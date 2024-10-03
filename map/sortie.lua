local entry_zones = S{267}
local sortie_zones = S{275,133,189}
last_gadget_used = nil
local npc_names = T{
	port = S{'Diaphanous Bitzer','Diaphanous Gadget'},
    warp = S{'Diaphanous Device'},
    exit= S{}, -- I might end up using exit for gadget_ and bitzer e-h if I dont come up with another solution to the superwarp basement retry re-entry conundrum. Just wanted to keep it as clean and concise as possible
}
--///////////////////////////////////////////////////////////////////-destination names-/////////////////////////////////////////////////////////////////////////////////////////////////////////////-
   local zone_info = windower.ffxi.get_info().zone
   device_  = { menu_id = 1000, index = 817, zone = zone_info,npc = 21001009, offset = 1, x = -836.00006103516, y = -20, z = -178.00001525879 , h = 0, unknown1 = 1 , unknown2 = 1}
   device_a = { menu_id = 1001, index = 818, zone = zone_info,npc = 21001010, offset = 2, x = -460.00003051758, y = 96.000007629395, z = -150 , h = 63, unknown1 = 2  , unknown2 = 1}
   device_b = { menu_id = 1002, index = 819, zone = zone_info,npc = 21001011, offset = 3, x = -344.00003051758, y = -20, z = -150 , h = 127, unknown1 = 3 , unknown2 = 1}
   device_c = { menu_id = 1003, index = 820, zone = zone_info,npc = 21001012, offset = 4, x = -460.00003051758, y = -136, z = -150 , h = 191, unknown1 = 4 , unknown2 = 1}
   device_d = { menu_id = 1004, index = 821, zone = zone_info,npc = 21001013, offset = 5, x = -576, y = -20, z = -150 , h = 0, unknown1 = 5, unknown2 = 1}
   gadget_a = { menu_id = 1005, index = 822, zone = zone_info,npc = 21001014, offset = 1, x = -900.00006103516, y = 416.00003051758, z = -200.00001525879 , h = 63, unknown1 = 1, unknown2 = 1}
   gadget_b = { menu_id = 1006, index = 823, zone = zone_info,npc = 21001015, offset = 2, x = -24.000001907349, y = 420.00003051758, z = -200.00001525879 , h = 127, unknown1 = 2, unknown2 = 1}
   gadget_c = { menu_id = 1007, index = 824, zone = zone_info,npc = 21001016, offset = 3, x = -20, y = -456.00003051758, z = -200.00001525879 , h = 191, unknown1 = 3, unknown2 = 1}
   gadget_d = { menu_id = 1008, index = 825, zone = zone_info,npc = 21001017, offset = 4, x = -896.00006103516, y = -460.00003051758, z = -200.00001525879 , h = 0, unknown1 = 4, unknown2 = 1}
   gadget_  = { menu_id = 1009, index = 826, zone = zone_info,npc = 21001018, offset = 0, x = 624, y = -620, z = 100.00000762939 , h = 0, unknown1 = 1, unknown2 = 1}
   gadget_e = { menu_id = 1018, index = 827, zone = zone_info,npc = 21001019, offset = 5, x = 280, y = 276, z = 70 , h = 63, unknown1 = 5, unknown2 = 1}
   gadget_f = { menu_id = 1019, index = 828, zone = zone_info,npc = 21001020, offset = 6, x = 876.00006103516, y = 280, z = 70 , h = 127, unknown1 = 6, unknown2 = 1}
   gadget_g = { menu_id = 1020, index = 829, zone = zone_info,npc = 21001021, offset = 7, x = 880.00006103516, y = -316, z = 70 , h = 191, unknown1 = 7, unknown2 = 1}
   gadget_h = { menu_id = 1021, index = 830, zone = zone_info,npc = 21001022, offset = 8, x = 284, z = 70, y = -320.00,  h = 0, unknown1 = 8, unknown2 = 1}
   bitzer_a = { menu_id = 1010, index = 833, zone = zone_info,npc = 21001025, offset = 1, x = -460.00003051758, z = -140, y = 35.5,  h = 191, unknown1 = 5, unknown2 = 1}
   bitzer_b = { menu_id = 1011, index = 834, zone = zone_info,npc = 21001026, offset = 2, x = -404.50003051758, z = -140, y = -20,  h = 0, unknown1 = 6, unknown2 = 1}
   bitzer_c = { menu_id = 1012, index = 835, zone = zone_info,npc = 21001027, offset = 3, x = -460.00003051758, y = -75.5, z = -140 , h = 63, unknown1 = 7, unknown2 = 1}
   bitzer_d = { menu_id = 1013, index = 836, zone = zone_info,npc = 21001028, offset = 4, x = -515.5, z = -140, y = -20,  h = 127, unknown1 = 8, unknown2 = 1}
   bitzer_e = { menu_id = 1014, index = 837, zone = zone_info,npc = 21001029, offset = 5, x = 580, y = 31.500001907349, z = 100.00000762939 , h = 191, unknown1 = 1, unknown2 = 1}
   bitzer_f = { menu_id = 1015, index = 838, zone = zone_info,npc = 21001030, offset = 6, x = 631.5, z = 100.00000762939, y = -20,  h = 0, unknown1 = 2, unknown2 = 1}
   bitzer_g = { menu_id = 1016, index = 839, zone = zone_info,npc = 21001031, offset = 7, x = 580, y = -71.5, z = 100.00000762939 , h = 63, unknown1 = 3, unknown2 = 1}
   bitzer_h = { menu_id = 1017, index = 840, zone = zone_info,npc = 21001032, offset = 8, x = 528.5, z = 100.00000762939, y = -20,  h = 127, unknown1 = 4, unknown2 = 1}
