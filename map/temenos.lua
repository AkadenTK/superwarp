local entry_zones = S{33}
local temenos_zone = 37
local npc_names = T{
    port = S{'Matter Diffusion Module'},
    ['next'] = S{'Matter Diffusion Module'},
    warp = S{'Matter Diffusion Module'},
}

   local destination_array = {
	   E  = {display_name = 'Entrance' ,         menu_id = 1000, index = 795, npc = 16929563, offset = 1, x = 580, z = 0 ,  y = 86.000007629395,   h = 63,  unknown1 = 1 , unknown2 = 1},
	   N1 = {display_name = 'Northern Tower 1',  menu_id = 1001, index = 853, npc = 16929621, offset = 1, x = 380.00003051758,  z = 71.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 11 ,unknown2 = 1},
	   N2 = {display_name = 'Northern Tower 2',  menu_id = 1002, index = 854, npc = 16929622, offset = 2, x = 180.00001525879,  z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 12 ,unknown2 = 1},
	   N3 = {display_name = 'Northern Tower 3',  menu_id = 1003, index = 855, npc = 16929623, offset = 3, x = 60.000003814697,  z = 71.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 13 ,unknown2 = 1},
	   N4 = {display_name = 'Northern Tower 4',  menu_id = 1004, index = 856, npc = 16929624, offset = 4, x = -140,z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 14 ,unknown2 = 1},
	   N5 = {display_name = 'Northern Tower 5',  menu_id = 1005, index = 857, npc = 16929625, offset = 5, x = -260,z = 77.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 15, unknown2 = 1},
	   N6 = {display_name = 'Northern Tower 6',  menu_id = 1006, index = 858, npc = 16929626, offset = 1, x = -460.00003051758, z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 16, unknown2 = 1},
	   N7 = {display_name = 'Northern Tower 7',  menu_id = 1007, index = 859, npc = 16929627, offset = 2, x = -580,z = 77.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 17, unknown2 = 1},
	   W1 = {display_name = 'Western Tower 1',   menu_id = 1008, index = 860, npc = 16929628, offset = 3, x = 380.00003051758,  z = -2.3800001144409 ,y = 96.000007629395,   h = 191, unknown1 = 21, unknown2 = 1},
	   W2 = {display_name = 'Western Tower 2',   menu_id = 1009, index = 861, npc = 16929629, offset = 4, x = 180.00001525879,  z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 22, unknown2 = 1},
	   W3 = {display_name = 'Western Tower 3',   menu_id = 1010, index = 862, npc = 16929630, offset = 0, x = 60.000003814697,  z = -2.3800001144409 ,y = 96.000007629395,   h = 191, unknown1 = 23, unknown2 = 1},
	   W4 = {display_name = 'Western Tower 4',   menu_id = 1011, index = 863, npc = 16929631, offset = 5, x = -140,z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 24, unknown2 = 1},
	   W5 = {display_name = 'Western Tower 5',   menu_id = 1012, index = 864, npc = 16929632, offset = 6, x = -260,z = -2.3800001144409 ,y = 96.000007629395,   h = 191, unknown1 = 25, unknown2 = 1},
	   W6 = {display_name = 'Western Tower 6',   menu_id = 1013, index = 865, npc = 16929633, offset = 7, x = -460.00003051758, z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 26, unknown2 = 1},
	   W7 = {display_name = 'Western Tower 7',   menu_id = 1014, index = 866, npc = 16929634, offset = 8, x = -580,z = -2.3800001144409, y = 96.000007629395,   h = 191, unknown1 = 27, unknown2 = 1},
	   E1 = {display_name = 'Eastern Tower 1',   menu_id = 1015, index = 867, npc = 16929635, offset = 9, x = 380.00003051758,  z = 71.620002746582,  y = -184.00001525879,  h = 191, unknown1 = 31, unknown2 = 1},
	   E2 = {display_name = 'Eastern Tower 2',   menu_id = 1016, index = 868, npc = 16929636, offset = 10,x = 180.00001525879,  z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 32, unknown2 = 1},
	   E3 = {display_name = 'Eastern Tower 3',   menu_id = 1017, index = 869, npc = 16929637, offset = 10,x = 60.000003814697,  z = 71.620002746582,  y = -184.00001525879,  h = 191, unknown1 = 33, unknown2 = 1},
	   E4 = {display_name = 'Eastern Tower 4',   menu_id = 1018, index = 870, npc = 16929638, offset = 1, x = -140,z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 34, unknown2 = 1},
	   E5 = {display_name = 'Eastern Tower 5',   menu_id = 1019, index = 871, npc = 16929639, offset = 2, x = -260,z = 77.620002746582,  y = -184.00001525879,  h = 191, unknown1 = 35, unknown2 = 1},
	   E6 = {display_name = 'Eastern Tower 6',   menu_id = 1020, index = 872, npc = 16929640, offset = 3, x = -460.00003051758, z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 36, unknown2 = 1},
	   E7 = {display_name = 'Eastern Tower 7',   menu_id = 1021, index = 873, npc = 16929641, offset = 4, x = -580,z = 77.620002746582,   y = -184.00001525879, h = 191, unknown1 = 37, unknown2 = 1},
	   C1 = {display_name = 'Central Tower 1',   menu_id = 1022, index = 874, npc = 16929642, offset = 5, x = 580, z = -2.3800001144409, y = -544, h = 191, unknown1 = 41, unknown2 = 1},
	   C2 = {display_name = 'Central Tower 2',   menu_id = 1023, index = 875, npc = 16929643, offset = 6, x = 260, z = -162.38000488281, y = -504.00003051758,  h = 191, unknown1 = 42, unknown2 = 1},
	   C3 = {display_name = 'Central Tower 3',   menu_id = 1024, index = 876, npc = 16929644, offset = 7, x = 20,  z = -2.3800001144409, y = -544, h = 191, unknown1 = 43, unknown2 = 1},
	   C4 = {display_name = 'Central Tower 4',   menu_id = 1025, index = 877, npc = 16929645, offset = 8, x = -296,z = -162.38000488281, y = -500.00003051758,  h = 127, unknown1 = 44, unknown2 = 1},
	}
