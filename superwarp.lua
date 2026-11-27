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
    * Neither the name of superwarp nor the
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
    Special thanks to those that have helped with specific areas of superwarp: 
        Waypoint currency calculations: Ivaar, Thorny
        Same-Zone warp data collection: Kenshi
        Escha domain elvorseal packets: Ivaar
        Unlocked warp point data packs: Ivaar
        Menu locked state reset functs: Ivaar
        Fuzzy matching logic for zones: Lili
        Sortie  support implementation: Staticvoid
        Odyssey support implementation: Staticvoid
        Apollyon  and  Temenos support: Staticvoid
		Mog Garden support            : Staticvoid
        Campaign support              : Staticvoid
        Incursion support             : Staticvoid
        Walk Of Echoes support        : Staticvoid
        Maintenance			          : Staticvoid
]]

_addon.name = 'superwarp'

_addon.author = 'Akaden'

_addon.version = '1.1.5'

_addon.commands = {'sw','superwarp'}

require('vectors')
require('tables')
require('logger')
require('functions')
packets = require('packets')
require('coroutine')
config = require('config')
resources = require('resources')

require('sendall')
require('fuzzyfind')
maps = require('map/maps')

warp_list = T{}
for k, map in pairs(maps) do
    if type(map.short_name) == 'table' then
        for _, alias in ipairs(map.short_name) do
            warp_list:append(alias)
        end
    else
        warp_list:append(map.short_name)
    end
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
    send_all_delay = 0.3,                 -- delay (seconds) between each character
    max_retries = 6,                        -- max retries for loading NPCs.
    retry_delay = 2,                        -- delay (seconds) between retries
    simulated_response_time = 0,            -- response time (seconds) for selecting a single menu item. Note this can happen multiple times per warp.
    simulated_response_variation = 0,       -- random variation (seconds) from the base simulated_response_time in either direction (+ or -)
    default_packet_wait_timeout = 3,        -- timeout (seconds) for waiting on a packet response before continuing on.
    enable_same_zone_teleport = true,       -- enable teleporting between points in the same zone. This is the default behavior in-game. Turning it off will look different than teleporting manually.
    enable_fast_retry_on_interrupt = false, -- after an event skip event, attempt a fast-retry that doesn't wait for packets or delay.
    use_tabs_at_survival_guides = false,    -- use tabs instead of gil at survival guides.
    stop_autorun_before_warp = true,        -- stop autorunning before using any warp system or subcommand
    command_before_warp = '',               -- inject this windower command before using any warp system or subcommand
    command_delay_on_arrival = 5,           -- delay before running command_on_arrival
    command_on_arrival = '',                -- inject this windower command on arriving at the next location.
    target_npc = true,                      -- locally target the warp/subcommand npc.
    simulate_client_lock = false,           -- lock the local client during a warp/subcommand, simulating menu behavior.
    send_all_order_mode = 'melast',         -- order modes: melast, mefirst, alphabetical
    send_all_display = true,
    chat_log_use = 'log',                   -- log messages to 'log', 'console', or 'none'. If debug is on, it will always log to the chat log
    understood = false,
    sortie_reverse_order = false,
    hp_legacy_defaults = true,
    limbus_chests = {
        temenos = {
            ["N7"] = 1,["W7"] = 2,["E7"] = 3,["C4"] = 4
    },
        apollyon = {
            ["NW5"] = 1,["SW4"] = 2,["NE5"] = 3,["SE4"] = 4
        }
    },
    limbus_chest_order = {
        temenos = {
            ["N4"] = 1,["W4"] = 2,["E4"] = 3,["C3"] = 4
    },
        apollyon = {
            ["NW5"] = 1,["SW4"] = 2,["NE5"] = 3,["SE4"] = 4
        }
    },
}
local settings
local player_info = windower.ffxi.get_info().logged_in and windower.ffxi.get_player().name
if player_info then settings = config.load('data/settings_'..player_info..'.xml', defaults) else settings = config.load(defaults) end



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
if settings.default_packet_wait_timeout < 2 then
    settings.default_packet_wait_timeout = 2
end
if settings.default_packet_wait_timeout > 4 then
    settings.default_packet_wait_timeout = 4
end
config.save(settings)
local current_zone = windower.ffxi.get_info().zone
local in_limbus_zone = (current_zone == 37 or current_zone == 38)
local timing = {}
timing.poke_time = nil
timing.poke_response_time = nil
timing.warp_cmd_time = nil
timing.warp_init_time = nil
local smartcmd = false
local smartcheck
if not (maps.abyssea.target_ids and maps.campaign.target_ids and maps.odyssey.all_warp_zones and maps.incursion and maps.walkofechoes.all_warp_zones) then --Version check
    smartcheck = false
else
    smartcheck = true
end
local intended_npc = nil
local warp_ident = nil
local state = {
    current_sub_cmd = nil,
    warp_interrupted = nil,
    warp_confirmed = nil,
    loop_count = nil,
    fast_retry = false,
    debug_stack = T{},
    client_lock = false,
}

