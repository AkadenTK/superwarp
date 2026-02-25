local WoE_zone = 182
local all_warp_zones = S{137,182}
local menu_ids = S{44,43,1000,1001,1004,1600}
local npc_names = T{
    enter = S{'Veridical Conflux #', },
    exit = S{' Veridical Conflux #', },
    medal = S{'Echo Disseminator', },
    zone = S{'Veridical Conflux'},
}
local destination_array = {
    ['E'] = {display_name = 'Entrance',          zone = 182, menu_id = 1000, index = 863, npc = 16929631, x = -420.0000305175781, y = -32, z = 13.5000009536743 ,h = 191, unknown1 = 2,},
    ['01'] = {display_name = 'Battlefield 1',    zone = 182, menu_id = 1000, index = 863, npc = 16929631, x = -574, y = 734.0000610351562, z = 17.5, h = 63, unknown1 = 2,},
    ['02'] = {display_name = 'Battlefield 2',    zone = 182, menu_id = 1000, index = 864, npc = 16929632, x = -122.0000076293945, y = 566, z = 17.5, h = 191, unknown1 = 2,},
    ['03'] = {display_name = 'Battlefield 3',    zone = 182, menu_id = 1000, index = 865, npc = 16929633, x = 354.0000305175781, y = 514,  z = -0.5, h = 191, unknown1 = 2,},
    ['04'] = {display_name = 'Battlefield 4',    zone = 182, menu_id = 1000, index = 866, npc = 16929634, x = 570, y = 670.0000610351562,  z = 17.5, h = 31,  unknown1 = 2,},
    ['05'] = {display_name = 'Battlefield 5',    zone = 182, menu_id = 1000, index = 867, npc = 16929635, x = -550, y = 330.0000305175781, z = -0.5, h = 127, unknown1 = 2,},
    ['06'] = {display_name = 'Battlefield 6',    zone = 182, menu_id = 1000, index = 868, npc = 16929636, x = 276, y = 240.0000152587891,  z = 29.5000019073486, h = 127, unknown1 = 2,},
    ['07'] = {display_name = 'Battlefield 7',    zone = 182, menu_id = 1000, index = 869, npc = 16929637, x = 640, y = 240.0000152587891,  z = 77.5, h = 159, unknown1 = 2,},
    ['08'] = {display_name = 'Battlefield 8',    zone = 182, menu_id = 1000, index = 870, npc = 16929638, x = -260, y = 340.0000305175781, z = -0.5, h = 63,  unknown1 = 2,},
    ['09'] = {display_name = 'Battlefield 9',    zone = 182, menu_id = 1000, index = 871, npc = 16929639, x = -64, y = -292, z = 23.5000019073486, h = 191, unknown1 = 2,},
    ['10'] = {display_name = 'Battlefield 10',   zone = 182, menu_id = 1000, index = 872, npc = 16929640, x = 320, y = -120.0000076293945, z = 107.5000076293945,h = 127, unknown1 = 2,},
    ['11'] = {display_name = 'Battlefield 11',   zone = 182, menu_id = 1000, index = 873, npc = 16929642, x = 760.0000610351562, y = 0,    z = 71.5, h = 95,  unknown1 = 2,},
    ['12'] = {display_name = 'Battlefield 12',   zone = 182, menu_id = 1000, index = 874, npc = 16929641, x = -700.0000610351562, y = -738.0000610351562,z = 11.5000009536743, h = 223, unknown1 = 2,},
    ['13'] = {display_name = 'Battlefield 13',   zone = 182, menu_id = 1000, index = 875, npc = 16929643, x = -296, y = -576,z = -0.5, h = 223, unknown1 = 2,},
    ['14'] = {display_name = 'Battlefield 14',   zone = 182, menu_id = 1000, index = 876, npc = 16929644, x = 680.0000610351562, y = -812.0000610351562, z = 35.5, h = 191, unknown1 = 2,},
    ['15'] = {display_name = 'Battlefield 15',   zone = 182, menu_id = 1000, index = 877, npc = 16929645, x = 146, y = -574, z = 17.5, h = 223, unknown1 = 2,},
}
return T{
    short_name = {'we','woe'},
    long_name = 'Walk Of Echoes',
    npc_plural = 'Veridical Confluxes',
    npc_names = npc_names,
    all_warp_zones = all_warp_zones,
    zone_npc_list = function(type)
        local mlist = windower.ffxi.get_mob_list()
        mlist = table.filter(mlist, function(name)
            return name ~= "" and npc_names[type]:any(string.startswith+{name})
        end)
        mlist = table.map(mlist, function(name)
            return {name=name}
        end)
        return mlist
    end,
    validate = function(menu_id, zone, current_activity, p)
        if current_activity.sub_cmd == 'zone' then
            if zone == 137 and menu_id ~= 43 and menu_id ~= 44 then
                return "Wrong NPC!"
            elseif zone == 182 and menu_id ~= 1004 then
                return "Wrong NPC!"
            end
        end
        if current_activity.sub_cmd == 'medal' then
            local has_medallion = p["Menu Parameters"] and p["Menu Parameters"]:unpack('b8', 5) ~= 0
            if has_medallion then
                return "You already have a medallion."
            end
        end
        local medallion = p["Menu Parameters"] and p["Menu Parameters"]:unpack('b8', 2)
        local has_ki = medallion and bit.band(medallion, 1) == 1
        local dest_key = current_activity.npc.name:match("#(%d+)")
        local destination = dest_key and destination_array[dest_key]
        if current_activity.sub_cmd == 'enter' and not destination then
            return "Sum ting wong"
        end
        if WoE_zone ~= zone and current_activity.sub_cmd ~= 'zone' then
            return "You are not in the correct zone."
        end
        if current_activity.sub_cmd == 'enter' and not medallion then
            return "You cannot use 'enter' from here."
        end
        if current_activity.sub_cmd == 'enter' and not has_ki then
            return "You do not possess a Kupofried's Medallion."
        end
        if current_activity.sub_cmd == 'exit' and medallion then
            return "You cannot exit from here."
        end
        if not menu_ids:contains(menu_id) then
            return "Incorrect Menu ID"
        end
        return nil
        --return "Its no good though"
    end,
    help_text = "| Walk Of Echoes |\n Command options [we, woe]\n- woe enter -- Enter battlefields inside Walk Of Echoes.\n- woe exit -- Leave battlefields inside Walk Of Echoes.\n- zone -- Zone into or out of the Walk Of Echoes zone (Blank Veridical Conflux).\n-----------------------------",
    sub_zone_targets =  S{},
    auto_select_zone = function(zone)
    end,
    auto_select_sub_zone = function(zone)
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = 0
        packet["_unknown1"] = 16384
        packet["Target Index"] = npc.index
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T{packet=packet, description='cancel menu', message='ERROR! Something went wrong!'})
        return actions
    end,
    sub_commands = {
        enter = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
            local dest_key = current_activity.npc.name:match("#(%d+)")
            local destination = dest_key and destination_array[dest_key]

            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 5
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description='send options'
            })
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description='send options',
                message='Entering Battlefield #'..dest_key
            })
