local entry_zones = S{33}
local limbus_zones = S{37,38}
local npc_names = T{
    port = S{'Swirling Vortex','Matter Diffusion Module'},
    ['next'] = S{'Swirling Vortex','Matter Diffusion Module'},
	['random'] = S{'Swirling Vortex','Matter Diffusion Module'},
	back = S{'Swirling Vortex','Matter Diffusion Module'},
    warp = S{'Swirling Vortex','Matter Diffusion Module'},
    enter = S{'Swirling Vortex'},
    ['exit'] = S{'Radiant Aureole'},
}

   local destination_array = {
        ['apollyon'] = {
	   E1  = {display_name = 'Entrance 1', zone = 38, menu_id = 102,  index = 671, npc = 16933535, offset = 1, x = -608,z = 0, y = -600,h = 126, unknown1 = 1,  unknown2 = 1},
	   E2  = {display_name = 'Entrance 2', zone = 38, menu_id = 103,  index = 672, npc = 16933536, offset = 1, x = 608,z = 0, y = -600,h = 0,   unknown1 = 1,  unknown2 = 1},
	   NW1 = {display_name = 'Northwest 1', zone = 38, menu_id = 104,  index = 673, npc = 16933537, offset = 1, x = -440.00003051758, z = 0, y = -88.000007629395,  h = 191, unknown1 = 11, unknown2 = 1},
	   NW2 = {display_name = 'Northwest 2', zone = 38, menu_id = 105,  index = 674, npc = 16933538, offset = 2, x = -534,z = 0, y = 171.00001525879,h = 159, unknown1 = 12, unknown2 = 1},
	   NW3 = {display_name = 'Northwest 3', zone = 38, menu_id = 106,  index = 675, npc = 16933539, offset = 3, x = -294,z = 0, y = 171.00001525879,h = 159, unknown1 = 13, unknown2 = 1},
	   NW4 = {display_name = 'Northwest 4', zone = 38, menu_id = 107,  index = 676, npc = 16933540, offset = 4, x = -628,z = 0, y = 497.00003051758,h = 223, unknown1 = 14, unknown2 = 1},
	   NW5 = {display_name = 'Northwest 5', zone = 38, menu_id = 108,  index = 677, npc = 16933541, offset = 5, x = -388,z = 0, y = 498.00003051758,h = 223, unknown1 = 15, unknown2 = 1},
	   SW1 = {display_name = 'Southwest 1', zone = 38, menu_id = 109,  index = 678, npc = 16933542, offset = 3, x = -468.00003051758, z = 0, y = -625,h = 223, unknown1 = 21, unknown2 = 1},
	   SW2 = {display_name = 'Southwest 2', zone = 38, menu_id = 110,  index = 679, npc = 16933543, offset = 4, x = -576,z = 0, y = -428.00003051758,  h = 159, unknown1 = 22, unknown2 = 1},
	   SW3 = {display_name = 'Southwest 3', zone = 38, menu_id = 111,  index = 680, npc = 16933544, offset = 0, x = -428.00003051758, z = 0, y = -385.00003051758,  h = 223, unknown1 = 23, unknown2 = 1},
	   SW4 = {display_name = 'Southwest 4', zone = 38, menu_id = 112,  index = 681, npc = 16933545, offset = 5, x = -176.00001525879, z = 0, y = -628,h = 159, unknown1 = 24, unknown2 = 1},
	   NE1 = {display_name = 'Northeast 1', zone = 38, menu_id = 113,  index = 682, npc = 16933546, offset = 9, x = 440.00003051758,  z = 0, y = -88.000007629395,  h = 191, unknown1 = 31, unknown2 = 1},
	   NE2 = {display_name = 'Northeast 2', zone = 38, menu_id = 114,  index = 683, npc = 16933547, offset = 10,x = 534,z = 0, y = 171.00001525879,h = 223, unknown1 = 32, unknown2 = 1},
	   NE3 = {display_name = 'Northeast 3', zone = 38, menu_id = 115,  index = 684, npc = 16933548, offset = 10,x = 294,z = 0, y = 171.00001525879,h = 223, unknown1 = 33, unknown2 = 1},
	   NE4 = {display_name = 'Northeast 4', zone = 38, menu_id = 116,  index = 685, npc = 16933549, offset = 1, x = 628,z = 0, y = 497.00003051758,h = 159, unknown1 = 34, unknown2 = 1},
	   NE5 = {display_name = 'Northeast 5', zone = 38, menu_id = 117,  index = 686, npc = 16933550, offset = 2, x = 388.00003051758,  z = 0, y = 498.00003051758,h = 159, unknown1 = 35, unknown2 = 1},
	   SE1 = {display_name = 'Southeast 1', zone = 38, menu_id = 118,  index = 687, npc = 16933551, offset = 5, x = 468.00003051758,  z = 0, y = -625,h = 159, unknown1 = 41, unknown2 = 1},
	   SE2 = {display_name = 'Southeast 2', zone = 38, menu_id = 119,  index = 688, npc = 16933552, offset = 6, x = 576,z = 0, y = -428.00003051758,  h = 223, unknown1 = 42, unknown2 = 1},
	   SE3 = {display_name = 'Southeast 3', zone = 38, menu_id = 120,  index = 689, npc = 16933553, offset = 7, x = 428.00003051758,  z = 0, y = -385.00003051758,  h = 159, unknown1 = 43, unknown2 = 1},
	   SE4 = {display_name = 'Southeast 4', zone = 38, menu_id = 121,  index = 690, npc = 16933554, offset = 8, x = 176.00001525879,  z = 0, y = -628,h = 223, unknown1 = 44, unknown2 = 1},
        },
    ['temenos'] ={
       E  = {display_name = 'Entrance' ,        zone = 37, menu_id = 1000, index = 795, npc = 16929563, offset = 1, x = 580, z = 0 ,  y = 86.000007629395,   h = 63,  unknown1 = 1 , unknown2 = 1},
	   N1 = {display_name = 'Northern Tower 1', zone = 37, menu_id = 1001, index = 853, npc = 16929621, offset = 1, x = 380.00003051758,  z = 71.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 11 ,unknown2 = 1},
	   N2 = {display_name = 'Northern Tower 2', zone = 37, menu_id = 1002, index = 854, npc = 16929622, offset = 2, x = 180.00001525879,  z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 12 ,unknown2 = 1},
	   N3 = {display_name = 'Northern Tower 3', zone = 37, menu_id = 1003, index = 855, npc = 16929623, offset = 3, x = 60.000003814697,  z = 71.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 13 ,unknown2 = 1},
	   N4 = {display_name = 'Northern Tower 4', zone = 37, menu_id = 1004, index = 856, npc = 16929624, offset = 4, x = -140,z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 14 ,unknown2 = 1},
	   N5 = {display_name = 'Northern Tower 5', zone = 37, menu_id = 1005, index = 857, npc = 16929625, offset = 5, x = -260,z = 77.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 15, unknown2 = 1},
	   N6 = {display_name = 'Northern Tower 6', zone = 37, menu_id = 1006, index = 858, npc = 16929626, offset = 1, x = -460.00003051758, z = -82.380004882812 ,y = 376.00003051758,   h = 191, unknown1 = 16, unknown2 = 1},
	   N7 = {display_name = 'Northern Tower 7', zone = 37, menu_id = 1007, index = 859, npc = 16929627, offset = 2, x = -580,z = 77.620002746582 , y = 376.00003051758,   h = 191, unknown1 = 17, unknown2 = 1},
	   W1 = {display_name = 'Western Tower 1',  zone = 37, menu_id = 1008, index = 860, npc = 16929628, offset = 3, x = 380.00003051758,  z = -2.3800001144409 ,y = 96.000007629395,   h = 191, unknown1 = 21, unknown2 = 1},
	   W2 = {display_name = 'Western Tower 2',  zone = 37, menu_id = 1009, index = 861, npc = 16929629, offset = 4, x = 180.00001525879,  z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 22, unknown2 = 1},
	   W3 = {display_name = 'Western Tower 3',  zone = 37, menu_id = 1010, index = 862, npc = 16929630, offset = 0, x = 60.000003814697,  z = -2.3800001144409 ,y = 96.000007629395,   h = 191, unknown1 = 23, unknown2 = 1},
	   W4 = {display_name = 'Western Tower 4',  zone = 37, menu_id = 1011, index = 863, npc = 16929631, offset = 5, x = -140,z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 24, unknown2 = 1},
	   W5 = {display_name = 'Western Tower 5',  zone = 37, menu_id = 1012, index = 864, npc = 16929632, offset = 6, x = -260,z = -2.3800001144409 ,y = 96.000007629395,   h = 191, unknown1 = 25, unknown2 = 1},
	   W6 = {display_name = 'Western Tower 6',  zone = 37, menu_id = 1013, index = 865, npc = 16929633, offset = 7, x = -460.00003051758, z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 26, unknown2 = 1},
	   W7 = {display_name = 'Western Tower 7',  zone = 37, menu_id = 1014, index = 866, npc = 16929634, offset = 8, x = -580,z = -2.3800001144409, y = 96.000007629395,   h = 191, unknown1 = 27, unknown2 = 1},
	   E1 = {display_name = 'Eastern Tower 1',  zone = 37, menu_id = 1015, index = 867, npc = 16929635, offset = 9, x = 380.00003051758,  z = 71.620002746582,  y = -184.00001525879,  h = 191, unknown1 = 31, unknown2 = 1},
	   E2 = {display_name = 'Eastern Tower 2',  zone = 37, menu_id = 1016, index = 868, npc = 16929636, offset = 10,x = 180.00001525879,  z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 32, unknown2 = 1},
	   E3 = {display_name = 'Eastern Tower 3',  zone = 37, menu_id = 1017, index = 869, npc = 16929637, offset = 10,x = 60.000003814697,  z = 71.620002746582,  y = -184.00001525879,  h = 191, unknown1 = 33, unknown2 = 1},
	   E4 = {display_name = 'Eastern Tower 4',  zone = 37, menu_id = 1018, index = 870, npc = 16929638, offset = 1, x = -140,z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 34, unknown2 = 1},
	   E5 = {display_name = 'Eastern Tower 5',  zone = 37, menu_id = 1019, index = 871, npc = 16929639, offset = 2, x = -260,z = 77.620002746582,  y = -184.00001525879,  h = 191, unknown1 = 35, unknown2 = 1},
	   E6 = {display_name = 'Eastern Tower 6',  zone = 37, menu_id = 1020, index = 872, npc = 16929640, offset = 3, x = -460.00003051758, z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 36, unknown2 = 1},
	   E7 = {display_name = 'Eastern Tower 7',  zone = 37, menu_id = 1021, index = 873, npc = 16929641, offset = 4, x = -580,z = 77.620002746582,   y = -184.00001525879, h = 191, unknown1 = 37, unknown2 = 1},
	   C1 = {display_name = 'Central Tower 1',  zone = 37, menu_id = 1022, index = 874, npc = 16929642, offset = 5, x = 580, z = -2.3800001144409, y = -544, h = 191, unknown1 = 41, unknown2 = 1},
	   C2 = {display_name = 'Central Tower 2',  zone = 37, menu_id = 1023, index = 875, npc = 16929643, offset = 6, x = 260, z = -162.38000488281, y = -504.00003051758,  h = 191, unknown1 = 42, unknown2 = 1},
	   C3 = {display_name = 'Central Tower 3',  zone = 37, menu_id = 1024, index = 876, npc = 16929644, offset = 7, x = 20,  z = -2.3800001144409, y = -544, h = 191, unknown1 = 43, unknown2 = 1},
	   C4 = {display_name = 'Central Tower 4',  zone = 37, menu_id = 1025, index = 877, npc = 16929645, offset = 8, x = -296,z = -162.38000488281, y = -500.00003051758,  h = 127, unknown1 = 44, unknown2 = 1},    
         }
	}