local prev_location = nil
local mh_door_menu = nil
local confirm_msg = ''
local function add_table_entry(zone, entry)
    local t = settings.limbus_chest_order[zone]
    if not t or not t[entry] then
        return
    end

    if t[entry] == 1 then
        return
    end

    local chests = {}

    for name, rank in pairs(t) do
        chests[#chests + 1] = {name = name, rank = rank}
    end

    table.sort(chests, function(a, b)
        if a.name == entry then
            return true
        elseif b.name == entry then
            return false
        elseif a.rank ~= b.rank then
            return a.rank < b.rank
        else
            return a.name < b.name
        end
    end)

    for i, chest in ipairs(chests) do
        t[chest.name] = i
    end

    config.save(settings)
end

local function migrate_limbus_chest_order()
    -- Already migrated
    if settings.version == 2 then
        return
    end

    local old = settings.limbus_chests or {}

    settings.limbus_chest_order = {
        apollyon = {},
        temenos = {},
    }
    -- Preserve Apollyon order
    if old.apollyon then
        settings.limbus_chest_order.apollyon = {
            ["NW5"] = old.apollyon.NW5 or 4,
            ["SW4"] = old.apollyon.SW4 or 3,
            ["NE5"] = old.apollyon.NE5 or 2,
            ["SE4"] = old.apollyon.SE4 or 1,
        }
    end
    -- Preserve Temenos order (old -> new floor names)
    if old.temenos then
        settings.limbus_chest_order.temenos = {
            ["N4"] = old.temenos.N7 or old.temenos.N4 or 4,
            ["W4"] = old.temenos.W7 or old.temenos.W4 or 3,
            ["E4"] = old.temenos.E7 or old.temenos.E4 or 2,
            ["C3"] = old.temenos.C4 or old.temenos.C3 or 1,
        }
    end
    settings.version = 2
    config.save(settings)
end
-- Handle one time table conversion for new temenos floor format.
migrate_limbus_chest_order()

local function set_chest_order(data)
    data = data:lower()
    local zone, tower
    if data:find("nw", 1, true) then
        zone, tower = "apollyon" , "NW5"
    elseif data:find("sw", 1, true) then
        zone, tower = "apollyon" , "SW4"
    elseif data:find("ne", 1, true) then
        zone, tower = "apollyon" , "NE5"
    elseif data:find("se", 1, true) then
        zone, tower = "apollyon" , "SE4"
    elseif data:find("n", 1, true) then
        zone, tower = "temenos" , "N4"
    elseif data:find("w", 1, true) then
        zone, tower = "temenos" , "W4"
    elseif data:find("e", 1, true) then
        zone, tower = "temenos" , "E4"
    elseif data:find("c", 1, true) then
        zone, tower = "temenos" , "C3"
    else
        log("Invalid argument, chest order tracking not updated.")
        return
    end
    log("Chest tracking updated. "..tower.." stored as most recently opened chest in "..zone..".")
    add_table_entry(zone, tower)
end

function sync_chest_data(chestdata)
    settings.limbus_chest_order = chestdata
    config.save(settings)
    log('Limbus chest data synced.')
end

function log(msg)
    if settings.chat_log_use == 'log' or settings.debug then
        windower.add_to_chat(207, 'superwarp: '..msg)
    elseif settings.chat_log_use == 'console' then
        print('superwarp: '..msg)
    end
end

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

local function get_keys(t)
    local keys = T{}
    for k, v in pairs(t) do
        keys:append(k)
    end
    return keys
end

function order_participants(participants)
    local player = windower.ffxi.get_player().name
    if settings.send_all_order_mode ~= 'alphabetical' then
        participants:delete(player)
    end
    table.sort(participants)
    if settings.send_all_order_mode == 'melast' then
        participants:append(player)
    elseif settings.send_all_order_mode == 'mefirst' then
        participants = T{player}:extend(participants)
    end
    return participants
end

local function get_party_members(local_members)
    local members = T{}
    for k, v in pairs(windower.ffxi.get_party()) do
        if type(v) == 'table' then
            if local_members:contains(v.name) then
                members:append(v.name)
            end
        end
    end
    return members
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

local function resolve_shortcuts(t, selection)
    if selection.shortcut == nil then return selection end

    return resolve_shortcuts(t, t[selection.shortcut])
end

local function resolve_waypoint_subzone(map_name, search_term)
    local best_zone, best_sub_zone, best_score, best_map

    for zone_name, zone_map in pairs(maps[map_name].warpdata) do
        if type(zone_map) == 'table' and not (zone_map.index or zone_map.shortcut) then
            local sub_keys = get_keys(zone_map)
            local sub_name, sub_score = fmatch(search_term, sub_keys)

            if sub_name and sub_score then
                local sub_zone_map = zone_map[sub_name]
                if sub_zone_map then
                    sub_zone_map = resolve_shortcuts(zone_map, sub_zone_map)
                    if sub_zone_map and sub_zone_map.index then
                        if not best_score or sub_score > best_score then
                            best_zone = zone_name
                            best_sub_zone = sub_name
                            best_score = sub_score
                            best_map = sub_zone_map
                        end
                    end
                end
            end
        end
    end

    return best_zone, best_sub_zone, best_map, best_score
end

local function resolve_warp(map_name, zone, sub_zone)
    if settings.shortcuts and settings.shortcuts[map_name] then
        local shortcut_map = settings.shortcuts[map_name][zone]
        if shortcut_map ~= nil then
            if shortcut_map.sub_zone ~= nil then
                debug("found custom shortcut: "..zone.." -> "..shortcut_map.zone.." "..shortcut_map.sub_zone)
                sub_zone = tostring(shortcut_map.sub_zone)
            else
                debug("found custom shortcut: "..zone.." -> "..shortcut_map.zone)
            end
            zone = shortcut_map.zone
        end
    end

    local closest_zone_name, closest_zone_value = fmatch(zone, get_keys(maps[map_name].warpdata))
    if closest_zone_name and closest_zone_value >= 3 and closest_zone_value >= #zone then
        debug('Search success. Term="'..zone..'", nearest match="'..(closest_zone_name or nil)..'", value='..(closest_zone_value or '-1'))
        local zone_map = maps[map_name].warpdata[closest_zone_name]
        if type(zone_map) == 'table' and not (zone_map.index or zone_map.shortcut) then
            if sub_zone ~= nil then
                local closest_sub_zone_name = fmatch(sub_zone, get_keys(zone_map))
                local sub_zone_map = zone_map[closest_sub_zone_name]
                if sub_zone_map then
                    sub_zone_map = resolve_shortcuts(zone_map, sub_zone_map)
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
                    local favorite_result = settings.favorites[map_name][get_fuzzy_name(closest_zone_name)]
                    if favorite_result then
                        local fr = tostring(resolve_sub_zone_aliases(favorite_result))
                        local sub_zone_map = zone_map[fr]
                        if sub_zone_map then
                            sub_zone_map = resolve_shortcuts(zone_map, sub_zone_map)

                            debug('Found zone ('..closest_zone_name..'), but no sub-zone listed, using favorite ('..fr..')')
                            return sub_zone_map, closest_zone_name..' - '..fr.." (F)"
                        end
                    end
                    --for fz, fsz in pairs(settings.favorites[map_name]) do
                    --    if get_fuzzy_name(fz) == get_fuzzy_name(closest_zone_name) then
                    --        for sz, sub_zone_map in pairs(zone_map) do
                    --            if sz == tostring(resolve_sub_zone_aliases(fsz)) then
                    --                if sub_zone_map.shortcut then
                    --                    if zone_map[sub_zone_map.shortcut] and type(zone_map[sub_zone_map.shortcut]) == 'table' then
                    --                        debug ('found shortcut: '..sub_zone_map.shortcut)
                    --                        sub_zone_map = zone_map[sub_zone_map.shortcut]
                    --                    end
                    --                end
                    --                debug('Found zone ('..closest_zone_name..'), but no sub-zone listed, using favorite ('..sz..')')
                    --                return sub_zone_map, closest_zone_name..' - '..sz.." (F)"
                    --            end
                    --        end
                    --    end
                    --end
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
    elseif map_name == 'waypoints' then
        local subzone_term = zone and zone:match('([^%s]+)$') or zone
        local global_zone, global_sub_zone, global_map, global_score = resolve_waypoint_subzone(map_name, subzone_term)
        if global_map and global_score and global_score >= 3 and global_score >= #subzone_term then
            debug('Global sub-zone search success. Term="'..subzone_term..'", zone="'..global_zone..'", sub-zone="'..global_sub_zone..'", value='..global_score)
            return global_map, global_zone..' - '..global_sub_zone
        elseif zone and closest_zone_name then
            log('Search returned no matches: '..zone)
            debug('Failed search. Term="'..zone..'", nearest match="'..(closest_zone_name or nil)..'", value='..(closest_zone_value or '-1'))
        else
            log('Search returned no matches.')
            debug('Failed search.')
        end
    elseif zone and closest_zone_name then
        log('Search returned no matches: '..zone)
        debug('Failed search. Term="'..zone..'", nearest match="'..(closest_zone_name or nil)..'", value='..(closest_zone_value or '-1'))
    else
        log('Search returned no matches.')
        debug('Failed search.')
    end
    return nil
end

function poke_npc(id, index)
    local first_poke = true
    local first_retry = true
    if not intended_npc.id then
        current_activity.poked_npc_index, intended_npc.index = index, index
        current_activity.poked_npc_id, intended_npc.id = id, id
    elseif not current_activity.poked_npc_id then
        current_activity.poked_npc_index = intended_npc.index
        current_activity.poked_npc_id = intended_npc.id
    end
    while id and index and current_activity and not current_activity.caught_poke do
        if not first_poke then
            if state.loop_count > 0 then
                state.loop_count = state.loop_count - 1
                if not first_retry then
                    log("Timed out waiting for response from the poke. Retrying...")
                end
                first_retry = false
            else 
                log("Timed out waiting for response from the poke.")
                current_activity = nil
                return
            end
        end

        debug("poke npc: "..tostring(id)..' '..tostring(index))
        
        local packet = packets.new('outgoing', 0x01A, {
            ["Target"]=id,
            ["Target Index"]=index,
            ["Category"]=0,
            ["Param"]=0,
            ["_unknown1"]=0})
        packets.inject(packet)
        if not timing.poke_time then
            timing.poke_time = os.clock()
        end
        if first_poke then
            first_poke = false
            coroutine.sleep(1.5)
        else
            coroutine.sleep(1.75)
            --coroutine.sleep(settings.default_packet_wait_timeout)
        end
    end
    timing.poke_time = nil
end

function set_target(index)
    local player = windower.ffxi.get_mob_by_target('me')
    local target = windower.ffxi.get_mob_by_index(index)
    if not (player and target) then return end
    packets.inject(packets.new('incoming', 0x58, {
        ['Player'] = player.id,
        ['Target'] = target.id,
        ['Player Index'] = player.index,
    }))
end

function client_lock(target_index)
    state.client_lock = not (not target_index)
    local data, ts = windower.packets.last_incoming(0x37)
    local p = packets.parse('incoming', data)
    if state.client_lock then
        set_target(tonumber(target_index))
        p['_flags3'] = bit.bor(p['_flags3'], 2)
    else
        p['_flags3'] = bit.band(p['_flags3'], bit.bnot(2))
    end
    packets.inject(p)
end

local function distance_sqd(a, b)
    local dx, dy = b.x-a.x, b.y-a.y
    return dy*dy + dx*dx
end

function get_fuzzy_name(name)
    return tostring(name):lower():gsub("%s", ""):gsub("%p", "")
end

local function find_npc(needles)
    local player = windower.ffxi.get_mob_by_target('me')
    local target_npc, distance, npc_key = nil, nil, nil
    if not player then
        return nil, nil, nil
    end
    local px, py, pz = player.x, player.y, player.z
    for index, npc_data in pairs(needles) do
        local npc = windower.ffxi.get_mob_by_index(index)
        if npc and npc.valid_target then
            local diff_vec = V{npc.x - px, npc.y - py, npc.z - pz}
            local true_distance = diff_vec:length()
            if true_distance < 50 then
                if not target_npc or npc.distance < distance then
                    target_npc = npc
                    distance = npc.distance
                    npc_key = npc_data.key
                end
            end
        end
    end
    return target_npc, distance, npc_key
end

-- Thanks to Ivaar for these two:
function general_release()
    windower.packets.inject_incoming(0x052, string.char(0,0,0,0,0,0,0,0))
    windower.packets.inject_incoming(0x052, string.char(0,0,0,0,1,0,0,0))
end
function release(menu_id)
    windower.packets.inject_incoming(0x052, ('ICHC'):pack(0,2,menu_id,0))
    windower.packets.inject_incoming(0x052, string.char(0,0,0,0,1,0,0,0)) -- likely not needed

end

function reset(quiet)
	client_lock()
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
        last_activity = current_activity
        if current_activity then
            current_activity.canceled = true
        end
        current_activity = nil
        last_npc = nil
        last_npc_index = nil
        last_menu = nil

        if not quiet then
            state.loop_count = 0 -- If we did a cancel / reset command we want to cancel the warp queue.
            log('No warp scheduled.')
        end
    else
        general_release()
        last_npc = nil
        last_npc_index = nil
        last_menu = nil
        current_activity = nil
        if not quiet then
            state.loop_count = 0 -- If we did a cancel / reset command we want to cancel the warp queue.
            log('No warp scheduled.')
        end
    end
end

local function handle_before_warp()
    if settings.stop_autorun_before_warp then
        debug('stopping autorun before warp')
        --windower.ffxi.follow() -- with no index, stops auto following.
        windower.ffxi.run(false) -- stop autorun
    end
    if settings.command_before_warp and type(settings.command_before_warp) == 'string' and settings.command_before_warp ~= '' then
        debug('running command before warp: '..settings.command_before_warp)
        windower.send_command(settings.command_before_warp)
    end
    -- Since the 1/5 of a second makes our retries take longer after being interrupted we autoskip this while being attacked.
    if not state.warp_interrupted and (settings.target_npc or settings.simulate_client_lock) and current_activity and current_activity.npc then
    	set_target(current_activity.npc.index)
    	coroutine.sleep(0.2) -- give target time to work.
    end
    if settings.simulate_client_lock and current_activity and current_activity.npc then
    	client_lock(current_activity.npc.index)
    end
end

local function handle_on_arrival()
    if settings.command_on_arrival and type(settings.command_on_arrival) == 'string' and settings.command_on_arrival ~= '' then
        debug('running command on arrival: '..settings.command_on_arrival)
        windower.send_command(settings.command_on_arrival)
    end
end

local function do_warp(map_name, zone, sub_zone)
    local map = maps[map_name]

    local warp_settings, display_name = resolve_warp(map_name, zone, sub_zone)
    if warp_settings and warp_settings.index then
        local npc, dist, npc_key
        if map.zone_npc_list then
            npc, dist, npc_key = find_npc(map.zone_npc_list('warp'))
        end
        warp_settings.npc = npc and npc.index or warp_settings.npc

        if not npc then
            if state.loop_count > 0 then
                log('No ' .. map.npc_plural .. ' found! Retrying...')
                state.loop_count = state.loop_count - 1
                do_warp:schedule(settings.retry_delay, map_name, zone, sub_zone)
            else
                log('No ' .. map.npc_plural .. ' found!')
                timing.warp_cmd_time = nil
            end
        elseif dist > 6^2 then
            if state.loop_count > 0 then
                log(npc.name .. ' found, but too far! Retrying...')
                state.loop_count = state.loop_count - 1
                do_warp:schedule(settings.retry_delay, map_name, zone, sub_zone)
            else
                log(npc.name .. ' found, but too far!')
                timing.warp_cmd_time = nil
            end
        elseif npc_key and (warp_settings.key == npc_key or npc_key == '1' and not warp_settings.key and warp_settings.npc == npc.index) and warp_settings.zone == windower.ffxi.get_info()['zone'] then
            log("You are already at "..display_name.."! Teleport canceled.")
            local player = windower.ffxi.get_mob_by_target('me')
            if player.name == warp_sender then
                confirm_msg = 'All warps finished.'
                warp_listener(true, player.name)
            elseif current_warp_id then
                windower.send_ipc_message('confirm '..current_warp_id..' '..player.name)
            end
            state.loop_count = 0
        elseif npc.id and npc.index then
            current_activity = {type=map_name, npc=npc, activity_settings=warp_settings, zone=zone, sub_zone=sub_zone, warp_ident = warp_ident}
            handle_before_warp()
            log('Warping via ' .. npc.name .. ' to '..display_name..'.')
            timing.warp_init_time = os.clock()
            if timing.warp_cmd_time then
                debug("Warp initialization time: "..string.format("%.3f", timing.warp_init_time - timing.warp_cmd_time).." seconds")
                timing.warp_cmd_time = nil
                timing.warp_init_time = nil
            end
            poke_npc(npc.id, npc.index)
        end
    else
        timing.warp_cmd_time = nil
        state.loop_count = 0
    end
end

local function do_sub_cmd(map_name, sub_cmd, args)
    local map = maps[map_name]

    local npc, dist = find_npc(map.zone_npc_list(sub_cmd))

    if not npc then
        if state.loop_count > 0 then
        	log('No '..map.npc_plural..' found! Retrying...')
            state.loop_count = state.loop_count - 1
        	do_sub_cmd:schedule(settings.retry_delay, map_name, sub_cmd, args)
        else
        	log('No '..map.npc_plural..' found!')
            timing.warp_cmd_time = nil
        end

    elseif dist > 6^2 then
        if state.loop_count > 0 then
            log(npc.name..' found, but too far! Retrying...')
            state.loop_count = state.loop_count - 1
            do_sub_cmd:schedule(settings.retry_delay, map_name, sub_cmd, args)
        else
            log(npc.name..' found, but too far!')
            timing.warp_cmd_time = nil
        end    
    elseif npc and npc.id and npc.index and dist <= 6^2 then
        current_activity = {type=map_name, sub_cmd=sub_cmd, args=args, npc=npc, warp_ident = warp_ident}
        if current_activity.sub_cmd then
            state.current_sub_cmd = current_activity.sub_cmd
        end
        handle_before_warp()
        timing.warp_init_time = os.clock()
        if timing.warp_cmd_time then
            debug("Warp initialization time: "..string.format("%.3f", timing.warp_init_time - timing.warp_cmd_time).." seconds")
            timing.warp_cmd_time = nil
            timing.warp_init_time = nil
        end
        poke_npc(npc.id, npc.index)
    end
end

local function do_find_missing_destinations(map_name, args)
    local map = maps[map_name]
    local npc, dist = find_npc(map.zone_npc_list('warp'))

    if not npc then
        if state.loop_count > 0 then
            log('No '..map.npc_plural..' found! Retrying...')
            state.loop_count = state.loop_count - 1
            do_find_missing_destinations:schedule(settings.retry_delay, map_name, args)
        else
            log('No '..map.npc_plural..' found!')
            timing.warp_cmd_time = nil
        end
    elseif dist > 6^2 then
        if state.loop_count > 0 then
            log(npc.name..' found, but too far! Retrying...')
            state.loop_count = state.loop_count - 1
            do_find_missing_destinations:schedule(settings.retry_delay, map_name, args)
        else
            log(npc.name..' found, but too far!')
            timing.warp_cmd_time = nil
        end
    elseif npc and npc.id and npc.index and dist <= 6^2 then
        local max_results = 999999
        if #args > 0 then
            max_results = tonumber(args[1]) or 999999 
        end
        current_activity = {type=map_name, find_missing=true, missing_max=max_results, args=args, npc=npc, warp_ident = warp_ident}
        timing.warp_init_time = os.clock()
        if timing.warp_cmd_time then
            debug("Warp initialization time: "..string.format("%.3f", timing.warp_init_time - timing.warp_cmd_time).." seconds")
            timing.warp_cmd_time = nil
            timing.warp_init_time = nil
        end
        poke_npc(npc.id, npc.index)
    end    
end

local function handle_map_short_name(map, name)
    if not map or not map.short_name or not name then return false end
    if type(map.short_name) == 'string' then
        return map.short_name:lower() == name:lower()
    elseif type(map.short_name) == 'table' then
        for _, alias in ipairs(map.short_name) do
            if type(alias) == 'string' and alias:lower() == name:lower() then
                return true
            end
        end
    end
    return false
end

-- These warps do not use an NPC poke and server response therefore they need an alternate, shorter, path of execution.
local function handle_moghouse_warp(info, args)
    local destiny, coordinate
    local packet = packets.new('outgoing', 0x05E)
    packet['Zone Line'] = 1903324538
    if args:contains('zone') or args:contains('garden') then
        coordinate = 'to Mog Garden'
        destiny = 127
    else
        coordinate = 'out'
        destiny = 0
    end
    log('Warping '..coordinate..' from Mog House.')
    debug('Warping '..coordinate..' from Mog House.')
    packet['Type'] = destiny
    if mh_door_menu then
        packet['MH Door Menu'] = mh_door_menu
    elseif info.zone == 256 or info.zone == 257 then
        packet['MH Door Menu'] = 9
    else
        log('Unable to zone from Mog House; superwarp was not loaded when you entered Mog House and you are not in Adoulin. More information is needed to safely execute warp.')
        return
    end
    debug('Injecting packet 1 zone request.')
    packets.inject(packet)
    if current_warp_id then
        local player = windower.ffxi.get_mob_by_target('me').name
        if player == warp_sender then
            warp_listener(true, player)
        else
            windower.send_ipc_message('confirm '..current_warp_id..' '..player)
        end
    end
end

local function handle_warp(warp, args, fast_retry, retries_remaining, current_sub_cmd)
    warp = warp:lower()
    if retries_remaining == nil then
        state.loop_count = settings.max_retries
    else
        state.loop_count = retries_remaining
    end
    state.fast_retry = fast_retry
    state.warp_interrupted = false
    -- make args safe to index
    if args:length() == 0 then
        -- no args provided; make an empty string so :lower() calls won't error
        args:append('') 
    end
    -- because I can't stop typing "hp warp X" because I've been trained. 
    if args[1] and args[1]:lower() == 'warp' or (args[1] and args[1]:lower() == 'w') then 
        args:remove(1) 
        if args:length() == 0 then args:append('') end
    end
    local all = S{'all','a','@all'}:contains(args[1]:lower()) and (args[2] or smartcmd)
    local party = S{'party','p','@party'}:contains(args[1]:lower()) and (args[2] or smartcmd)
    if all or party then 
        args:remove(1) 

        local participants = nil
        if all then
            participants = get_participants()
        elseif party then
            participants = get_party_members(get_participants())
        end
        participants = order_participants(participants)
        debug('sending warp to all: '..participants:concat(', '))
        confirm_msg = 'All warps confirmed.'
        send_all_with_confirm(
            warp..' '..args:concat(' '),
            settings.send_all_delay,
            participants,
            function(warp_id, entry)
                log(confirm_msg)
            end,
            settings.send_all_display
        )
        --send_all(warp..' '..args:concat(' '), settings.send_all_delay, participants)

        return
    end
    warp_ident = ((warp_ident and warp_ident) or 0) + 1
    smartcmd = false
    -------------------Mog House Handling-----------------------------
    if warp == 'mg' then
        local info = windower.ffxi.get_info()
        if info.mog_house and info.zone ~= 280 then -- We're in a Mog House and it is not our Mog Garden.
            handle_moghouse_warp(info, args)
            return
        else
            current_sub_cmd = 'zone'
        end
    end
    -------------------------------------------------------------------
    if args[1] and args[1]:lower() == 'missing' then
        args:remove(1)         
        for key,map in pairs(maps) do
            if handle_map_short_name(map, warp) then
                do_find_missing_destinations(key, args)
                return
            end
        end
        return
    end
    state.current_warp = warp
    state.current_args = args:copy()
    
    for key,map in pairs(maps) do
        if handle_map_short_name(map, warp) then
            local sub_cmd = nil
            if map.sub_commands then
                for sc, fn in pairs(map.sub_commands) do
                    if sc:lower() == (args[1] and args[1]:lower() or '') then
                        sub_cmd = sc
                    end
                end
            end
            if current_sub_cmd then
                do_sub_cmd(key, current_sub_cmd, args)
                return
            elseif sub_cmd then
                args:remove(1)
                do_sub_cmd(key, sub_cmd, args)
                return
            else
                local sub_zone_target = nil
                if map.sub_zone_targets then
                    local last_arg = args:last() or ''
                    local target_candidate = resolve_sub_zone_aliases(last_arg)
                    if map.sub_zone_targets:contains(target_candidate:lower()) then
                        sub_zone_target = target_candidate
                        args:remove(args:length())
                    end
                end
                local zone = windower.ffxi.get_info().zone
                local zone_target = args:concat(' ')
                if zone_target == '' then
                    zone_target = resources.zones[zone].en
                end
                if map.auto_select_zone and map.auto_select_zone(zone) then
                    zone_target = map.auto_select_zone(zone)
                end
                local specified = {zone = zone_target, subzone = sub_zone_target, legacy = settings.hp_legacy_defaults, order = settings.sortie_reverse_order}
                if map.auto_select_sub_zone and map.auto_select_sub_zone(zone, specified) then
                    sub_zone_target = map.auto_select_sub_zone(zone, specified)
                end
                do_warp(key, zone_target, sub_zone_target)
                return
            end
        end
    end

    -- if we get here nothing matched
    debug('No map found matching short name: '..tostring(warp))
end

local function received_warp_command(cmd, args)
    local player = windower.ffxi.get_mob_by_target('me')
    prev_location = {x = player.x, y = player.y, z = player.z}
    if not timing.warp_cmd_time then
        timing.warp_cmd_time = os.clock()
    end
    if current_activity ~= nil then
        log('superwarp is currently busy. To cancel the last request try "//sw cancel"')
    else
        intended_npc = {}
        state.warp_confirmed = false
        state.current_sub_cmd = nil
        if not smartcmd then
            state.debug_stack = T{}
        end
        handle_warp(cmd, args)
    end
end
---------------------------------------------
--             [Smart Command]             --
--  (Automatically pass the appropriate    -- 
--     sub command with '//sw' only.)      --
---------------------------------------------
local function smart_command(best, short_name)
    local zone_check = windower.ffxi.get_info().zone
    if best.interaction == 'enter' then
        if (maps.abyssea.abyssea_zones and maps.abyssea.abyssea_zones:contains(zone_check)) or (maps.escha.escha_zones and maps.escha.escha_zones:contains(zone_check)) then
            best.interaction = 'exit'
        elseif best.map_name == 'limbus' and zone_check ~= 33 then
            best.interaction = 'next'
        end
    elseif best.interaction == 'exit' then
        if best.npc.name:find('Maw', 1, true) then
            if maps.abyssea.entry_zones and maps.abyssea.entry_zones:contains(zone_check) then
                best.interaction = 'enter'
            end
        elseif best.map_name == 'escha' then
            if maps.escha.escha_zones and not maps.escha.escha_zones:contains(zone_check)then
                best.interaction = 'enter'
            end
        end
    elseif best.map_name == 'limbus' and best.interaction ~= 'exit' then
        if zone_check == 33 then
            best.interaction = 'enter'
        else
            best.interaction = 'next'
        end
    elseif best.map_name == 'sortie' then
        if best.npc.name:find('Device', 1, true) then
            best.interaction = 'warp'
        elseif best.npc.name:find('Bitzer', 1, true) then
            best.interaction = 'port'
        elseif best.npc.name:find('Gadget', 1, true) then
            if not best.npc.name:find("?", 1, true) then
                best.interaction = 'port'
            else
                best.interaction = 'normal'
            end
        end
    elseif best.map_name == 'portals' then
        if zone_check == 50 then
            best.interaction = 'assault'
        else
            best.interaction = 'return'
        end
    elseif best.map_name == 'odyssey' and best.interaction == 'port' and (zone_check == 247 or zone_check == 248) then
        best.interaction = 'warp'
    elseif best.map_name == 'walkofechoes' and best.interaction == 'zone' and best.npc.name:find("#", 1, true) then
        best.interaction = 'enter'
    elseif best.map_name == 'campaign' and best.interaction == 'port' then
        if maps.abyssea.target_ids:contains(best.npc.id) then
            short_name = 'ab'
            best.interaction = 'enter'
        end
    end
    return best.interaction, short_name
end

local last_cache = {
    zone = nil,
    map_name = nil,
    interaction = nil,
}
local function magic_map()
    local best = {
        map_name = nil,
        interaction = nil,
        distance = nil,
        npc = nil,
    }

    local player = windower.ffxi.get_mob_by_target('me')
    if not player then
        return best
    end

    local px, py, pz = player.x, player.y, player.z

    local zone_check = windower.ffxi.get_info().zone
    local max_dist = 36

    -- eliminate overhead if possible
    if last_cache.zone == zone_check
        and last_cache.map_name
        and maps[last_cache.map_name]
    then
        local map = maps[last_cache.map_name]

        if map.zone_npc_list and map.npc_names then
            local warp_zones = not map.all_warp_zones
                or (map.all_warp_zones and map.all_warp_zones:contains(zone_check))

            if warp_zones then
                -- just create an order to run through with ipairs with the one last_cache is holding checked first
                local interaction_order = {}

                if last_cache.interaction then
                    table.insert(interaction_order, last_cache.interaction)
                end

                for interaction_type, _ in pairs(map.npc_names) do
                    if interaction_type ~= last_cache.interaction then
                        table.insert(interaction_order, interaction_type)
                    end
                end

                for _, interaction_type in ipairs(interaction_order) do
                    local npc_list = map.zone_npc_list(interaction_type)

                    for index, npc_data in pairs(npc_list) do
                        local npc = windower.ffxi.get_mob_by_index(index)

                        if npc and npc.valid_target then
                            local diff_vec = V{
                                npc.x - px,
                                npc.y - py,
                                npc.z - pz
                            }

                            local true_distance = diff_vec:length()

                            if true_distance < 50 then  --2D distance checks are squared, these are not.
                                if not best.distance or npc.distance < best.distance then
                                    best.map_name = last_cache.map_name
                                    best.interaction = interaction_type
                                    best.distance = npc.distance
                                    best.npc = npc
                                end
                            end
                        end
                    end
                    -- if within range our work is done
                    if best.npc and best.distance and best.distance < max_dist then
                        last_cache.zone = zone_check
                        last_cache.map_name = best.map_name
                        last_cache.interaction = best.interaction
                        return best
                    end
                end
            end
        end
    end
    -- full scan if cache doesn't do the trick
    for map_name, map in pairs(maps) do
        if map.zone_npc_list and map.npc_names then
            local warp_zones = not map.all_warp_zones
                or (map.all_warp_zones and map.all_warp_zones:contains(zone_check))

            if warp_zones then
                for interaction_type, _ in pairs(map.npc_names) do
                    local npc_list = map.zone_npc_list(interaction_type)

                    for index, npc_data in pairs(npc_list) do
                        local npc = windower.ffxi.get_mob_by_index(index)

                        if npc and npc.valid_target then
                            local diff_vec = V{
                                npc.x - px,
                                npc.y - py,
                                npc.z - pz
                            }

                            local true_distance = diff_vec:length()

                            if true_distance < 50 then --2D distance checks are squared, these are not.
                                if not best.distance or npc.distance < best.distance then
                                    best.map_name = map_name
                                    best.interaction = interaction_type
                                    best.distance = npc.distance
                                    best.npc = npc
                                end
                                -- if within range our work is done
                                if best.distance and best.distance < max_dist then
                                    last_cache.zone = zone_check
                                    last_cache.map_name = best.map_name
                                    last_cache.interaction = best.interaction
                                    return best
                                end
                            end
                        end
                    end
                end
            end
        end
    end
    if best.map_name then
        last_cache.zone = zone_check
        last_cache.map_name = best.map_name
        last_cache.interaction = best.interaction
    end
    return best
end
---------------------------------------------
--            [The superwarp™]             --
---------------------------------------------
local function the_superwarp(genArgs, dispatcher, retries)
    local short_name
    local info = windower.ffxi.get_info()
    state.debug_stack = T{}
    if not info.mog_house or info.mog_house and info.zone == 280 then
        if retries == nil then
            state.loop_count = settings.max_retries
        end

        local result = magic_map()
        if not result.map_name then
            if state.loop_count > 0 then
                log('Searching for warp NPCs...')
                state.loop_count = state.loop_count - 1
                the_superwarp:schedule(3, genArgs, dispatcher, state.loop_count)
            else
                log('No warp NPCs nearby.')
                timing.warp_cmd_time = nil
            end
            return
        end
        state.loop_count = nil
        if result.map_name == 'campaign' and result.interaction == 'port' then
            if maps.abyssea.target_ids:contains(result.npc.id) then
                result.map_name = 'abyssea'
                result.interaction = 'enter'
            end
        end
        local map = maps[result.map_name]

        if type(map.short_name) == 'table' then
            short_name = map.short_name[1]
        else
            short_name = map.short_name
        end
        for i,v in pairs(genArgs) do genArgs[i]=windower.convert_auto_trans(genArgs[i]) end
        if genArgs:length() == 0 then
            local smart_cmd
            smart_cmd, short_name = smart_command(result, short_name)
            if smart_cmd ~= 'warp' and short_name ~= 'hp' then
                debug('No sub-command provided, using '..short_name..' '..smart_cmd..'.')
                genArgs:append(smart_cmd)
            end
        else
            debug('Using '..result.npc.name..' for '..result.map_name..'.')
        end
    elseif info.zone ~= 280 then
        short_name = 'mg'
    end
    if dispatcher then genArgs:insert(1, dispatcher) end
    smartcmd = true
    warp_listener()
    received_warp_command(short_name, genArgs)
end

windower.register_event('addon command', function(...)
    local args = T{...}
    local genArgs = args:copy()
    local cmd = args[1]
    args:remove(1)
    for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
    
    if cmd and warp_list:contains(cmd:lower()) and args[1] then
        warp_listener()
        received_warp_command(cmd, args)
    elseif cmd == 'cancel' or cmd == 'reset' then
        if args[1] then
            local all = S{'all','a','@all'}:contains(args[1]:lower())
            local party = S{'party','p','@party'}:contains(args[1]:lower())
            if all or party then 
                local participants = nil
                participants = get_participants()
                if party then
                    participants = get_party_members(participants)
                end
                participants = order_participants(participants)
                reset_all(settings.send_all_delay, participants)
                warp_listener()
            else
                reset()
            end
        else
            reset()
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
    elseif cmd == 'understood' then
        if not settings.understood then
            windower.add_to_chat(207,'Load messages will no longer be displayed')
            settings.understood = true
            settings:save()
        end
    elseif cmd == 'chest' then
        if args[1] then
            set_chest_order(args[1])
        else
            local zone_name = resources.zones[windower.ffxi.get_info().zone].name:lower()
            if zone_name == 'apollyon' or zone_name == 'temenos' then
                for k, v in pairs (settings.limbus_chest_order[zone_name]) do
                    if v == 4 then
                        log("Open chest at "..k)
                        break
                    end
                end
            else
                log('You are not in limbus.')
            end
        end
    elseif cmd and cmd:contains('sync') then
        local chestdata = T(settings.limbus_chest_order):tovstring()
        chestdata = chestdata:gsub('%s+', '')
        windower.send_ipc_message(
            'sync_limbus_chests '..chestdata
        )
        log('Sent limbus chest sync.')
    elseif cmd and cmd:contains('default') then
        if settings.hp_legacy_defaults then
            settings.hp_legacy_defaults = false
            log('Homepoint defaults set to: New')
        else
            settings.hp_legacy_defaults = true
            log('Homepoint defaults set to: Legacy')
        end
        config.save(settings)
    elseif cmd and cmd:contains('order') then
        if settings.sortie_reverse_order then
            settings.sortie_reverse_order = false
            log('Sortie order set to: ABC')
        else
            settings.sortie_reverse_order = true
            log('Sortie order set to: CBA')
        end
        config.save(settings)
    elseif cmd and cmd:contains('display') then
        if settings.send_all_display then
            settings.send_all_display = false
            log('Sendall readout is now OFF.')
        else
            settings.send_all_display = true
            log('Sendall readout is now ON.')
        end
        config.save(settings)
    elseif cmd == 'help' then
        windower.add_to_chat(207,'\n| READ ME |\n[New!] You may now use "//sw" or "/console sw" for all maps with no extra command prefix. i.e. //sw port, or //sw rab to go to Rabao #2')
        windower.add_to_chat(207,'[New!] superwarp (smartcommand) - You may now use just //sw with no command for all warps that do not require a destination to be specified. i.e. enter and exit commands for abyssea, escha zones and apollyon, domain invasion enter, next command in limbus, port in odyssey and sortie, runic portal assault and return, campaign npcs return and Cavernous Maw port, all 4 Walk Of Echoes commands. It can also be used to go to the default destination in cases that call for specification. "//sw p" to use the smart command with all party members, or "a" for all. Use with confidence. Layers of failsafes are in place.')
        windower.add_to_chat(207,'\nUse [all/a/@all/party/p] after the command prefix and before the destination to warp all characters or all party/alliance members. (//li p next)\nYou may still use [warp] if you learned to include it or still have macros written this way. (sw hp warp eastern adoulin 1) (Legacy support)\n-----------------------------')
        local keys = {}
        for key in pairs(maps) do
            table.insert(keys, key)
        end

        table.sort(keys)  -- alphabetical sort

        for _, key in ipairs(keys) do
            local map = maps[key]
            windower.add_to_chat(207,map.help_text)
        end
        windower.add_to_chat(207,'| superwarp |\nsw cancel -- Cancels pending warp command.\nsw reset -- Attempts to clear menu lock.\nsw sync -- Instantly synchronizes all characters Limbus chest tracking order with the character the command is executed from.\nsw chest (tower) / chest -- Manually updates chest tracking with the tower you input after the chest command. i.e. //sw chest se; If no argument is provided will display the next chest open location within limbus. i.e. //sw chest\nsw hpdefaults -- Toggles homepoint default destinations between Legacy and New.\nsw order Toggles between ABC and CBA order for Sortie Smart Command.\nsw display -- Toggles all / party warp display.\nsw missing -- Display destinations you are missing from the nearest warp system if applicable.\n-----------------------------')
        windower.add_to_chat(207,'Use [all/a/@all/party/p] after the command prefix and before the destination to warp all characters or all party/alliance members. (//li p next)\nYou may still use [warp] if you learned to include it or still have macros written this way. (sw hp warp eastern adoulin 1) (Legacy support)\n\n[New!] You may now use "//sw" or "/console sw" for all maps with no extra command prefix. i.e. //sw port , or //sw rab to go to Rabao #2')
        windower.add_to_chat(207,'[New!] superwarp (smartcommand) - You may now use just //sw with no command for all warps that do not require a destination to be specified. i.e. enter and exit commands for abyssea, escha zones and apollyon, domain invasion enter, next command in limbus, port in odyssey and sortie, runic portal assault and return, campaign npcs return and Cavernous Maw port, all 4 Walk Of Echoes commands. It can also be used to go to the default destination in cases that call for specification. "//sw p" to use the smart command with all party members, or "a" for all. Use with confidence. Layers of failsafes are in place.')
        windower.add_to_chat(207,'If you become menu locked use //sw reset to clear.')
    elseif current_activity ~= nil then
        log('superwarp is currently busy. To cancel the last request try "//sw cancel"')
        return
    else
        timing.warp_cmd_time = os.clock()
        if smartcheck then
            local all, party
            if genArgs[1] and genArgs[1]:lower() == 'warp' or (genArgs[1] and genArgs[1]:lower() == 'w') then 
                genArgs:remove(1) 
            end
            if genArgs:length() ~= 0 then
                all = S{'all','a','@all'}:contains(genArgs[1]:lower())
                party = S{'party','p','@party'}:contains(genArgs[1]:lower())
                if all then
                    local _zs = S{275, 133, 189}
                    local zone_exclusion = windower.ffxi.get_info().zone
                    if _zs:contains(zone_exclusion) and not genArgs[2] then
                        all = nil
                        genArgs[1] = '#a'
                    else
                        genArgs:remove(1)
                    end
                elseif party then 
                    genArgs:remove(1)
                end
            end
            local dispatcher
            if party then dispatcher = 'p' elseif all then dispatcher = 'a' end
            the_superwarp(genArgs,dispatcher)
        else
            log('Please update all of superwarp\'s files for version 1.1.')
            return
        end
    end
end)

-- handle direct hp/wp/sg commands
windower.register_event('unhandled command', function(cmd, ...)
    local args = T{...}
    for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
    if warp_list:contains(cmd:lower()) then
        warp_listener()
        received_warp_command(cmd, args)
    end
end)

function receive_send_all(msg)
    local args = msg:split(' ')
    local cmd = args[1]
    args:remove(1)
    if cmd == 'reset' then
        reset()
    elseif warp_list:contains(cmd) then
        received_warp_command(cmd, args)
    end
end

local function reset_action_queue() -- Clean solution to one of the toughest bugs i've had to overcome.
    local wait_packets = {
        nil,
        0x052,
        0x05B,
        nil,
    }
    for i = 1, 4 do
        if current_activity.action_queue[i] then
            current_activity.action_queue[i].wait_packet = wait_packets[i]
        end
    end
    current_activity.action_index = 1
    local limbus_action = current_activity.action_queue[1]
    packets.inject(limbus_action.packet)
    current_activity.action_index = current_activity.action_index + 1
    if current_activity.retried_once then
        current_activity.retry_attempted = true
        log('Failed again, attempting to execute warp one more time or abort cleanly.')

        local zone = windower.ffxi.get_info().zone
        local map = zone == 38 and maps.limbus.warpdata['Apollyon'] or maps.limbus.warpdata['Temenos']
        local the_poke = current_activity.poked_npc_id

        for _, teleporter in pairs(map) do
            if teleporter.npc == the_poke then
                current_activity.action_queue[2].packet["X"] = teleporter.x
                current_activity.action_queue[2].packet["Y"] = teleporter.y
                current_activity.action_queue[2].packet["Z"] = teleporter.z
                current_activity.action_queue[2].packet["_unknown1"] = teleporter.unknown1
                current_activity.action_queue[2].packet["Rotation"] = teleporter.h
                break
            end
        end
    else
        log('There was "Nothing out of the ordinary here.", Attempting to retry the warp.')
    end
    current_activity.retried_once = true
end

local function perform_next_action()
    if current_activity and current_activity.running and current_activity.action_queue and current_activity.action_index > 0 then
        local current_action = current_activity.action_queue[current_activity.action_index]
        if current_action == nil then
            debug("all actions complete")
            if current_warp_id then
                local player = windower.ffxi.get_mob_by_target('me').name
                if player == warp_sender then
                    warp_listener(true, player)
                else
                    windower.send_ipc_message('confirm '..current_warp_id..' '..player)
                end
            end
            if last_action and last_action.expecting_zone then
                debug("expecting zone")
                -- we're going to zone. 
                expecting_zone = true
            else
            	state.client_lock = false
                -- not zoning. Just run the command now + delay
                handle_on_arrival:schedule(math.max(0, settings.command_delay_on_arrival))
            end

            last_activity = current_activity
            state.loop_count = 0
            current_activity = nil
            last_action = nil
        elseif not state.fast_retry and current_action.wait_packet then
            debug("waiting for packet 0x"..current_action.wait_packet:hex().." for action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            current_action.wait_start = os.time()
            if not current_action.timeout then
                if in_limbus_zone and current_activity.action_index == 3 then
                    current_action.timeout = 2.5  -- If we do not receive our wait packet quickly at this phase of a limbus warp we need to act fast to avoid divergent state.
                else
                    current_action.timeout = 3--settings.default_packet_wait_timeout
                end
            end
            local fn = function(s, ca, i, p, d, wi)
                local action = ca.action_queue[i]
                if action and ca.action_index == i and wi == warp_ident and action.wait_packet == p and not ca.canceled then --We no longer get false timeouts which would thwart otherwise would be successful warps.
                    debug("timed out waiting for packet 0x"..p:hex().." for action "..tostring(i)..' '..(d or ''))
                    if in_limbus_zone and (current_activity.action_index == 3 and state.loop_count > 0 and not current_activity.retry_attempted) or (current_activity.retried_once and not current_activity.retry_attempted) then  -- If we timeout at this phase and it is not because of interrupt send the 0x05C again because it was dropped. / Or we have retried once and still failed, safe retry/abort procedure.
                        reset_action_queue()
                    else
                        if s.loop_count > 0 then
                            reset(true)
                            log("Timed out waiting for response from the menu. Retrying...")
                            handle_warp:schedule(settings.retry_delay, s.current_warp, s.current_args, false, s.loop_count - 0.2, s.current_sub_cmd)
                        else
                            reset(true)
                            log("Timed out waiting for response from the menu.")
                        end
                    end
                end
            end
            fn:schedule(current_action.timeout, state, current_activity, current_activity.action_index, current_action.wait_packet, current_action.description, warp_ident)
        elseif not state.fast_retry and current_action.delay and current_action.delay > 0 then
            debug("delaying action "..tostring(current_activity.action_index)..' '..(current_action.description or '')..' for '.. current_action.delay..'s...')
            local delay_seconds = current_action.delay
            current_action.delay = nil
            last_action = current_action
            perform_next_action:schedule(delay_seconds)
        elseif current_action.packet then
            -- just a packet, inject it.
            debug("injecting packet "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            packets.inject(current_action.packet)
            current_activity.action_index = current_activity.action_index + 1
            if current_action.message then
                log(current_action.message)
            end
            last_action = current_action
            perform_next_action()
        elseif current_action.fn ~= nil then
            -- has a function, pass along params.
            debug("performing action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            continue = current_action.fn(current_action.incoming_packet)
            current_activity.action_index = current_activity.action_index + 1
            if current_action.message then
                log(current_action.message)
            end
            last_action = current_action
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
        if current_action and current_action.wait_packet and current_action.wait_packet == id and not state.warp_interrupted then
            local message_type = data:unpack('b4', 5)
            local paquet = packets.parse('incoming', data)
            if id == 0x05C or (id == 0x052 and message_type ~= 2) or (id == 0x05B and paquet['ID'] == windower.ffxi.get_mob_by_target('me').id) then -- Filter event skips and other false positives.
                debug("received packet 0x"..id:hex().." for action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
                current_action.wait_packet = nil
                current_action.incoming_packet = packets.parse('incoming',data)
                perform_next_action()
            elseif id == 0x052 and message_type == 2 then
                debug("Detected event skip while waiting to receive packet 0x"..id:hex().." for action "..tostring(current_activity.action_index)..' '..(current_action.description or ''))
            end
        end
    end
    ----
    if id == 0x05C and current_activity and current_activity.type == 'campaign' and not current_activity.sub_cmd then
        local envelope = packets.parse('incoming', data)
        local campparam1 = data:unpack('I', 9)
        local campnpc = data:unpack('I', 5)
        if current_activity.find_missing then
            local map = maps.campaign
            if map.missing then
                if current_activity.type == 'campaign' then
                    local zone = windower.ffxi.get_info()['zone']
                    local check_flag = true
                    local missing, err = map.missing(map.warpdata, zone, envelope, check_flag)
                    if err then
                        log("Error: "..err)
                    elseif missing ~= nil then
                        if #missing > 0 then
                            log("You are missing these "..map.long_name.." destinations: ")
                            for i=1, math.min(#missing, current_activity.missing_max) do
                                log(missing[i] or 'nil')
                            end
                            if #missing > current_activity.missing_max then
                                log("..and "..(#missing-current_activity.missing_max)..' more...')
                            end
                        else
                            log("You are not missing any destinations.")
                        end
                    else
                        log("An unknown error occurred when finding missing destinations.")                        
                    end
                end
                return
            end
        else
            if campnpc and campnpc ~= 0 then
                local permission = envelope["Menu Parameters"]:unpack('I', 1)
                if bit.band(permission, current_activity.activity_settings.permission) ~= 0 then
                    debug("Destination is unlocked...")
                else
                    log("Destination not unlocked yet...")
                    reset(true)
                end
            else
                if allied_notes < campparam1 then
                    log("Insufficient Allied Notes")
                    reset(true)
                end
            end
        end
    end
    ---
    if id == 0x37 and not injected and state.client_lock then
        local p = packets.parse('incoming', data)
        p['_flags3'] = bit.bor(p['_flags3'], 2)
        return packets.build(p)
    end
    if id == 0x00A then
        local p = packets.parse('incoming', data)
        if not p then return end
        mh_door_menu = p['MH Door Menu']
    end
    if id == 0x052 and current_activity and current_activity.running then
        local message_type = data:unpack('b4', 5)
        if message_type == 2 then
            if state.loop_count > 0 then
                if settings.enable_fast_retry_on_interrupt then
                    log("Detected event-skip. Retrying (fast)...")
                    state.warp_interrupted = true
                    handle_warp:schedule(0.1, state.current_warp, state.current_args, true, state.loop_count - 0.2, state.current_sub_cmd)
                else
                    log("Detected event-skip. Retrying...")
                    state.warp_interrupted = true
                    handle_warp:schedule(0.1, state.current_warp, state.current_args, false, state.loop_count - 0.2, state.current_sub_cmd)
                end
            end
        end
    end

    if id == 0x034 or id == 0x032 then
        local p = packets.parse('incoming', data)
        
        if current_activity and not current_activity.running then
            current_activity.caught_poke = true
            if timing.poke_time then
                timing.poke_response_time = os.clock()
                debug("Response time: "..string.format("%.2f", timing.poke_response_time - timing.poke_time).." seconds")
            else
                debug("Poke time nil.")
            end
            timing.poke_response_time = nil
            local zone = windower.ffxi.get_info()['zone']
            local map = maps[current_activity.type]
            
            last_menu = p["Menu ID"]
            last_npc = p["NPC"]
            last_npc_index = p["NPC Index"]

            --debug("recorded reset params: "..last_menu.." "..last_npc)

            if current_activity.poked_npc_id ~= p["NPC"] or current_activity.poked_npc_index ~= p["NPC Index"] then
                log("This is not the NPC the warp was meant for. Shutting it down.")
                last_activity = current_activity
                state.loop_count = 0
                current_activity = nil
                reset:schedule(0.5, true)
                return true
            end

            if current_activity.find_missing then
                debug("Finding missing destinations")
                if map.missing then
                    local missing, err = map.missing(map.warpdata, zone, p)
                    if err then
                        log("Error: "..err)
                    elseif missing ~= nil then
                        if #missing > 0 then
                            log("You are missing these "..map.long_name.." destinations: ")
                            for i=1, math.min(#missing, current_activity.missing_max) do
                                log(missing[i] or 'nil')
                            end
                            if #missing > current_activity.missing_max then
                                log("..and "..(#missing-current_activity.missing_max)..' more...')
                            end
                        else
                            log("You are not missing any destinations.")
                        end
                    elseif current_activity.type ~= 'campaign' then
                        log("An unknown error occurred when finding missing destinations.")                        
                    end
                end
                if current_activity.type ~= 'campaign' then
                    -- reset
                    reset:schedule(0.1, true)
                else
                    reset:schedule(1, true)
                end
                return true
            end

            local validation_message = nil
            if map.validate then validation_message = map.validate(p["Menu ID"], zone, current_activity, p, settings) end
            if validation_message ~= nil then
                log("WARNING: "..validation_message.." Canceling action.")
                ------------------Warp Confirm----------------------
                local player = windower.ffxi.get_mob_by_target('me')
                if player.name == warp_sender then
                    confirm_msg = 'All warps finished.'
                    warp_listener(true, player.name)
                elseif current_warp_id then
                    windower.send_ipc_message('confirm '..current_warp_id..' '..player.name)
                end
                ---------------------------------------------
                last_activity = current_activity
                state.loop_count = 0
                current_activity = nil
                reset(true)
                return true
            end

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
        log('Wait until the current action has finished. If you are soft-locked  //sw reset ')
      --[[
        -- USER poked something and we were in the middle of something.
        -- we can't cancel that poke. The client is execting it already. We MUST cancel the current task.
        log('Detected user interaction. Canceling current warp...')

        reset(true)
        coroutine.sleep(1)
        return false
        ]]
    end  
end)
windower.register_event('zone change',function(id,data,modified,injected,blocked)
    current_zone = windower.ffxi.get_info().zone
    if current_zone == 37 or current_zone == 38 then
        in_limbus_zone = true
    else
        in_limbus_zone = false
    end
    state.client_lock = false
    if expecting_zone then 
        handle_on_arrival:schedule(math.max(0, settings.command_delay_on_arrival))
    end
    expecting_zone = false
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
    elseif id == 0x05B and in_limbus_zone then  -- only look at these packets when we're in limbus
        local p = packets.parse('outgoing', data)
        if p["Target"] >= 16929362 and p["Target"] <= 16929365 then
            if p['Automated Message'] == true then --Filter x2 calls and/or interrupts
                if current_zone == 37 then
                    local zone = 'temenos'
                    local tower = nil
                    if p["Target"] == 16929362 then
                        tower = "N4"
                    elseif p["Target"] == 16929363 then
                        tower = "W4"
                    elseif p["Target"] == 16929364 then
                        tower = "E4"
                    elseif p["Target"] == 16929365 then
                        tower = "C3"
                    end
                    if tower then
                        add_table_entry(zone, tower)
                    end
                end
            end
        elseif p["Target"] >= 16933563 and p["Target"] <= 16933566 then
            if p['Automated Message'] == true then --Filter x2 calls and/or interrupts
                if current_zone == 38 then
                    local zone = 'apollyon'
                    local tower = nil
                    if p["Target"] == 16933563 then
                        tower = "NW5"
                    elseif p["Target"] == 16933564 then
                        tower = "SW4"
                    elseif p["Target"] == 16933565 then
                        tower = "NE5"
                    elseif p["Target"] == 16933566 then
                        tower = "SE4"
                    end
                    if tower then
                        add_table_entry(zone, tower)
                    end
                end
            end
        end
        --print(data:unpack('b7b4b3b7b8', 9))
        --local p = packets.parse('outgoing', data)
        --local t = windower.ffxi.get_mob_by_index(p['Target Index'])
        --debug("out 0x05B: "..t.name.." oi:"..tostring(p['Option Index']).." _u1:"..tostring(p['_unknown1']).." _u2:"..tostring(p['_unknown2']).." menu:"..tostring(p['Menu ID']).." auto:"..tostring(p['Automated Message']))
    end
end)
windower.register_event('load', function()
    if not settings.understood then
        windower.add_to_chat(207,' \nWelcome to superwarp 1.1.5. \n \n Now use sw in place of  hp, wp, sg, un, so, li, ew, ab etc -  for all warp commands!!\n The new smart-command is "//sw" by itself. It autohandles all warp scenarios where a destination need not be specified. i.e. so port or ab enter. It works as any subcommand for any map except others where multiple are usable, in those cases it always serves as one. i.e. next cmd for limbus.')
        windower.add_to_chat(207,' All legacy functionality is still in place.')
        windower.add_to_chat(207,' sw help to list all information.')
        windower.add_to_chat(207,' sw understood to stop displaying these messages on load.')
    end
end)
windower.register_event('login', function()
    player_info = windower.ffxi.get_player()
    if not player_info then return end
    settings = config.load(('data/settings_%s.xml'):format(player_info.name),defaults)
    migrate_limbus_chest_order()
end)
windower.register_event('unload', function()
	if windower.ffxi.get_info().logged_in then
		reset(true)
	end
end)
