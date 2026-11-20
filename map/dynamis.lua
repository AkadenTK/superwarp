local entry_zones = S{ 230, 234, 239, 243 }
local npc_names = T{
    zone = S{'Enigmatic Footprints #2'},
}
return T{
    short_name = {'ds','dy'},
    long_name = 'Dynamis',
    npc_plural = 'dynamis entry points',
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
    validate = function(menu_id, zone, current_activity, p)
        local eligibility_status = p["Menu Parameters"]:unpack('b8', 1)
            if eligibility_status + 128 > 128 then
                return "Cannot enter right now."
            end
        return nil
    end,
    missing = function(warpdata, zone, p)
        local missing = T{}
        return missing
    end,
    help_text = "| Dynamis |\n- ds zone -- Enter Shared Dynamis zones from Enigmatic Footprints #2.\n-----------------------------",
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

            warpmessage='Entering Dynamis.'

                -- Menu change
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 1
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, expecting_zone=true, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='menu change', message=warpmessage})  
            
                -- Complete menu
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 2
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, expecting_zone=true, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='complete menu'})  


            return actions
        end,
    },
    warpdata = T{

	},
}