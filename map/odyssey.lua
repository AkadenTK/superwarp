local entry_zones = S {247}
local odyssey_zones = S {298,279}
local npc_names = T{
    exit = S{'Otherworldly Vortex'},
    port = S{'Veridical Conflux'},
    warp = S{'Translocator'},
}
--88888888888888888888888888888888888888888888888888888888888888888888888888888-----destinations-----888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888-
	zone_tag = windower.ffxi.get_info().zone
Sheol_A = {
   ['translocator_1'] = { display_name = 'Translocator #1', menu_id = 1020, index = 562, zone = zone_tag,npc = 20951602, npc2 = 20955698, offset = 0, x = 160, y = 156, z = 59.500003814697 , h = 63, unknown1 = 1  , unknown2 = 1}, 
   ['translocator_2'] = { display_name = 'Translocator #2', menu_id = 1021, index = 563, zone = zone_tag,npc = 20951603, npc2 = 20955699, offset = 1, x = 332.00003051758, y = -600, z = -0.5 , h = 127, unknown1 = 2 , unknown2 = 1}, 
   ['translocator_3'] = { display_name = 'Translocator #3', menu_id = 1022, index = 564, zone = zone_tag,npc = 20951604, npc2 = 20955700, offset = 2, x = -420.00003051758, y = -218.00001525879, z = 19.5 , h = 191, unknown1 = 3 , unknown2 = 1},
   ['conflux_1']      = { display_name = 'Conflux #1', menu_id = 1000, index = 565, zone = zone_tag,npc = 20951605, npc2 = 20955701, offset = 1, x = 166.00001525879, z = 30.000001907349, y = 220.00001525879,  h = 0, unknown1 = 2, unknown2 = 1},
   ['conflux_2']      = { display_name = 'Conflux #2', menu_id = 1001, index = 566, zone = zone_tag,npc = 20951606, npc2 = 20955702, offset = 2, x = -86.000007629395, z = 0, y = -660.00006103516,  h = 127, unknown1 = 1, unknown2 = 1},
   ['conflux_3']      = { display_name = 'Conflux #3', menu_id = 1002, index = 567, zone = zone_tag,npc = 20951607, npc2 = 20955703, offset = 3, x = -220.00001525879, y = -446.00003051758, z = 0, h = 63, unknown1 = 4, unknown2 = 1},
   ['conflux_4']      = { display_name = 'Conflux #4', menu_id = 1003, index = 568, zone = zone_tag,npc = 20951608, npc2 = 20955704, offset = 4, x = 260, z = 0, y = -674.00006103516,  h = 191, unknown1 = 3, unknown2 = 1},
   ['conflux_5']      = { display_name = 'Conflux #5', menu_id = 1004, index = 569, zone = zone_tag,npc = 20951609, npc2 = 20955705, offset = 5, x = 380.00003051758, y = -606, z = 18 , h = 63, unknown1 = 6, unknown2 = 1},
   ['conflux_6']      = { display_name = 'Conflux #6', menu_id = 1005, index = 570, zone = zone_tag,npc = 20951610, npc2 = 20955706, offset = 6, x = -140, z = 6.0000004768372, y = -274,  h = 191, unknown1 = 5, unknown2 = 1},
   ['conflux_7']      = { display_name = 'Conflux #7', menu_id = 1006, index = 571, zone = zone_tag,npc = 20951611, npc2 = 20955707, offset = 7, x = -46.000003814697, y = -300, z = 24.000001907349, h = 127, unknown1 = 8, unknown2 = 1},
   ['conflux_8']      = { display_name = 'Conflux #8', menu_id = 1007, index = 572, zone = zone_tag,npc = 20951612, npc2 = 20955708, offset = 8, x = -474.00003051758, z = 14.000000953674, y = -20,  h = 0, unknown1 = 7, unknown2 = 1},
   ['conflux_9']      = { display_name = 'Conflux #9', menu_id = 1008, index = 573, zone = zone_tag,npc = 20951613, npc2 = 20955709, offset = 9, x = -366.00003051758, y = -20, z = 14.000000953674, h = 127, unknown1 = 10, unknown2 = 1},
   ['conflux_10']     = { display_name = 'Conflux #10', menu_id = 1009, index = 574, zone = zone_tag,npc = 20951614, npc2 = 20955710, offset = 10, x = -634, z = 0, y = 620,  h = 0, unknown1 = 9, unknown2 = 1},
   ['conflux_11']     = { display_name = 'Conflux #11', menu_id = 1010, index = 575, zone = zone_tag,npc = 20951615, npc2 = 20955711, offset = 11, x = -526, y = 700.00006103516, z = 18 , h = 127, unknown1 = 12, unknown2 = 1},
   ['conflux_12']     = { display_name = 'Conflux #12', menu_id = 1011, index = 576, zone = zone_tag,npc = 20951616, npc2 = 20955712, offset = 12, x = -314, z = 0, y = 580,  h = 0, unknown1 = 11, unknown2 = 1},
}
Sheol_B = {                                                        -- [P1] and [P2] , annoyingly, have different target ids  
   ['translocator_1'] = {display_name = 'Translocator #1', menu_id = 1020, index = 665, zone = zone_tag,npc = 20959897, npc2 = 20963993, offset = 0, x = 680.00006103516, y = -788.00006103516, z = 36 , h = 191, unknown1 = 1  , unknown2 = 1},
   ['translocator_2'] = {display_name = 'Translocator #2', menu_id = 1021, index = 666, zone = zone_tag,npc = 20959898, npc2 = 20963994, offset = 1, x = 212.00001525879, y = 560, z = 17.5 , h = 0, unknown1 = 2 , unknown2 = 1},
   ['translocator_3'] = {display_name = 'Translocator #3', menu_id = 1022, index = 667, zone = zone_tag,npc = 20959899, npc2 = 20963995, offset = 2, x = -552, y = 320, z = -0.5 , h = 127, unknown1 = 3 , unknown2 = 1},
   ['conflux_1']      = {display_name = 'Conflux #1', menu_id = 1000, index = 668, zone = zone_tag,npc = 20959900, npc2 = 20963996, offset = 1, x = 700.00006103516, z = 54.000003814697, y = -644.00006103516,  h = 63, unknown1 = 2, unknown2 = 1},
   ['conflux_2']      = {display_name = 'Conflux #2', menu_id = 1001, index = 669, zone = zone_tag,npc = 20959901, npc2 = 20963997, offset = 2, x = -700.00006103516, z = 12.000000953674, y = -756.00006103516,  h = 191, unknown1 = 1, unknown2 = 1},
   ['conflux_3']      = {display_name = 'Conflux #3', menu_id = 1002, index = 670, zone = zone_tag,npc = 20959902, npc2 = 20963998, offset = 3, x = -620, y = -644.00006103516, z = 6.0000004768372 , h = 63, unknown1 = 4, unknown2 = 1},
   ['conflux_4']      = {display_name = 'Conflux #4', menu_id = 1003, index = 671, zone = zone_tag,npc = 20959903, npc2 = 20963999, offset = 4, x = 180.0000152879, z = 54.000003814697, y = 644.00006103516,  h = 191, unknown1 = 3, unknown2 = 1},
   ['conflux_5']      = {display_name = 'Conflux #5', menu_id = 1004, index = 672, zone = zone_tag,npc = 20959904, npc2 = 20964000, offset = 5, x = 396.00003051758, y = 740.00006103516, z = 72 , h = 127, unknown1 = 6, unknown2 = 1},
   ['conflux_6']      = {display_name = 'Conflux #6', menu_id = 1005, index = 673, zone = zone_tag,npc = 20959905, npc2 = 20964001, offset = 6, x = 524, z = 17.5, y = 700.00006103516,  h = 0, unknown1 = 5, unknown2 = 1},
   ['conflux_7']      = {display_name = 'Conflux #7', menu_id = 1006, index = 674, zone = zone_tag,npc = 20959906, npc2 = 20964002, offset = 7, x = 756.00006103516, y = 540, z = 17.5 , h = 127, unknown1 = 8, unknown2 = 1},
   ['conflux_8']      = {display_name = 'Conflux #8', menu_id = 1007, index = 675, zone = zone_tag,npc = 20959907, npc2 = 20964003, offset = 8, x = 284, z = 107.50000762939, y = -100.00000762939,  h = 0, unknown1 = 7, unknown2 = 1},
   ['conflux_9']      = {display_name = 'Conflux #9', menu_id = 1008, index = 676, zone = zone_tag,npc = 20959908, npc2 = 20964004, offset = 9, x = 140, y = -284, z = 17.5 , h = 63, unknown1 = 10, unknown2 = 1},
   ['conflux_10']     = {display_name = 'Conflux #10', menu_id = 1009, index = 677, zone = zone_tag,npc = 20959909, npc2 = 20964005, offset = 10, x = -500.00003051758, z = 35.5, y = 204.00001525879,  h = 191, unknown1 = 9, unknown2 = 1},
}
Sheol_C = {
   ['translocator_1'] = {display_name = 'Translocator #1', menu_id = 1020, index = 564, zone = zone_tag,npc = 20967988, npc2 = 20972084, offset = 0, x = 526, y = 234.00001525879, z = 59.500003814697 , h = 31, unknown1 = 1  , unknown2 = 1},
   ['translocator_2'] = {display_name = 'Translocator #2', menu_id = 1021, index = 565, zone = zone_tag,npc = 20967989, npc2 = 20972085, offset = 1, x = -700.00006103516, y = -338.00003051758, z = -18.10000038147 , h = 63, unknown1 = 2 , unknown2 = 1},
   ['conflux_1']      = {display_name = 'Conflux #1',      menu_id = 1000, index = 566, zone = zone_tag,npc = 20967990, npc2 = 20972086, offset = 1, x = 630, z = -0.5, y = 340.00003051758,  h = 127, unknown1 = 2, unknown2 = 1},
   ['conflux_2']      = {display_name = 'Conflux #2',      menu_id = 1001, index = 567, zone = zone_tag,npc = 20967991, npc2 = 20972087, offset = 2, x = -750.00006103516, z = 0.5, y = -420.00003051758,  h = 0, unknown1 = 1, unknown2 = 1},
   ['conflux_3']      = {display_name = 'Conflux #3',      menu_id = 1002, index = 568, zone = zone_tag,npc = 20967992, npc2 = 20972088, offset = 3, x = -650.00006103516, y = -420.00003051758, z = -0.10000000149012 , h = 127, unknown1 = 4, unknown2 = 1},
   ['conflux_4']      = {display_name = 'Conflux #4',      menu_id = 1003, index = 569, zone = zone_tag,npc = 20967993, npc2 = 20972089, offset = 4, x = 650, z = 35.5, y = -140,  h = 0, unknown1 = 3, unknown2 = 1},
   ['conflux_5']      = {display_name = 'Conflux #5',      menu_id = 1004, index = 570, zone = zone_tag,npc = 20967994, npc2 = 20972090, offset = 5, x = 670.00006103516, y = -260, z = 35.5 , h = 127, unknown1 = 6, unknown2 = 1},
   ['conflux_6']      = {display_name = 'Conflux #6',      menu_id = 1005, index = 571, zone = zone_tag,npc = 20967995, npc2 = 20972091, offset = 6, x = -350.00003051758, z = 23.500001907349, y = 180.00001525879,  h = 0, unknown1 = 5, unknown2 = 1}
}
--88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888-

