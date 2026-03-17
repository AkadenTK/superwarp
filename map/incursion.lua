local incursion_zone = 271
local menu_ids = S{10,11,12,13,14,15,16}
local npc_names = T{
    warp = S{'Rusted Transmitter'},
}
return T{
    short_name = {'in','inc'},
    long_name = 'Incursion',
    npc_plural = 'Rusted transmitters',
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
    validate = function(menu_id, zone, current_activity,p)
        local destination = current_activity.activity_settings
        local unlock_bits = p["Menu Parameters"]
        local destination_unlocked = true
        if destination.offset ~= nil then
            destination_unlocked = has_bit(unlock_bits, destination.offset)
        end
        debug('Transmitter is unlocked: '..tostring(destination_unlocked))
        if not destination_unlocked then
            return "Destination is locked."
        end
        if menu_id == destination.menu_id then
            return "You are already at that location."
        end
        if not menu_ids:contains(menu_id) then 
            return "Incorrect menu detected! Menu ID: "..menu_id
        end
        if zone ~= incursion_zone then
            return 'Not in incursion zone.'
        end
        return nil
    end,
    missing = function(warpdata, zone, p)
        local missing = T{}
        local unlock_bits = p["Menu Parameters"]
        for z, zd in pairs(warpdata) do
            if not zd.shortcut then
                if zd.offset then
                    if has_bit(unlock_bits, zd.offset) then

                    else
                        missing:append(z)
                    end
                end
            end
        end
        return missing
    end,
    help_text = "| Incursion |\n Command options [in, inc]\n- in [boss name] -- warp to a designated boss chamber, i.e. //in ymmr\n-----------------------------",
    sub_zone_targets = S{},
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T{}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings

        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = 255
        packet["_unknown1"] = 0
        packet["Target Index"] = npc.index
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T {
            packet=packet,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description='send options'
        })

        packet = packets.new('outgoing', 0x05C)
        packet["Target ID"] = npc.id
        packet["Target Index"] = npc.index
        packet["Zone"] = zone
        packet["Menu ID"] = menu

        packet["X"] = destination.x
        packet["Y"] = destination.y
        packet["Z"] = destination.z
        packet["_unknown1"] = destination.oi
        packet["Rotation"] = destination.h
        packet["_unknown2"] = 1
        actions:append(T {
            packet = packet,
            wait_packet = 0x052,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation),
            description = 'same-zone move request'
        })

        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = destination.oi
        packet["_unknown1"] = 0
        packet["Target Index"] = npc.index
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T{
            packet=packet,
            wait_packet=0x052,
            expecting_zone=false,
            delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='complete menu'})

        return actions
    end,
    warpdata = T{
        ['Entrance'] =                {index = 1, offset = 0, oi=1, menu_id =10, x = -237.71900939941, z = 29.999000549316 , y = 400.72702026367, h = 0,},
        ['Hall Of The Reckless'] =    {index = 1, offset = 0, oi=1, menu_id =10, x = -237.71900939941, z = 29.999000549316 , y = 400.72702026367, h = 0,},
        ['Ymmr-Ulvid Gloomlight'] =   {index = 2, offset = 0, oi=2, menu_id =11, x = 82.436004638672, z = 29.955001831055 , y = 580.05505371094, h = 7},
        ['Ignor-Mnt Stealthslayer'] = {index = 3, offset = 1, oi=3, menu_id =12, x = 497.8860168457, z = 30.150001525879 , y = 301.51501464844, h = 51},
        ['Durs-Vike Deathspell'] =    {index = 4, offset = 2, oi=4, menu_id =13, x = -139.87901306152, z = 10.185000419617 , y = 56.409004211426, h = 60},
        ['Tryl-Wuj Wingrip'] =        {index = 5, offset = 3, oi=5, menu_id =14, x = 518.25402832031, z = 29.999000549316 , y = -280.18701171875, h = 192},
        ['Liij-Vok Waxwane'] =        {index = 6, offset = 4, oi=6, menu_id =15, x = 22.263000488281, z = 30.228000640869 , y = -263.29800415039, h = 179},
        ['Brash Gramk-Droog'] =       {index = 7, offset = 5, oi=7, menu_id =16, x = 61.952003479004, z = 28.011001586914 , y = -454.43301391602, h = 188},
    },
}
