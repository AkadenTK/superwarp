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
    * Neither the name of HomePoint nor the
      names of its contributors may be used to endorse or promote products
      derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL Sammeh BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

]]

_addon.name = 'superwarp'

_addon.author = 'Akaden'

_addon.version = '0.9'

_addon.command = 'sw'

require('tables')
require('logger')
require('functions')
packets = require('packets')

maps = {
	['hp'] = require('map/homepoints'),
	['wp'] = require('map/waypoints'),
	['sg'] = require('map/guides'),
}

sub_zone_aliases = {
	['e'] = 'Entrance',
	['ah'] = 'Auction House',
	['auction'] = 'Auction House',
	['mh'] = 'Mog House',
	['mog'] = 'Mog House',
	['house'] = 'Mog House',
	['fs'] = 'Frontier Station',
}

sub_zone_targets = {
	['hp'] = S{'entrance', 'mog house', 'auction house', '1', '2', '3', '4', '5', '6', '7', '8', '9', },
	['wp'] = S{'frontier station', 'platea', 'triumphus', 'pioneers', 'mummers', 'inventors', 'auction house', 'mog house', 'bridge', 'airship', 'docks', 'waterfront', 'peacekeepers', 'scouts', 'statue', 'goddess', 'wharf', 'yahse', 'sverdhried', 'hillock', 'coronal', 'esplanade', 'castle', 'gates', '1', '2', '3', '4', '5', '6', '7', '8', '9', }	
}

debugging = true

function debug(msg)
	if debugging then
		log('debug: '..msg)
	end
end

--- resolve sub-zone target aliases (ah -> auction house, etc.)
local function resolve_sub_zone_aliases(raw)
	if raw == nil then return nil end
	local raw_lower = raw:lower()

	if sub_zone_aliases[raw_lower] then return sub_zone_aliases[raw_lower] end

	return raw
end

function get_fuzzy_name(name)
	return name:lower():gsub("%s", ""):gsub("%p", "")
end

local function resolve_warp_index(map, zone, sub_zone)
	local fuzzy_zone = get_fuzzy_name(zone)
	for z, sub_zones in pairs(map) do
		local fuzzy_z = get_fuzzy_name(z)
		if fuzzy_z ~= '' and type(sub_zones) == 'table' then
			if sub_zone ~= nil then
				local fuzzy_sub_zone = get_fuzzy_name(sub_zone)
				if (fuzzy_zone:length() >= 3 and fuzzy_z:contains(fuzzy_zone)) or fuzzy_zone == fuzzy_z then
					for sz, index in pairs(sub_zones) do
						local fuzzy_sz = get_fuzzy_name(sz)
						if (sub_zone:length() >= 3 and fuzzy_sz:contains(fuzzy_sub_zone)) or fuzzy_sz == fuzzy_sub_zone then
							debug('found warp index: '..z..'/'..sz..' ('..index..')')
							return index, z..' - '..sz
						end
					end
					log('Found zone ('..z..'), but not sub zone: '..sub_zone)
					return nil
				end
			else
				-- table listed, but no sub_zone specified, just return the first.
				for sz, index in pairs(sub_zones) do
					debug('Found zone ('..z..'), but no sub-zone listed, using first ('..sz..')')
					return index, z..' - '..sz
				end
			end
		else -- no sub_zones table, it's just an index.
			if (fuzzy_zone:length() >= 3 and fuzzy_z:contains(fuzzy_zone)) or fuzzy_z == fuzzy_zone then
				debug('found warp index: '..z..' ('..sub_zones..')')
				return sub_zones, zone
			end
		end
	end
end

local function set_homepoint()
	log('set hp')
end

local function do_homepoint_warp(zone, sub_zone)
	local warp_index, display_name = resolve_warp_index(maps.hp, zone, sub_zone)
	if warp_index then
		log('Warping via Home Point to '..display_name..'.')
	end
end

local function do_waypoint_warp(zone, sub_zone)
	local warp_index, display_name = resolve_warp_index(maps.wp, zone, sub_zone)
	if warp_index then
		log('Warping via Waypoint to '..display_name..'.')
	end
end

local function do_guide_warp(zone)
	local warp_index, display_name = resolve_warp_index(maps.sg, zone)
	if warp_index then
		log('Warping via Survival Guide to '..display_name..'.')
	end
end

local function reset()
	log('Should be reset, try again.')
end

local function handle_warp(warp, args)
	warp = warp:lower()

	local all = args[1]:lower() == 'all'
	if all then args:remove(1) end

	local sub_zone_targt = nil
	if sub_zone_targets[warp] then
		local target_candidate = resolve_sub_zone_aliases(args:last())
		if sub_zone_targets[warp]:contains(target_candidate:lower()) then
			sub_zone_target = target_candidate
			args:remove(args:length())
		end
	end

	if warp == 'hp' then
		if args[1]:lower() == 'set' then
			set_homepoint()
		else
			do_homepoint_warp(args:concat(' '), sub_zone_target)
		end
	elseif warp == 'wp' then
		do_waypoint_warp(args:concat(' '), sub_zone_target)
	elseif warp == 'sg' then
		do_guide_warp(args:concat(' '))
	end
end


windower.register_event('addon command', function(...)
    local args = T{...}
    local cmd = args[1]
	args:remove(1)
	for i,v in pairs(args) do args[i]=windower.convert_auto_trans(args[i]) end
	local item = table.concat(args," "):lower()
	if S{'hp','wp','sg'}:contains(cmd) then
		handle_warp(cmd, args)
	elseif cmd == 'reset' then
		reset()	
	end
end)

windower.register_event('unhandled command', function(cmd, ...)
    local args = T{...}
    if S{'hp','wp','sg'}:contains(cmd:lower()) then
		handle_warp(cmd, args)
    end
end)