local temenos_temp_item_ids = {
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

local apollyon_temp_item_ids = {
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

local apollyon_floor_order = {
    "NW1","NW2","NW3","NW4","NW5",
    "SW1","SW2","SW3","SW4",
    "NE1","NE2","NE3","NE4","NE5",
    "SE1","SE2","SE3","SE4"
}

local temenos_floor_order = {
    "N1","N2","N3","N4","N5","N6","N7",
    "W1","W2","W3","W4","W5","W6","W7",
    "E1","E2","E3","E4","E5","E6","E7",
    "C1","C2","C3","C4"
}

local function find_first_apollyon_missing_floor()
    for _, _floor in ipairs(apollyon_floor_order) do
        local item_id = apollyon_temp_item_ids[_floor]
        if not has_temp_item(item_id) then
            return _floor, item_id
        end
    end
    return nil
end

local function find_first_temenos_missing_floor()
    for _, _floor in ipairs(temenos_floor_order) do
        local item_id = temenos_temp_item_ids[_floor]
        if not has_temp_item(item_id) then
            return _floor, item_id
        end
    end
    return nil
end

local function get_current_apollyon_floor(menu_id)
    for floor, data in pairs(destination_array.apollyon) do
        if data.menu_id == menu_id then
            return floor
        end
    end
    return nil
end	
	
local function get_current_temenos_floor(menu_id)
    for floor, data in pairs(destination_array.temenos) do
        if data.menu_id == menu_id then
            return floor
        end
    end
    return nil
end	

local function find_shuffled_missing_apollyon_floor(menu_id)
    local current_floor = get_current_apollyon_floor(menu_id)
    if not current_floor then return nil end

    local current_tower = current_floor:sub(1, 2)
    local fallback_floor, fallback_item = nil, nil
    for floor, item_id in pairs(apollyon_temp_item_ids) do
        if floor ~= current_floor and not has_temp_item(item_id) then
            if floor:sub(1, 2) == current_tower then
                return floor, item_id
            end
            if not fallback_floor then
                fallback_floor, fallback_item = floor, item_id
            end
        end
    end
    return fallback_floor, fallback_item
end

local function find_shuffled_missing_temenos_floor(menu_id)
    local current_floor = get_current_temenos_floor(menu_id)
    if not current_floor then return nil end

    local current_tower = current_floor:sub(1, 1)
    local fallback_floor, fallback_item = nil, nil
    for floor, item_id in pairs(temenos_temp_item_ids) do
        if floor ~= current_floor and not has_temp_item(item_id) then
            if floor:sub(1, 1) == current_tower then
                return floor, item_id
            end
            if not fallback_floor then
                fallback_floor, fallback_item = floor, item_id
            end
        end
    end
    return fallback_floor, fallback_item
end

return T {
    short_name = { 'li', 'te', 'ap' },
    long_name = 'limbus',
    move_in_zone = true,
    npc_plural = 'Limbus warps',
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
		local _apollyon_floor, item_id = find_first_apollyon_missing_floor()
        local _temenos_floor, item_id = find_first_temenos_missing_floor()
		local _apollyon_shuffle, item_id = find_shuffled_missing_apollyon_floor(menu_id)
        local _temenos_shuffle, item_id = find_shuffled_missing_temenos_floor(menu_id)
		local destination = nil
		local cross_tower_checkinator = nil
		local current_floor_checkinator = nil
        if current_activity.sub_cmd == 'port' or current_activity.sub_cmd == 'next' or current_activity.sub_cmd == 'back' or current_activity.sub_cmd == 'random' then
            destination = nil
        else
            destination = current_activity.activity_settings
        end
        --------------------------------------------------------------------------------------------------------------------------------------------
        --  Apollyon
        --------------------------------------------------------------------------------------------------------------------------------------------
		if current_activity.sub_cmd == 'enter' and zone ~= 33 and menu_id ~= 159 and menu_id ~= 160 then
			return "You cannot use the enter command here."
		end
		if current_activity.sub_cmd == 'exit' and zone ~= 38 and menu_id ~= 100 and menu_id ~= 101 then
			return "These aren't the droids you're looking for."
		end
if zone == 38 then
        if not (current_activity.sub_cmd == 'enter' or current_activity.sub_cmd == 'exit') and
        not (menu_id >= 102 and menu_id <= 121) then
            return "Incorrect menu detected! Menu ID: " .. menu_id
        end
		-------------------------------------------------------------------------------------------------------------------------------------------
       -- Destination setters
        -------------------------------------------------------------------------------------------------------------------------------------------
		if current_activity.sub_cmd == 'next' then
			if _apollyon_floor then
				destination = destination_array.apollyon[_apollyon_floor]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 102 or menu_id == 103 then
				destination = destination_array.apollyon.SE4
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 108 or menu_id == 112 or menu_id == 117 or menu_id == 121 then
				destination = destination_array.apollyon.E1
				log('All data collected. Sending you to the entrance.')
			else
				if menu_id >= 104 and menu_id <= 107 then
					destination = destination_array.apollyon.NW5
				elseif menu_id >= 109 and menu_id <= 111 then
					destination = destination_array.apollyon.SW4
				elseif menu_id >= 113 and menu_id <= 116 then
					destination = destination_array.apollyon.NE5
				elseif menu_id >= 118 and menu_id <= 120 then
					destination = destination_array.apollyon.SE4
				end
				log('All data collected. Sending you to open the chest.')
			end 
		elseif current_activity.sub_cmd == 'random' then
			if _apollyon_shuffle then
				destination = destination_array.apollyon[_apollyon_shuffle]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 102 or menu_id == 103 then
				destination = destination_array.apollyon.SE4
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 108 or menu_id == 112 or menu_id == 117 or menu_id == 121 then
				destination = destination_array.apollyon.E1
				log('All data collected. Sending you to the entrance.')
			else
				if menu_id >= 104 and menu_id <= 107 then
					destination = destination_array.apollyon.NW5
				elseif menu_id >= 109 and menu_id <= 111 then
					destination = destination_array.apollyon.SW4
				elseif menu_id >= 113 and menu_id <= 116 then
					destination = destination_array.apollyon.NE5
				elseif menu_id >= 118 and menu_id <= 120 then
					destination = destination_array.apollyon.SE4
				end
				log('All data collected. Sending you to open the chest.')
			end 
		----------------------------------------------
		elseif current_activity.sub_cmd == 'port' then
			if menu_id >= 102 and menu_id <= 111 then
				if menu_id == 102 or menu_id == 103 then
					destination = destination_array.apollyon.NW1
				elseif menu_id == 104 then
					destination = destination_array.apollyon.NW2
				elseif menu_id == 105 then
					destination = destination_array.apollyon.NW3
				elseif menu_id == 106 then
					destination = destination_array.apollyon.NW4
				elseif menu_id == 107 then
					destination = destination_array.apollyon.NW5
				elseif menu_id == 108 then
					destination = destination_array.apollyon.E1
				elseif menu_id == 109 then
					destination = destination_array.apollyon.SW2
				elseif menu_id == 110 then
					destination = destination_array.apollyon.SW3
				elseif menu_id == 111 then
					destination = destination_array.apollyon.SW4
				end
			elseif menu_id >= 112 and menu_id <= 121 then
				if menu_id == 112 then
					destination = destination_array.apollyon.E1
				elseif menu_id == 113 then
					destination = destination_array.apollyon.NE2
				elseif menu_id == 114 then
					destination = destination_array.apollyon.NE3
				elseif menu_id == 115 then
					destination = destination_array.apollyon.NE4
				elseif menu_id == 116 then
					destination = destination_array.apollyon.NE5
				elseif menu_id == 117 then
					destination = destination_array.apollyon.E1
				elseif menu_id == 118 then
					destination = destination_array.apollyon.SE2
				elseif menu_id == 119 then
					destination = destination_array.apollyon.SE3
				elseif menu_id == 120 then
					destination = destination_array.apollyon.SE4
				elseif menu_id == 121 then
					destination = destination_array.apollyon.E1
				end
			end
		elseif current_activity.sub_cmd == 'back' then
			if menu_id <= 121 and menu_id >= 113 then
				if menu_id == 121 then
					destination = destination_array.apollyon.SE3
				elseif menu_id == 120 then
					destination = destination_array.apollyon.SE2
				elseif menu_id == 119 then
					destination = destination_array.apollyon.SE1
				elseif menu_id == 118 then
					destination = destination_array.apollyon.E1
				elseif menu_id == 117 then
					destination = destination_array.apollyon.NE4
				elseif menu_id == 116 then
					destination = destination_array.apollyon.NE3
				elseif menu_id == 115 then
					destination = destination_array.apollyon.NE2
				elseif menu_id == 114 then
					destination = destination_array.apollyon.NE1
				elseif menu_id == 113 then
					destination = destination_array.apollyon.E1
				end
			elseif menu_id <= 112 and menu_id >= 102 then
				if menu_id == 112 then
					destination = destination_array.apollyon.SW3
				elseif menu_id == 111 then
					destination = destination_array.apollyon.SW2
				elseif menu_id == 110 then
					destination = destination_array.apollyon.SW1
				elseif menu_id == 109 then
					destination = destination_array.apollyon.E1
				elseif menu_id == 108 then
					destination = destination_array.apollyon.NW4
				elseif menu_id == 107 then
					destination = destination_array.apollyon.NW3
				elseif menu_id == 106 then
					destination = destination_array.apollyon.NW2
				elseif menu_id == 105 then
					destination = destination_array.apollyon.NW1
				elseif menu_id == 104 then
					destination = destination_array.apollyon.E1
				elseif menu_id == 103 or menu_id == 102 then
					destination = destination_array.apollyon.SE4
				end
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
				destination = destination_array.apollyon.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Southwest--------------------------------------------------------------------------
        if (menu_id >= 109 and menu_id <= 112) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 112 or destination.menu_id < 109) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.apollyon.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Northeast--------------------------------------------------------------------------
        if (menu_id >= 113 and menu_id <= 117) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 117 or destination.menu_id < 113) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.apollyon.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Southeast--------------------------------------------------------------------------
        if (menu_id >= 118 and menu_id <= 121) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 121 or destination.menu_id < 118) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.apollyon.E1
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        --------------------------------------------------------------------------------------------------------------------------------------------
    end    --  Temenos
        --------------------------------------------------------------------------------------------------------------------------------------------
