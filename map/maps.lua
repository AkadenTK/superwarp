local maps =  {
    ['homepoints'] = require('map/homepoints'),
    ['waypoints'] = require('map/waypoints'),
    ['guides'] = require('map/guides'),
    ['escha'] = require('map/escha'),
    ['unity'] = require('map/unity'),
    ['abyssea'] = require('map/abyssea'),
    ['protowaypoints'] = require('map/protowaypoints'),
    ['portals'] = require('map/portals'),
    ['voidwatch'] = require('map/voidwatch'),
    ['spd'] = require('map/spd'),
    ['sortie'] = require('map/sortie'),
    ['odyssey'] = require('map/odyssey'),
    ['temenos'] = require('map/temenos'),
    ['apollyon'] = require('map/apollyon')
}

for _, map in pairs(maps) do
    for zone_name, zone_data in pairs(map.warpdata) do
        if not zone_data.index then
            for key, npc in pairs(zone_data) do
                npc.key = key
            end
        end
    end
end

return maps