--
            packet = packets.new('outgoing', 0x05C)
            packet["Target ID"] = npc.id
            packet["Target Index"] = npc.index
            packet["Zone"] = zone
            packet["Menu ID"] = menu

            packet["X"] = destination.x
            packet["Y"] = destination.y
            packet["Z"] = destination.z
            packet["_unknown1"] =destination.unknown1
            packet["Rotation"] = destination.h
            packet["_unknown2"] = 1
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'same-zone move request'
            })
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 3
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='complete menu'
            })
            return actions
        end,
        exit = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
            local destination = destination_array.E
            local dest_key = current_activity.npc.name:match("#(%d+)")
            if destination.display_name ~= 'Entrance' then
                return
            end
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet, 
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='send options', 
                message='Exiting Battlefield #'..dest_key
            })
--
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
            packet["_unknown2"] = 1
            actions:append(T {
                packet = packet,
                wait_packet = 0x052,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description = 'same-zone move request'
            })
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 2
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet, 
                wait_packet = 0x052, 
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='complete menu'
            })
            return actions
        end,

        medal = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc

            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description='send options',
                message='Grabbing a Kupofried\'s medallion',
            })
--

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 2
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                wait_packet = 0x052, 
                delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='send options'
            })
--
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 8
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                wait_packet = 0x052, 
                delay = 1 + wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='complete menu'
            })

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 16384
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet, 
                wait_packet = 0x052, 
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='cancel menu', 
            })

            return actions
        end,

        zone = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc

            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})
    if menu == 1004 and zone == 182 then
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                expecting_zone = true,
                delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description='zone request',
                message='Leaving Walk Of Echoes',
            })
    elseif menu == 43 and zone == 137 then
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 999
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                message='Grabbing the Kupofried\'s medallion needed for entry, re-send command afterwards.',
                description='send options'
            })

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 99
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                wait_packet = 0x052, 
                delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='send options'
            })

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 99
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                wait_packet = 0x052, 
                delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                description='send options'
            })
    elseif menu == 44 and zone == 137 then
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 999
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), 
                message='Entering Walk Of Echoes.',
                description='send options'
            })

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 99
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{
                packet=packet,
                expecting_zone = true,
                wait_packet = 0x052, 
                delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
                description='zone request',
            })
    else
        log('Something is afoul foregoing the operation.')
        return
    end

            return actions
        end,
    },
    warpdata = T{
          
	},
}