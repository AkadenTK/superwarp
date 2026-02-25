local past_zones = S{80,81,82,83,84,87,88,89,90,91,94,95,96,97,98,136,137,164,171,175}
local past_town_zones = S{80,87,94}
local all_warp_zones = S{80,81,82,83,84,87,88,89,90,91,94,95,96,97,98,136,137,164,171,175,115,119,120,101,104,105,106,109,110}
local menu_ids = S{454,455,456,457,458}
local maw_menu_ids = S{101,102,103,903,904,905,910}
local target_ids = S{17212104,17203886}
local npc_names = T{
    warp = S{'Scarlette, C.A.', 'Wenonah, C.A.', 'Narkissa, C.A.'},
    ['return'] = S{'Estaud','Sleiney','Timid Scorpion','Yimi Jomkeh','Disserond','Gray Colossus','Moana','Luk Leotih','Myllue','Telford','Gisbert','Wayward Echo','Hdya Mhirako','Marius','Larkin','Roiloux','Stray Boar','Barnett','Dhen Kwherri','Kearney','Felicia','Toulsard','Polished Fang','Xenia','Lamurara','Wren','Arlayse','Waldo','Jagged Onyx','Uriah','Addison','Mhik Ljusihlo','Darden','Tomoa-Nomoa','Astrid','Landon','Amaliya','Renvriche'},
    port = S{'Cavernous Maw'}, -- travel through cav. maws 2-way, 1-cmd. Backward and forward in time.
}
return T{
    short_name = {'ca','cn'},
    long_name = 'Campaign',
    npc_plural = 'Campaign NPCs',
    npc_names = npc_names,
    all_warp_zones = all_warp_zones,
    target_ids = target_ids,
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
        allied_notes = p["Menu Parameters"] and p["Menu Parameters"]:unpack('I', 9)
        local warp_cost = 40 --Minimum check, warp costs vary and it gets checked again along with the destination locks.
        if allied_notes and allied_notes < warp_cost then
            return "You have less than 40 Allied Notes."
        end
        if current_activity.sub_cmd ~= 'port' then 
            if not menu_ids:contains(menu_id) then
                return "Incorrect menu detected! Menu ID: "..menu_id
            end
            if past_town_zones:contains(zone) and menu_id ~= 458 then
                return "Incorrect menu ID detected, Campaign teleports not possible."
            end
            if not past_zones:contains(zone) then
                return 'Not in past town zone.'
            end
        elseif current_activity.sub_cmd == 'port' and not maw_menu_ids:contains(menu_id) then
            return "Wrong menu."
        end
        return nil
    end,
    missing = function(warpdata, zone, p, secondcall)
        -- Little tricky since the unlocks are handled different from any other map. Two calls, one to trigger the 5C and another for the operation.
        if not secondcall then
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = p['NPC']
            packet["Option Index"] = 50
            packet["_unknown1"] = 0
            packet["Target Index"] = p['NPC Index']
            packet["Automated Message"] = true
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = p["Menu ID"]
            packets.inject(packet)
        elseif secondcall then
            local missing = T{}
            local unlock_bits = p["Menu Parameters"]:unpack('I', 1)

            for z, zd in pairs(warpdata) do
                if not zd.shortcut then
                    if zd.permission then
                        if bit.band(unlock_bits, zd.permission) ~= 0 then

                        else
                            missing:append(z)
                        end
                    end
                end
            end
            return missing
        end
    end,
    help_text = "| Campaign |\n Command options [ca, cn]\n- ca zone name -- warp to a designated [S] zone via a Campaign Arbiter in a [S] city.\n- ca return -- return to your [S] home nation. via any [S] 2 initial field NPC i.e. Amaliya, C.A.\n- ca port -- teleport to the other side of [S] Cavernous Maws.\n-----------------------------",
    sub_zone_targets = S{},
    build_warp_packets = function(current_activity, zone, p, settings)
        local actions = T{}
        local packet = nil
        local menu = p["Menu ID"]
        local npc = current_activity.npc
        local destination = current_activity.activity_settings

        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = 50
        packet["_unknown1"] = 0
        packet["Target Index"] = npc.index
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T{packet=packet, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='send options'})

        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = destination.oi
        packet["_unknown1"] = 0
        packet["Target Index"] = npc.index
        packet["Automated Message"] = true
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T{packet=packet, wait_packet=0x05C, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation) + 1, description='send options'})

        packet = packets.new('outgoing', 0x05B)
        packet["Target"] = npc.id
        packet["Option Index"] = destination.oi
        packet["_unknown1"] = 0
        packet["Target Index"] = npc.index
        packet["Automated Message"] = false
        packet["_unknown2"] = 0
        packet["Zone"] = zone
        packet["Menu ID"] = menu
        actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=true, delay = wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='complete menu'})

        return actions
    end,

    sub_commands = {
        ['return'] = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc

            log("Returning to town.")
            -- update request
            packet = packets.new('outgoing', 0x016)
            packet["Target Index"] = windower.ffxi.get_player().index
            actions:append(T{packet=packet, description='update request'})

            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 1
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
        port = function(current_activity, zone, p, settings)
            local actions = T{}
            local packet = nil
            local menu = p["Menu ID"]
            local npc = current_activity.npc

            log("Traveling through time...")
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
            actions:append(T{packet=packet, wait_packet=0x052, expecting_zone=true, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='warp request'})

            return actions
        end,
    },
    warpdata = T{
        ['Xarcabard [S]'] =             {index = 1, oi=1,   menu_id =458, permission = 0x00000002},
        ['Beaucedine Glacier [S]'] =    {index = 2, oi=2,   menu_id =458, permission = 0x00000004},
        ['Batallia Downs [S]'] =        {index = 3, oi=3,   menu_id =458, permission = 0x00000008},
        ['Rolanberry Fields [S]'] =     {index = 4, oi=4,   menu_id =458, permission = 0x00000010},
        ['Sauromugue Champaign [S]'] =  {index = 5, oi=5,   menu_id =458, permission = 0x00000020},
        ['Jugner Forest [S]'] =         {index = 6, oi=6,   menu_id =458, permission = 0x00000040},
        ['Pashhow Marshlands [S]'] =    {index = 7, oi=7,   menu_id =458, permission = 0x00000080},
        ['Meriphataud Mountains [S]'] = {index = 8, oi=8,   menu_id =458, permission = 0x00000100},
        ['Vunkerl Inlet [S]'] =         {index = 9, oi=9,   menu_id =458, permission = 0x00000200},
        ['Grauberg [S]'] =              {index = 10, oi=10, menu_id =458, permission = 0x00000400},
        ['Fort Karugo-Narugo [S]'] =    {index = 11, oi=11, menu_id =458, permission = 0x00000800},
        ['East Ronfaure [S]'] =         {index = 12, oi=12, menu_id =458, permission = 0x00001000},
        ['North Gustaberg [S]'] =       {index = 13, oi=13, menu_id =458, permission = 0x00002000},
        ['West Sarutabaruta [S]'] =     {index = 14, oi=14, menu_id =458, permission = 0x00004000},
        ['Garlaige Citadel [S]'] =      {index = 15, oi=18, menu_id =458, permission = 0x00040000},
        ['Crawlers\' Nest [S]'] =       {index = 16, oi=19, menu_id =458, permission = 0x00080000},
        ['Eldieme Necropolis [S]'] =    {index = 17, oi=20, menu_id =458, permission = 0x00100000},
    },
}