elseif zone == 37 then
		-------------------------------------------------------------------------------------------------------------------------------------------
       -- Destination setters
        -------------------------------------------------------------------------------------------------------------------------------------------
		if current_activity.sub_cmd == 'next' then
			if _temenos_floor then
				destination = destination_array.temenos[_temenos_floor]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 1000 then
				destination = destination_array.temenos.C4
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 1025 or menu_id == 1007 or menu_id == 1014 or menu_id == 1021 then
				destination = destination_array.temenos.E
				log('All data collected. Sending you to the entrance.')
			else
				if menu_id >= 1001 and menu_id <= 1006 then
					destination = destination_array.temenos.N7
				elseif menu_id >= 1008 and menu_id <= 1013 then
					destination = destination_array.temenos.W7
				elseif menu_id >= 1015 and menu_id <= 1020 then
					destination = destination_array.temenos.E7
				elseif menu_id >= 1022 and menu_id <= 1024 then
					destination = destination_array.temenos.C4
				end
				log('All data collected. Sending you to open the chest.')
			end 
		elseif current_activity.sub_cmd == 'random' then
			if _temenos_shuffle then
				destination = destination_array.temenos[_temenos_shuffle]
				current_floor_checkinator = true
				cross_tower_checkinator = true
			elseif menu_id == 1000 then
				destination = destination_array.temenos.C4
				log('All data collected. Sending you to open the chest.')
			elseif menu_id == 1025 or menu_id == 1007 or menu_id == 1014 or menu_id == 1021 then
				destination = destination_array.temenos.E
				log('All data collected. Sending you to the entrance.')
			else
				if menu_id >= 1001 and menu_id <= 1006 then
					destination = destination_array.temenos.N7
				elseif menu_id >= 1008 and menu_id <= 1013 then
					destination = destination_array.temenos.W7
				elseif menu_id >= 1015 and menu_id <= 1020 then
					destination = destination_array.temenos.E7
				elseif menu_id >= 1022 and menu_id <= 1024 then
					destination = destination_array.temenos.C4
				end
				log('All data collected. Sending you to open the chest.')
			end 
		--------------------------------------------
		elseif current_activity.sub_cmd == 'port' then
			if menu_id >= 1000 and menu_id <= 1008 then
				if menu_id == 1000 then
					destination = destination_array.temenos.N1
				elseif menu_id == 1001 then
					destination = destination_array.temenos.N2
				elseif menu_id == 1002 then
					destination = destination_array.temenos.N3
				elseif menu_id == 1003 then
					destination = destination_array.temenos.N4
				elseif menu_id == 1004 then
					destination = destination_array.temenos.N5
				elseif menu_id == 1005 then
					destination = destination_array.temenos.N6
				elseif menu_id == 1006 then
					destination = destination_array.temenos.N7
				elseif menu_id == 1007 then
					destination = destination_array.temenos.E
				elseif menu_id == 1008 then
					destination = destination_array.temenos.W2
				end
			elseif menu_id >= 1009 and menu_id <= 1016 then
				if menu_id == 1009 then
					destination = destination_array.temenos.W3
				elseif menu_id == 1010 then
					destination = destination_array.temenos.W4
				elseif menu_id == 1011 then
					destination = destination_array.temenos.W5
				elseif menu_id == 1012 then
					destination = destination_array.temenos.W6
				elseif menu_id == 1013 then
					destination = destination_array.temenos.W7
				elseif menu_id == 1014 then
					destination = destination_array.temenos.E
				elseif menu_id == 1015 then
					destination = destination_array.temenos.E2
				elseif menu_id == 1016 then
					destination = destination_array.temenos.E3
				end
			elseif menu_id >= 1017 and menu_id <= 1025 then
				if menu_id == 1017 then
					destination = destination_array.temenos.E4
				elseif menu_id == 1018 then
					destination = destination_array.temenos.E5
				elseif menu_id == 1019 then
					destination = destination_array.temenos.E6
				elseif menu_id == 1020 then
					destination = destination_array.temenos.E7
				elseif menu_id == 1021 then
					destination = destination_array.temenos.E
				elseif menu_id == 1022 then
					destination = destination_array.temenos.C2
				elseif menu_id == 1023 then
					destination = destination_array.temenos.C3
				elseif menu_id == 1024 then
					destination = destination_array.temenos.C4
				elseif menu_id == 1025 then
					destination = destination_array.temenos.E
				end
			end
		elseif current_activity.sub_cmd == 'back' then
			if menu_id <= 1025 and menu_id >= 1017 then
				if menu_id == 1025 then
					destination = destination_array.temenos.C3
				elseif menu_id == 1024 then
					destination = destination_array.temenos.C2
				elseif menu_id == 1023 then
					destination = destination_array.temenos.C1
				elseif menu_id == 1022 then
					destination = destination_array.temenos.E
				elseif menu_id == 1021 then
					destination = destination_array.temenos.E6
				elseif menu_id == 1020 then
					destination = destination_array.temenos.E5
				elseif menu_id == 1019 then
					destination = destination_array.temenos.E4
				elseif menu_id == 1018 then
					destination = destination_array.temenos.E3
				elseif menu_id == 1017 then
					destination = destination_array.temenos.E2
				end
			elseif menu_id <= 1016 and menu_id >= 1008 then
				if menu_id == 1016 then
					destination = destination_array.temenos.E1
				elseif menu_id == 1015 then
					destination = destination_array.temenos.E
				elseif menu_id == 1014 then
					destination = destination_array.temenos.W6
				elseif menu_id == 1013 then
					destination = destination_array.temenos.W5
				elseif menu_id == 1012 then
					destination = destination_array.temenos.W4
				elseif menu_id == 1011 then
					destination = destination_array.temenos.W3
				elseif menu_id == 1010 then
					destination = destination_array.temenos.W2
				elseif menu_id == 1009 then
					destination = destination_array.temenos.W1
				elseif menu_id == 1008 then
					destination = destination_array.temenos.E
				end
			elseif menu_id <= 1007 and menu_id >= 1000 then
				if menu_id == 1007 then
					destination = destination_array.temenos.N6
				elseif menu_id == 1006 then
					destination = destination_array.temenos.N5
				elseif menu_id == 1005 then	
					destination = destination_array.temenos.N4
				elseif menu_id == 1004 then	
					destination = destination_array.temenos.N3
				elseif menu_id == 1003 then	
					destination = destination_array.temenos.N2
				elseif menu_id == 1002 then	
					destination = destination_array.temenos.N1
				elseif menu_id == 1001 then	
					destination = destination_array.temenos.E
				elseif menu_id == 1000 then
					destination = destination_array.temenos.C4
				end
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
				destination = destination_array.temenos.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------West Tower--------------------------------------------------------------------------
        if (menu_id >= 1008 and menu_id <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.temenos.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------East Tower--------------------------------------------------------------------------
        if (menu_id >= 1015 and menu_id <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.temenos.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
        ----------------Central Tower--------------------------------------------------------------------------
        if (menu_id >= 1022 and menu_id <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
			if cross_tower_checkinator then 
				cross_tower_checkinator = nil
				destination = destination_array.temenos.E
			else
				return 'Cannot warp to other towers from here.'
			end
        end
end
	if current_activity.sub_cmd ~= 'exit' and current_activity.sub_cmd ~= 'enter' then
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
        if not limbus_zones:contains(zone) then
            return 'Not in Limbus!'
        end
        if zone ~= destination.zone then
            return 'Destination is in wrong zone.'
        end
	end
		current_floor_checkinator = nil
		cross_tower_checkinator = nil
        return nil
    end,
    help_text = "| Limbus |\n Commands: (Floor), port, next, back, random, enter, exit \n[sw] li [warp/w] [all/a/@all/party/p]  e1/nw1/sw2/ne5/se3   e/n1/w2/e5/c3 etc. -- warp to a designated tower and floor in limbus. \n[sw] li [all/a/@all/party/p]  port -- warp to the next floor of any tower, if on last floor will warp to the entrance, if at entrance will warp to first floor of the first tower. \n[sw] li [all/a/@all/party/p]  next -- warp to the first uncompleted floor in sequence, if this is in another tower, will warp to the entrance.\n [sw] li [all/a/@all/party/p]  back -- the reverse of port command, teleports to the previous floor. If you are on the first floor of a tower this will send you to the entrance, if you are at the entrance this command will send you to the last floor of the last tower.\n[sw] li [all/a/@all/party/p]  random -- Similar to the next command, sends you to floors you do not have the data for until you have collected all data; Will send you to other floors within the same tower until all are completed then will send to another tower/floor.\n [sw] li [all/a/@all/party/p]  enter -- enter apollyon. \n[sw] li [all/a/@all/party/p]  exit -- exit apollyon.\n------------------------------",
    sub_zone_targets = S {'e1', 'e2', 'nw1', 'nw2', 'nw3', 'nw4', 'nw5', 'sw1', 'sw2', 'sw3','sw4', 'ne1', 'ne2', 'ne3', 'ne4', 'ne5', 'se1', 'se2', 'se3', 'se4','entrance','n1', 'n2', 'n3', 'n4', 'n5', 'n6', 'n7', 'w1', 'w2','w3', 'w4', 'w5', 'w6', 'w7', 'e1', 'e2', 'e3', 'e4', 'e5','e6','e7','c1','c2','c3','c4'}, 
    auto_select_zone = function(zone)
        if zone == 38 then
            return 'apollyon'
        elseif zone == 37 then
            return 'temenos'
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
    if zone == 38 then
		if current_activity.sub_cmd == 'port' then
			if menu >= 102 and menu <= 111 then
				if menu == 102 or menu == 103 then
					destination = destination_array.apollyon.NW1
				elseif menu == 104 then
					destination = destination_array.apollyon.NW2
				elseif menu == 105 then
					destination = destination_array.apollyon.NW3
				elseif menu == 106 then
					destination = destination_array.apollyon.NW4
				elseif menu == 107 then
					destination = destination_array.apollyon.NW5
				elseif menu == 108 then
					destination = destination_array.apollyon.E1
				elseif menu == 109 then
					destination = destination_array.apollyon.SW2
				elseif menu == 110 then
					destination = destination_array.apollyon.SW3
				elseif menu == 111 then
					destination = destination_array.apollyon.SW4
				end
			elseif menu >= 112 and menu <= 121 then
				if menu == 112 then
					destination = destination_array.apollyon.E1
				elseif menu == 113 then
					destination = destination_array.apollyon.NE2
				elseif menu == 114 then
					destination = destination_array.apollyon.NE3
				elseif menu == 115 then
					destination = destination_array.apollyon.NE4
				elseif menu == 116 then
					destination = destination_array.apollyon.NE5
				elseif menu == 117 then
					destination = destination_array.apollyon.E1
				elseif menu == 118 then
					destination = destination_array.apollyon.SE2
				elseif menu == 119 then
					destination = destination_array.apollyon.SE3
				elseif menu == 120 then
					destination = destination_array.apollyon.SE4
				elseif menu == 121 then
					destination = destination_array.apollyon.E1
				end
			end
		end
    elseif zone == 37 then
		if current_activity.sub_cmd == 'port' then
			if menu >= 1000 and menu <= 1008 then 
				if menu == 1000 then
					destination = destination_array.temenos.N1
				elseif menu == 1001 then
					destination = destination_array.temenos.N2
				elseif menu == 1002 then
					destination = destination_array.temenos.N3
				elseif menu == 1003 then
					destination = destination_array.temenos.N4
				elseif menu == 1004 then
					destination = destination_array.temenos.N5
				elseif menu == 1005 then
					destination = destination_array.temenos.N6
				elseif menu == 1006 then
					destination = destination_array.temenos.N7
				elseif menu == 1007 then
					destination = destination_array.temenos.E
				elseif menu == 1008 then
					destination = destination_array.temenos.W2
				end
			elseif menu >= 1009 and menu <= 1017 then
				if menu == 1009 then
					destination = destination_array.temenos.W3
				elseif menu == 1010 then
					destination = destination_array.temenos.W4
				elseif menu == 1011 then
					destination = destination_array.temenos.W5
				elseif menu == 1012 then
					destination = destination_array.temenos.W6
				elseif menu == 1013 then
					destination = destination_array.temenos.W7
				elseif menu == 1014 then
					destination = destination_array.temenos.E
				elseif menu == 1015 then
					destination = destination_array.temenos.E2
				elseif menu == 1016 then
					destination = destination_array.temenos.E3
				elseif menu == 1017 then
					destination = destination_array.temenos.E4
				end
			elseif menu >= 1018 and menu <= 1025 then
				if menu == 1018 then
					destination = destination_array.temenos.E5
				elseif menu == 1019 then
					destination = destination_array.temenos.E6
				elseif menu == 1020 then
					destination = destination_array.temenos.E7
				elseif menu == 1021 then
					destination = destination_array.temenos.E
				elseif menu == 1022 then
					destination = destination_array.temenos.C2
				elseif menu == 1023 then
					destination = destination_array.temenos.C3
				elseif menu == 1024 then
					destination = destination_array.temenos.C4
				elseif menu == 1025 then
					destination = destination_array.temenos.E
				end
			end
		end
    end
	
				if zone ~= destination.zone then
					log('Woa woa woa.')
					return
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
  
	back = function(current_activity, zone, p, settings, warpdata)
		local actions = T {}
		local packet = nil
		local menu = p["Menu ID"]
		local npc = current_activity.npc
		local destination = nil
    if zone == 38 then
		if current_activity.sub_cmd == 'back' then
			if menu <= 121 and menu >= 113 then
				if menu == 121 then
					destination = destination_array.apollyon.SE3
				elseif menu == 120 then
					destination = destination_array.apollyon.SE2
				elseif menu == 119 then
					destination = destination_array.apollyon.SE1
				elseif menu == 118 then
					destination = destination_array.apollyon.E1
				elseif menu == 117 then
					destination = destination_array.apollyon.NE4
				elseif menu == 116 then
					destination = destination_array.apollyon.NE3
				elseif menu == 115 then
					destination = destination_array.apollyon.NE2
				elseif menu == 114 then
					destination = destination_array.apollyon.NE1
				elseif menu == 113 then
					destination = destination_array.apollyon.E1
				end
			elseif menu <= 112 and menu >= 102 then
				if menu == 112 then
					destination = destination_array.apollyon.SW3
				elseif menu == 111 then
					destination = destination_array.apollyon.SW2
				elseif menu == 110 then
					destination = destination_array.apollyon.SW1
				elseif menu == 109 then
					destination = destination_array.apollyon.E1
				elseif menu == 108 then
					destination = destination_array.apollyon.NW4
				elseif menu == 107 then
					destination = destination_array.apollyon.NW3
				elseif menu == 106 then
					destination = destination_array.apollyon.NW2
				elseif menu == 105 then
					destination = destination_array.apollyon.NW1
				elseif menu == 104 then
					destination = destination_array.apollyon.E1
				elseif menu == 102 or menu == 103 then
					destination = destination_array.apollyon.SE4
				end
			end
		end
    elseif zone == 37 then
		if current_activity.sub_cmd == 'back' then
			if menu <= 1025 and menu >= 1017 then
				if menu == 1025 then
					destination = destination_array.temenos.C3
				elseif menu == 1024 then
					destination = destination_array.temenos.C2
				elseif menu == 1023 then
					destination = destination_array.temenos.C1
				elseif menu == 1022 then
					destination = destination_array.temenos.E
				elseif menu == 1021 then
					destination = destination_array.temenos.E6
				elseif menu == 1020 then
					destination = destination_array.temenos.E5
				elseif menu == 1019 then
					destination = destination_array.temenos.E4
				elseif menu == 1018 then
					destination = destination_array.temenos.E3
				elseif menu == 1017 then
					destination = destination_array.temenos.E2
				end
			elseif menu <= 1016 and menu >= 1008 then
				if menu == 1016 then
					destination = destination_array.temenos.E1
				elseif menu == 1015 then
					destination = destination_array.temenos.E
				elseif menu == 1014 then
					destination = destination_array.temenos.W6
				elseif menu == 1013 then
					destination = destination_array.temenos.W5
				elseif menu == 1012 then
					destination = destination_array.temenos.W4
				elseif menu == 1011 then
					destination = destination_array.temenos.W3
				elseif menu == 1010 then
					destination = destination_array.temenos.W2
				elseif menu == 1009 then
					destination = destination_array.temenos.W1
				elseif menu == 1008 then
					destination = destination_array.temenos.E
				end
			elseif menu <= 1007 and menu >= 1000 then
				if menu == 1007 then
					destination = destination_array.temenos.N6
				elseif menu == 1006 then
					destination = destination_array.temenos.N5
				elseif menu == 1005 then	
					destination = destination_array.temenos.N4
				elseif menu == 1004 then	
					destination = destination_array.temenos.N3
				elseif menu == 1003 then	
					destination = destination_array.temenos.N2
				elseif menu == 1002 then	
					destination = destination_array.temenos.N1
				elseif menu == 1001 then	
					destination = destination_array.temenos.E
				elseif menu == 1000 then
					destination = destination_array.temenos.C4
				end
			end
		end
    end
	
				if zone ~= destination.zone then
					log('Woa woa woa.')
					return
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
		local _apollyon_floor, item_id = find_first_apollyon_missing_floor()
        local _temenos_floor, item_id = find_first_temenos_missing_floor()
		local destination = nil

    if zone == 38 then
			if _apollyon_floor then
				destination = destination_array.apollyon[_apollyon_floor]
			elseif menu == 102 or menu == 103 then
				destination = destination_array.apollyon.SE4
			elseif menu >= 104 and menu <= 107 then
				destination = destination_array.apollyon.NW5
			elseif menu >= 109 and menu <= 111 then
				destination = destination_array.apollyon.SW4
			elseif menu >= 113 and menu <= 116 then
				destination = destination_array.apollyon.NE5
			elseif menu >= 118 and menu <= 120 then
				destination = destination_array.apollyon.SE4
			elseif menu == 108 or menu == 112 or menu == 117 or menu == 121 then
				destination = destination_array.apollyon.E1
			end
		-----------Cross-tower warp override--------------------------------------------------------------------------------------------------------------------------------
        if (menu >= 104 and menu <= 108) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 108 or destination.menu_id < 104) then
				destination = destination_array.apollyon.E1
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 109 and menu <= 112) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 112 or destination.menu_id < 109) then
				destination = destination_array.apollyon.E1
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 113 and menu <= 117) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 117 or destination.menu_id < 113) then
				destination = destination_array.apollyon.E1
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 118 and menu <= 121) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 121 or destination.menu_id < 118) then
				destination = destination_array.apollyon.E1
        end
    elseif zone == 37 then
			if _temenos_floor then
				destination = destination_array.temenos[_temenos_floor]
			elseif menu == 1000 then
				destination = destination_array.temenos.C4
			elseif menu >= 1001 and menu <= 1006 then
				destination = destination_array.temenos.N7
			elseif menu >= 1008 and menu <= 1013 then
				destination = destination_array.temenos.W7
			elseif menu >= 1015 and menu <= 1020 then
				destination = destination_array.temenos.E7
			elseif menu >= 1022 and menu <= 1024 then
				destination = destination_array.temenos.C4
			elseif menu == 1007 or menu == 1014 or menu == 1021 or menu == 1025 then
				destination = destination_array.temenos.E
			end 

        if (menu >= 1001 and menu <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
				destination = destination_array.temenos.E
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 1008 and menu <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
				destination = destination_array.temenos.E
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 1015 and menu <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
				destination = destination_array.temenos.E
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 1022 and menu <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
				destination = destination_array.temenos.E
        end
    end
				if zone ~= destination.zone then
					log('Woa woa woa.')
					return
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
		
	['random'] = function(current_activity, zone, p, settings, warpdata)
			local actions = T {}
			local packet = nil
			local menu = p["Menu ID"]
			local npc = current_activity.npc
			local destination = nil
		    local _apollyon_shuffle, item_id = find_shuffled_missing_apollyon_floor(menu)
            local _temenos_shuffle, item_id = find_shuffled_missing_temenos_floor(menu)

    if zone == 38 then
        if _apollyon_shuffle then
            destination = destination_array.apollyon[_apollyon_shuffle]
        elseif menu == 102 or menu == 103 then
            destination = destination_array.apollyon.SE4
        elseif menu >= 104 and menu <= 107 then
            destination = destination_array.apollyon.NW5
        elseif menu >= 109 and menu <= 111 then
            destination = destination_array.apollyon.SW4
        elseif menu >= 113 and menu <= 116 then
            destination = destination_array.apollyon.NE5
        elseif menu >= 118 and menu <= 120 then
            destination = destination_array.apollyon.SE4
		elseif menu == 108 or menu == 112 or menu == 117 or menu == 121 then
			destination = destination_array.apollyon.E1
        end
    
		-----------Cross-tower warp override--------------------------------------------------------------------------------------------------------------------------------
        if (menu >= 104 and menu <= 108) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 108 or destination.menu_id < 104) then
				destination = destination_array.apollyon.E1
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 109 and menu <= 112) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 112 or destination.menu_id < 109) then
				destination = destination_array.apollyon.E1
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 113 and menu <= 117) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 117 or destination.menu_id < 113) then
				destination = destination_array.apollyon.E1
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 118 and menu <= 121) and (destination.menu_id ~= 102 and destination.menu_id ~= 103) and (destination.menu_id > 121 or destination.menu_id < 118) then
				destination = destination_array.apollyon.E1
        end
    elseif zone == 37 then
			if _temenos_shuffle then
				destination = destination_array.temenos[_temenos_shuffle]
			elseif menu == 1000 then
				destination = destination_array.temenos.C4
			elseif menu >= 1001 and menu <= 1006 then
				destination = destination_array.temenos.N7
			elseif menu >= 1008 and menu <= 1013 then
				destination = destination_array.temenos.W7
			elseif menu >= 1015 and menu <= 1020 then
				destination = destination_array.temenos.E7
			elseif menu >= 1022 and menu <= 1024 then
				destination = destination_array.temenos.C4
			elseif menu == 1007 or menu == 1014 or menu == 1021 or menu == 1025 then
				destination = destination_array.temenos.E
			end 

        if (menu >= 1001 and menu <= 1007) and destination.menu_id ~= 1000 and (destination.menu_id > 1007 or destination.menu_id < 1001) then
				destination = destination_array.temenos.E
        ----------------West Tower--------------------------------------------------------------------------
        elseif (menu >= 1008 and menu <= 1014) and destination.menu_id ~= 1000 and (destination.menu_id > 1014 or destination.menu_id < 1008) then
				destination = destination_array.temenos.E
        ----------------East Tower--------------------------------------------------------------------------
        elseif (menu >= 1015 and menu <= 1021) and destination.menu_id ~= 1000 and (destination.menu_id > 1021 or destination.menu_id < 1015) then
				destination = destination_array.temenos.E
        ----------------Central Tower--------------------------------------------------------------------------
        elseif (menu >= 1022 and menu <= 1025) and destination.menu_id ~= 1000 and (destination.menu_id > 1025 or destination.menu_id < 1022) then
				destination = destination_array.temenos.E
        end
		if menu == destination.menu_id then
				destination = destination_array.temenos.E
			log('Cannot warp to same floor. Suspicious packets averted.')
		end
    end
				if zone ~= destination.zone then
					log('Woa woa woa.')
					return
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
               ['E1'] = {display_name = 'Entrance 1', zone = 38,  menu_id = 102, index = 671, npc = 16933535, offset = 1, x = -608,z = 0, y = -600,h = 126, unknown1 = 1,unknown2 = 1},
			   ['E2'] = {display_name = 'Entrance 2', zone = 38, menu_id = 103, index = 672, npc = 16933536, offset = 1, x = 608, z = 0, y = -600,h = 0,unknown1 = 1,  unknown2 = 1},
			   ['NW1'] = {display_name = 'Northwest 1', zone = 38, menu_id = 104, index = 673, npc = 16933537, offset = 1, x = -440.00003051758, z = 0, y = -88.000007629395, h = 191, unknown1 = 11, unknown2 = 1},
			   ['NW2'] = {display_name = 'Northwest 2', zone = 38, menu_id = 105, index = 674, npc = 16933538, offset = 2, x = -534,z = 0, y = 171.00001525879,h = 159, unknown1 = 12, unknown2 = 1},
			   ['NW3'] = {display_name = 'Northwest 3', zone = 38, menu_id = 106, index = 675, npc = 16933540, offset = 3, x = -294,z = 0, y = 171.00001525879,h = 159, unknown1 = 13, unknown2 = 1},
			   ['NW4'] = {display_name = 'Northwest 4', zone = 38, menu_id = 107, index = 676, npc = 16933539, offset = 4, x = -628,z = 0, y = 497.00003051758,h = 223, unknown1 = 14, unknown2 = 1},
			   ['NW5'] = {display_name = 'Northwest 5', zone = 38, menu_id = 108, index = 677, npc = 16933542, offset = 5, x = -388,z = 0, y = 498.00003051758,h = 223, unknown1 = 15, unknown2 = 1},
			   ['SW1'] = {display_name = 'Southwest 1', zone = 38, menu_id = 109, index = 678, npc = 16933541, offset = 3, x = -468.00003051758, z = 0, y = -625,h = 223, unknown1 = 21, unknown2 = 1},
			   ['SW2'] = {display_name = 'Southwest 2', zone = 38, menu_id = 110, index = 679, npc = 16933543, offset = 4, x = -576,z = 0, y = -428.00003051758, h = 159, unknown1 = 22, unknown2 = 1},
			   ['SW3'] = {display_name = 'Southwest 3', zone = 38, menu_id = 111, index = 680, npc = 16933544, offset = 0, x = -428.00003051758, z = 0, y = -385.00003051758, h = 223, unknown1 = 23, unknown2 = 1},
			   ['SW4'] = {display_name = 'Southwest 4', zone = 38, menu_id = 112, index = 681, npc = 16933545, offset = 5, x = -176.00001525879, z = 0, y = -628,h = 159, unknown1 = 24, unknown2 = 1},
			   ['NE1'] = {display_name = 'Northeast 1', zone = 38, menu_id = 113, index = 682, npc = 16933546, offset = 9, x = 440.00003051758,  z = 0, y = -88.000007629395, h = 191, unknown1 = 31, unknown2 = 1},
			   ['NE2'] = {display_name = 'Northeast 2', zone = 38, menu_id = 114, index = 683, npc = 16933547, offset = 10,x = 534,z = 0, y = 171.00001525879,h = 223, unknown1 = 32, unknown2 = 1},
			   ['NE3'] = {display_name = 'Northeast 3', zone = 38, menu_id = 115, index = 684, npc = 16933548, offset = 10,x = 294,z = 0, y = 171.00001525879,h = 223, unknown1 = 33, unknown2 = 1},
			   ['NE4'] = {display_name = 'Northeast 4', zone = 38, menu_id = 116, index = 685, npc = 16933549, offset = 1, x = 628,z = 0, y = 497.00003051758,h = 159, unknown1 = 34, unknown2 = 1},
			   ['NE5'] = {display_name = 'Northeast 5', zone = 38, menu_id = 117, index = 686, npc = 16933550, offset = 2, x = 388.00003051758,  z = 0, y = 498.00003051758,  h = 159, unknown1 = 35, unknown2 = 1},
			   ['SE1'] = {display_name = 'Southeast 1', zone = 38, menu_id = 118, index = 687, npc = 16933551, offset = 5, x = 468.00003051758,  z = 0, y = -625,h = 159, unknown1 = 41, unknown2 = 1},
			   ['SE2'] = {display_name = 'Southeast 2', zone = 38, menu_id = 119, index = 688, npc = 16933552, offset = 6, x = 576,z = 0, y = -428.00003051758, h = 223, unknown1 = 42, unknown2 = 1},
			   ['SE3'] = {display_name = 'Southeast 3', zone = 38, menu_id = 120, index = 689, npc = 16933553, offset = 7, x = 428.00003051758,  z = 0, y = -385.00003051758, h = 159, unknown1 = 43, unknown2 = 1},
			   ['SE4'] = {display_name = 'Southeast 4', zone = 38, menu_id = 121, index = 690, npc = 16933554, offset = 8, x = 176.00001525879,  z = 0, y = -628,h = 223, unknown1 = 44, unknown2 = 1},
		},
        ['Temenos'] = T{  
			   ['Entrance']  = {display_name = 'Entrance' , zone = 37,  menu_id = 1000, index = 795, npc = 16929563, offset = 1, x = 580, z = 0 ,y = 86.000007629395,h = 63,unknown1 = 1 , unknown2 = 1},
			   ['N1'] = {display_name = 'Northern Tower 1', zone = 37, menu_id = 1001, index = 853, npc = 16929621, offset = 1, x = 380.00003051758,z = 71.620002746582 ,y = 376.00003051758,h = 191,unknown1 = 11,unknown2 = 1},
			   ['N2'] = {display_name = 'Northern Tower 2', zone = 37, menu_id = 1002, index = 854, npc = 16929622, offset = 2, x = 180.00001525879,z = -82.380004882812,y = 376.00003051758,h = 191,unknown1 = 12,unknown2 = 1},
			   ['N3'] = {display_name = 'Northern Tower 3', zone = 37, menu_id = 1003, index = 855, npc = 16929623, offset = 3, x = 60.000003814697,z = 71.620002746582 ,y = 376.00003051758,h = 191,unknown1 = 13,unknown2 = 1},
			   ['N4'] = {display_name = 'Northern Tower 4', zone = 37, menu_id = 1004, index = 856, npc = 16929624, offset = 4, x = -140,z = -82.380004882812 ,y = 376.00003051758,h = 191, unknown1 = 14,unknown2 = 1},
			   ['N5'] = {display_name = 'Northern Tower 5', zone = 37, menu_id = 1005, index = 857, npc = 16929625, offset = 5, x = -260,z = 77.620002746582 , y = 376.00003051758,h = 191, unknown1 = 15, unknown2 = 1},
			   ['N6'] = {display_name = 'Northern Tower 6', zone = 37, menu_id = 1006, index = 858, npc = 16929626, offset = 1, x = -460.00003051758,z = -82.380004882812 ,y = 376.00003051758,h = 191,unknown1 = 16,unknown2 = 1},
			   ['N7'] = {display_name = 'Northern Tower 7', zone = 37, menu_id = 1007, index = 859, npc = 16929627, offset = 2, x = -580,z = 77.620002746582 , y = 376.00003051758,h = 191, unknown1 = 17, unknown2 = 1},
			   ['W1'] = {display_name = 'Western Tower 1',  zone = 37, menu_id = 1008, index = 860, npc = 16929628, offset = 3, x = 380.00003051758,z = -2.3800001144409 ,y = 96.000007629395,h = 191, unknown1 = 21, unknown2 = 1},
			   ['W2'] = {display_name = 'Western Tower 2',  zone = 37, menu_id = 1009, index = 861, npc = 16929629, offset = 4, x = 180.00001525879,z = -162.38000488281 ,y = 96.000007629395,h = 191, unknown1 = 22, unknown2 = 1},
			   ['W3'] = {display_name = 'Western Tower 3',  zone = 37, menu_id = 1010, index = 862, npc = 16929630, offset = 0, x = 60.000003814697,z = -2.3800001144409 ,y = 96.000007629395,h = 191, unknown1 = 23, unknown2 = 1},
			   ['W4'] = {display_name = 'Western Tower 4',  zone = 37, menu_id = 1011, index = 863, npc = 16929631, offset = 5, x = -140,z = -162.38000488281 ,y = 96.000007629395,h = 191, unknown1 = 24, unknown2 = 1},
			   ['W5'] = {display_name = 'Western Tower 5',  zone = 37, menu_id = 1012, index = 864, npc = 16929632, offset = 6, x = -260,z = -2.3800001144409 ,y = 96.000007629395,h = 191, unknown1 = 25, unknown2 = 1},
			   ['W6'] = {display_name = 'Western Tower 6',  zone = 37, menu_id = 1013, index = 865, npc = 16929633, offset = 7, x = -460.00003051758, z = -162.38000488281 ,y = 96.000007629395,   h = 191, unknown1 = 26, unknown2 = 1},
			   ['W7'] = {display_name = 'Western Tower 7',  zone = 37, menu_id = 1014, index = 866, npc = 16929634, offset = 8, x = -580,z = -2.3800001144409, y = 96.000007629395,   h = 191, unknown1 = 27, unknown2 = 1},
			   ['E1'] = {display_name = 'Eastern Tower 1',  zone = 37, menu_id = 1015, index = 867, npc = 16929635, offset = 9, x = 380.00003051758,z = 71.620002746582,y = -184.00001525879,h = 191, unknown1 = 31, unknown2 = 1},
			   ['E2'] = {display_name = 'Eastern Tower 2',  zone = 37, menu_id = 1016, index = 868, npc = 16929636, offset = 10,x = 180.00001525879,z = -82.380004882812,y = -184.00001525879,h = 191, unknown1 = 32, unknown2 = 1},
			   ['E3'] = {display_name = 'Eastern Tower 3',  zone = 37, menu_id = 1017, index = 869, npc = 16929637, offset = 10,x = 60.000003814697,z = 71.620002746582,y = -184.00001525879,h = 191, unknown1 = 33, unknown2 = 1},
			   ['E4'] = {display_name = 'Eastern Tower 4',  zone = 37, menu_id = 1018, index = 870, npc = 16929638, offset = 1, x = -140,z = -82.380004882812, y = -184.00001525879,h = 191, unknown1 = 34, unknown2 = 1},
			   ['E5'] = {display_name = 'Eastern Tower 5',  zone = 37, menu_id = 1019, index = 871, npc = 16929639, offset = 2, x = -260,z = 77.620002746582,  y = -184.00001525879,h = 191, unknown1 = 35, unknown2 = 1},
			   ['E6'] = {display_name = 'Eastern Tower 6',  zone = 37, menu_id = 1020, index = 872, npc = 16929640, offset = 3, x = -460.00003051758, z = -82.380004882812, y = -184.00001525879,  h = 191, unknown1 = 36, unknown2 = 1},
			   ['E7'] = {display_name = 'Eastern Tower 7',  zone = 37, menu_id = 1021, index = 873, npc = 16929642, offset = 4, x = -580,z = 77.620002746582,  y = -184.00001525879,h = 191, unknown1 = 37, unknown2 = 1},
			   ['C1'] = {display_name = 'Central Tower 1',  zone = 37, menu_id = 1022, index = 874, npc = 16929641, offset = 5, x = 580, z = -2.3800001144409, y = -544, h = 191, unknown1 = 41, unknown2 = 1},
			   ['C2'] = {display_name = 'Central Tower 2',  zone = 37, menu_id = 1023, index = 875, npc = 16929643, offset = 6, x = 260, z = -162.38000488281, y = -504.00003051758,h = 191, unknown1 = 42, unknown2 = 1},
			   ['C3'] = {display_name = 'Central Tower 3',  zone = 37, menu_id = 1024, index = 876, npc = 16929644, offset = 7, x = 20,  z = -2.3800001144409, y = -544, h = 191, unknown1 = 43, unknown2 = 1},
			   ['C4'] = {display_name = 'Central Tower 4',  zone = 37, menu_id = 1025, index = 877, npc = 16929645, offset = 8, x = -296,z = -162.38000488281, y = -500.00003051758,h = 127, unknown1 = 44, unknown2 = 1},
		},
    },
}