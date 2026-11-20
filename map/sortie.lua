local entry_zones = S{267}
local sortie_zones = S{275, 133, 189}
local npc_names = T{
    port = S{'Diaphanous Bitzer','Diaphanous Gadget'},
    warp = S{'Diaphanous Device'},
    normal = S{'Diaphanous Gadget #?'},
    hard = S{'Diaphanous Gadget #?'},
    repop = S{'Diaphanous Device','Diaphanous Bitzer'},
}
local destination_array = {
        device_  = {display_name = 'Device' ,         menu_id = 1000, index = 817, npc = 21001009, offset = 32, x = -836.00006103516, y = -20, z = -178.00001525879 , h = 0, unknown1 = 1 , unknown2 = 1},
        device_a = {display_name = 'Device #A',       menu_id = 1001, index = 818, npc = 21001010, offset = 33, x = -460.00003051758, y = 96.000007629395, z = -150 , h = 63, unknown1 = 2  , unknown2 = 1},
        device_b = {display_name = 'Device #B',       menu_id = 1002, index = 819, npc = 21001011, offset = 34, x = -344.00003051758, y = -20, z = -150 , h = 127, unknown1 = 3 , unknown2 = 1},
        device_c = {display_name = 'Device #C',       menu_id = 1003, index = 820, npc = 21001012, offset = 35, x = -460.00003051758, y = -136, z = -150 , h = 191, unknown1 = 4 , unknown2 = 1},
        device_d = {display_name = 'Device #D',       menu_id = 1004, index = 821, npc = 21001013, offset = 36, x = -576, y = -20, z = -150 , h = 0, unknown1 = 5, unknown2 = 1},
        gadget_a = {display_name = 'Gadget #A',       menu_id = 1005, index = 822, npc = 21001014, offset = 1, x = -900.00006103516, y = 416.00003051758, z = -200.00001525879 , h = 63, unknown1 = 1, unknown2 = 1},
        gadget_b = {display_name = 'Gadget #B',       menu_id = 1006, index = 823, npc = 21001015, offset = 2, x = -24.000001907349, y = 420.00003051758, z = -200.00001525879 , h = 127, unknown1 = 2, unknown2 = 1},
        gadget_c = {display_name = 'Gadget #C',       menu_id = 1007, index = 824, npc = 21001016, offset = 3, x = -20, y = -456.00003051758, z = -200.00001525879 , h = 191, unknown1 = 3, unknown2 = 1},
        gadget_d = {display_name = 'Gadget #D',       menu_id = 1008, index = 825, npc = 21001017, offset = 4, x = -896.00006103516, y = -460.00003051758, z = -200.00001525879 , h = 0, unknown1 = 4, unknown2 = 1},
        gadget_  = {display_name = 'Gadget',          menu_id = 1009, index = 826, npc = 21001018, offset = 0, x = 624, y = -620, z = 100.00000762939 , h = 0, unknown1 = 1, unknown2 = 1},
        gadget_e = {display_name = 'Gadget #E',       menu_id = 1018, index = 827, npc = 21001019, offset = 5, x = 280, y = 276, z = 70 , h = 63, unknown1 = 5, unknown2 = 1},
        gadget_f = {display_name = 'Gadget #F',       menu_id = 1019, index = 828, npc = 21001020, offset = 6, x = 876.00006103516, y = 280, z = 70 , h = 127, unknown1 = 6, unknown2 = 1},
        gadget_g = {display_name = 'Gadget #G',       menu_id = 1020, index = 829, npc = 21001021, offset = 7, x = 880.00006103516, y = -316, z = 70 , h = 191, unknown1 = 7, unknown2 = 1},
        gadget_h = {display_name = 'Gadget #H',       menu_id = 1021, index = 830, npc = 21001022, offset = 8, x = 284, z = 70, y = -320.00,  h = 0, unknown1 = 8, unknown2 = 1},
        gadget_q = {display_name = 'Gadget #?',       menu_id = 1022, index = 831, npc = 21001023, offset = 9, x = 186.50001525879, z = 60.000003814697, y = -20,  h = 255, unknown1 = 1, unknown2 = 1},
        aminon_  = {display_name = 'Aminon (Normal)', menu_id = 1023, index = 832, npc = 21001024, offset = 10,x = 184.00001525879, z = 100.00000762939, y = -660.00006103516,  h = 0, unknown1 = 1, unknown2 = 1},
        aminon_h = {display_name = 'Aminon (Hard)',   menu_id = 1023, index = 832, npc = 21001024, offset = 10,x = 184.00001525879, z = 100.00000762939, y = -660.00006103516,  h = 0, unknown1 = 2, unknown2 = 1},
        bitzer_a = {display_name = 'Bitzer #A',       menu_id = 1010, index = 833, npc = 21001025, offset = 1, x = -460.00003051758, z = -140, y = 35.5,  h = 191, unknown1 = 5, unknown2 = 1},
        bitzer_b = {display_name = 'Bitzer #B',       menu_id = 1011, index = 834, npc = 21001026, offset = 2, x = -404.50003051758, z = -140, y = -20,  h = 0, unknown1 = 6, unknown2 = 1},
        bitzer_c = {display_name = 'Bitzer #C',       menu_id = 1012, index = 835, npc = 21001027, offset = 3, x = -460.00003051758, y = -75.5, z = -140 , h = 63, unknown1 = 7, unknown2 = 1},
        bitzer_d = {display_name = 'Bitzer #D',       menu_id = 1013, index = 836, npc = 21001028, offset = 4, x = -515.5, z = -140, y = -20,  h = 127, unknown1 = 8, unknown2 = 1},
        bitzer_e = {display_name = 'Bitzer #E',       menu_id = 1014, index = 837, npc = 21001029, offset = 5, x = 580, y = 31.500001907349, z = 100.00000762939 , h = 191, unknown1 = 1, unknown2 = 1},
        bitzer_f = {display_name = 'Bitzer #F',       menu_id = 1015, index = 838, npc = 21001030, offset = 6, x = 631.5, z = 100.00000762939, y = -20,  h = 0, unknown1 = 2, unknown2 = 1},
        bitzer_g = {display_name = 'Bitzer #G',       menu_id = 1016, index = 839, npc = 21001031, offset = 7, x = 580, y = -71.5, z = 100.00000762939 , h = 63, unknown1 = 3, unknown2 = 1},
        bitzer_h = {display_name = 'Bitzer #H',       menu_id = 1017, index = 840, npc = 21001032, offset = 8, x = 528.5, z = 100.00000762939, y = -20,  h = 127, unknown1 = 4, unknown2 = 1},
}

