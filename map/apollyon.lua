local entry_zones = S{33}
local apollyon_zone = 38
local npc_names = T{
    port = S{'Swirling Vortex'},
    ['next'] = S{'Swirling Vortex'},
    warp = S{'Swirling Vortex'},
    enter = S{'Swirling Vortex'},
    ['exit'] = S{'Radiant Aureole'},
}

   local destination_array = {
	   E1  = {display_name = 'Entrance 1' , menu_id = 102,  index = 671, npc = 16933535, offset = 1, x = -608,z = 0, y = -600,h = 126, unknown1 = 1,  unknown2 = 1},
	   E2  = {display_name = 'Entrance 2' , menu_id = 103,  index = 672, npc = 16933536, offset = 1, x = 608,z = 0, y = -600,h = 0,   unknown1 = 1,  unknown2 = 1},
	   NW1 = {display_name = 'Northwest 1', menu_id = 104,  index = 673, npc = 16933537, offset = 1, x = -440.00003051758, z = 0, y = -88.000007629395,  h = 191, unknown1 = 11, unknown2 = 1},
	   NW2 = {display_name = 'Northwest 2', menu_id = 105,  index = 674, npc = 16933538, offset = 2, x = -534,z = 0, y = 171.00001525879,h = 159, unknown1 = 12, unknown2 = 1},
	   NW3 = {display_name = 'Northwest 3', menu_id = 106,  index = 675, npc = 16933539, offset = 3, x = -294,z = 0, y = 171.00001525879,h = 159, unknown1 = 13, unknown2 = 1},
	   NW4 = {display_name = 'Northwest 4', menu_id = 107,  index = 676, npc = 16933540, offset = 4, x = -628,z = 0, y = 497.00003051758,h = 223, unknown1 = 14, unknown2 = 1},
	   NW5 = {display_name = 'Northwest 5', menu_id = 108,  index = 677, npc = 16933541, offset = 5, x = -388,z = 0, y = 498.00003051758,h = 223, unknown1 = 15, unknown2 = 1},
	   SW1 = {display_name = 'Southwest 1', menu_id = 109,  index = 678, npc = 16933542, offset = 3, x = -468.00003051758, z = 0, y = -625,h = 223, unknown1 = 21, unknown2 = 1},
	   SW2 = {display_name = 'Southwest 2', menu_id = 110,  index = 679, npc = 16933543, offset = 4, x = -576,z = 0, y = -428.00003051758,  h = 159, unknown1 = 22, unknown2 = 1},
	   SW3 = {display_name = 'Southwest 3', menu_id = 111,  index = 680, npc = 16933544, offset = 0, x = -428.00003051758, z = 0, y = -385.00003051758,  h = 223, unknown1 = 23, unknown2 = 1},
	   SW4 = {display_name = 'Southwest 4', menu_id = 112,  index = 681, npc = 16933545, offset = 5, x = -176.00001525879, z = 0, y = -628,h = 159, unknown1 = 24, unknown2 = 1},
	   NE1 = {display_name = 'Northeast 1', menu_id = 113,  index = 682, npc = 16933546, offset = 9, x = 440.00003051758,  z = 0, y = -88.000007629395,  h = 191, unknown1 = 31, unknown2 = 1},
	   NE2 = {display_name = 'Northeast 2', menu_id = 114,  index = 683, npc = 16933547, offset = 10,x = 534,z = 0, y = 171.00001525879,h = 223, unknown1 = 32, unknown2 = 1},
	   NE3 = {display_name = 'Northeast 3', menu_id = 115,  index = 684, npc = 16933548, offset = 10,x = 294,z = 0, y = 171.00001525879,h = 223, unknown1 = 33, unknown2 = 1},
	   NE4 = {display_name = 'Northeast 4', menu_id = 116,  index = 685, npc = 16933549, offset = 1, x = 628,z = 0, y = 497.00003051758,h = 159, unknown1 = 34, unknown2 = 1},
	   NE5 = {display_name = 'Northeast 5', menu_id = 117,  index = 686, npc = 16933550, offset = 2, x = 388.00003051758,  z = 0, y = 498.00003051758,h = 159, unknown1 = 35, unknown2 = 1},
	   SE1 = {display_name = 'Southeast 1', menu_id = 118,  index = 687, npc = 16933551, offset = 5, x = 468.00003051758,  z = 0, y = -625,h = 159, unknown1 = 41, unknown2 = 1},
	   SE2 = {display_name = 'Southeast 2', menu_id = 119,  index = 688, npc = 16933552, offset = 6, x = 576,z = 0, y = -428.00003051758,  h = 223, unknown1 = 42, unknown2 = 1},
	   SE3 = {display_name = 'Southeast 3', menu_id = 120,  index = 689, npc = 16933553, offset = 7, x = 428.00003051758,  z = 0, y = -385.00003051758,  h = 159, unknown1 = 43, unknown2 = 1},
	   SE4 = {display_name = 'Southeast 4', menu_id = 121,  index = 690, npc = 16933554, offset = 8, x = 176.00001525879,  z = 0, y = -628,h = 223, unknown1 = 44, unknown2 = 1},
	}