-- Categorize NPCs to prevent warping between different NPC types
conflux_menu_ids = T {1000,1001,1002,1003,1004,1005,1006,1007,1008,1009,1010,1011}
translocator_menu_ids = T {1020,1021,1022}

local function table_contains(t, value)
    for _, v in pairs(t) do
        if v == value then
            return true
        end
    end
    return false
end

return T {
    short_name = 'od',
    long_name = 'odyssey',
    --move_in_zone = true,
    npc_plural = 'Odyssey NPCs',
    npc_names = npc_names,
    ----------------------------------------------------------------------------------------------

    ------------------------------------------------------------------------------------
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
    validate = function(menu_id, zone, current_activity, p)
        local destination = current_activity.activity_settings
        zone_tag = windower.ffxi.get_info().zone
		local npc = p["NPC"]
		if npc == nil then
			return 'Please update your superwarp.lua file to the latest version for Odyssey support'
		end
		if npc == 20975716 or npc == 20979812 then
			return 'You cannot use superwarp in Gaol!'
		end
if current_activity.sub_cmd ~= 'exit' then
        -- Destination setters
        --------------------------------------------------------------------------------------------------------------------------------------------
		       --(Sheol C Confluxes)
    if ((npc >= 20967990 and npc <= 20967995) or (npc >= 20972086 and npc <= 20972091)) then
        if menu_id == 1000 then
            destination = Sheol_C['conflux_2']
        elseif menu_id == 1001 then
            destination = Sheol_C['conflux_1']
        elseif menu_id == 1002 then
            destination = Sheol_C['conflux_4']
        elseif menu_id == 1003 then
            destination = Sheol_C['conflux_3']
        elseif menu_id == 1004 then
            destination = Sheol_C['conflux_6']
        elseif menu_id == 1005 then
            destination = Sheol_C['conflux_5']
        end      --(Sheol B Confluxes)
    elseif ((npc >= 20959900 and npc <= 20959909) or (npc >= 20963996 and npc <= 20964005)) then
        if menu_id == 1000 then
            destination = Sheol_B['conflux_2']
        elseif menu_id == 1001 then
            destination = Sheol_B['conflux_1']
        elseif menu_id == 1002 then
            destination = Sheol_B['conflux_4']
        elseif menu_id == 1003 then
            destination = Sheol_B['conflux_3']
        elseif menu_id == 1004 then
            destination = Sheol_B['conflux_6']
        elseif menu_id == 1005 then
            destination = Sheol_B['conflux_5']
        elseif menu_id == 1006 then
            destination = Sheol_B['conflux_8']
        elseif menu_id == 1007 then
            destination = Sheol_B['conflux_7']
        elseif menu_id == 1008 then
            destination = Sheol_B['conflux_10']
        elseif menu_id == 1009 then
            destination = Sheol_B['conflux_9']
        end       --(Sheol A Confluxes)
    elseif ((npc >= 20951605 and npc <= 20951616) or (npc >= 20955701 and npc <= 20955712)) then
        if menu_id == 1000 then
            destination = Sheol_A['conflux_2']
        elseif menu_id == 1001 then
            destination = Sheol_A['conflux_1']
        elseif menu_id == 1002 then
            destination = Sheol_A['conflux_4']
        elseif menu_id == 1003 then
            destination = Sheol_A['conflux_3']
        elseif menu_id == 1004 then
            destination = Sheol_A['conflux_6']
        elseif menu_id == 1005 then
            destination = Sheol_A['conflux_5']
        elseif menu_id == 1006 then
            destination = Sheol_A['conflux_8']
        elseif menu_id == 1007 then
            destination = Sheol_A['conflux_7']
        elseif menu_id == 1008 then
            destination = Sheol_A['conflux_10']
        elseif menu_id == 1009 then
            destination = Sheol_A['conflux_9']
        elseif menu_id == 1010 then
            destination = Sheol_A['conflux_12']
        elseif menu_id == 1011 then
            destination = Sheol_A['conflux_11']
        end
    end            --Translocators
----------------------------------------------------------------------------
	               --(Sheol_C)
----------------------------------------------------------------------------
    if (npc == 20967988 or npc == 20967989 or npc == 20972084 or npc == 20972085) then
        if menu_id == 1020 then
            destination = Sheol_C['translocator_2']
        elseif menu_id == 1021 then
            destination = Sheol_C['translocator_1']
        elseif (menu_id == 1020 or menu_id == 1021) and destination.menu_id == 1022 then 
            return 'There is no Translocator 3 in Sheol C...'         -- stymie attempts to warp to a non-existent C #3
        end        --(Sheol_B)
----------------------------------------------------------------------------
    elseif ((npc >= 20959897 and npc <= 20959899) or (npc >= 20963993 and npc <= 20963995)) then
        if menu_id == 1020 then
		    if destination.menu_id == 1021 then
                destination = Sheol_B['translocator_2']
			elseif destination.menu_id == 1022 then
			    destination = Sheol_B['translocator_3']
			end
        elseif menu_id == 1021 then
		    if destination.menu_id == 1020 then
                destination = Sheol_B['translocator_1']
			elseif destination.menu_id == 1022 then
			    destination = Sheol_B['translocator_3']
			end
        elseif menu_id == 1022 then
		    if destination.menu_id == 1020 then
                destination = Sheol_B['translocator_1']
			elseif destination.menu_id == 1021 then
			    destination = Sheol_B['translocator_2']
			end
		end
		          --(Sheol_A)
----------------------------------------------------------------------------
    elseif ((npc >= 20951602 and npc <= 20951604) or (npc >= 20955698 and npc <= 20955700)) then
        if menu_id == 1020 then
		    if destination.menu_id == 1021 then
                destination = Sheol_A['translocator_2']
			elseif destination.menu_id == 1022 then
			    destination = Sheol_A['translocator_3']
			end
        elseif menu_id == 1021 then
		    if destination.menu_id == 1020 then
                destination = Sheol_A['translocator_1']
			elseif destination.menu_id == 1022 then
			    destination = Sheol_A['translocator_3']
			end
        elseif menu_id == 1022 then
		    if destination.menu_id == 1020 then
                destination = Sheol_A['translocator_1']
			elseif destination.menu_id == 1021 then
			    destination = Sheol_A['translocator_2']
			end
		end
    end  
			destination.zone = zone_tag
        -------------------------------------------------------------------
        if not  -- NPCs:
        ((menu_id >= 1000 and menu_id <= 1011) or (menu_id >= 1020 and menu_id <= 1022))  then 
            return "Incorrect menu detected! Not an Odyssey warp!"
        end
        -- prevent warping to translocators from confluxs
        --------------------------------------------------------------------------------------------------
        if (menu_id >= 1000 and menu_id <= 1011) and not table_contains(conflux_menu_ids, destination.menu_id) then
            return 'Cannot warp to translocators from here.'
        end
        -- prevent warping to confluxs from translocators
        ---------------------------------------------------------------------------------------------------
        if (menu_id >= 1020 and menu_id <= 1022) and not table_contains(translocator_menu_ids, destination.menu_id) then
            return 'Cannot warp to confluxs from here.'
        end
        -- extra layer of protection for stopping any cross-zone warp
        ---------------------------------------------------------------------------------------------------
        if zone ~= destination.zone then           -- Safety first~
            return "Wrong Zone!"
        end
        ------------------------------------------------------------------------------------------------------------------
        if not odyssey_zones:contains(zone) then   -- These are not the droids you're looking for
            return 'Not in a odyssey zone!'
        end
        if menu_id == destination.menu_id then      -- Don't mess around and find out.
            return "You're already at that location"
        end
end
        return nil
    end,
    help_text = "|Odyssey| - [sw] od [warp/w] [all/a/@all] (1-3) -- warp between translocators in odyssey.\n[sw] od [all/a/@all] port -- warp to the other side of Veridical Confluxes.\n[sw] od [all/a/@all] exit -- Exits Odyssey (This does give the 25% touch bonus 100% of the time.)\n-----------------------------",
    sub_zone_targets = S {'1','2','3'},
    auto_select_zone = function(zone)
        if zone == 298 then
            return 'Walk of Echoes [P1]'
        end
        if zone == 279 then
            return 'Walk of Echoes [P2]'
        end
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T {}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
		local destination = nil
		zone_tag = windower.ffxi.get_info().zone
		    -- Ensure we go to the correct Sheol's translocator.
------------------------------------------------------------------------------------------
            --Translocators
----------------------------------------------------------------------------
	               --(Sheol_C)
----------------------------------------------------------------------------
    if (npc.id == 20967988 or npc.id == 20967989 or npc.id == 20972084 or npc.id == 20972085) then
        if menu == 1020 then
            destination = Sheol_C['translocator_2']
        elseif menu == 1021 then
            destination = Sheol_C['translocator_1']
        end        --(Sheol_B)
----------------------------------------------------------------------------
    elseif ((npc.id >= 20959897 and npc.id <= 20959899) or (npc.id >= 20963993 and npc.id <= 20963995)) then
        if menu == 1020 then
		    if current_activity.activity_settings.menu_id == 1021 then
                destination = Sheol_B['translocator_2']
			elseif current_activity.activity_settings.menu_id == 1022 then
			    destination = Sheol_B['translocator_3']
			end
        elseif menu == 1021 then
		    if current_activity.activity_settings.menu_id == 1020 then
                destination = Sheol_B['translocator_1']
			elseif current_activity.activity_settings.menu_id == 1022 then
			    destination = Sheol_B['translocator_3']
			end
        elseif menu == 1022 then
		    if current_activity.activity_settings.menu_id == 1020 then
                destination = Sheol_B['translocator_1']
			elseif current_activity.activity_settings.menu_id == 1021 then
			    destination = Sheol_B['translocator_2']
			end
		end
		          --(Sheol_A)
----------------------------------------------------------------------------
    elseif ((npc.id >= 20951602 and npc.id <= 20951604) or (npc.id >= 20955698 and npc.id <= 20955700)) then
        if menu == 1020 then
		    if current_activity.activity_settings.menu_id == 1021 then
                destination = Sheol_A['translocator_2']
			elseif current_activity.activity_settings.menu_id == 1022 then
			    destination = Sheol_A['translocator_3']
			end
        elseif menu == 1021 then
		    if current_activity.activity_settings.menu_id == 1020 then
                destination = Sheol_A['translocator_1']
			elseif current_activity.activity_settings.menu_id == 1022 then
			    destination = Sheol_A['translocator_3']
			end
        elseif menu == 1022 then
		    if current_activity.activity_settings.menu_id == 1020 then
                destination = Sheol_A['translocator_1']
			elseif current_activity.activity_settings.menu_id == 1021 then
			    destination = Sheol_A['translocator_2']
			end
		end
    end  
	destination.zone = zone_tag
------------------------------------------------------------------------------------------
	            -- Unlock checker
----------------------------------------------------------------------------------------------------------------------------------------
        local unlock_bit_start = 32

        local destination_unlocked = true
        if destination.offset ~= nil then
            destination_unlocked = not has_bit(p["Menu Parameters"], unlock_bit_start + destination.offset) 
        end
        debug('Translocator is unlocked: '..tostring(destination_unlocked))
        if not destination_unlocked then
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 16384
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, description='cancel menu', message='Destination Portal is not unlocked yet!'})
            return actions
        end
