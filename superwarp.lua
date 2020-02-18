--[[

Copyright © 2019, Akaden of Asura
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

    * Redistributions of source code must retain the above copyright
      notice, this list of conditions and the following disclaimer.
    * Redistributions in binary form must reproduce the above copyright
      notice, this list of conditions and the following disclaimer in the
      documentation and/or other materials provided with the distribution.
    * Neither the name of Superwarp nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

]]

--[[
	Special thanks to those that have helped with specific areas of Superwarp: 
		Waypoint currency calculations: Ivaar, Thorny
		Same-Zone warp data collection: Kenshi
		Escha domain elvorseal packets: Ivaar
		Unlocked warp point data packs: Ivaar
		Menu locked state reset functs: Ivaar
]]

_addon.name = 'superwarp'

_addon.author = 'Akaden'

_addon.version = '0.96'

_addon.commands = {'sw','superwarp'}

require('tables')
require('logger')
require('functions')
packets = require('packets')
require('coroutine')
config = require('config')

maps = require('map/maps')

warp_list = T{}
for k, map in pairs(maps) do
    warp_list:append(map.short_name)
end

sub_zone_aliases = {
    ['e'] = 'Entrance',
    ['ah'] = 'Auction House',
    ['auction'] = 'Auction House',
    ['mh'] = 'Mog House',
    ['mog'] = 'Mog House',
    ['house'] = 'Mog House',
    ['fs'] = 'Frontier Station',
    ['ed'] = 'Enigmatic Device',
}

local defaults = {
    debug = false,
    send_all_delay = 0.4,                   -- delay (seconds) between each character
    max_retries = 6,                        -- max retries for loading NPCs.
    retry_delay = 2,                        -- delay (seconds) between retries
    simulated_response_time = 0,            -- response time (seconds) for selecting a single menu item. Note this can happen multiple times per warp.
    simulated_response_variation = 0,       -- random variation (seconds) from the base simulated_response_time in either direction (+ or -)
    default_packet_wait_timeout = 5,        -- timeout (seconds) for waiting on a packet response before continuing on.
    enable_same_zone_teleport = true,       -- enable teleporting between points in the same zone. This is the default behavior in-game. Turning it off will look different than teleporting manually.
    enable_fast_retry_on_interrupt = false, -- after an event skip event, attempt a fast-retry that doesn't wait for packets or delay.
    use_tabs_at_survival_guides = false,    -- use tabs instead of gil at survival guides.
    enable_locked_warps = true,             -- enables warp destinations not unlocked yet. 
}

local settings = config.load(defaults)

-- bounds checks.
if settings.send_all_delay < 0 then
    settings.send_all_delay = 0
end
if settings.send_all_delay > 5 then
    settings.send_all_delay = 5
end
if settings.max_retries < 1 then
    settings.max_retries = 1
end
if settings.max_retries > 20 then
    settings.max_retries = 20
end
if settings.retry_delay < 1 then
    settings.retry_delay = 1
end
if settings.retry_delay > 10 then
    settings.retry_delay = 10
end
if settings.simulated_response_time < 0 then
    settings.simulated_response_time = 0
end
if settings.simulated_response_time > 5 then
    settings.simulated_response_time = 5
end
if settings.default_packet_wait_timeout < 1 then
    settings.default_packet_wait_timeout = 1
end
if settings.default_packet_wait_timeout > 10 then
    settings.default_packet_wait_timeout = 10
end
config.save(settings)

local state = {
    loop_count = nil,
    fast_retry = false,
    debug_stack = T{},
}

function debug(msg)
    if settings.debug then
        log('debug: '..msg)
    else
    	state.debug_stack:append('debug: '..msg)
    end
end

function has_bit(data, x)
  return data:unpack('q', math.floor(x/8)+1, x%8+1)
end

