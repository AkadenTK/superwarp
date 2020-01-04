return T{
	short_name = 'ew',
	long_name = 'eschan portal',
	npc_names = T{
		warp = T{'Eschan Portal', 'Ethereal Ingress'},
		enter = T{'Undulating Confluence', 'Dimensional Portal'},
	},
	help_text = "[sw] ew [warp/w] [all/a/@all] portal number -- warp to a designated portal in your current escha zone.\n[sw] ew [all/a/@all] enter -- enter the eschan zone corresponding to the entrance zone.",
	sub_zone_targets =  S{'1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14','15' },
	auto_select_zone = function(zone)
		if zone == 288 then return 'Escha Zi\'tah' end
		if zone == 289 then return 'Escha Ru\'an' end
		if zone == 291 then return 'Reisenjima' end
	end,
	build_warp_packets = function(current_activity, zone, p, settings)
		local actions = T{}
		local packet = nil
		local menu = p["Menu ID"]
		local npc = current_activity.npc
		local destination = current_activity.activity_settings

		local silt_stock = p["Menu Parameters"]:unpack('i', 21)

		debug('silt '..silt_stock)
		if silt_stock < 1000 then
            packet = packets.new('outgoing', 0x05B)
            packet["Target"] = npc.id
            packet["Option Index"] = 0
            packet["_unknown1"] = 16384
            packet["Target Index"] = npc.index
            packet["Automated Message"] = false
            packet["_unknown2"] = 0
            packet["Zone"] = zone
            packet["Menu ID"] = menu
            actions:append(T{packet=packet, description='cancel menu', message='Not enough Silt!'})
            return actions
		end

		if zone == destination.zone then
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

			packet["Option Index"] = 1
			packet["_unknown1"] = destination.index
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
        	actions:append(T{packet=packet, wait_packet=0x052, delay=wiggle_value(settings.simulated_response_time, settings.simulated_response_variation), description='same-zone move request'})

			-- complete menu
			packet = packets.new('outgoing', 0x05B)
			packet["Target"] = npc.id
			packet["Target Index"] = npc.index
			packet["Zone"] = zone
			packet["Menu ID"] = menu

			packet["Option Index"] = 2
			packet["_unknown1"] = 0
			packet["Automated Message"] = false
			packet["_unknown2"] = 0
        	actions:append(T{packet=packet, wait_packet=0x052, delay=1, description='complete menu'})
		else
			packet["Target"] = npc.id
			packet["Option Index"] = 0
			packet["_unknown1"] = 16384
			packet["Target Index"] = npc.index
			packet["Automated Message"] = false
			packet["_unknown2"] = 0
			packet["Zone"] = zone
			packet["Menu ID"] = menu
            actions:append(T{packet=packet, description='cancel menu', message='WARNING: not in correct zone!'})
		end

		return actions
	end,
	sub_commands = {
		enter = function(current_activity, zone, p, settings)
			local actions = T{}
			local packet = nil
			local menu = p["Menu ID"]
			local npc = current_activity.npc

			local oi = 0

			-- qufim or misareaux
			if zone == 126 or zone == 25 then oi = 1 end
			-- La theine, konschtat or tahrongi
			if zone == 102 or zone == 108 or zone == 117 then oi = 2 end

			if oi == 0 then -- we're not in an entry zone...
				-- send the cancel menu packet.
				packet = packets.new('outgoing', 0x05B)
				packet["Target"] = npc.id
				packet["Option Index"] = 0
				packet["_unknown1"] = 16384
				packet["Target Index"] = npc.index
				packet["Automated Message"] = false
				packet["_unknown2"] = 0
				packet["Zone"] = zone
				packet["Menu ID"] = menu
            	actions:append(T{packet=packet, description='cancel menu', message='WARNING: not in an entry zone!'})
			else
				log("Entering Escha...")
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
	            packet["Option Index"] = oi
	            packet["_unknown1"] = 0
	            packet["Target Index"] = npc.index
	            packet["Automated Message"] = false
	            packet["_unknown2"] = 0
	            packet["Zone"] = zone
	            packet["Menu ID"] = menu
            	actions:append(T{packet=packet, wait_packet=0x052, delay=2, description='complete menu'})
			end

			return actions
		end,
	},
    ['Escha Zi\'tah'] = T{
        ['1'] = { index = 0, zone = 288, npc = 586, x = -343.00003051758, z = -0.070000000298023, y = -172.00001525879, h = 0, unknown1 = 2},
        ['2'] = { index = 1, zone = 288, npc = 587, x = -303, z = -0.030000001192093, y = 308, h = 191, unknown1 = 65538},
        ['3'] = { index = 2, zone = 288, npc = 588, x = -261, z = 0.6700000166893, y = -16, h = 191, unknown1 = 131074},
        ['4'] = { index = 3, zone = 288, npc = 589, x = -110.00000762939, z = 0.12000000476837, y = -241.00001525879, h = 63, unknown1 = 196610},
        ['5'] = { index = 4, zone = 288, npc = 590, x = 245.00001525879, z = 0.27000001072884, y = -148, h = 0, unknown1 = 262146},
        ['6'] = { index = 5, zone = 288, npc = 591, x = 452.00003051758, z = 1.3900001049042, y = -344.00003051758, h = 191, unknown1 = 327682},
        ['7'] = { index = 6, zone = 288, npc = 592, x = 191.00001525879, z = 0.20000000298023, y = -318, h = 0, unknown1 = 393218},
        ['8'] = { index = 7, zone = 288, npc = 593, x = -134, z = 1.8000000715256, y = -454.00003051758, h = 159, unknown1 = 458754},
        --elvorseal x = -2, z = 0, y = 59.500003814697, h = 16129, unknown1 = 12
    },
    ['Escha Ru\'an'] = T{
        ['1'] = { index = 8,   zone = 289, npc = 752, x = 10, z = -34, y = -464.00003051758, h = 191, unknown1 = 524290},
        ['2'] = { index = 9,   zone = 289, npc = 753, x = -275.5, z = -40.500003814697, y = -378.50003051758, h = 223, unknown1 = 589826},
        ['3'] = { index = 10,  zone = 289, npc = 754, x = -454.00003051758, z = -3.5000002384186, y = -147.5, h = 127, unknown1 = 655362},
        ['4'] = { index = 11,  zone = 289, npc = 755, x = -452.50003051758, z = -71.42000579834, y = -307.5, h = 223, unknown1 = 720898},
        ['5'] = { index = 12,  zone = 289, npc = 756, x = -444.50003051758, z = -40.500003814697, y = 144, h = 0, unknown1 = 786434},
        ['6'] = { index = 13,  zone = 289, npc = 757, x = -280.5, z = -3.5000002384186, y = 386.50003051758, h = 159, unknown1 = 851970},
        ['7'] = { index = 14,  zone = 289, npc = 758, x = -431.50003051758, z = -71.850006103516, y = 335.50003051758, h = 31, unknown1 = 917506},
        ['8'] = { index = 15,  zone = 289, npc = 759, x = 0, z = -40.500003814697, y = 466.50003051758, h = 63, unknown1 = 983042},
        ['9'] = { index = 16,  zone = 289, npc = 760, x = 278.5, z = -3.6300001144409, y = 384.00003051758, h = 223, unknown1 = 1048578},
        ['10'] = { index = 17, zone = 289, npc = 761, x = 186.00001525879, z = -71.850006103516, y = 514.5, h = 95, unknown1 = 1114114},
        ['11'] = { index = 18, zone = 289, npc = 762, x = 444.50003051758, z = -40, y = 144, h = 127, unknown1 = 1179650},
        ['12'] = { index = 19, zone = 289, npc = 763, x = 454.50003051758, z = -3.6000001430511, y = -147.5, h = 0, unknown1 = 1245186},
        ['13'] = { index = 20, zone = 289, npc = 764, x = 546.5, z = -71.5, y = -17, h = 127, unknown1 = 1310722},
        ['14'] = { index = 21, zone = 289, npc = 765, x = 275, z = -40.500003814697, y = -377.50003051758, h = 159, unknown1 = 1376258},
        ['15'] = { index = 22, zone = 289, npc = 766, x = -1.2000000476837, z = -52.000003814697, y = -581.5, h = 191, unknown1 = 1441794},
        --elvorseal x = 0, z = -43.600002288818, y = -238.00001525879, h = 48897, unknown1 = 12
    },
	['Reisenjima'] = T{
        ['1'] = {  index = 23, zone = 291, npc = 824, x = -495.44003295898, z = -19, y = -476.48001098633, h = 0, unknown1 = 1507330},
        ['2'] = {  index = 24, zone = 291, npc = 825, x = -404.00003051758, z = -55.000003814697, y = 86.000007629395, h = 63, unknown1 = 1572866},
        ['3'] = {  index = 25, zone = 291, npc = 826, x = -530.40002441406, z = -50.000003814697, y = 399.75003051758, h = 95, unknown1 = 1638402},
        ['4'] = {  index = 26, zone = 291, npc = 827, x = -554.40002441406, z = -48.750003814697, y = 602, h = 191, unknown1 = 1703938},
        ['5'] = {  index = 27, zone = 291, npc = 828, x = 107.00000762939, z = -75.400001525879, y = 599, h = 63, unknown1 = 1769474},
        ['6'] = {  index = 28, zone = 291, npc = 829, x = 243.50001525879, z = -87.400001525879, y = 106.00000762939, h = 127, unknown1 = 1835010},
        ['7'] = {  index = 29, zone = 291, npc = 830, x = 641.60003662109, z = -374.00003051758, y = -912.20007324219, h = 159, unknown1 = 1900546},
        ['8'] = {  index = 30, zone = 291, npc = 831, x = -368.72003173828, z = -113.30000305176, y = 212.45001220703, h = 63, unknown1 = 1966082},
        ['9'] = {  index = 31, zone = 291, npc = 832, x = -581, z = -417.40002441406, y = -1065, h = 0, unknown1 = 2031618},
        ['10'] = { index = 32, zone = 291, npc = 833, x = -390.22003173828, z = -439.71002197266, y = -835.13006591797, h = 0, unknown1 = 2097156},
        --elvorseal x = 640, z = -372.00003051758, y = -921.00006103516, h = 24321, unknown1 = 12
    },
}