--////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////-

	gadget_menu_identification = T{
	["Gadget A"] = 1005,
	["Gadget B"] = 1006,
	["Gadget C"] = 1007,
	["Gadget D"] = 1008,
	["Gadget"] =   1009,
	["Gadget E"] = 1018,
	["Gadget F"] = 1019,
	["Gadget G"] = 1020,
	["Gadget H"] = 1021
	}
		bitzer_menu_identification = T{
	["Bitzer A"] = 1010,
	["Bitzer B"] = 1011,
	["Bitzer C"] = 1012,
	["Bitzer D"] = 1013,
	["Bitzer E"] = 1014,
	["Bitzer F"] = 1015,
	["Bitzer G"] = 1016,
	["Bitzer H"] = 1017
	}

-- Categorize NPCs to prevent warping between different NPC types

bitzer_menu_ids = T{1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017}
gadget_menu_ids = T{1005, 1006, 1007, 1008, 1009, 1018, 1019, 1020, 1021}
device_menu_ids = T{1000, 1001, 1002, 1003, 1004}

--------------------------------------------------------------------------------

local temp_item_ids = {
    Plate = {
        A = 9898,  
        B = 9899,
        C = 9900,
        D = 9901
    },
    Shard = {
        A = 9906,  
        B = 9907,
        C = 9908,
        D = 9909,
        E = 9910,
        F = 9911,
        G = 9912,
        H = 9913
    },
    Sheet = {
        A = 9902,  
        B = 9903,
        C = 9904,
        D = 9905
    },
    Fragment = {
        A = 9914,  
        B = 9915,
        C = 9916,
        D = 9917
    }
}

local function table_contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

local function has_temp_item(item_id)
    local temp_items = windower.ffxi.get_items(3)  
    for _, item in ipairs(temp_items) do
        if item.id == item_id then
            return true
        end
    end
    return false
end

-------------------------------------------------------------------
local find_gadget_by_id = function(id)
    for key, value in pairs(gadget_menu_identification) do
        if last_gadget_used == value then
            return key
        end
    end
    return nil 
end
local find_bitzer_by_id = function(id)
    for key, value in pairs(bitzer_menu_identification) do
        if destination.menu_id == value then
            return key
        end
    end
    return nil 
end