----------------------------------------------------------------------------------------------------------------------------------------
		    packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
				wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
				--delay = 0.2,
                description = 'update request'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["X"] = destination.x
            packet["Z"] = destination.z
            packet["Y"] = destination.y
            packet["Target ID"] = npc.id
            packet["_unknown1"] = destination.unknown1
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            packet["Target Index"] = npc.index
            packet["_unknown2"] = destination.unknown2
            packet["Rotation"] = destination.h
            actions:append(T {
                packet = packet,
                --wait_packet = 0x052, -- according to my investigation, this prevents warps from working in odyssey on account of the shoddy server response in there.
				-- furthermore the timing of the post-5C--5B should be consistently 1.5 seconds.
                wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T {
                packet = packet,
                expecting_zone = false,
                delay = 1.5,
                description = 'complete menu'
            })
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
				delay = 0.2,
                description = 'update request'
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
            zone_tag = windower.ffxi.get_info().zone

            if (menu >= 1020 and menu <= 1022) then
                notice('Use sw od [1/2/3] for translocators.')
                return
            end
			    -- Destination setters
        --------------------------------------------------------------------------------------------------------------------------------------------
    if ((npc.id >= 20967990 and npc.id <= 20967995) or (npc.id >= 20972086 and npc.id <= 20972091)) then
        if menu == 1000 then
            destination = Sheol_C['conflux_2']
        elseif menu == 1001 then
            destination = Sheol_C['conflux_1']
        elseif menu == 1002 then
            destination = Sheol_C['conflux_4']
        elseif menu == 1003 then
            destination = Sheol_C['conflux_3']
        elseif menu == 1004 then
            destination = Sheol_C['conflux_6']
        elseif menu == 1005 then
            destination = Sheol_C['conflux_5']
        end
    elseif ((npc.id >= 20959900 and npc.id <= 20959909) or (npc.id >= 20963996 and npc.id <= 20964005)) then
        if menu == 1000 then
            destination = Sheol_B['conflux_2']
        elseif menu == 1001 then
            destination = Sheol_B['conflux_1']
        elseif menu == 1002 then
            destination = Sheol_B['conflux_4']
        elseif menu == 1003 then
            destination = Sheol_B['conflux_3']
        elseif menu == 1004 then
            destination = Sheol_B['conflux_6']
        elseif menu == 1005 then
            destination = Sheol_B['conflux_5']
        elseif menu == 1006 then
            destination = Sheol_B['conflux_8']
        elseif menu == 1007 then
            destination = Sheol_B['conflux_7']
        elseif menu == 1008 then
            destination = Sheol_B['conflux_10']
        elseif menu == 1009 then
            destination = Sheol_B['conflux_9']
        end
    elseif ((npc.id >= 20951605 and npc.id <= 20951616) or (npc.id >= 20955701 and npc.id <= 20955712)) then
        if menu == 1000 then
            destination = Sheol_A['conflux_2']
        elseif menu == 1001 then
            destination = Sheol_A['conflux_1']
        elseif menu == 1002 then
            destination = Sheol_A['conflux_4']
        elseif menu == 1003 then
            destination = Sheol_A['conflux_3']
        elseif menu == 1004 then
            destination = Sheol_A['conflux_6']
        elseif menu == 1005 then
            destination = Sheol_A['conflux_5']
        elseif menu == 1006 then
            destination = Sheol_A['conflux_8']
        elseif menu == 1007 then
            destination = Sheol_A['conflux_7']
        elseif menu == 1008 then
            destination = Sheol_A['conflux_10']
        elseif menu == 1009 then
            destination = Sheol_A['conflux_9']
        elseif menu == 1010 then
            destination = Sheol_A['conflux_12']
        elseif menu == 1011 then
            destination = Sheol_A['conflux_11']
        end
    end
	destination.zone = zone_tag
            -----------------------------------------------------------------------------------
	        log('Warping via ' .. npc.name .. ' to '..destination.display_name..'.')
	        -----------------------------------------------------------------------------------
		    packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
				wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'update request'
            })

            -- request in-zone warp
            packet = packets.new('outgoing', 0x05C)
            packet["X"] = destination.x
            packet["Z"] = destination.z
            packet["Y"] = destination.y
            packet["Target ID"] = npc.id
            packet["_unknown1"] = destination.unknown1
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            packet["Target Index"] = npc.index
            packet["_unknown2"] = destination.unknown2
            packet["Rotation"] = destination.h
            actions:append(T {
                packet = packet,
                wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'same-zone move request'
            })

            -- complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = destination.unknown1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T {
                packet = packet,
                expecting_zone = false,
                delay = 1.5,
                description = 'complete menu'
            })
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
				delay = 0.2,
                description = 'update request'
            })
            return actions
        end,
        exit = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc

            log("Leaving Odyssey...")
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
		           
			['Walk of Echoes [P1]'] = T{  
  --[[translocator 1]]['1'] =   { menu_id = 1020, index = 562, zone = 298,npc = 20951602, offset = 0,--[[ x = 160, y = 156, z = 59.500003814697 , h = 63, unknown1 = 1  , unknown2 = 1]]}, 
  --[[translocator 2]]['2'] =   { menu_id = 1021, index = 563, zone = 298,npc = 20951603, offset = 1,--[[ x = 332.00003051758, y = -600, z = -0.5 , h = 127, unknown1 = 2 , unknown2 = 1]]},
  --[[translocator 3]]['3'] =   { menu_id = 1022, index = 564, zone = 298,npc = 20951604, offset = 2,--[[ x = -420.00003051758, y = -218.00001525879, z = 19.5 , h = 191, unknown1 = 3 , unknown2 = 1]]},
		},
			['Walk of Echoes [P2]'] = T{
  --[[translocator 1]]['1'] =   { menu_id = 1020, index = 562, zone = 279,npc = 20951602, offset = 0,--[[ x = 160, y = 156, z = 59.500003814697 , h = 63, unknown1 = 1  , unknown2 = 1]]},
  --[[translocator 2]]['2'] =   { menu_id = 1021, index = 563, zone = 279,npc = 20951603, offset = 1,--[[ x = 332.00003051758, y = -600, z = -0.5 , h = 127, unknown1 = 2 , unknown2 = 1]]},
  --[[translocator 3]]['3'] =   { menu_id = 1022, index = 564, zone = 279,npc = 20951604, offset = 2,--[[ x = -420.00003051758, y = -218.00001525879, z = 19.5 , h = 191, unknown1 = 3 , unknown2 = 1]]},
		},
    },
}