-- Categorize NPCs to prevent warping between different NPC types

local bitzer_menu_ids = T {1010, 1011, 1012, 1013, 1014, 1015, 1016, 1017}
local gadget_menu_ids = T {1005, 1006, 1007, 1008, 1009, 1018, 1019, 1020, 1021}
local device_menu_ids = T {1000, 1001, 1002, 1003, 1004}

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

local function has_temp_item(item_id)
    local temp_items = windower.ffxi.get_items(3)
    for _, item in ipairs(temp_items) do
        if item.id == item_id then
            return true
        end
    end
    return false
end

return T {
    short_name = {'so','se'},
    long_name = 'Sortie',
    move_in_zone = true,
    npc_plural = 'Diaphanous Objects',
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
    validate = function(menu_id, zone, c_a,p)
		local origination = p["Menu Parameters"]:unpack('b8', 1)
        local bitcheckinator = p["Menu Parameters"]:unpack('b8', 5)
		local destination = nil
        if c_a.sub_cmd then
            destination = nil
        else
            destination = c_a.activity_settings
            ---- Device unlocks -----
            local unlock_bits = p["Menu Parameters"]
            local destination_locked = true
            if destination.offset ~= nil then
                destination_locked = has_bit(unlock_bits, destination.offset)
            end
            if menu_id == destination.menu_id then
                return "You're already at that location"
            elseif destination_locked then
                return "Cannot warp to "..destination.key.." without the Ra'Kaznar Plate #"..destination.key.." KI."
            end
            ------------------------
        end
		if origination == nil or bitcheckinator == nil then
			return 'Please update your superwarp.lua file to the latest version for Sortie support'
		end
       -- Destination setters
        --------------------------------------------------------------------------------------------------------------------------------------------
    if c_a.sub_cmd ~= 'repop' then
        if menu_id == 1010 then 
            current_activity.args = destination_array.bitzer_e
        elseif menu_id == 1011 then
            current_activity.args = destination_array.bitzer_f
        elseif menu_id == 1012 then
            current_activity.args = destination_array.bitzer_g
        elseif menu_id == 1013 then
            current_activity.args = destination_array.bitzer_h
        elseif menu_id == 1014 then
            current_activity.args = destination_array.bitzer_a
        elseif menu_id == 1015 then
            current_activity.args = destination_array.bitzer_b
        elseif menu_id == 1016 then
            current_activity.args = destination_array.bitzer_c
        elseif menu_id == 1017 then
            current_activity.args = destination_array.bitzer_d
            -- Gadgets all warp to 'Gadget'
        elseif (menu_id >= 1005 and menu_id <= 1008) or (menu_id >= 1018 and menu_id <= 1021) then
            current_activity.args = destination_array.gadget_
        elseif menu_id == 1022 and (c_a.sub_cmd == 'port' and bitcheckinator == 0) or (c_a.sub_cmd == 'normal' and (bitcheckinator == 1 or bitcheckinator == 0)) or (c_a.sub_cmd == 'hard' and bitcheckinator == 0) then
            current_activity.args = destination_array.aminon_
        elseif menu_id == 1022 and (c_a.sub_cmd == 'port' and bitcheckinator == 2) or (c_a.sub_cmd == 'hard' and (bitcheckinator == 1 or bitcheckinator == 2)) or (c_a.sub_cmd == 'normal' and bitcheckinator == 2) then
            current_activity.args = destination_array.aminon_h
        end
		if menu_id == 1022 and bitcheckinator == 1 and (c_a.sub_cmd ~= 'normal' and c_a.sub_cmd ~= 'hard') then
		    return 'Difficulty not set - Use //so normal or //so hard ; alternatively, set the Aminon difficulty before using //so port.'
		end
        if (c_a.sub_cmd == 'normal' or c_a.sub_cmd == 'hard') and menu_id ~= 1022 then	    
		    return 'Only use the normal or hard command on Aminon\'s gadget.'
		end
        -----------Gadget Handling (Ensures the player can only warp back from whence they came --------------------------
        if menu_id == 1009 and origination ~= nil then
            -- Warp the player back to the gadget they came from
            if origination == 1 then
                current_activity.args = destination_array.gadget_a
            elseif origination == 2 then
                current_activity.args = destination_array.gadget_b
            elseif origination == 3 then
                current_activity.args = destination_array.gadget_c
            elseif origination == 4 then
                current_activity.args = destination_array.gadget_d
            elseif origination == 10 then
                current_activity.args = destination_array.gadget_e
            elseif origination == 11 then
                current_activity.args = destination_array.gadget_f
            elseif origination == 12 then
                current_activity.args = destination_array.gadget_g
            elseif origination == 13 then
                current_activity.args = destination_array.gadget_h
			end
        elseif menu_id == 1009 and origination == nil then
            return 'Superwarp does not know where to send you, debacle averted; Warp out manually.'  -- I can't imagine a scenario where this could occur but handled it anyway.
        end
        if menu_id == 1023 and origination ~= nil then
            if origination == 14 then
                current_activity.args = destination_array.gadget_q
		    end
		end
        ---------------------------------
        if c_a.sub_cmd then
            destination = current_activity.args
        end
        -------------------------------------------------------------------
        if not  -- NPCs:
        (menu_id >= 1000 and menu_id <= 1023) then
            return "Incorrect menu detected! Menu ID: " .. menu_id
        end

        -- prevent warping to gadgets or devices from bitzers
        if bitzer_menu_ids:contains(menu_id) and not bitzer_menu_ids:contains(destination.menu_id) then
            return 'Cannot warp to devices or gadgets from here.'
        end
        -- prevent warping to devices or bitzers from gadgets
        if gadget_menu_ids:contains(menu_id) and not gadget_menu_ids:contains(destination.menu_id) then
            return 'Cannot warp to devices or bitzers from here.'
        end
        -- prevent warping to gadgets or bitzers from devices
        if device_menu_ids:contains(menu_id) and not device_menu_ids:contains(destination.menu_id) then
            return 'Cannot warp to gadgets or bitzers from here.'
        end
        -- extra layer of protection for stopping any cross-zone warp
        ---------------------------------------------------------------------------------------------------
        if menu_id == destination.menu_id then
            return "You're already at that location"
        end
        ------------------------------------------------------------------------------------------------------------------
        if not sortie_zones:contains(zone) then
            return 'Not in a Sortie zone!'
        end
        --------------------------------------------------------------------------------------------------------------------
    end
        return nil
    end,
    help_text = "| Sortie |\n Command options [so, se]\n- so s/a/b/c/d (# now optional i.e. [#b]) OR  0/1/2/3/4 -- warp to a designated Device in Sortie. (Use only with devices)\n- so port -- warp to the other side of any bitzer or gadget. \n- so normal -- set Aminon difficulty to normal and warp into his chamber. \n- so hard -- set Aminon difficulty to hard and warp into his chamber. \n- so repop -- Rematerialize monsters at a device or downstairs bitzer. \n-----------------------------",
    sub_zone_targets = S {'0', '1', '2', '3', '4','#a','#b','#c','#d', 's','a', 'b', 'c', 'd'},
    auto_select_zone = function(zone)
        if zone == 275 then
            return 'Outer Ra\'Kaznar'
        end
        if zone == 133 then
            return 'Outer Ra\'Kaznar'
        end
        if zone == 189 then
            return 'Outer Ra\'Kaznar'
        end
    end,
    auto_select_sub_zone = function(zone, specified)
        if not specified.subzone then
            if has_temp_item(temp_item_ids.Shard.G) then
                return "C"
            elseif has_temp_item(temp_item_ids.Shard.F) then
                return "B"
            elseif has_temp_item(temp_item_ids.Shard.E) then
                return "A"
            elseif has_temp_item(temp_item_ids.Shard.H) then
                return "D"
            else
                local job = windower.ffxi.get_player().main_job
                if job == 'COR' and not has_temp_item(temp_item_ids.Shard.B) then
                    return "B"
                elseif (job == 'GEO' or job == 'DNC') and not has_temp_item(temp_item_ids.Shard.C) then
                    return "C"
                end
            end
            if specified.order and has_temp_item(temp_item_ids.Fragment.D) then
                return "C"
            else
                return "S"
            end
        else
            return nil
        end
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T {}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings
        if not device_menu_ids:contains(menu) then
            log('You cannot warp to a device from here.')
            return
        end
        -- update request
        packet = packets.new('outgoing', 0x016)
        packet["Target Index"] = windower.ffxi.get_player().index
        actions:append(T {
            packet = packet,
            description = 'update request'
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
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
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

        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'complete menu'
        })
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
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
			local origination = nil
			local destination = current_activity.args
            origination = p["Menu Parameters"]:unpack('b8', 1)
			local bitcheckinator = p["Menu Parameters"]:unpack('b8', 5)
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
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
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
        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
		local menu_B_delay = 0.5
		if menu == 1013 then
		   menu_B_delay = 2  -- Extra delay for sector H to prevent casket#H1 from spawning pre-maturely
		end
		actions:append(T {
		packet = packet,
		wait_packet = 0x052,
		expecting_zone = false,
		delay = menu_B_delay,
		description = 'complete menu'
		})
    if menu >= 1010 and menu <= 1013 then
            -- Spawn trigger packet
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
        delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) ,
        description = 'complete menu'
        })  
    else
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'complete menu'
        })
    end

            return actions
        end,
