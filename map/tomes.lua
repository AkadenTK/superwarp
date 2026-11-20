local npc_names = T{
    ['zone'] = S{'Grounds Tome','Field Manual'},
}
return T{
    short_name = 'to',
    long_name = 'Tomes',
    npc_plural = 'Valor Tomes',
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
        -- There seem to be a wide variety of menu IDs but are of no discernible importance.
        --[[
		if not (  menu_id == 100 or menu_id == 61 or menu_id == 62 or menu_id == 29 or menu_id == 17 or menu_id == 110) then
            return "Incorrect menu detected! Menu ID: "..menu_id
        end
        ]]
        return nil
    end,
    missing = function(warpdata, zone, p)
        local missing = T{}
        return missing
    end,
    help_text = "| Tomes |\n- to zone -- Warp to your home nation from a Field Manual or Home Point from a Grounds Tome.\n-----------------------------",
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
            local warpmessage = nil
            local OI = nil
            if npc.name == 'Field Manual' then
                OI = 21
                warpmessage='Warping to your home nation.'
            elseif npc.name == 'Grounds Tome' then
                OI = 52
                warpmessage='Warping to your home point.'
            end
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = OI
            packet["_unknown1"] = 0
            packet["Target Index"] = npc.index
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, expecting_zone=true, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='warp request', message=warpmessage})  

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = OI
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