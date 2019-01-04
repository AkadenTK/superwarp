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
	['hp'] = require('maps/homepoints.lua'),
	['wp'] = require('maps/waypoints.lua'),
	['sg'] = require('maps/guides.lua'),
}

sub_zone_targets = {
	['hp'] = {'e', 'mh', 'ah', '1', '2', '3', '4', '5', '6', '7', '8', '9', },
	['wp'] = {'fs', 'platea', 'triumphus', 'pioneers', 'mummers', 'inventors', 'auction', 'ah', 'mog', 'house', 'mh', 'bridge', 'airship', 'docks', 'waterfront', 'peacekeepers', 'scouts', 'statue', 'goddess', 'wharf', 'yahse', 'sverdhried', 'hillock', 'coronal', 'esplanade', 'castle', 'gates', '1', '2', '3', '4', '5', '6', '7', '8', '9', }	
}

local function set_homepoint()

end

local function do_homepoint_warp(zone, sub_zone)

end

local function do_waypoint_warp(zone, sub_zone)

end

local function do_guide_warp(zone)
	
end

local function reset()
	
end

local function handle_warp(warp, args)
	warp = warp:lower()

	local all = args[1]:lower() == 'all'
	if all then args:remove(1) end

	local sub_zone_targt = nil
	if sub_zone_targets[warp] and sub_zone_targets[warp]:contains(args:last():lower()) then
		sub_zone_target = args:last():lower()
		args:remove(args:length())
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