-----------------------------------------------------------------------------------------------------------
        normal = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local destination = nil
			local bitcheckinator = p["Menu Parameters"]:unpack('b8', 5)
            --------------------------------------------------------------------------------------
            if menu == 1022 then
                if bitcheckinator == 0 then
                    destination = destination_array.aminon_
                    log('Normal mode has already been set, you can use the port command for the duration of this instance.')
                elseif bitcheckinator == 2 then
                    log('Hardmode has already been set; you cannot enter normalmode for the duration of this instance and can use the port command.')
                    destination = destination_array.aminon_h
                elseif bitcheckinator == 1 then
                    log('Setting difficulty to normal...')
                    destination = destination_array.aminon_
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
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
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

        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'complete menu'
        })
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'complete menu'
        })

            return actions
        end,
-----------------------------------------------------------------------------------------------------------
        hard = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
			local destination = nil
			local bitcheckinator = p["Menu Parameters"]:unpack('b8', 5)
            --------------------------------------------------------------------------------------
            if menu == 1022 then
                if bitcheckinator == 0 then
                    destination = destination_array.aminon_
                    log('Normalmode has already been set; you cannot enter hardmode for the duration of this instance and can use the port command.')
                elseif bitcheckinator == 2 then
                    log('Hardmode has already been set, you can use the port command for the duration of this instance..')
                    destination = destination_array.aminon_h
                elseif bitcheckinator == 1 then
                    log('Setting difficulty to hard...')
                    destination = destination_array.aminon_h
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
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
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

        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'complete menu'
        })
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["Option Index"] = 101
        packet["_unknown1"] = 0
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            expecting_zone = false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'complete menu'
        })

            return actions
        end,