local temp_item_ids = {
   -- Northwest
        ["NW1"] = 9981,
        ["NW2"] = 9982,
        ["NW3"] = 9983,
        ["NW4"] = 9984,
        ["NW5"] = 9985,
   -- Southwest
        ["SW1"] = 9986,
        ["SW2"] = 9987,
        ["SW3"] = 9988,
        ["SW4"] = 9989,
   --Northeast
        ["NE1"] = 9990,
        ["NE2"] = 9991,
        ["NE3"] = 9992,
        ["NE4"] = 9993,
        ["NE5"] = 9994,
   -- Southeast
        ["SE1"] = 9995,
        ["SE2"] = 9996,
        ["SE3"] = 9997,
        ["SE4"] = 9998,
}

local function has_temp_item(item_id)
    local temp_items = windower.ffxi.get_items(3)
    for _, item in ipairs(temp_items) do
        if item.id == item_id then
            return true
        end
    end
    return false
end

local floor_order = {
    "NW1","NW2","NW3","NW4","NW5",
    "SW1","SW2","SW3","SW4",
    "NE1","NE2","NE3","NE4","NE5",
    "SE1","SE2","SE3","SE4"
}

local function find_first_missing_floor()
    for _, _floor in ipairs(floor_order) do
        local item_id = temp_item_ids[_floor]
        if not has_temp_item(item_id) then
            return _floor, item_id
        end
    end
    return nil
end

