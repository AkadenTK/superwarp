# superwarp

This is an addon for Windower4 for FFXI. It allows text commands to teleport using Homepoints, Waypoints, Survival Guides, Escha/Reis portals, and Unity NPC warps. There may be more coming. 

### Commands:

| Command | Action |
| --- | --- |
| //[sw] hp [warp] [all] zone_name [homepoint_number]  | Warp to a specified homepoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck). This, otherwise, works just like the homepoint addon, with additional shortcuts such as "entrance" (or simpler "e"), "auction" (or simpler "ah") or "mog" (or simpler "mh"). If the homepoint_number is omitted, the first homepoint will be chosen (from the mapping). |
| //[sw] hp [all] set  | Set the nearest homepoint as your home point. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck). |
| //[sw] wp [warp] [all] zone_name [waypoint_number]  | Warp to a specified waypoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck). This, otherwise, works just like the homepoint addon, with additional shortcuts such as "fs", "auction" (or simpler "ah") or "mog" (or simpler "mh"). If the waypoint_number is omitted, the first waypoint will be chosen (from the mapping). |
| //[sw] sg [warp] [all] zone_name  | Warp to a specified waypoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck).  |
| //[sw] ew [warp] [all] portal_number  | Warp to a specified portal in Escha/Reis zones. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck).  |
| //[sw] ew [all] enter  | Enters the Escha/Reis zones from the NPC in Qufim/Misareaux/Crags. "sw" is optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck).  |
| //[sw] un [warp] [all] zone_name  | Warp to a specified unity zone or unity wanted NM. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck).  |
| //[sw] ab [warp] [all] zone_name_or_conflux  | Warp to a specified abyssea entry zone or conflux number. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck).  |
| //[sw] ab [all] enter  | Enter the abyssea zone when next to a cavernous maw. "sw" is optional, and does nothing different. It's for those that require it because they've been trained to already. "all" will send an ipc message to all local instances of Windower with a delay (otherwise it could get stuck).  |

### Fuzzy Zone Names

Spaces and punctuation are ignored. So type "southernsand" all you want, buddy. You're going to Southern San d'oria. Also, if you ommit the homepoint/waypoint number, it'll just take the first one in the map. Favorites are available in the settings file (example follows):
```xml
<?xml version="1.1" ?>
<settings>
    <global>
        <favorites>
        	<homepoints>
        		<Norg>Auction House</Norg>
        		<PortBastok>Mog House</PortBastok>
        		<PortJeuno>2</PortJeuno>
        		<RuludeGardens>Auction House</RuludeGardens>
        	</homepoints>
        	<waypoints>
        		<ForetdeHennetiel>4</ForetdeHennetiel>
        	</waypoints>
        </favorites>
    </global>
</settings>
```

Further customization can be done with the Shortcuts section in the settings file. You can specify a zone only, enabling you to choose the subzone on the fly, or include a subzone and make it a full shortcut. Shortcut names must match exactly (case-insensitive) and must not have spaces.
```xml
<?xml version="1.1" ?>
<settings>
    <global>
        <shortcuts>
            <homepoints>
                <eado>
                    <sub_zone>Mog House</sub_zone>
                    <zone>Eastern Adoulin</zone>
                </eado>
                <wado>
                    <zone>Western Adoulin</zone>
                </wado>
            </homepoints>
            <waypoints>
                <foretjp>
                    <sub_zone>4</sub_zone>
                    <zone>Foret de Hennetiel</zone>
                </foretjp>
            </waypoints>
        </shortcuts>
    </global>
</settings>
```

### In-Zone warping
When handling the menu through the game's vanilla systems, warping between two homepoints or waypoints in the same zone sends a packet that moves your character without zoning out. Escha/Reis do this too. This is usually accompanied by a fade-to-black animation. When this occurs through Superwarp, no animations are played. It's faster, but it can look jarring. You can disable this behavior for some zones (Escha/Reis cannot be, because of the nature of the zone) with a setting: `<enable_same_zone_teleport>false</enable_same_zone_teleport>`. It is true by default. 

### Updates
#### v0.96
- **Feature**: Homepoints now uses same-zone teleporting feature.
- **Feature**: Homepoints now check enabled expansion content before warping. Before, if you warped to a zone that came in an expansion that is not enabled or installed, the character would get stuck until the expansion was enabled and installed.
- **Feature**: All warp systems check the currency required to teleport before teleporting. 
- **Resolved**: Escha and Waypoint systems now correctly consume currency.
- **Feature**: Survival Guides can now use tabs (Valor Points) to teleport instead of gil. Change the setting `<use_tabs_at_survival_guides>true</use_tabs_at_survival_guides>` to enable. If the character is out of tabs, it will switch back to gil and warn the user. This also respects the Thrifty Transit super kupower. 
- **Feature**: All warp systems check if you are already at the desired destination before warping.
- **Feature**: An option to simulate menu choice delay by a fixed number of seconds. Change the setting `<simulated_response_time>0</simulated_response_time>` to a number of seconds to wait between ***EACH*** menu packet sent. Teleports send between 2 and 4 packets that can be affected by this number, so be prepared to wait. This option is specifically designed to make packets sent look more like vanilla behavior.
- **Resolved**: Teleport packets now respect the game's normal order for sending to the client. The next menu option packets will wait for the response packets before continuing. This makes the teleporting take a little bit longer, but it looks much more like vanilla game behavior. 
- **Feature**: Added custom shortcuts. Configured in the settings file, an exact phrase can be specified (e.g. "wado" for "Western Adoulin") that resolves to a zone name or a zone + subzone combination.
- **Feature**: When Superwarp detects that the event has been skipped while mid-teleport, it can retry immediately. Additionally with a new setting, it will enable "fast" mode for the next attempt. Fast mode does not wait for the response packets and removes any simulated menu choice delays. The hope is to fire off the teleport packets to get you out of there ASAP. To enable this option change the setting `<enable_fast_retry_on_interrupt>true</enable_fast_retry_on_interrupt>`.
- **Improvement**: The retry system has been improved. Superwarp has more control over when a retry is attempted. This should mean less issues when the client lags. Retries occur when the warp NPC cannot be found, is out of range, or when the event is skipped.
- **Resolved**: Same-zone teleports now correctly orient your character on arrival. 
- **Resolved**: All same-zone teleports now have fully accurate arrival coordinates. The packet sent matches vanilla exactly.
- **Improvement**: The reset functionality when an error occurs with Superwarp has been improved. This should get your character out of "stuck in menu" issue more often. Ideally, you should never have to use this feature.