return T{
	short_name = 'so',
	long_name = 'sortie',
	move_in_zone = true,
	npc_plural = 'Diaphanous Objects',
	npc_names = npc_names,
----------------------------------------------------------------------------------------------


------------------------------------------------------------------------------------
    zone_npc_list = function(type)
        local mlist = windower.ffxi.get_mob_list()
        mlist = table.filter(mlist, function(name)
            return name ~= "" and npc_names[type]:any(string.startswith+{name})
        end)
        mlist = table.map(mlist, function(name)
            local num = name:match('%d+$')
            return {name=name, key=(num and tostring(num))}
        end)
        return mlist
    end,
    validate = function(menu_id, zone, current_activity)
        local destination = current_activity.activity_settings
		local zone_info = windower.ffxi.get_info().zone
		-- Extra set of these just to be absolutely certain; Revert back to single set if things are working correctly
-----------------------------------------------------------------------------------------------------------------------------------------
  if (menu_id >= 1010 and menu_id <= 1013) then
    	if menu_id == 1010 and not has_temp_item(temp_item_ids.Sheet.A) then
            return 'You do not have the Ra\'Kaznar Sheet #A'
        end
	if menu_id == 1011 and not has_temp_item(temp_item_ids.Sheet.B) then
            return 'You do not have the Ra\'Kaznar Sheet #B'
        end
	if menu_id == 1012 and not has_temp_item(temp_item_ids.Sheet.C) then
            return 'You do not have the Ra\'Kaznar Sheet #C'
        end
	if menu_id == 1013 and not has_temp_item(temp_item_ids.Sheet.D) then
            return 'You do not have the Ra\'Kaznar Sheet #D'
        end
	
							-- Gadgets --
  elseif (menu_id >= 1005 and menu_id <= 1008) or (menu_id >= 1018 and menu_id <= 1021) then
	if menu_id == 1005 and not has_temp_item(temp_item_ids.Shard.A) then
            return 'You do not have the Ra\'Kaznar Shard #A'
        end
	if menu_id == 1006 and not has_temp_item(temp_item_ids.Shard.B) then
            return 'You do not have the Ra\'Kaznar Shard #B'
        end
	if menu_id == 1007 and not has_temp_item(temp_item_ids.Shard.C) then
            return 'You do not have the Ra\'Kaznar Shard #C'
        end
	if menu_id == 1008 and not has_temp_item(temp_item_ids.Shard.D) then
            return 'You do not have the Ra\'Kaznar Shard #D'
        end
	if menu_id == 1018 and not has_temp_item(temp_item_ids.Shard.E) then
            return 'You do not have the Ra\'Kaznar Shard #E'
        end
	if menu_id == 1019 and not has_temp_item(temp_item_ids.Shard.F) then
            return 'You do not have the Ra\'Kaznar Shard #F'
        end
	if menu_id == 1020 and not has_temp_item(temp_item_ids.Shard.G) then
            return 'You do not have the Ra\'Kaznar Shard #G'
        end
	if menu_id == 1021 and not has_temp_item(temp_item_ids.Shard.H) then
            return 'You do not have the Ra\'Kaznar Shard #H'
        end
	
	                          --Devices--
  elseif (menu_id >= 1000 and menu_id <= 1004) then
        if menu_id == 1000 and (not has_temp_item(temp_item_ids.Plate.A) and not has_temp_item(temp_item_ids.Plate.B) and not has_temp_item(temp_item_ids.Plate.C) and not has_temp_item(temp_item_ids.Plate.D)) then
            return 'You do not have any of the Ra\'Kaznar Plates'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1001 and not has_temp_item(temp_item_ids.Plate.A) then
            return 'You do not have the Ra\'Kaznar Plate #A'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1002 and not has_temp_item(temp_item_ids.Plate.B) then
            return 'You do not have the Ra\'Kaznar Plate #B'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1003 and not has_temp_item(temp_item_ids.Plate.C) then
            return 'You do not have the Ra\'Kaznar Plate #C'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1004 and not has_temp_item(temp_item_ids.Plate.D) then
            return 'You do not have the Ra\'Kaznar Plate #D'
        end
  end
							--Fragments--
	if menu_id == 1022 and (not has_temp_item(temp_item_ids.Fragment.A) or not has_temp_item(temp_item_ids.Fragment.B) or not has_temp_item(temp_item_ids.Fragment.C) or not has_temp_item(temp_item_ids.Fragment.D)) then
	    return 'You do not have all 4 Ra\'Kaznar Fragments'
	end
		     --Destination setters
--------------------------------------------------------------------------------------------------------------------------------------------
			if menu_id == 1010 then
				destination = bitzer_e
			elseif menu_id == 1011 then
				destination = bitzer_f
			elseif menu_id == 1012 then
				destination = bitzer_g
			elseif menu_id == 1013 then
				destination = bitzer_h
			elseif menu_id == 1014 then
				destination = bitzer_a
			elseif menu_id == 1015 then
				destination = bitzer_b
			elseif menu_id == 1016 then
				destination = bitzer_c
			elseif menu_id == 1017 then
				destination = bitzer_d
			-- Gadgets all warp to 'Gadget'
			elseif (menu_id >= 1005 and menu_id <= 1008) or (menu_id >= 1018 and menu_id <= 1021) then
				destination = gadget_
				last_gadget_used = menu_id
			end
	
-----------Gadget Handling (Ensures the player can only warp back from whence they came --------------------------
		if menu_id == 1009 and last_gadget_used ~= nil then
			-- Warp the player back to the gadget they came from
			if last_gadget_used == 1005 then
				destination = gadget_a
			elseif last_gadget_used == 1006 then
				destination = gadget_b
			elseif last_gadget_used == 1007 then
				destination = gadget_c
			elseif last_gadget_used == 1008 then
				destination = gadget_d
			elseif last_gadget_used == 1018 then
				destination = gadget_e
			elseif last_gadget_used == 1019 then
				destination = gadget_f
			elseif last_gadget_used == 1020 then
			    destination = gadget_g
	       	        elseif last_gadget_used == 1021 then    
				destination = gadget_h
			end
		elseif menu_id == 1009 and last_gadget_used == nil then
			return 'Superwarp does not know where to send you since you did not have it loaded before entering boss chamber'
		end		
				-- more anti-numbskull mechanisms.
			if menu_id == 1009 and destination.menu_id ~= last_gadget_used then  
				return 'Cannot warp to that Gadget, you must return from whence you came; Use '..find_gadget_by_id
			end
-------------------------------------------------------------------
        if not ( -- NPCs:
               (menu_id >= 1000 and menu_id <= 1023)  ) then
            return "Incorrect menu detected! Menu ID: "..menu_id
        end
		--prevent warping to gadgets or devices from bitzers
--------------------------------------------------------------------------------------------------
        if (menu_id >= 1010 and menu_id <= 1017) and not table_contains(bitzer_menu_ids, destination.menu_id) then
            return 'Cannot warp to devices or gadgets from here.'
        end
		--prevent warping to devices or bitzers from gadgets
---------------------------------------------------------------------------------------------------
        if ((menu_id >= 1005 and menu_id <= 1009) or (menu_id >= 1018 and menu_id <= 1021)) and not table_contains(gadget_menu_ids, destination.menu_id) then
			print(destination.menu_id)
			print(table_contains(gadget_menu_ids, destination.menu_id))
            return 'Cannot warp to devices or bitzers from here.'
        end
		--prevent warping to gadgets or bitzers from devices
---------------------------------------------------------------------------------------------------
        if (menu_id >= 1000 and menu_id <= 1004) and not table_contains(device_menu_ids, destination.menu_id) then
            return 'Cannot warp to gadgets or bitzers from here.'
        end
		-- Prevent using Gadget if origin Gadget is not known 
---------------------------------------------------------------------------------------------------------
		if menu_id == 1009 and last_gadget_used == nil then

		    return 'Superwarp does not know where to send you since you did not have it loaded before entering boss chamber'
		end
		-- extra layer of protection for stopping any cross-zone warp
---------------------------------------------------------------------------------------------------
        if zone ~= destination.zone then
            return "Wrong Zone!"
        end
------------------------------------------------------------------------------------------------------------------
        if current_activity.sub_cmd == 'port' and not sortie_zones:contains(zone) then
            return 'Not in a Sortie zone!'
        end
--------------------------------------------------------------------------------------------------------------------
		----   KI CHECKS. DO NOT JACK AROUND WITH THIS! IT WONT WORK ANYWAY: CONFIRMED. CHEERS ----
		
						-- Bitzers --
  if (menu_id >= 1010 and menu_id <= 1017) then 
	if menu_id == 1010 and not has_temp_item(temp_item_ids.Sheet.A) then
            return 'You do not have the Ra\'Kaznar Sheet #A'
        end
	if menu_id == 1011 and not has_temp_item(temp_item_ids.Sheet.B) then
            return 'You do not have the Ra\'Kaznar Sheet #B'
        end
	if menu_id == 1012 and not has_temp_item(temp_item_ids.Sheet.C) then
            return 'You do not have the Ra\'Kaznar Sheet #C'
        end
	if menu_id == 1013 and not has_temp_item(temp_item_ids.Sheet.D) then
            return 'You do not have the Ra\'Kaznar Sheet #D'
        end
	
							-- Gadgets --
  elseif (menu_id >= 1005 and menu_id <= 1008) or (menu_id >= 1018 and menu_id <= 1021) then
	if menu_id == 1005 and not has_temp_item(temp_item_ids.Shard.A) then
            return 'You do not have the Ra\'Kaznar Shard #A'
        end
	if menu_id == 1006 and not has_temp_item(temp_item_ids.Shard.B) then
            return 'You do not have the Ra\'Kaznar Shard #B'
        end
	if menu_id == 1007 and not has_temp_item(temp_item_ids.Shard.C) then
            return 'You do not have the Ra\'Kaznar Shard #C'
        end
	if menu_id == 1008 and not has_temp_item(temp_item_ids.Shard.D) then
            return 'You do not have the Ra\'Kaznar Shard #D'
        end
	if menu_id == 1018 and not has_temp_item(temp_item_ids.Shard.E) then
            return 'You do not have the Ra\'Kaznar Shard #E'
        end
	if menu_id == 1019 and not has_temp_item(temp_item_ids.Shard.F) then
            return 'You do not have the Ra\'Kaznar Shard #F'
        end
	if menu_id == 1020 and not has_temp_item(temp_item_ids.Shard.G) then
            return 'You do not have the Ra\'Kaznar Shard #G'
        end
	if menu_id == 1021 and not has_temp_item(temp_item_ids.Shard.H) then
            return 'You do not have the Ra\'Kaznar Shard #H'
        end
	
	                          --Devices--
  elseif (menu_id >= 1000 and menu_id <= 1004) then
        if menu_id == 1000 and (not has_temp_item(temp_item_ids.Plate.A) and not has_temp_item(temp_item_ids.Plate.B) and not has_temp_item(temp_item_ids.Plate.C) and not has_temp_item(temp_item_ids.Plate.D)) then
            return 'You do not have any of the Ra\'Kaznar Plates'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1001 and not has_temp_item(temp_item_ids.Plate.A) then
            return 'You do not have the Ra\'Kaznar Plate #A'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1002 and not has_temp_item(temp_item_ids.Plate.B) then
            return 'You do not have the Ra\'Kaznar Plate #B'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1003 and not has_temp_item(temp_item_ids.Plate.C) then
            return 'You do not have the Ra\'Kaznar Plate #C'
        end
        if (menu_id >= 1000 and menu_id <= 1004) and destination.menu_id == 1004 and not has_temp_item(temp_item_ids.Plate.D) then
            return 'You do not have the Ra\'Kaznar Plate #D'
        end
  end
							--Fragments--
	if menu_id == 1022 and (not has_temp_item(temp_item_ids.Fragment.A) or not has_temp_item(temp_item_ids.Fragment.B) or not has_temp_item(temp_item_ids.Fragment.C) or not has_temp_item(temp_item_ids.Fragment.D)) then
	    return 'You do not have all 4 Ra\'Kaznar Fragments'
	end
        return nil
    end,
    missing = function(warpdata, zone, p)
        local missing = T{}
        local unlock_bit_start = 32

        local zd = nil
		if zone == 275 then zd = warpdata['Outer Ra\'Kaznar [U1]'] end
		if zone == 133 then zd = warpdata['Outer Ra\'Kaznar [U2]'] end
		if zone == 189 then zd = warpdata['Outer Ra\'Kaznar [U3]'] end
        if zd == nil then
            return nil, 'You cannot check missing destinations from here.'
        end

        for d, dd in pairs(zd) do
            if not dd.shortcut and dd.offset then
                if not has_bit(p["Menu Parameters"], unlock_bit_start + dd.offset) then
                    missing:append(z..'-'..d)
                end
            end
        end
        return missing
    end,
    help_text = "[sw] so [warp/w] [all/a/@all] device [letter] or 0-5 -- warp to a designated device in Sortie.\n[sw] so [all/a/@all] port -- warp to the other side of the bitzer.\n[sw] so [all/a/@all] port -- warp to the other side of the gadget.",
    sub_zone_targets =  S{'0','1','2','3','4'}, --We don't want to port to the wrong place due to a systemic anomoly inherent to the programming of superwarp's fuzzyfind system, using any names with letters confuses superwarp and it will try to send you to gadgets from devices or bitzers. 
	auto_select_zone = function(zone)
		if zone == 275 then return 'Outer Ra\'Kaznar [U1]' end
		if zone == 133 then return 'Outer Ra\'Kaznar [U2]' end
		if zone == 189 then return 'Outer Ra\'Kaznar [U3]' end
	end,
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T{}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings

        -- update request
        packet = packets.new('outgoing', 0x016)
        packet["Target Index"] = windower.ffxi.get_player().index
        actions:append(T{packet=packet, description='update request'})

        -- request map
        packet = packets.new('outgoing', 0x114)
        actions:append(T{packet=packet, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='request map'})

        -- menu change
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = 100  -- this first 5B always has an option index of 100
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        actions:append(T{packet=packet, delay=0.2, description='send options'})

        -- request in-zone warp
        packet = packets.new('outgoing', 0x05C)
        packet["Target ID"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["X"] = destination.x
        packet["Y"] = destination.y
        packet["Z"] = destination.z
        packet["_unknown1"] = destination.unknown1  -- this byte and option index of the subsequent 5B tell the server that you legitimately warped and which npc you warped from.
        packet["Rotation"] = destination.h
		packet["_unknown2"] = destination.unknown2
        actions:append(T{packet=packet, wait_packet=0x052, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='same-zone move request'})

        -- complete menu
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = destination.unknown1  -- confirmed post-5C , 5B complete's option index same as destination uk1  -- This byte is key
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=false, delay=1, description='complete menu'})
            
        return actions
    end,

    sub_commands = {
        port = function(current_activity, zone, p, settings,warpdata)
        local actions = T{}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings
		local zone_info = windower.ffxi.get_info().zone

			if (menu >= 1000 and menu <= 1004) then
				notice('Use sw so [0/A/B/C/D] for devices.')
				return
			end
		if (menu >= 1010 and menu <= 1017) then
			if menu == 1010 then
				destination = bitzer_e
			elseif menu == 1011 then
				destination = bitzer_f
			elseif menu == 1012 then
				destination = bitzer_g
			elseif menu == 1013 then
				destination = bitzer_h
			elseif menu == 1014 then
				destination = bitzer_a
			elseif menu == 1015 then
				destination = bitzer_b
			elseif menu == 1016 then
				destination = bitzer_c
			elseif menu == 1017 then
				destination = bitzer_d
			end
			print("Destination Bitzer: "..destination.menu_id.." - "..find_bitzer_by_id)
		 end
			
			-- Gadgets all warp to 'Gadget'
			if (menu >= 1005 and menu <= 1008) or (menu >= 1018 and menu <= 1021) then
				destination = gadget_
				last_gadget_used = menu
				print("Last Gadget Used: "..last_gadget_used)
			end

	
-----------Gadget Handling (Ensures the player can only warp back from whence they came --------------------------
		if menu == 1009 and last_gadget_used ~= nil then
			-- Warp the player back to the specific gadget they came from
			if last_gadget_used == 1005 then
				destination = gadget_a
			elseif last_gadget_used == 1006 then
				destination = gadget_b
			elseif last_gadget_used == 1007 then
				destination = gadget_c
			elseif last_gadget_used == 1008 then
				destination = gadget_d
			elseif last_gadget_used == 1018 then
				destination = gadget_e
			elseif last_gadget_used == 1019 then
				destination = gadget_f
			elseif last_gadget_used == 1020 then
			    destination = gadget_g
	                elseif last_gadget_used == 1021 then    
				destination = gadget_h
			end
		elseif menu == 1009 and last_gadget_used == nil then
			notice('Superwarp does not know where to send you since you did not have it loaded before entering boss chamber')
			return 
		end
			    -- more anti-numbskull mechanisms.
		        if menu == 1009 and destination.menu_id ~= last_gadget_used then  
				notice('Cannot warp to that Gadget, you must return from whence you came; Use '..find_gadget_by_id)
			    return 
		        end
-----------------------------------------------------------------------------------

        -- update request
        packet = packets.new('outgoing', 0x016)
        packet["Target Index"] = windower.ffxi.get_player().index
        actions:append(T{packet=packet, description='update request'})

        -- request map
        packet = packets.new('outgoing', 0x114)
        actions:append(T{packet=packet, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='request map'})

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
        actions:append(T{packet=packet, delay=0.2, description='send options'})

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
        actions:append(T{packet=packet, wait_packet=0x052, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='same-zone move request'})

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
        actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=false, delay=1, description='complete menu'})

        return actions
    end,
	},
    warpdata = T{
		            -- Had a lot of trouble out of the closest-match system with keys so I changed them all to arbitrary numbers. only the devices are needed anyway.
			['Outer Ra\'Kaznar [U1]'] = T{  		
  --[[Device]]  ['0'] =   { menu_id = 1000, index = 817, zone = 275,npc = 21001009, offset = 1, x = -836.00006103516, y = -20, z = -178.00001525879 , h = 0, unknown1 = 1 , unknown2 = 1},
  --[[Device A]]['1'] =   { menu_id = 1001, index = 818, zone = 275,npc = 21001010, offset = 2, x = -460.00003051758, y = 96.000007629395, z = -150 , h = 63, unknown1 = 2  , unknown2 = 1},
  --[[Device B]]['2'] =   { menu_id = 1002, index = 819, zone = 275,npc = 21001011, offset = 3, x = -344.00003051758, y = -20, z = -150 , h = 127, unknown1 = 3 , unknown2 = 1},
  --[[Device C]]['3'] =   { menu_id = 1003, index = 820, zone = 275,npc = 21001012, offset = 4, x = -460.00003051758, y = -136, z = -150 , h = 191, unknown1 = 4 , unknown2 = 1},
  --[[Device D]]['4'] =   { menu_id = 1004, index = 821, zone = 275,npc = 21001013, offset = 5, x = -576, y = -20, z = -150 , h = 0, unknown1 = 5, unknown2 = 1}, 
  --[[Gadget A]]['21'] =  { menu_id = 1005, index = 822, zone = 275,npc = 21001014, offset = 1, x = -900.00006103516, y = 416.00003051758, z = -200.00001525879 , h = 63, unknown1 = 1, unknown2 = 1},
  --[[Gadget B]]['22'] =  { menu_id = 1006, index = 823, zone = 275,npc = 21001015, offset = 2, x = -24.000001907349, y = 420.00003051758, z = -200.00001525879 , h = 127, unknown1 = 2, unknown2 = 1},
  --[[Gadget C]]['23'] =  { menu_id = 1007, index = 824, zone = 275,npc = 21001016, offset = 3, x = -20, y = -456.00003051758, z = -200.00001525879 , h = 191, unknown1 = 3, unknown2 = 1}, 
  --[[Gadget D]]['24'] =  { menu_id = 1008, index = 825, zone = 275,npc = 21001017, offset = 4, x = -896.00006103516, y = -460.00003051758, z = -200.00001525879 , h = 0, unknown1 = 4, unknown2 = 1},
  --[[Gadget]]  ['25'] =  { menu_id = 1009, index = 826, zone = 275,npc = 21001018, offset = 0, x = 624, y = -620, z = 100.00000762939 , h = 0, unknown1 = 1, unknown2 = 1},
  --[[Gadget E]]['26'] =  { menu_id = 1018, index = 827, zone = 275,npc = 21001019, offset = 5, x = 280, y = 276, z = 70 , h = 63, unknown1 = 5, unknown2 = 1}, 
  --[[Gadget F]]['27'] =  { menu_id = 1019, index = 828, zone = 275,npc = 21001020, offset = 6, x = 876.00006103516, y = 280, z = 70 , h = 127, unknown1 = 6, unknown2 = 1},
  --[[Gadget G]]['28'] =  { menu_id = 1020, index = 829, zone = 275,npc = 21001021, offset = 7, x = 880.00006103516, y = -316, z = 70 , h = 191, unknown1 = 7, unknown2 = 1}, 
  --[[Gadget H]]['29'] =  { menu_id = 1021, index = 830, zone = 275,npc = 21001022, offset = 8, x = 284, z = 70, y = -320.00,  h = 0, unknown1 = 8, unknown2 = 1},
  --[[Bitzer A]]['31'] =  { menu_id = 1010, index = 833, zone = 275,npc = 21001025, offset = 1, x = -460.00003051758, z = -140, y = 35.5,  h = 191, unknown1 = 5, unknown2 = 1}, 
  --[[Bitzer B]]['32'] =  { menu_id = 1011, index = 834, zone = 275,npc = 21001026, offset = 2, x = -404.50003051758, z = -140, y = -20,  h = 0, unknown1 = 6, unknown2 = 1},  
  --[[Bitzer C]]['33'] =  { menu_id = 1012, index = 835, zone = 275,npc = 21001027, offset = 3, x = -460.00003051758, y = -75.5, z = -140 , h = 63, unknown1 = 7, unknown2 = 1}, 
  --[[Bitzer D]]['34'] =  { menu_id = 1013, index = 836, zone = 275,npc = 21001028, offset = 4, x = -515.5, z = -140, y = -20,  h = 127, unknown1 = 8, unknown2 = 1},
  --[[Bitzer E]]['35'] =  { menu_id = 1014, index = 837, zone = 275,npc = 21001029, offset = 5, x = 580, y = 31.500001907349, z = 100.00000762939 , h = 191, unknown1 = 1, unknown2 = 1}, 
  --[[Bitzer F]]['36'] =  { menu_id = 1015, index = 838, zone = 275,npc = 21001030, offset = 6, x = 631.5, z = 100.00000762939, y = -20,  h = 0, unknown1 = 2, unknown2 = 1},  
  --[[Bitzer G]]['37'] =  { menu_id = 1016, index = 839, zone = 275,npc = 21001031, offset = 7, x = 580, y = -71.5, z = 100.00000762939 , h = 63, unknown1 = 3, unknown2 = 1}, 
  --[[Bitzer H]]['38'] =  { menu_id = 1017, index = 840, zone = 275,npc = 21001032, offset = 8, x = 528.5, z = 100.00000762939, y = -20,  h = 127, unknown1 = 4, unknown2 = 1},
		},
		['Outer Ra\'Kaznar [U2]'] = T{
   --[[Device]]  ['0'] =   { menu_id = 1000, index = 817, zone = 133,npc = 21001009, offset = 1, x = -836.00006103516, y = -20, z = -178.00001525879 , h = 0, unknown1 = 1 , unknown2 = 1},
   --[[Device A]]['1'] =   { menu_id = 1001, index = 818, zone = 133,npc = 21001010, offset = 2, x = -460.00003051758, y = 96.000007629395, z = -150 , h = 63, unknown1 = 2  , unknown2 = 1},
   --[[Device B]]['2'] =   { menu_id = 1002, index = 819, zone = 133,npc = 21001011, offset = 3, x = -344.00003051758, y = -20, z = -150 , h = 127, unknown1 = 3 , unknown2 = 1},
   --[[Device C]]['3'] =   { menu_id = 1003, index = 820, zone = 133,npc = 21001012, offset = 4, x = -460.00003051758, y = -136, z = -150 , h = 191, unknown1 = 4 , unknown2 = 1},
   --[[Device D]]['4'] =   { menu_id = 1004, index = 821, zone = 133,npc = 21001013, offset = 5, x = -576, y = -20, z = -150 , h = 0, unknown1 = 5, unknown2 = 1}, 
   --[[Gadget A]]['38'] =  { menu_id = 1005, index = 822, zone = 133,npc = 21001014, offset = 1, x = -900.00006103516, y = 416.00003051758, z = -200.00001525879 , h = 63, unknown1 = 1, unknown2 = 1},
   --[[Gadget B]]['37'] =  { menu_id = 1006, index = 823, zone = 133,npc = 21001015, offset = 2, x = -24.000001907349, y = 420.00003051758, z = -200.00001525879 , h = 127, unknown1 = 2, unknown2 = 1},
   --[[Gadget C]]['36'] =  { menu_id = 1007, index = 824, zone = 133,npc = 21001016, offset = 3, x = -20, y = -456.00003051758, z = -200.00001525879 , h = 191, unknown1 = 3, unknown2 = 1}, 
   --[[Gadget D]]['35'] =  { menu_id = 1008, index = 825, zone = 133,npc = 21001017, offset = 4, x = -896.00006103516, y = -460.00003051758, z = -200.00001525879 , h = 0, unknown1 = 4, unknown2 = 1},
   --[[Gadget]]  ['38'] =  { menu_id = 1009, index = 826, zone = 133,npc = 21001018, offset = 0, x = 624, y = -620, z = 100.00000762939 , h = 0, unknown1 = 1, unknown2 = 1},
   --[[Gadget E]]['33'] =  { menu_id = 1018, index = 827, zone = 133,npc = 21001019, offset = 5, x = 280, y = 276, z = 70 , h = 63, unknown1 = 5, unknown2 = 1}, 
   --[[Gadget F]]['32'] =  { menu_id = 1019, index = 828, zone = 133,npc = 21001020, offset = 6, x = 876.00006103516, y = 280, z = 70 , h = 127, unknown1 = 6, unknown2 = 1},
   --[[Gadget G]]['31'] =  { menu_id = 1020, index = 829, zone = 133,npc = 21001021, offset = 7, x = 880.00006103516, y = -316, z = 70 , h = 191, unknown1 = 7, unknown2 = 1}, 
   --[[Gadget H]]['29'] =  { menu_id = 1021, index = 830, zone = 133,npc = 21001022, offset = 8, x = 284, z = 70, y = -320.00,  h = 0, unknown1 = 8, unknown2 = 1},
   --[[Bitzer A]]['28'] =  { menu_id = 1010, index = 833, zone = 133,npc = 21001025, offset = 1, x = -460.00003051758, z = -140, y = 35.5,  h = 191, unknown1 = 5, unknown2 = 1}, 
   --[[Bitzer B]]['27'] =  { menu_id = 1011, index = 834, zone = 133,npc = 21001026, offset = 2, x = -404.50003051758, z = -140, y = -20,  h = 0, unknown1 = 6, unknown2 = 1},  
   --[[Bitzer C]]['26'] =  { menu_id = 1012, index = 835, zone = 133,npc = 21001027, offset = 3, x = -460.00003051758, y = -75.5, z = -140 , h = 63, unknown1 = 7, unknown2 = 1}, 
   --[[Bitzer D]]['25'] =  { menu_id = 1013, index = 836, zone = 133,npc = 21001028, offset = 4, x = -515.5, z = -140, y = -20,  h = 127, unknown1 = 8, unknown2 = 1},
   --[[Bitzer E]]['24'] =  { menu_id = 1014, index = 837, zone = 133,npc = 21001029, offset = 5, x = 580, y = 31.500001907349, z = 100.00000762939 , h = 191, unknown1 = 1, unknown2 = 1}, 
   --[[Bitzer F]]['23'] =  { menu_id = 1015, index = 838, zone = 133,npc = 21001030, offset = 6, x = 631.5, z = 100.00000762939, y = -20,  h = 0, unknown1 = 2, unknown2 = 1},  
   --[[Bitzer G]]['22'] =  { menu_id = 1016, index = 839, zone = 133,npc = 21001031, offset = 7, x = 580, y = -71.5, z = 100.00000762939 , h = 63, unknown1 = 3, unknown2 = 1}, 
   --[[Bitzer H]]['21'] =  { menu_id = 1017, index = 840, zone = 133,npc = 21001032, offset = 8, x = 528.5, z = 100.00000762939, y = -20,  h = 127, unknown1 = 4, unknown2 = 1},
		},
		['Outer Ra\'Kaznar [U3]'] = T{
   --[[Device]]  ['0']  =  { menu_id = 1000, index = 817, zone = 189,npc = 21001009, offset = 1, x = -836.00006103516, y = -20, z = -178.00001525879 , h = 0, unknown1 = 1 , unknown2 = 1},
   --[[Device A]]['1']  =  { menu_id = 1001, index = 818, zone = 189,npc = 21001010, offset = 2, x = -460.00003051758, y = 96.000007629395, z = -150 , h = 63, unknown1 = 2  , unknown2 = 1},
   --[[Device B]]['2']  =  { menu_id = 1002, index = 819, zone = 189,npc = 21001011, offset = 3, x = -344.00003051758, y = -20, z = -150 , h = 127, unknown1 = 3 , unknown2 = 1},
   --[[Device C]]['3']  =  { menu_id = 1003, index = 820, zone = 189,npc = 21001012, offset = 4, x = -460.00003051758, y = -136, z = -150 , h = 191, unknown1 = 4 , unknown2 = 1},
   --[[Device D]]['4']  =  { menu_id = 1004, index = 821, zone = 189,npc = 21001013, offset = 5, x = -576, y = -20, z = -150 , h = 0, unknown1 = 5, unknown2 = 1}, 
   --[[Gadget A]]['37'] =  { menu_id = 1005, index = 822, zone = 189,npc = 21001014, offset = 1, x = -900.00006103516, y = 416.00003051758, z = -200.00001525879 , h = 63, unknown1 = 1, unknown2 = 1},
   --[[Gadget B]]['36'] =  { menu_id = 1006, index = 823, zone = 189,npc = 21001015, offset = 2, x = -24.000001907349, y = 420.00003051758, z = -200.00001525879 , h = 127, unknown1 = 2, unknown2 = 1},
   --[[Gadget C]]['35'] =  { menu_id = 1007, index = 824, zone = 189,npc = 21001016, offset = 3, x = -20, y = -456.00003051758, z = -200.00001525879 , h = 191, unknown1 = 3, unknown2 = 1}, 
   --[[Gadget D]]['34'] =  { menu_id = 1008, index = 825, zone = 189,npc = 21001017, offset = 4, x = -896.00006103516, y = -460.00003051758, z = -200.00001525879 , h = 0, unknown1 = 4, unknown2 = 1},
   --[[Gadget]]  ['33'] =  { menu_id = 1009, index = 826, zone = 189,npc = 21001018, offset = 0, x = 624, y = -620, z = 100.00000762939 , h = 0, unknown1 = 1, unknown2 = 1},
   --[[Gadget E]]['32'] =  { menu_id = 1018, index = 827, zone = 189,npc = 21001019, offset = 5, x = 280, y = 276, z = 70 , h = 63, unknown1 = 5, unknown2 = 1},  
   --[[Gadget F]]['31'] =  { menu_id = 1019, index = 828, zone = 189,npc = 21001020, offset = 6, x = 876.00006103516, y = 280, z = 70 , h = 127, unknown1 = 6, unknown2 = 1},
   --[[Gadget G]]['29'] =  { menu_id = 1020, index = 829, zone = 189,npc = 21001021, offset = 7, x = 880.00006103516, y = -316, z = 70 , h = 191, unknown1 = 7, unknown2 = 1}, 
   --[[Gadget H]]['28'] =  { menu_id = 1021, index = 830, zone = 189,npc = 21001022, offset = 8, x = 284, z = 70, y = -320.00,  h = 0, unknown1 = 8, unknown2 = 1},
   --[[Bitzer A]]['26'] =  { menu_id = 1010, index = 833, zone = 189,npc = 21001025, offset = 1, x = -460.00003051758, z = -140, y = 35.5,  h = 191, unknown1 = 5, unknown2 = 1}, 
   --[[Bitzer B]]['27'] =  { menu_id = 1011, index = 834, zone = 189,npc = 21001026, offset = 2, x = -404.50003051758, z = -140, y = -20,  h = 0, unknown1 = 6, unknown2 = 1},  
   --[[Bitzer C]]['25'] =  { menu_id = 1012, index = 835, zone = 189,npc = 21001027, offset = 3, x = -460.00003051758, y = -75.5, z = -140 , h = 63, unknown1 = 7, unknown2 = 1}, 
   --[[Bitzer D]]['24'] =  { menu_id = 1013, index = 836, zone = 189,npc = 21001028, offset = 4, x = -515.5, z = -140, y = -20,  h = 127, unknown1 = 8, unknown2 = 1},
   --[[Bitzer E]]['23'] =  { menu_id = 1014, index = 837, zone = 189,npc = 21001029, offset = 5, x = 580, y = 31.500001907349, z = 100.00000762939 , h = 191, unknown1 = 1, unknown2 = 1}, 
   --[[Bitzer F]]['22'] =  { menu_id = 1015, index = 838, zone = 189,npc = 21001030, offset = 6, x = 631.5, z = 100.00000762939, y = -20,  h = 0, unknown1 = 2, unknown2 = 1},  
   --[[Bitzer G]]['21'] =  { menu_id = 1016, index = 839, zone = 189,npc = 21001031, offset = 7, x = 580, y = -71.5, z = 100.00000762939 , h = 63, unknown1 = 3, unknown2 = 1}, 
   --[[Bitzer H]]['44'] =  { menu_id = 1017, index = 840, zone = 189,npc = 21001032, offset = 8, x = 528.5, z = 100.00000762939, y = -20,  h = 127, unknown1 = 4, unknown2 = 1},
		},
    },
}