-----------------------------------------------------------------------------------------------------------
        repop = function(current_activity, zone, p, settings, warpdata)
            local actions = T {}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
            local rematerialization_checker = 36
            local rematerialization_avail = true
			
			if (menu >= 1001 and menu <= 1004)  then
                rematerialization_avail = not has_bit(p["Menu Parameters"],rematerialization_checker + 1) 
			elseif (menu >= 1014 and menu <= 1017)  then
			    rematerialization_avail = not has_bit(p["Menu Parameters"],rematerialization_checker) 
            end
			
            if not (menu >= 1001 and menu <= 1004) and not (menu >= 1014 and menu <= 1017) then
                notice('You can only rematerialize monsters from devices and basement bitzers.')
                return
			end

			
            if (menu >= 1001 and menu <= 1004) or (menu >= 1014 and menu <= 1017) then
            debug('rematerialization is possible: '..tostring(rematerialization_avail))
                if not rematerialization_avail then
                    packet = packets.new('outgoing', 0x05B)
                    packet["Target"] = npc.id
                    packet["Option Index"] = 0
                    packet["_unknown1"] = 16384
                    packet["Target Index"] = npc.index
                    packet["Automated Message"] = false
                    packet["_unknown2"] = 0
                    packet["Zone"] = zone
                    packet["Menu ID"] = menu
                    actions:append(T{packet=packet, description='cancel menu', message='Rematerialization is not possible yet!'})
                    return actions
                end
				    log('Proceeding with the rematerialization...')
            end