return T {
    short_name = 'ap',
    long_name = 'apollyon',
    move_in_zone = true,
    npc_plural = 'Vortices',
    npc_names = npc_names,
    zone_npc_list = function(type)
        local mlist = windower.ffxi.get_mob_list()
        mlist = table.filter(mlist, function(name)
            return name ~= "" and npc_names[type]:any(string.startswith + {name})
        end)
        mlist = table.map(mlist, function(name)
            local num = name:match('%d+$')
            return {
                name = name,
                key = (num and tostring(num))
            }
        end)
        return mlist
    end,
    validate = function(menu_id, zone, current_activity,p)
		local _floor, item_id = find_first_missing_floor()
		local destination = nil
		local cross_tower_checkinator = nil
		local current_floor_checkinator = nil
        if current_activity.sub_cmd == 'port' or current_activity.sub_cmd == 'next' then
            destination = nil
        else
            destination = current_activity.activity_settings
        end
        if not (current_activity.sub_cmd == 'enter' or current_activity.sub_cmd == 'exit') and
        not (menu_id >= 102 and menu_id <= 121) then
            return "Incorrect menu detected! Menu ID: " .. menu_id
        end
		if current_activity.sub_cmd == 'enter' and zone ~= 33 and menu_id ~= 159 and menu_id ~= 160 then
			return "You cannot use the enter command here."
		end
		if current_activity.sub_cmd == 'exit' and zone ~= 38 and menu_id ~= 100 and menu_id ~= 101 then
			return "These aren't the droids you're looking for."
		end
		if zone ~= 38 and current_activity.sub_cmd ~= 'enter' then
			return "You need to be inside Apollyon"
		end
		-------------------------------------------------------------------------------------------------------------------------------------------
       -- Destination setters
        --------------------------------------------------------------------------------------------------------------------------------------------
		if current_activity.sub_cmd == 'next' then
			if _floor then
				destination = destination_array[_floor]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 102 or menu_id == 103 then
				destination = destination_array.SE4
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 108 or menu_id == 112 or menu_id == 117 or menu_id == 121 then
				return 'All data collected. Open the chest on this floor before proceeding. If your units are overflowing and you do not wish to open the chest, use the port command. //ap port'
			else
				if menu_id >= 104 and menu_id <= 107 then
					destination = destination_array.NW5
				elseif menu_id >= 109 and menu_id <= 111 then
					destination = destination_array.SW4
				elseif menu_id >= 113 and menu_id <= 116 then
					destination = destination_array.NE5
				elseif menu_id >= 118 and menu_id <= 120 then
					destination = destination_array.SE4
				end
				log('All data collected. Sending you to open the chest.')
			end 
		----------------------------------------------
		elseif current_activity.sub_cmd == 'port' then
			if menu_id == 102 or menu_id == 103 then
				destination = destination_array.NW1
			elseif menu_id == 104 then
				destination = destination_array.NW2
			elseif menu_id == 105 then
				destination = destination_array.NW3
			elseif menu_id == 106 then
				destination = destination_array.NW4
			elseif menu_id == 107 then
				destination = destination_array.NW5
			elseif menu_id == 108 then
				destination = destination_array.E1
			elseif menu_id == 109 then
				destination = destination_array.SW2
			elseif menu_id == 110 then
				destination = destination_array.SW3
			elseif menu_id == 111 then
				destination = destination_array.SW4
			elseif menu_id == 112 then
				destination = destination_array.E1
			elseif menu_id == 113 then
				destination = destination_array.NE2
			elseif menu_id == 114 then
				destination = destination_array.NE3
			elseif menu_id == 115 then
				destination = destination_array.NE4
			elseif menu_id == 116 then
				destination = destination_array.NE5
			elseif menu_id == 117 then
				destination = destination_array.E1
			elseif menu_id == 118 then
				destination = destination_array.SE2
			elseif menu_id == 119 then
				destination = destination_array.SE3
			elseif menu_id == 120 then
				destination = destination_array.SE4
			elseif menu_id == 121 then
				destination = destination_array.E1
			end
		end
-----------------------------------------------------------------------------------------------------------
	if current_activity.sub_cmd ~= 'exit' and current_activity.sub_cmd ~= 'enter' then
		---------------------------------------------------------------------------------------------------
        -- prevent warping between towers / next command cross-tower destination entrance override
        ----------------Northwest--------------------------------------------------------------------------
        if (menu_id >= 104 and menu_id <= 108) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 108 or destination.menu_id < 104) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Southwest--------------------------------------------------------------------------
        if (menu_id >= 109 and menu_id <= 112) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 112 or destination.menu_id < 109) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Northeast--------------------------------------------------------------------------
        if (menu_id >= 113 and menu_id <= 117) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 117 or destination.menu_id < 113) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Southeast--------------------------------------------------------------------------
        if (menu_id >= 118 and menu_id <= 121) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 121 or destination.menu_id < 118) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
		------------Same floor prevention / data check warp override------------------
        if menu_id == destination.menu_id then
			if current_floor_checkinator and current_activity.sub_cmd == 'next' then
				current_floor_checkinator = nil
				return "You still have work to do on this floor."
			else
                return "You're already at that location"
			end
        end
