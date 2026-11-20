local entry_zones = S{ 232, 236, 240, 256, 257, 280 }
local npc_names = T{
    zone = S{'Mog Dinghy','Cunegonde','Dangueubert'}, -- No need for 2 commands seems to me.
}
return T{
    short_name = 'mg',
    long_name = 'Mog Garden',
    npc_plural = 'garden entry npcs',
    npc_names = npc_names,
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
    validate = function(menu_id, zone, current_activity)
		if not (  menu_id == 575 or menu_id == 1015 or menu_id == 808 or menu_id == 546 or menu_id == 896 or menu_id == 440 or menu_id == 1089) then
            return "Incorrect menu detected! Menu ID: "..menu_id
        end
        if current_activity.sub_cmd == 'zone' and not entry_zones:contains(zone) then
            return 'Not in an entry zone!'
        end
        return nil
    end,
    missing = function(warpdata, zone, p)
        local missing = T{}
        return missing
    end,
    help_text = "| Mog Garden |\n- mg zone -- Enter Mog Garden from Eastern/Western Adoulin or Mog Dinghy in a Port zone or exit Mog Garden from Mog Dinghy.\nMog House\n- mg or mg anything - Warp out from Mog House. mg zone / mg garden warp to Mog Garden from Mog House.\n-----------------------------",
    sub_zone_targets =  S{},
    auto_select_zone = function(zone)
    end,
    auto_select_sub_zone = function(zone)
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        local packet = nil
        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = 0
        packet["_unknown1"] = 16384
        packet["Target Index"] = npc.index
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T{packet=packet, description='cancel menu', message='This map is only meant for sub-command.'})
        return actions
    end,
    sub_commands = {
        zone = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc
            local warpmessage
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})
            if zone == 280 then
                warpmessage='Leaving Mog Garden. Heading back from whence you came.'
            else
                warpmessage='Entering Mog Garden.'
            end
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, expecting_zone=true, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='complete menu', message=warpmessage})  

            return actions
        end,
    },
    warpdata = T{

	},
}