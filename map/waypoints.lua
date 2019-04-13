return T{
	short_name = 'wp',
	long_name = 'waypoint',
	npc_name = 'Waypoint',
	move_in_zone = true,
	build_warp_packets = function(id, index, zone, menu, settings)
		local p = {}
		local packet = packets.new('outgoing', 0x05B)

		-- menu change
		packet["Target"] = id
		packet["Target Index"] = index
		packet["Zone"] = zone
		packet["Menu ID"] = menu

		packet["Option Index"] = settings.index
		packet["_unknown1"] = 0
		packet["Automated Message"] = true
		packet["_unknown2"] = 0
		packet.debug_desc = 'menu change'
		p[1] = packet

		-- request warp
		packet = packets.new('outgoing', 0x05B)
		packet["Target"] = id
		packet["Target Index"] = index
		packet["Zone"] = zone
		packet["Menu ID"] = menu

		packet["Option Index"] = settings.index
		packet["_unknown1"] = 0
		packet["Automated Message"] = false
		packet["_unknown2"] = 0
		packet.debug_desc = 'zone warp request'
		p[2] = packet

		return p
	end,
	['Western Adoulin'] = {
		['Platea'] = { shortcut = '1' },
		['Triumphus'] = { shortcut = '1' },
		['Pioneers'] = { shortcut = '2' },
		['Mummers'] = { shortcut = '3' },
		['Inventors'] = { shortcut = '4' },
		['Auction House'] = { shortcut = '5' },
		['Mog House'] = { shortcut = '6' },
		['Bridge'] = { shortcut = '7' },
		['Airship'] = { shortcut = '8' },
		['Docks'] = { shortcut = '8' },
		['Waterfront'] = { shortcut = '9' },
		['1'] = { index = 1, x = 4.896, z = 0, y = -4.789, },
		['2'] = { index = 2, x = -110.5, z = 3.85, y = -13.482, },
		['3'] = { index = 3, x = -20.982, z = -0.15, y = -79.891, },
		['4'] = { index = 4, x = 91.451, z = -0.15, y = -49.013, },
		['5'] = { index = 5, x = -68.099, z = 4, y = -73.672, },
		['6'] = { index = 6, x = 5.731, z = 0, y = -123.043, },
		['7'] = { index = 7, x = 174.783, z = 3.85, y = -35.788, },
		['8'] = { index = 8, x = 14.586, z = 0, y = 162.608, },
		['9'] = { index = 9, x = 51.094, z = 32, y = 126.299, },
	},
	['Eastern Adoulin'] = {
		['Peacekeepers'] = { shortcut = '1' },
		['Scouts'] = { shortcut = '2' },
		['Statue'] = { shortcut = '3' },
		['Goddess'] = { shortcut = '3' },
		['Wharf'] = { shortcut = '4' },
		['Yahse'] = { shortcut = '4' },
		['Mog House'] = { shortcut = '5' },
		['Auction House'] = { shortcut = '6' },
		['Sverdhried'] = { shortcut = '7' },
		['Hillock'] = { shortcut = '7' },
		['Hill'] = { shortcut = '7' },
		['Coronal'] = { shortcut = '8' },
		['Esplanade'] = { shortcut = '8' },
		['Castle'] = { shortcut = '9' },
		['Gates'] = { shortcut = '9' },
		['1'] = { index = 21, x = -101.274, z = -0.15, y = -10.726, },
		['2'] = { index = 22, x = -77.944, z = -0.15, y = -63.926, },
		['3'] = { index = 23, x = -46.838, z = -0.075, y = -12.767, },
		['4'] = { index = 24, x = -57.773, z = -0.15, y = 85.237, },
		['5'] = { index = 25, x = -61.865, z = -0.15, y = -120.81, },
		['6'] = { index = 26, x = -42.065, z = -0.15, y = -89.979, },
		['7'] = { index = 27, x = 11.681, z = -22.15, y = 29.976, },
		['8'] = { index = 28, x = 27.124, z = -40.15, y = -60.844, },
		['9'] = { index = 29, x = 95.994, z = -40.15, y = -74.541, },
	},
	['Yahse Hunting Grounds'] = {
		['Frontier Station'] = { index = 31 },
		['1'] = { index = 32 },
		['2'] = { index = 33 },
		['3'] = { index = 34 },
	},
	['Ceizak Battlegrounds'] = {
		['Frontier Station'] = { index = 41 },
		['1'] = { index = 42 },
		['2'] = { index = 43 },
		['3'] = { index = 44 },
	},
	['Foret de Hennetiel'] = {
		['Frontier Station'] = { index = 51 },
		['1'] = { index = 52 },
		['2'] = { index = 53 },
		['3'] = { index = 54 },
		['4'] = { index = 55 },
	},
	['Morimar Basalt Fields'] = {
		['Frontier Station'] = { index = 61 },
		['1'] = { index = 62 },
		['2'] = { index = 63 },
		['3'] = { index = 64 },
		['4'] = { index = 65 },
		['5'] = { index = 66 },
	},
	['Yorcia Weald'] = {
		['Frontier Station'] = { index = 71 },
		['1'] = { index = 72 },
		['2'] = { index = 73 },
		['3'] = { index = 74 },
	},
	['Marjami Ravine'] = {
		['Frontier Station'] = { index = 81 },
		['1'] = { index = 82 },
		['2'] = { index = 83 },
		['3'] = { index = 84 },
		['4'] = { index = 85 },
	},
	['Kamihr Drifts'] = {
		['Frontier Station'] = { index = 91 },
		['1'] = { index = 92 },
		['2'] = { index = 93 },
		['3'] = { index = 94 },
		['4'] = { index = 95 },
	},
	['Jeuno'] = { index = 100 },
	['Rala'] = { index = 300 },
	['Waterways'] = { index = 300 },
	['Cirdas'] = { index = 301 },
	['Caverns'] = { index = 301 },
	['Yorcia'] = { index = 302 },
	['Weald'] = { index = 302 },
	['Outer'] = { index = 303 },
	['Ra\'Kaznar'] = { index = 303 },
}