---------------------------------
        if apollyon_zone ~= zone then
            return 'Not in apollyon!'
        end
	end
		current_floor_checkinator = nil
		cross_tower_checkinator = nil
        return nil
    end,
    help_text = "|Apollyon| \n[sw] ap [warp/w] [all/a/@all/party/p] e1/nw1/sw2/ne5/se3 etc. -- warp to a designated tower and floor in apollyon. \n[sw] ap [all/a/@all] port -- warp to the next floor of any tower, if on last floor will warp to the entrance, if at entrance will warp to nw1. \n[sw] ap [all/a/@all] next -- warp to the first uncompleted floor in sequence, if this is in another tower, will warp to the entrance.\n[sw] ew [all/a/@all] enter -- enter apollyon. \n[sw] ew [all/a/@all] exit -- exit apollyon.\n------------------------------",
    sub_zone_targets = S {'e1', 'e2', 'nw1', 'nw2', 'nw3', 'nw4', 'nw5', 'sw1', 'sw2', 'sw3','sw4', 'ne1', 'ne2', 'ne3', 'ne4', 'ne5', 'se1', 'se2', 'se3', 'se4'}, 
    auto_select_zone = function(zone)
        if zone == 38 then
            return 'apollyon'
        end
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T {}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings		
        -- update request
        packet = packets.new('outgoing', 0x016)
        packet["Target Index"] = windower.ffxi.get_player().index
        actions:append(T {
            packet = packet,
            description = 'update request'
        })

        -- request map
        packet = packets.new('outgoing', 0x114)
        actions:append(T {
            packet = packet,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'request map'
        })

        -- menu change
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = 100 
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            delay = 0.2,
            description = 'send options'
        })

        -- request in-zone warp
        packet = packets.new('outgoing', 0x05C)
        packet["Target ID"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["X"] = destination.x
        packet["Y"] = destination.y
        packet["Z"] = destination.z
        packet["_unknown1"] = destination.unknown1 
        packet["Rotation"] = destination.h
        packet["_unknown2"] = destination.unknown2
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'same-zone move request'
        })

        -- complete menu
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = destination.unknown1 
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
        })

        return actions
    end,
    sub_commands = {
        port = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local destination = nil

		if current_activity.sub_cmd == 'port' then
			if menu == 102 or menu == 103 then
				destination = destination_array.NW1
			elseif menu == 104 then
				destination = destination_array.NW2
			elseif menu == 105 then
				destination = destination_array.NW3
			elseif menu == 106 then
				destination = destination_array.NW4
			elseif menu == 107 then
				destination = destination_array.NW5
			elseif menu == 108 then
				destination = destination_array.E1
			elseif menu == 109 then
				destination = destination_array.SW2
			elseif menu == 110 then
				destination = destination_array.SW3
			elseif menu == 111 then
				destination = destination_array.SW4
			elseif menu == 112 then
				destination = destination_array.E1
			elseif menu == 113 then
				destination = destination_array.NE2
			elseif menu == 114 then
				destination = destination_array.NE3
			elseif menu == 115 then
				destination = destination_array.NE4
			elseif menu == 116 then
				destination = destination_array.NE5
			elseif menu == 117 then
				destination = destination_array.E1
			elseif menu == 118 then
				destination = destination_array.SE2
			elseif menu == 119 then
				destination = destination_array.SE3
			elseif menu == 120 then
				destination = destination_array.SE4
			elseif menu == 121 then
				destination = destination_array.E1
			end
		end

		    --------------------------------------------------------------------------------------
		    log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
			--------------------------------------------------------------------------------------
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })

            -- request map
            packet = packets.new('outgoing', 0x114)
            actions:append(T {
                packet = packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'request map'
            })

            -- menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = 100
            packet["_unknown1"] = 0
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                delay = 0.2,
                description = 'send options'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] = destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = destination.unknown2
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0

            actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
            })
            return actions
        end,
  

        ['next'] = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local _floor, item_id = find_first_missing_floor()
			local destination = nil


			if _floor then
				destination = destination_array[_floor]
			elseif menu_id == 102 or menu_id == 103 then
				destination = destination_array.SE4
			elseif menu_id >= 104 and menu_id <= 107 then
				destination = destination_array.NW5
			elseif menu_id >= 109 and menu_id <= 111 then
				destination = destination_array.SW4
			elseif menu_id >= 113 and menu_id <= 116 then
				destination = destination_array.NE5
			elseif menu_id >= 118 and menu_id <= 120 then
				destination = destination_array.SE4
			end
			
		-----------Cross-tower warp override--------------------------------------------------------------------------------------------------------------------------------
        if (menu >= 104 and menu <= 108) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 108 or destination.menu_id < 104) then
				destination = destination_array.E1
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 109 and menu <= 112) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 112 or destination.menu_id < 109) then
				destination = destination_array.E1
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 113 and menu <= 117) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 117 or destination.menu_id < 113) then
				destination = destination_array.E1
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 118 and menu <= 121) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 121 or destination.menu_id < 118) then
				destination = destination_array.E1
        end
		    --------------------------------------------------------------------------------------
		    log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
			--------------------------------------------------------------------------------------
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })

            -- request map
            packet = packets.new('outgoing', 0x114)
            actions:append(T {
                packet = packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'request map'
            })

            -- menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = 100
            packet["_unknown1"] = 0
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                delay = 0.2,
                description = 'send options'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] = destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = destination.unknown2
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0

            actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = 1,
            description = 'complete menu'
            })
            return actions
        end,
        enter = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
           
            log("Entering Apollyon...")
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='send options'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=true, delay=2, description='complete menu'})

            return actions
        end,

        ['exit'] = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc

            log("Leaving Apollyon...")
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='send options'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=true, delay=2, description='complete menu'})

            return actions
        end,
    },
    warpdata = T{
        ['apollyon'] = T{  
               ['E1'] =  {display_name = 'Entrance 1',  menu_id = 102, index = 671, npc = 16933535, offset = 1, x = -608,z = 0, y = -600,h = 126, unknown1 = 1,unknown2 = 1},
			   ['E2'] =  {display_name = 'Entrance 2',  menu_id = 103, index = 672, npc = 16933536, offset = 1, x = 608, z = 0, y = -600,h = 0,unknown1 = 1,  unknown2 = 1},
			   ['NW1'] = {display_name = 'Northwest 1', menu_id = 104, index = 673, npc = 16933537, offset = 1, x = -440.00003051758, z = 0, y = -88.000007629395, h = 191, unknown1 = 11, unknown2 = 1},
			   ['NW2'] = {display_name = 'Northwest 2', menu_id = 105, index = 674, npc = 16933538, offset = 2, x = -534,z = 0, y = 171.00001525879,h = 159, unknown1 = 12, unknown2 = 1},
			   ['NW3'] = {display_name = 'Northwest 3', menu_id = 106, index = 675, npc = 16933540, offset = 3, x = -294,z = 0, y = 171.00001525879,h = 159, unknown1 = 13, unknown2 = 1},
			   ['NW4'] = {display_name = 'Northwest 4', menu_id = 107, index = 676, npc = 16933539, offset = 4, x = -628,z = 0, y = 497.00003051758,h = 223, unknown1 = 14, unknown2 = 1},
			   ['NW5'] = {display_name = 'Northwest 5', menu_id = 108, index = 677, npc = 16933542, offset = 5, x = -388,z = 0, y = 498.00003051758,h = 223, unknown1 = 15, unknown2 = 1},
			   ['SW1'] = {display_name = 'Southwest 1', menu_id = 109, index = 678, npc = 16933541, offset = 3, x = -468.00003051758, z = 0, y = -625,h = 223, unknown1 = 21, unknown2 = 1},
			   ['SW2'] = {display_name = 'Southwest 2', menu_id = 110, index = 679, npc = 16933543, offset = 4, x = -576,z = 0, y = -428.00003051758, h = 159, unknown1 = 22, unknown2 = 1},
			   ['SW3'] = {display_name = 'Southwest 3', menu_id = 111, index = 680, npc = 16933544, offset = 0, x = -428.00003051758, z = 0, y = -385.00003051758, h = 223, unknown1 = 23, unknown2 = 1},
			   ['SW4'] = {display_name = 'Southwest 4', menu_id = 112, index = 681, npc = 16933545, offset = 5, x = -176.00001525879, z = 0, y = -628,h = 159, unknown1 = 24, unknown2 = 1},
			   ['NE1'] = {display_name = 'Northeast 1', menu_id = 113, index = 682, npc = 16933546, offset = 9, x = 440.00003051758,  z = 0, y = -88.000007629395, h = 191, unknown1 = 31, unknown2 = 1},
			   ['NE2'] = {display_name = 'Northeast 2', menu_id = 114, index = 683, npc = 16933547, offset = 10,x = 534,z = 0, y = 171.00001525879,h = 223, unknown1 = 32, unknown2 = 1},
			   ['NE3'] = {display_name = 'Northeast 3', menu_id = 115, index = 684, npc = 16933548, offset = 10,x = 294,z = 0, y = 171.00001525879,h = 223, unknown1 = 33, unknown2 = 1},
			   ['NE4'] = {display_name = 'Northeast 4', menu_id = 116, index = 685, npc = 16933549, offset = 1, x = 628,z = 0, y = 497.00003051758,h = 159, unknown1 = 34, unknown2 = 1},
			   ['NE5'] = {display_name = 'Northeast 5', menu_id = 117, index = 686, npc = 16933550, offset = 2, x = 388.00003051758,  z = 0, y = 498.00003051758,  h = 159, unknown1 = 35, unknown2 = 1},
			   ['SE1'] = {display_name = 'Southeast 1', menu_id = 118, index = 687, npc = 16933551, offset = 5, x = 468.00003051758,  z = 0, y = -625,h = 159, unknown1 = 41, unknown2 = 1},
			   ['SE2'] = {display_name = 'Southeast 2', menu_id = 119, index = 688, npc = 16933552, offset = 6, x = 576,z = 0, y = -428.00003051758, h = 223, unknown1 = 42, unknown2 = 1},
			   ['SE3'] = {display_name = 'Southeast 3', menu_id = 120, index = 689, npc = 16933553, offset = 7, x = 428.00003051758,  z = 0, y = -385.00003051758, h = 159, unknown1 = 43, unknown2 = 1},
			   ['SE4'] = {display_name = 'Southeast 4', menu_id = 121, index = 690, npc = 16933554, offset = 8, x = 176.00001525879,  z = 0, y = -628,h = 223, unknown1 = 44, unknown2 = 1},
		},
    },
}