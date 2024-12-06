local entry_zones = S{ 29 } 
local npc_names = T{
    enter = S{'Spatial Displacement'},
}
return T{
    short_name = 'spd',
    long_name = 'spatial displacement',
    npc_plural = 'displacements',
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
        -- check menu id here.
		if not (  menu_id == 33) then
            return "Incorrect menu detected! Menu ID: "..menu_id
        end
        if current_activity.sub_cmd == 'enter' and not entry_zones:contains(zone) then
            return 'Not in an entry zone!'
        end
        return nil
    end,
    missing = function(warpdata, zone, p)
        local missing = T{}
        return missing
    end,
    help_text = "|Spacial Displacements| - [sw] spd [all/a/@all] enter -- Enter Monarch Linn from #B01. \"all\" sends ipc to all local clients.\n-----------------------------",
    sub_zone_targets =  S{},
    auto_select_zone = function(zone)
    end,
    auto_select_sub_zone = function(zone)
    end,
    build_warp_packets = function(current_activity, zone, p, settings)
        -- no warps, only go.
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
            actions:append(T{packet=packet, description='send options'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, expecting_zone=true, delay=1+wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='complete menu', message='Entering Monarch Linn'})

            return actions
        end,
    },
    warpdata = T{

	},
}