local temp_item_ids = {
   -- North
        ["N1"] = 9956,
        ["N2"] = 9957,
        ["N3"] = 9958,
        ["N4"] = 9959,
        ["N5"] = 9960,
        ["N6"] = 9961,
        ["N7"] = 9962,
   -- West
        ["W1"] = 9963,
        ["W2"] = 9964,
        ["W3"] = 9965,
        ["W4"] = 9966,
        ["W5"] = 9967,
        ["W6"] = 9968,
        ["W7"] = 9969,
   --East
        ["E1"] = 9970,
        ["E2"] = 9971,
        ["E3"] = 9972,
        ["E4"] = 9973,
        ["E5"] = 9974,
        ["E6"] = 9975,
        ["E7"] = 9976,
   -- Central
        ["C1"] = 9977,
        ["C2"] = 9978,
        ["C3"] = 9979,
        ["C4"] = 9980,
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
    "N1","N2","N3","N4","N5","N6","N7",
    "W1","W2","W3","W4","W5","W6","W7",
    "E1","E2","E3","E4","E5","E6","E7",
    "C1","C2","C3","C4"
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
    short_name = 'te',
    long_name = 'temenos',
    move_in_zone = true,
    npc_plural = 'Modules',
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
		-------------------------------------------------------------------------------------------------------------------------------------------
       -- Destination setters
        --------------------------------------------------------------------------------------------------------------------------------------------
		if current_activity.sub_cmd == 'next' then
			if _floor then
				destination = destination_array[_floor]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 1000 then
				destination = destination_array.C4
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 1025 or menu_id == 1007 or menu_id == 1014 or menu_id == 1021 then
				return 'All data collected. Open the chest on this floor before proceeding. If your units are overflowing and you do not wish to open the chest, use the port command. //te port'
			else
				if menu_id >= 1001 and menu_id <= 1006 then
					destination = destination_array.N7
				elseif menu_id >= 1008 and menu_id <= 1013 then
					destination = destination_array.W7
				elseif menu_id >= 1015 and menu_id <= 1020 then
					destination = destination_array.E7
				elseif menu_id >= 1022 and menu_id <= 1024 then
					destination = destination_array.C4
				end
				log('All data collected. Sending you to open the chest.')
			end 
		--------------------------------------------
		elseif current_activity.sub_cmd == 'port' then
			if menu_id == 1000 then
				destination = destination_array.N1
			elseif menu_id == 1001 then
				destination = destination_array.N2
			elseif menu_id == 1002 then
				destination = destination_array.N3
			elseif menu_id == 1003 then
				destination = destination_array.N4
			elseif menu_id == 1004 then
				destination = destination_array.N5
			elseif menu_id == 1005 then
				destination = destination_array.N6
			elseif menu_id == 1006 then
				destination = destination_array.N7
			elseif menu_id == 1007 then
				destination = destination_array.E
			elseif menu_id == 1008 then
				destination = destination_array.W2
			elseif menu_id == 1009 then
				destination = destination_array.W3
			elseif menu_id == 1010 then
				destination = destination_array.W4
			elseif menu_id == 1011 then
				destination = destination_array.W5
			elseif menu_id == 1012 then
				destination = destination_array.W6
			elseif menu_id == 1013 then
				destination = destination_array.W7
			elseif menu_id == 1014 then
				destination = destination_array.E
			elseif menu_id == 1015 then
				destination = destination_array.E2
			elseif menu_id == 1016 then
				destination = destination_array.E3
			elseif menu_id == 1017 then
				destination = destination_array.E4
			elseif menu_id == 1018 then
				destination = destination_array.E5
			elseif menu_id == 1019 then
				destination = destination_array.E6
			elseif menu_id == 1020 then
				destination = destination_array.E7
			elseif menu_id == 1021 then
				destination = destination_array.E
			elseif menu_id == 1022 then
				destination = destination_array.C2
			elseif menu_id == 1023 then
				destination = destination_array.C3
			elseif menu_id == 1024 then
				destination = destination_array.C4
			elseif menu_id == 1025 then
				destination = destination_array.E
			end
		end
-------------------------------------------
        if not
        (menu_id >= 1000 and menu_id <= 1025) then
            return "Incorrect menu detected! Menu ID: " .. menu_id
        end
        -- prevent warping between towers / next command cross-tower destination entrance override
        ----------------North Tower--------------------------------------------------------------------------
        if (menu_id >= 1001 and menu_id <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------West Tower--------------------------------------------------------------------------
        if (menu_id >= 1008 and menu_id <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------East Tower--------------------------------------------------------------------------
        if (menu_id >= 1015 and menu_id <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Central Tower--------------------------------------------------------------------------
        if (menu_id >= 1022 and menu_id <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.E
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
        if temenos_zone ~= zone then
            return 'Not in Temenos!'
        end
		current_floor_checkinator = nil
		cross_tower_checkinator = nil
        return nil
    end,
    help_text = "|Temenos|\n[sw] te [warp/w] [all/a/@all/party/p] e/n1/w2/e5/c3 etc. -- warp to a designated floor in Temenos. \n[sw] te [all/a/@all] port -- warp to the next floor of any tower, if on last floor will warp to the entrance, if at entrance will warp to n1. \n[sw] te [all/a/@all] next -- warp to the first uncompleted floor in sequence, if this is in another tower, will warp to the entrance. \n-----------------------------",
    sub_zone_targets = S {'entrance','n1', 'n2', 'n3', 'n4', 'n5', 'n6', 'n7', 'w1', 'w2','w3', 'w4', 'w5', 'w6', 'w7', 'e1', 'e2', 'e3', 'e4', 'e5','e6','e7','c1','c2','c3','c4'}, 
    auto_select_zone = function(zone)
        if zone == 37 then
            return 'Temenos'
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
			if menu == 1000 then
				destination = destination_array.N1
			elseif menu == 1001 then
				destination = destination_array.N2
			elseif menu == 1002 then
				destination = destination_array.N3
			elseif menu == 1003 then
				destination = destination_array.N4
			elseif menu == 1004 then
				destination = destination_array.N5
			elseif menu == 1005 then
				destination = destination_array.N6
			elseif menu == 1006 then
				destination = destination_array.N7
			elseif menu == 1007 then
				destination = destination_array.E
			elseif menu == 1008 then
				destination = destination_array.W2
			elseif menu == 1009 then
				destination = destination_array.W3
			elseif menu == 1010 then
				destination = destination_array.W4
			elseif menu == 1011 then
				destination = destination_array.W5
			elseif menu == 1012 then
				destination = destination_array.W6
			elseif menu == 1013 then
				destination = destination_array.W7
			elseif menu == 1014 then
				destination = destination_array.E
			elseif menu == 1015 then
				destination = destination_array.E2
			elseif menu == 1016 then
				destination = destination_array.E3
			elseif menu == 1017 then
				destination = destination_array.E4
			elseif menu == 1018 then
				destination = destination_array.E5
			elseif menu == 1019 then
				destination = destination_array.E6
			elseif menu == 1020 then
				destination = destination_array.E7
			elseif menu == 1021 then
				destination = destination_array.E
			elseif menu == 1022 then
				destination = destination_array.C2
			elseif menu == 1023 then
				destination = destination_array.C3
			elseif menu == 1024 then
				destination = destination_array.C4
			elseif menu == 1025 then
				destination = destination_array.E
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
			elseif menu_id == 1000 then
				destination = destination_array.C4
			elseif menu_id >= 1001 and menu_id <= 1006 then
				destination = destination_array.N7
			elseif menu_id >= 1008 and menu_id <= 1013 then
				destination = destination_array.W7
			elseif menu_id >= 1015 and menu_id <= 1020 then
				destination = destination_array.E7
			elseif menu_id >= 1022 and menu_id <= 1024 then
				destination = destination_array.C4
			end 

        if (menu >= 1001 and menu <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
				destination = destination_array.E
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 1008 and menu <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
				destination = destination_array.E
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 1015 and menu <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
				destination = destination_array.E
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 1022 and menu <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
				destination = destination_array.E
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
    },
    warpdata = T{
        ['Temenos'] = T{  
			   ['Entrance']  = {display_name = 'Entrance' ,  menu_id = 1000, index = 795, npc = 16929563, offset = 1, x = 580, z = 0 ,y = 86.000007629395,h = 63,unknown1 = 1 , unknown2 = 1},
			   ['N1'] = {display_name = 'Northern Tower 1',  menu_id = 1001, index = 853, npc = 16929621, offset = 1, x = 380.00003051758,z = 71.620002746582 ,y = 376.00003051758,h = 191,unknown1 = 11,unknown2 = 1},
			   ['N2'] = {display_name = 'Northern Tower 2',  menu_id = 1002, index = 854, npc = 16929622, offset = 2, x = 180.00001525879,z = -82.380004882812,y = 376.00003051758,h = 191,unknown1 = 12,unknown2 = 1},
			   ['N3'] = {display_name = 'Northern Tower 3',  menu_id = 1003, index = 855, npc = 16929623, offset = 3, x = 60.000003814697,z = 71.620002746582 ,y = 376.00003051758,h = 191,unknown1 = 13,unknown2 = 1},
			   ['N4'] = {display_name = 'Northern Tower 4',  menu_id = 1004, index = 856, npc = 16929624, offset = 4, x = -140,z = -82.380004882812 ,y = 376.00003051758,h = 191, unknown1 = 14,unknown2 = 1},
			   ['N5'] = {display_name = 'Northern Tower 5',  menu_id = 1005, index = 857, npc = 16929625, offset = 5, x = -260,z = 77.620002746582 , y = 376.00003051758,h = 191, unknown1 = 15, unknown2 = 1},
			   ['N6'] = {display_name = 'Northern Tower 6',  menu_id = 1006, index = 858, npc = 16929626, offset = 1, x = -460.00003051758,z = -82.380004882812 ,y = 376.00003051758,h = 191,unknown1 = 16,unknown2 = 1},
			   ['N7'] = {display_name = 'Northern Tower 7',  menu_id = 1007, index = 859, npc = 16929627, offset = 2, x = -580,z = 77.620002746582 , y = 376.00003051758,h = 191, unknown1 = 17, unknown2 = 1},
			   ['W1'] = {display_name = 'Western Tower 1',   menu_id = 1008, index = 860, npc = 16929628, offset = 3, x = 380.00003051758,z = -2.3800001144409 ,y = 96.000007629395,h = 191, unknown1 = 21, unknown2 = 1},
			   ['W2'] = {display_name = 'Western Tower 2',   menu_id = 1009, index = 861, npc = 16929629, offset = 4, x = 180.00001525879,z = -162.38000488281 ,y = 96.000007629395,h = 191, unknown1 = 22, unknown2 = 1},
			   ['W3'] = {display_name = 'Western Tower 3',   menu_id = 1010, index = 862, npc = 16929630, offset = 0, x = 60.000003814697,z = -2.3800001144409 ,y = 96.000007629395,h = 191, unknown1 = 23, unknown2 = 1},
			   ['W4'] = {display_name = 'Western Tower 4',   menu_id = 1011, index = 863, npc = 16929631, offset = 5, x = -140,z = -162.38000488281 ,y = 96.000007629395,h = 191, unknown1 = 24, unknown2 = 1},
			   ['W5'] = {display_name = 'Western Tower 5',   menu_id = 1012, index = 864, npc = 16929632, offset = 6, x = -260,z = -2.3800001144409 ,y = 96.000007629395,h = 191, unknown1 = 25, unknown2 = 1},
			   ['W6'] = {display_name = 'Western Tower 6',   menu_id = 1013, index = 865, npc = 16929633, offset = 7, x = -460.00003051758, z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 26, unknown2 = 1},
			   ['W7'] = {display_name = 'Western Tower 7',   menu_id = 1014, index = 866, npc = 16929634, offset = 8, x = -580,z = -2.3800001144409, y = 96.000007629395,   h = 191, unknown1 = 27, unknown2 = 1},
			   ['E1'] = {display_name = 'Eastern Tower 1',   menu_id = 1015, index = 867, npc = 16929635, offset = 9, x = 380.00003051758,z = 71.620002746582,y = -184.00001525879,h = 191, unknown1 = 31, unknown2 = 1},
			   ['E2'] = {display_name = 'Eastern Tower 2',   menu_id = 1016, index = 868, npc = 16929636, offset = 10,x = 180.00001525879,z = -82.380004882812,y = -184.00001525879,h = 191, unknown1 = 32, unknown2 = 1},
			   ['E3'] = {display_name = 'Eastern Tower 3',   menu_id = 1017, index = 869, npc = 16929637, offset = 10,x = 60.000003814697,z = 71.620002746582,y = -184.00001525879,h = 191, unknown1 = 33, unknown2 = 1},
			   ['E4'] = {display_name = 'Eastern Tower 4',   menu_id = 1018, index = 870, npc = 16929638, offset = 1, x = -140,z = -82.380004882812, y = -184.00001525879,h = 191, unknown1 = 34, unknown2 = 1},
			   ['E5'] = {display_name = 'Eastern Tower 5',   menu_id = 1019, index = 871, npc = 16929639, offset = 2, x = -260,z = 77.620002746582,  y = -184.00001525879,h = 191, unknown1 = 35, unknown2 = 1},
			   ['E6'] = {display_name = 'Eastern Tower 6',   menu_id = 1020, index = 872, npc = 16929640, offset = 3, x = -460.00003051758, z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 36, unknown2 = 1},
			   ['E7'] = {display_name = 'Eastern Tower 7',   menu_id = 1021, index = 873, npc = 16929642, offset = 4, x = -580,z = 77.620002746582,  y = -184.00001525879,h = 191, unknown1 = 37, unknown2 = 1},
			   ['C1'] = {display_name = 'Central Tower 1',   menu_id = 1022, index = 874, npc = 16929641, offset = 5, x = 580, z = -2.3800001144409, y = -544, h = 191, unknown1 = 41, unknown2 = 1},
			   ['C2'] = {display_name = 'Central Tower 2',   menu_id = 1023, index = 875, npc = 16929643, offset = 6, x = 260, z = -162.38000488281, y = -504.00003051758,h = 191, unknown1 = 42, unknown2 = 1},
			   ['C3'] = {display_name = 'Central Tower 3',   menu_id = 1024, index = 876, npc = 16929644, offset = 7, x = 20,  z = -2.3800001144409, y = -544, h = 191, unknown1 = 43, unknown2 = 1},
			   ['C4'] = {display_name = 'Central Tower 4',   menu_id = 1025, index = 877, npc = 16929645, offset = 8, x = -296,z = -162.38000488281, y = -500.00003051758,h = 127, unknown1 = 44, unknown2 = 1},
		},
    },
}