local function get_delay()
    -- gets the delay before executing the warp. Based on party list, sorted by name ascending.
    local self = windower.ffxi.get_player().name
    local members = {}
    for k, v in pairs(windower.ffxi.get_party()) do
        if type(v) == 'table' then
            members[#members + 1] = v.name
        end
    end
    table.sort(members)
    for k, v in pairs(members) do
        if v == self then
            return (k - 1) * settings.send_all_delay
        end
    end
end

function wiggle_value(value, variation)
    return math.max(0, value + (math.random() * 2 * variation - variation))
end

--- resolve sub-zone target aliases (ah -> auction house, etc.)
local function resolve_sub_zone_aliases(raw)
    if raw == nil then return nil end
    if type(raw) == 'number' then return raw end
    local raw_lower = raw:lower()

    if sub_zone_aliases[raw_lower] then return sub_zone_aliases[raw_lower] end

    return raw
end

function get_fuzzy_name(name)
    return tostring(name):lower():gsub("%s", ""):gsub("%p", "")
end

function get_shortcut_match(map_name, needle)
    if settings.shortcuts == nil or settings.shortcuts[map_name] == nil then
        return nil
    end
    -- check custom shortcuts
    local fuzzy_needle = get_fuzzy_name(needle)

    local destination, score
    for haystack, value in pairs(settings.shortcuts[map_name]) do
        local fuzzy_haystack = get_fuzzy_name(haystack)
        if fuzzy_needle:length() >= 3 and fuzzy_haystack == fuzzy_needle then
            local cur_score = fuzzy_haystack:length() - fuzzy_needle:length()
            if not destination or cur_score < score then
                destination = value
                score = cur_score
            end
        end
    end
    return destination
end

function get_closest_match(map, needle)
    local fuzzy_needle = get_fuzzy_name(needle)

    local key, score
    for haystack, value in pairs(map) do
        local fuzzy_haystack = get_fuzzy_name(haystack)
        if (fuzzy_needle:length() >= 3 and fuzzy_haystack:contains(fuzzy_needle)) or fuzzy_haystack == fuzzy_needle then
            local cur_score = fuzzy_haystack:length() - fuzzy_needle:length()
            if not key or cur_score < score then
                key = haystack
                score = cur_score
            end
        end
    end
    return key
end

local function resolve_warp(map_name, zone, sub_zone)
    local shortcut_result = get_shortcut_match(map_name, zone)
    if shortcut_result ~= nil then
        if shortcut_result.sub_zone ~= nil then
            debug("found custom shortcut: "..zone.." -> "..shortcut_result.zone.." "..shortcut_result.sub_zone)
            sub_zone = shortcut_result.sub_zone
        else
            debug("found custom shortcut: "..zone.." -> "..shortcut_result.zone)
        end
        zone = shortcut_result.zone
    end

    local closest_zone_name = get_closest_match(maps[map_name], zone)
    if closest_zone_name then
        local zone_map = maps[map_name][closest_zone_name]
        if type(zone_map) == 'table' and not (zone_map.index or zone_map.shortcut) then
            if sub_zone ~= nil then
                local closest_sub_zone_name = get_closest_match(zone_map, sub_zone)
                local sub_zone_map = zone_map[closest_sub_zone_name]
                if sub_zone_map then
                    if sub_zone_map.shortcut then
                        if zone_map[sub_zone_map.shortcut] and type(zone_map[sub_zone_map.shortcut]) == 'table' then
                            debug('found shortcut: '..sub_zone_map.shortcut)
                            sub_zone_map = zone_map[sub_zone_map.shortcut]
                        end
                    end
                    if sub_zone_map.index then
                        debug('found warp index: '..closest_zone_name..'/'..closest_sub_zone_name..' ('..sub_zone_map.index..')')
                        return sub_zone_map, closest_zone_name..' - '..closest_sub_zone_name
                    else
                        log("Found closest sub-zone, but index is not specified.")
                        return nil
                    end
                else
                    log('Found zone ('..closest_zone_name..'), but not sub zone: "'..sub_zone..'"')
                    return nil
                end
            else
                if settings.favorites and settings.favorites[map_name] then
                    for fz, fsz in pairs(settings.favorites[map_name]) do
                        if get_fuzzy_name(fz) == get_fuzzy_name(closest_zone_name) then
                            for sz, sub_zone_map in pairs(zone_map) do
                                if sz == tostring(resolve_sub_zone_aliases(fsz)) then
                                    if sub_zone_map.shortcut then
                                        if zone_map[sub_zone_map.shortcut] and type(zone_map[sub_zone_map.shortcut]) == 'table' then
                                            debug ('found shortcut: '..sub_zone_map.shortcut)
                                            sub_zone_map = zone_map[sub_zone_map.shortcut]
                                        end
                                    end
                                    debug('Found zone ('..closest_zone_name..'), but no sub-zone listed, using favorite ('..sz..')')
                                    return sub_zone_map, closest_zone_name..' - '..sz.." (F)"
                                end
                            end
                        end
                    end
                end
                for sz, sub_zone_map in pairs(zone_map) do
                    if sub_zone_map.shortcut then
                        if zone_map[sub_zone_map.shortcut] and type(zone_map[sub_zone_map.shortcut]) == 'table' then
                            debug ('found shortcut: '..sub_zone_map.shortcut)
                            sub_zone_map = zone_map[sub_zone_map.shortcut]
                        end
                    end
                    debug('Found zone ('..closest_zone_name..'), but no sub-zone listed, using first ('..sz..')')
                    return sub_zone_map, closest_zone_name..' - '..sz
                end
            end
        else
            debug("Found zone settings. No sub-zones defined.")
            return zone_map, closest_zone_name    
        end
    else
        log('Could not find zone: '..zone)
        return nil
    end
end 

function poke_npc(id, index)
	local first_poke = true
    while id and index and current_activity and not current_activity.caught_poke do
        if not first_poke then
			if state.loop_count > 0 then
				state.loop_count = state.loop_count - 1
            	log("Timed out waiting for response from the poke. Retrying...")
            else 
                log("Timed out waiting for response from the poke.")
                current_activity = nil
            	return
            end
        end

        debug("poke npc: "..tostring(id)..' '..tostring(index))
        first_poke = false
        local packet = packets.new('outgoing', 0x01A, {
            ["Target"]=id,
            ["Target Index"]=index,
            ["Category"]=0,
            ["Param"]=0,
            ["_unknown1"]=0})
        packets.inject(packet)

		coroutine.sleep(settings.default_packet_wait_timeout)
    end
end

local function distance_sqd(a, b)
    local dx, dy = b.x-a.x, b.y-a.y
    return dy*dy + dx*dx
end

local function find_npc(needles)
    local target_npc = nil
    local distance = nil
    local p = windower.ffxi.get_mob_by_target("me")
    for i, v in pairs(windower.ffxi.get_mob_array()) do
        local d = distance_sqd(windower.ffxi.get_mob_by_index(i), p)
        for i, needle in ipairs(needles) do
            if v.valid_target and (not target_npc or d < distance) and string.find(get_fuzzy_name(v.name), "^"..get_fuzzy_name(needle)) then
                target_npc = v
                distance = d
            end
        end
    end
    return target_npc, distance
end

-- Thanks to Ivaar for these two:
function general_release()
    windower.packets.inject_incoming(0x052, string.char(0,0,0,0,0,0,0,0))
    windower.packets.inject_incoming(0x052, string.char(0,0,0,0,1,0,0,0))
end
function release(menu_id)
    windower.packets.inject_incoming(0x052, 'ICHC':pack(0,2,menu_id,0))
    windower.packets.inject_incoming(0x052, string.char(0,0,0,0,1,0,0,0)) -- likely not needed

end

local function reset(quiet)
    if last_npc ~= nil and last_menu ~= nil then
        general_release()
        release(last_menu)
        local packet = packets.new('outgoing', 0x05B)
        packet["Target"]=last_npc
        packet["Option Index"]="0"
        packet["_unknown1"]="16384"
        packet["Target Index"]=last_npc_index
        packet["Automated Message"]=false
        packet["_unknown2"]=0
        packet["Zone"]=windower.ffxi.get_info()['zone']
        packet["Menu ID"]=last_menu
        packets.inject(packet)
        last_activity = activity
        current_activity.canceled = true
        current_activity = nil
        last_npc = nil
        last_npc_index = nil
        last_menu = nil

        if not quiet then
            log('Should be reset now. Please try again. If still locked, try a second reset.')
        end
    else
        general_release()
        last_npc = nil
        last_npc_index = nil
        last_menu = nil
        current_activity = nil
        if not quiet then
            log('No warp scheduled.')
        end
    end
end

local function do_warp(map_name, zone, sub_zone)
    local map = maps[map_name]

    local warp_settings, display_name = resolve_warp(map_name, zone, sub_zone)
    if warp_settings and warp_settings.index then
        local npc, dist = find_npc(map.npc_names.warp)

        if not npc then
            if state.loop_count > 0 then
                log('No ' .. map.long_name .. ' found! Retrying...')
                do_warp:schedule(settings.retry_delay, map_name, zone, sub_zone)
                state.loop_count = state.loop_count - 1
            else
                log('No ' .. map.long_name .. ' found!')
            end
        elseif dist > 6^2 then
            if state.loop_count > 0 then
                log(npc.name .. ' found, but too far! Retrying...')
                do_warp:schedule(settings.retry_delay, map_name, zone, sub_zone)
                state.loop_count = state.loop_count - 1
            else
                log(npc.name .. ' found, but too far!')
            end
        elseif (warp_settings.npc == nil or warp_settings.npc == npc.index) and warp_settings.zone == windower.ffxi.get_info()['zone'] then
            log("You are already at "..display_name.."! Teleport canceled.")
            state.loop_count = 0
        elseif npc.id and npc.index then
            current_activity = {type=map_name, npc=npc, activity_settings=warp_settings, zone=zone, sub_zone=sub_zone}
            log('Warping via ' .. npc.name .. ' to '..display_name..'.')
            poke_npc(npc.id, npc.index)
        end
    else
        state.loop_count = 0
    end
end

local function do_sub_cmd(map_name, sub_cmd, args)
    local map = maps[map_name]

    local npc, dist = find_npc(map.npc_names[sub_cmd])
    if npc and npc.id and npc.index and dist <= 6^2 then
        current_activity = {type=map_name, sub_cmd=sub_cmd, args=args, npc=npc}
        poke_npc(npc.id, npc.index)
    elseif not npc then
        log('No '..map.long_name..' found!')
    elseif dist > 6^2 then
        log(npc.name..' found, but too far!')
    end
end

local function handle_warp(warp, args, fast_retry, retries_remaining)

    warp = warp:lower()
    if retries_remaining == nil then
        state.loop_count = settings.max_retries
    else
        state.loop_count = retries_remaining
    end
    state.fast_retry = fast_retry

    -- because I can't stop typing "hp warp X" because I've been trained. 
    if args[1]:lower() == 'warp' or args[1]:lower() == 'w' then args:remove(1) end

    local all = args[1]:lower() == 'all' or args[1]:lower() == 'a' or args[1]:lower() == '@all'
    if all then 
        args:remove(1) 

        debug('sending warp to all.')
        windower.send_ipc_message(warp..' '..args:concat(' '))

        local delay = get_delay()
        debug('delay: '..delay)
        handle_warp:schedule(delay, warp, args)
        return
    end

    state.current_warp = warp
    state.current_args = args:copy()

    for key,map in pairs(maps) do
        if map.short_name == warp then
            local sub_cmd = nil
            if map.sub_commands then
                for sc, fn in pairs(map.sub_commands) do
                    if sc:lower() == args[1]:lower() then
                        sub_cmd = sc
                    end
                end
            end

            if sub_cmd then
                args:remove(1)
                do_sub_cmd(key, sub_cmd, args)
                return
            else
                local sub_zone_target = nil
                if map.sub_zone_targets then
                    local target_candidate = resolve_sub_zone_aliases(args:last())
                    if map.sub_zone_targets:contains(target_candidate:lower()) then
                        sub_zone_target = target_candidate
                        args:remove(args:length())
                    end
                end
                local zone = windower.ffxi.get_info().zone
                local zone_target = args:concat(' ')
                if map.auto_select_zone and map.auto_select_zone(zone) then
                    zone_target = map.auto_select_zone(zone)
                end
                if map.auto_select_sub_zone and map.auto_select_sub_zone(zone) then
                    sub_zone_target = map.auto_select_sub_zone(zone)
                end
                do_warp(key, zone_target, sub_zone_target)
                return
            end
        end
    end
end

local function received_warp_command(cmd, args)
	if current_activity ~= nil then
		log('Superwarp is currently busy. To cancel the last request try "//sw cancel"')
	else
		state.debug_stack = T{}
		handle_warp(cmd, args)
	end
end


windower.register_event('addon command', function(...)
    local args = T{...}
    local cmd = args[1]
    args:remove(1)
    for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
    local item = table.concat(args," "):lower()

    if warp_list:contains(cmd) then
        received_warp_command(cmd, args)
    elseif cmd == 'cancel' then
    	reset()
        if args[1] and args[1]:lower() == 'all' then
            windower.send_ipc_message('reset')
        end

    elseif cmd == 'reset' then
        reset()    
        if args[1] and args[1]:lower() == 'all' then
            windower.send_ipc_message('reset')
        end

    elseif cmd == 'debug' then
        settings.debug = not settings.debug
        log('Debug is now '..tostring(settings.debug))
        settings:save()
        if settings.debug then 
        	for _, m in ipairs(state.debug_stack) do
        		log(m)
        	end
        end
    else
        for key, map in pairs(maps) do
            log(map.help_text)
        end
    end
end)

-- handle direct hp/wp/sg commands
windower.register_event('unhandled command', function(cmd, ...)
    local args = T{...}
    for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
    if warp_list:contains(cmd:lower()) then
        received_warp_command(cmd, args)
    end
end)

-- handle ipc message
windower.register_event('ipc message', function(msg) 
    local args = msg:split(' ')
    local cmd = args[1]
    args:remove(1)
    if cmd == 'reset' then
        reset()
    elseif warp_list:contains(cmd) then
        local delay = get_delay()
        debug('received ipc: '..msg..'. executing in '..tostring(delay)..'s.')
        received_warp_command:schedule(delay, cmd, args)
    end
end)

local function perform_next_action()
    if current_activity and current_activity.running and current_activity.action_queue and current_activity.action_index > 0 then
        local current_action = current_activity.action_queue[current_activity.action_index]
        if current_action == nil then
            debug("all actions complete")
            last_activity = current_activity
            state.loop_count = 0
            current_activity = nil
        elseif not state.fast_retry and current_action.wait_packet then
            debug("waiting for packet 0x"..current_action.wait_packet:hex().." for action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            current_action.wait_start = os.time()
            if not current_action.timeout then 
                current_action.timeout = settings.default_packet_wait_timeout
            end
            local fn = function(s, ca, i, p, d)
                if ca and ca.action_index == i and not ca.canceled then
                    debug("timed out waiting for packet 0x"..p:hex().." for action "..tostring(i)..' '..(d or ''))

                    if s.loop_count > 0 then
                        reset(true)
                        log("Timed out waiting for response from the menu. Retrying...")
                        handle_warp:schedule(settings.retry_delay, s.current_warp, s.current_args, false, s.loop_count - 1)
                    else
                        reset(true)
                        log("Timed out waiting for response from the menu.")
                    end
                end
            end

            fn:schedule(current_action.timeout, state, current_activity, current_activity.action_index, current_action.wait_packet, current_action.description)
        elseif not state.fast_retry and current_action.delay and current_action.delay > 0 then
            debug("delaying action "..tostring(current_activity.action_index)..' '..(current_action.description or '')..' for '.. current_action.delay..'s...')
            local delay_seconds = current_action.delay
            current_action.delay = nil
            perform_next_action:schedule(delay_seconds)
        elseif current_action.packet then
            -- just a packet, inject it.
            debug("injecting packet "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            packets.inject(current_action.packet)
            current_activity.action_index = current_activity.action_index + 1
            if current_action.message then
                log(current_action.message)
            end
            perform_next_action()
        elseif current_action.fn ~= nil then
            -- has a function, pass along params.
            debug("performing action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            continue = current_action.fn(current_action.incoming_packet)
            current_activity.action_index = current_activity.action_index + 1
            if current_action.message then
                log(current_action.message)
            end
            if continue then
                perform_next_action()
            else
                reset(true)
                if state.loop_count > 0 then
                    log("Teleport aborted. Retrying...")
                    handle_warp:schedule(settings.retry_delay, state.current_warp, state.current_args, false, state.loop_count - 1)
                end
            end
        end
    end
end

-- Handle menu interraction. 
windower.register_event('incoming chunk',function(id,data,modified,injected,blocked)
    if current_activity and current_activity.action_queue and current_activity.running then
        local current_action = current_activity.action_queue[current_activity.action_index]
        if current_action.wait_packet and current_action.wait_packet == id then
            debug("received packet 0x"..id:hex().." for action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            current_action.wait_packet = nil
            current_action.incoming_packet = packets.parse('incoming',data)
            perform_next_action()
        end
    end

    if id == 0x052 and current_activity and current_activity.running then
        local message_type = data:unpack('b4', 5)
        if message_type == 2 then
            if state.loop_count > 0 then
                if settings.enable_fast_retry_on_interrupt then
                    log("Detected event-skip. Retrying (fast)...")
                    handle_warp:schedule(0.1, state.current_warp, state.current_args, true, state.loop_count - 1)
                else
                    log("Detected event-skip. Retrying...")
                    handle_warp:schedule(0.1, state.current_warp, state.current_args, false, state.loop_count - 1)
                end
            end
        end
    end

    if id == 0x034 or id == 0x032 then
        local p = packets.parse('incoming', data)
        
        if current_activity and not current_activity.running then
        	current_activity.caught_poke = true
            local zone = windower.ffxi.get_info()['zone']
            local map = maps[current_activity.type]

            last_menu = p["Menu ID"]
            last_npc = p["NPC"]
            last_npc_index = p["NPC Index"]
            --debug("recorded reset params: "..last_menu.." "..last_npc)

            current_activity.action_queue = nil
            current_activity.action_index = 1

            if current_activity.sub_cmd then
                debug("building "..current_activity.type.." sub_command actions: "..current_activity.sub_cmd)
                current_activity.action_queue = map.sub_commands[current_activity.sub_cmd](current_activity, zone, p, settings)
            else
                debug("building "..current_activity.type.." warp actions...")
                current_activity.action_queue = map.build_warp_packets(current_activity, zone, p, settings)
            end

            if current_activity.action_queue and type(current_activity.action_queue) == 'table' then
                -- startup actions.

                current_activity.running = true

                perform_next_action:schedule(0)

                return true
            else
                log("No action required.")
                last_activity = current_activity
                state.loop_count = 0
                current_activity = nil
                return false
            end
        end
    end

end)
windower.register_event('outgoing chunk',function(id,data,modified,injected,blocked)
	if id == 0x01A and not injected and current_activity and not current_activity.canceled then
		-- USER poked something and we were in the middle of something.
		-- we can't cancel that poke. The client is execting it already. We MUST cancel the current task.
		log('Detected user interaction. Canceling current warp...')

		reset(true)
		coroutine.sleep(1)
		return false
	end
end)


-- debugging
windower.register_event('outgoing chunk',function(id,data,modified,injected,blocked)
    if id == 0x05C then
        --if not injected then
        --    print(data:hex())
        --end
        --local p = packets.parse('outgoing', data)
        --local t = windower.ffxi.get_mob_by_index(p['Target Index'])
        --debug("out 0x05C: "..t.name..", menu:"..tostring(p['Menu ID'])..", zone:"..tostring(p['Zone'])..", x:"..string.format('%0.3f', p['X'])..", z:"..string.format('%0.3f', p['Z'])..", y:"..string.format('%0.3f', p['Y'])..", _u1:"..tostring(p['_unknown1'])..", _u3:"..tostring(p['_unknown3']))
    elseif id == 0x05B then
        --print(data:unpack('b7b4b3b7b8', 9))
        --local p = packets.parse('outgoing', data)
        --local t = windower.ffxi.get_mob_by_index(p['Target Index'])
        --debug("out 0x05B: "..t.name.." oi:"..tostring(p['Option Index']).." _u1:"..tostring(p['_unknown1']).." _u2:"..tostring(p['_unknown2']).." menu:"..tostring(p['Menu ID']).." auto:"..tostring(p['Automated Message']))
    end
end)