----------------------------------------------------------------------------------

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu
        if (menu >= 1001 and menu <= 1004)  then
            packet["Option Index"] = 6
        elseif (menu >= 1014 and menu <= 1017)  then
            packet["Option Index"] = 9
		end
            packet["_unknown1"] = 0
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            actions:append(T {
                packet = packet,
                --wait_packet = 0x052,
                expecting_zone = false,
                delay = 1,
                description = 'complete menu'
            })
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T {
                packet = packet,
                description = 'update request'
            })
            return actions
        end,
----------------------------------------------------------
    },
    warpdata = T{
        ['Outer Ra\'Kaznar'] = T{  
                ['0'] =  { shortcut = 'S' },
                ['1'] =  { shortcut = 'A' },
                ['2'] =  { shortcut = 'B' }, 
                ['3'] =  { shortcut = 'C' },
                ['4'] =  { shortcut = 'D' },
                ['#A'] = { shortcut = 'A' },
                ['#B'] = { shortcut = 'B' },
                ['#C'] = { shortcut = 'C' },
                ['#D'] = { shortcut = 'D' },
  --[[Device]]  ['S'] =   { menu_id = 1000, index = 817, zone = 275,npc = 21001009, offset = 32, x = -836.00006103516, y = -20, z = -178.00001525879 , h = 0, unknown1 = 1 , unknown2 = 1},
  --[[Device A]]['A'] =   { menu_id = 1001, index = 818, zone = 275,npc = 21001010, offset = 33, x = -460.00003051758, y = 96.000007629395, z = -150 , h = 63, unknown1 = 2  , unknown2 = 1},
  --[[Device B]]['B'] =   { menu_id = 1002, index = 819, zone = 275,npc = 21001011, offset = 34, x = -344.00003051758, y = -20, z = -150 , h = 127, unknown1 = 3 , unknown2 = 1},
  --[[Device C]]['C'] =   { menu_id = 1003, index = 820, zone = 275,npc = 21001012, offset = 35, x = -460.00003051758, y = -136, z = -150 , h = 191, unknown1 = 4 , unknown2 = 1},
  --[[Device D]]['D'] =   { menu_id = 1004, index = 821, zone = 275,npc = 21001013, offset = 36, x = -576, y = -20, z = -150 , h = 0, unknown1 = 5, unknown2 = 1}, 
		},
    },
}