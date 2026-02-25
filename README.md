# superwarp

This is an addon for Windower4 for FFXI. It allows text commands to teleport using Homepoints, Waypoints, Proto-Waypoints, Survival Guides, Escha Portals and Reisenjima Ingresses, Voidwatch and Unity NPCs, Abyssea Confluxes, Runic Portals, Odyssey Confluxes and Translocators, and Sortie Gadgets, Bitzers, and Devices, Temenos Matter Diffusion Modules and Apollyon Swirling Vortices.

### Commands:
The //sw command prefix can now be used for all maps. It may still be used in the manner it was previously if the user so desired.

#### Homepoint Commands
| Command | Action |
| --- | --- |
| //[sw] hp [warp] [all/party] zone_name [homepoint_number]  | Warp to a specified homepoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). This, otherwise, works just like the homepoint addon, with additional shortcuts such as "entrance" (or simpler "e"), "auction" (or simpler "ah") or "mog" (or simpler "mh"). If the homepoint_number is omitted, the first homepoint will be chosen (from the mapping). |
| //[sw] hp [all/party] set  | Set the nearest homepoint as your home point. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). |
| //[sw] hp [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
|alt cmd: ho |

#### Waypoint Commands
| Command | Action |
| --- | --- |
| //[sw] wp [warp] [all/party] zone_name [waypoint_number]  | Warp to a specified waypoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). This, otherwise, works just like the homepoint addon, with additional shortcuts such as "fs" (for Frontier Station), "auction" (or simpler "ah") or "mog" (or simpler "mh"). If the waypoint_number is omitted, the first waypoint will be chosen (from the mapping). |
| //[sw] pwp [warp] [all/party] zone_name  | Warp to a specified proto-waypoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). |
| //[sw] wp [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
| //[sw] pwp [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
|alt wp cmd: wa |
|alt pwp cmd: pw |

#### Survival Guide Commands
| Command | Action |
| --- | --- |
| //[sw] sg [warp] [all/party] zone_name  | Warp to a specified waypoint. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] sg [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
|alt cmd: sur |

#### Escha Commands
| Command | Action |
| --- | --- |
| //[sw] ew [warp] [all/party] portal_number  | Warp to a specified portal in Escha/Reis zones. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] ew [all/party] enter  | Enters the Escha/Reis zones from the NPC in Qufim/Misareaux/Crags. "sw" is optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] ew [all/party] domain  | Aquires Elvorseal if it is available and your character does not already have it, then teleports to the area where the Domain Invasion dragon will apper.  |
| //[sw] ew [all/party] domain return  | Returns the Elvorseal status effect if your character has it.  |
| //[sw] ew [all/party] exit  | Leaves the Escha/Reis zones from the undulating confluenc or dimensional portal in within the zone. "sw" is optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] ew [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. Note: this can only be done inside a zone, and only for the zone you are currently in. |
|alt cmds: es / ea |

#### Unity Commands
| Command | Action |
| --- | --- |
| //[sw] un [warp] [all/party] zone_name  | Warp to a specified zone or the correct zone for a specified Unity NM. If an NM is specified, Superwarp will display the coordinates for the spawn NPCs. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] un [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
|alt cmd: uy |

#### Abyssea Commands
| Command | Action |
| --- | --- |
| //[sw] ab [warp] [all/party] zone_name_or_conflux  | Warp to a specified abyssea entry zone or conflux number. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] ab [all/party] enter  | Enter the abyssea zone when next to a cavernous maw. "sw" is optional, and does nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] ab [all/party] exit  | Leave the abyssea zone when next to a cavernous maw. "sw" is optional, and does nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] ab [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. Note: this can only be done inside a zone, and only for the zone you are currently in. |
|alt cmd: aa |

#### Runic Portal Commands
| Command | Action |
| --- | --- |
| //[sw] po [warp] [all/party] staging_point  | Warp to a specified assault staging point. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] po [all/party] assault  | Be taken to your current assault mission staging point. "sw" is optional, and does nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] po [all/party] return  | Leave the assault staging area and return to Whitegate. "sw" is optional, and does nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] po [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
|alt cmd: ps |

#### Voidwatch Commands
| Command | Action |
| --- | --- |
| //[sw] vw [warp] [all/party] zone_name  | Warp to a specified zone through the Voidwatcher NPC. Note that you cannot warp to the past from the present (or vice versa). "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] vw [all/party] missing [max]  | List out which destinations are still locked. The optional max parameter is a maximum number of lines to display. Default: all. |
|alt cmds: vo |

#### Sortie
| Command | Action |
| --- | --- |
| //[sw] so [warp] [all/party] s/a/b/c/d OR 0/1/2/3/4 | Warp to a specified device by number. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).  |
| //[sw] so [all/party] port | Warp via the nearby gadget or bitzer. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). |
| //[sw] so [all/party] normal | Set Aminon difficulty to normal and enter his chamber. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). |
| //[sw] so [all/party] hard | Set Aminon difficulty to hard (deepest dark) and enter his chamber. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck). |
|alt cmd: se |

#### Odyssey
| Command | Action |
| --- | --- |
|//[sw] od [warp] [all/party] 1/2/3 | Warp to a specified translocator by number. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] od [all/party] port | Warp to the other side of the Veridical Conflux "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] od [all/party] exit | Exit the Odyssey zone. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|alt cmd: oy |

#### Limbus
| Command | Action |
| --- | --- |
|//[sw] li [warp] [all/party] nw1/sw2/ne3/se4 | Warp to any specified tower/floor by letters&number. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] li [all/party] port | Warp to the next floor irrespective of data or if on last floor will warp the user to the entrance, from the entrance specify a letter&number to start a new tower or use the next or random command. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] li [all/party] back | Warp to the previous floor irrespective of data or if on first floor will warp the user to the entrance, from the entrance specify a letter&number to start a new tower or use the next or random command. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] li [all/party] next | Warps you to the lowest floor you have NOT collected data for. Sophisticated decision making. Enjoy. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] li [all/party] random | Warps you to a floor you have NOT collected data for in a shuffled order; Use this to seperate from crowd of people climbing. Enjoy. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] li [all/party] enter| Enter the Apollyon zone. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] li [all/party] exit | Exit the Apollyon zone. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|alt cmds: te / ap |

#### Campaign (New!)
| Command | Action |
| --- | --- |
|//[sw] ca [warp] [all/party] | warp to a designated [S] zone via a Campaign Arbiter in a [S] city. "sw" and "warp" are optional, and do nothing different. It's for those that require it because they've been trained to already. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] ca [all/party] return | return to your [S] home nation. via any [S] 2 initial field NPC i.e. Amaliya, C.A. . "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|alt cmd: cn |

#### Incursion (New!)
| Command | Action |
| --- | --- |
|//[sw] in [warp] [all/party] [part of boss name] | warp to a designated boss chamber inside Incursion. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] in missing| Check which destinations you lack, incase you wanted to do it; I wrote it so i'm putting it in here. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|alt cmd: inc |

#### Walk Of Echoes (New!)
| Command | Action |
| --- | --- |
|//[sw] woe [all/party] zone| Zone into or out of the Walk Of Echoes zone. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] woe [all/party] enter | Enter a battlefield you are standing within 6 yalms of while inside Walk Of Echoes. (There is no point at which more than one conflux is <= 6 yalms.) "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|//[sw] woe [all/party] exit | Exit a battlefield inside Walk Of Echoes. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).
|alt cmd: we |

#### The Superwarp™ (New!)
| Command | Action |
| --- | --- |
| //sw [a/p]  Passes the appropriate command for the circumstance. Some users might consider a hotkey for this, like alt + S to pass the smartcommand with no typing and no macro. "all" and "party" will send an ipc message to all local instances (or specific local party members) with a delay (otherwise it will get stuck).

#### Misc. Commands
| Command | Action |
| --- | --- |
| //sw debug  | Toggles debug mode which displays debug messages in the log. If debug mode was off, will display the debug logs of the last warp command as well.   |
| //sw missing | Displays the destinations the user is missing from the warp system nearest you where applicable. |
| //sw cancel [all/party]  | Cancels the current in-progress warp.   |
| //sw reset [all/party]  | Resets client menu lock. This should be exceedingly rare, but it's here in case it's needed.   |

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

### Locked homepoints and waypoints
Superwarp is no longer able to warp to locations you have not unlocked yet. Square has started checking serverside. 

### Multi-boxing features
Every command can be sent to all characters by prepending the "all" or "party" keyword before the zone name and sub-zone destination or the sub-command. This will send the same command to all characters on the same machine or all characters on the same machine in the same party and delay their responses to prevent Square-Enix's servers from rejecting duplicate packets.

The default behavior of Superwarp is to cancel the in-game follow and autorun during a warp/sub-command event. But to disable this (for some reason), there is an option in the settings.xml file.

An option is available to apply a windower command before a warp/sub-command begins as well as on arrival. The use case is really infinite, but the goal was to enable the user to disable follow addons during a warp or sub-command event. Bonus feature! Prank your friends by setting the command before starting a warp to `sw cancel`. (Don't actually, I'm the one that will get a message about it not working)

### Special thanks
Thanks to Ivaar and Thorny for their work on figuring out the waypoint currency data packs. Without them the waypoint system wouldn't function properly at all.

Thanks to Kenshi for helping collect data about same-zone warp coordinates accurately.

Thanks to Ivaar for also helping with the elvorseal state and receive packets, data for unlocked homepoints, waypoints and survival guides, and for helping with the client menu-lock reset functions.

Thanks to Lili for researching a better fuzzy matching logic.

Thanks to Staticvoid for researching and implementing the Sortie, Odyssey, Temenos, Apollyon and Campaign warp systems.

### Updates
#### v0.96
- **Feature**: Homepoints now uses same-zone teleporting feature.
- **Feature**: Homepoints now check enabled expansion content before warping. Before, if you warped to a zone that came in an expansion that is not enabled or installed, the character would get stuck until the expansion was enabled and installed.
- **Feature**: All warp systems check the currency required to teleport before teleporting. 
- **Feature**: An option has been added to check for unlock status of homepoints, waypoints, and survival guides. To enable unlock checks, set the following setting: `<enable_locked_warps>false</enable_locked_warps>`. This option is TRUE by default, meaning that Superwarp will let you warp there even if you don't have it unlocked.
- **Feature**: When in escha or Reisenjima, use the sub-command "domain" to aquire elvorseal if the status is not already applied and teleport to the target Domain Invasion arena. If the option to acquire elvorseal is not available, the command will warn in the log and cancel. To return the status before the fight is over, use the sub-command "domain return"
- **Resolved**: Escha and Waypoint systems now correctly consume currency.
- **Feature**: Waypoints warp system can now teleport to rune locations.
- **Feature**: Proto-waypoints are now supported under the system "pwp".
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
- **Imprevement**: When submitting multiple actions accidentally, superwarp will prevent the second attempt. To cancel an in-progress warp type `//sw cancel` or `//sw cancel all`. 
- **Improvement**: Client menu locks should be far less frequent (they were quite infrequent before, but it should be less frequent still). If the warp somehow manages to stall, don't talk to the NPC manually. Instead do `//sw reset` to reset the menu lock before reattempting.
- **Improvement**: Menu ID and NPC IDs are validated when a new menu packet arrives. Odd out-of order things happen sometimes, this aims to prevent issues. 

#### v0.96.1
- **Feature**: Escha and Abyssea systems now have an Exit subcommand.
- **Feature**: Added ability to disable autorun and /follow before starting a warp or using a sub command
- **Feature**: Added ability to run a windower command before starting a warp or using a sub command as well as at arrival time. A delay option is also in place for timing the arrival command.
- **Resolved**: Outdoor Adoulin areas send the correct final menu packet when warping between waypoints in the same zone. No change in anything noticable, but it's nice to be exactly correct.

#### v0.96.2
- **Resolved**: Exiting Abyssea should work again.
- **Feature**: Added option to target warp NPC before initiating. 
- **Feature**: Added option to simulate client lock during a warp. This will prevent your character from moving until the warp is complete. //sw reset will also clear this state.
- **Resolved**: Somehow managing to unload superwarp during a warp/subcommand will now reset the state first (to prevent soft and client locks).
- **Resolved**: Sub commands will now retry if the npc hasn't loaded yet or isn't near, like warp systems.
- **Resolved**: Survival guides under thrifty transit now work with the menu id validation

#### v0.96.3
- **Resolved**: Removed option to warp to locations you have not unlocked yet as the July update broke this functionality for good. 

#### v0.97
- **Feature**: Added runic portals ("po")
- **Improvement**: New option to send to all characters in an order mode (me-first, me-last, or just alphabetical)
- **Feature**: New option to send to just party members. Other key words that work: party, p, @party. Uses above order mode too.
- **Improvement**: Separated sendall logic into a copyable library. Enjoy!
- **Improvement**: Added fuzzy logic from Lili. Thanks!

#### v0.97.1
- **Feature**: Added command to detect destinations that have yet to be unlocked.

#### v0.97.2
- **Feature**: Added setting to direct log messages to console instead, or turn off entirely.

#### v0.97.3
- **Resolved**: Homepoint indices for Ru'lude and Qufim have been updated (changed after update).

### v0.97.4
- **Resolved**: Fixed issue warping with voidwatch
- **Improvement**: Documented voidwatch commands (oops!)

#### v0.98
- **Resolved**: Several bug fixes.

#### v0.99
- **Feature**: Sortie warp system added.

#### v1.0
- **Feature**: Odyssey warp system added.
- **Resolved**: Sortie: Resolved lock-up when warping to or from Aminon. Be sure to set your destination before warping to Aminon. Superwarp will cancel the warp and warn the user if it is not set.
- **Resolved**: Sortie: Fix for sometimes being immediately warped out from a boss room.
- **Improvement**: Sortie: More consistent handling of origination gadget.

#### v1.0.1
- **Feature**: Sortie: Added repop, Aminon normal, Aminon hard commands.
- **Resolved**: Sortie: Fixed a bug that could cause the casket to spawn next to Bitzer #D instead of entrance of sector H.
- **Improvement**: Sortie: Added chatlog display for warps done with the port, normal and hard commands.
- **Improvement**: Sortie: Updated Help text.
- **Feature**: Odyssey: Added exit command.
- **Improvement**: Odyssey: Added chatlog display for warps done with the port command.
- **Improvement**: Added map labels to increase readability when using the //sw help command in-game.

#### v1.0.2
- **Resolved**: Sortie: fixed menu structure for update

#### v1.0.3
- **Resolved**: Limbus: Some NPC targets are not updated correctly in packets, resolve issue teleporting.
- **Resolved**: Sortie: fixed menu structure (again)

#### v1.0.4
- **Feature**: Campaign warp system added.
- **Resolved**: A bug that could occur with higher send_all_delay setting where one or more characters would fail to warp.
- **Improvement**: Help text readability.
- **Improvement**: Added shortcut in apollyon for entrance.

#### v1.1
- **Feature**: All commands for all maps can now be dispatched with 'sw'.
- **Feature**: Introducing The Superwarp. A new general command that uses logic to become the appropriate command based on the circumstances. Give it a spin.
- **Feature**: The 'next' and 'random' commands for the Limbus map now have the ability to track the chests you open and will always send you to the 4th-to-last chest you opened in sequence irrespective of repeat opens. If you received 5k from a chest and wish to try the same chest again, the tracking will ignore the repeat open. Multiboxers will wish to rotate regardless since opening different chests with different characters is a headache.
- **Feature**: Incursion warp system added.
- **Feature**: Walk Of Echoes warp system added.
- **Feature**: New command (port) added to Campaign map to travel back and forward through Cavernous Maws.
- **Improvement**: Homepoints now defaults to the most popular homepoint of frequently visited zones when a sub-command is not specified; This allows the user to leverage the fuzzyfind feature and command interpretation to execute common warps with very little typing. Examples - '//sw no' = Norg #2, '//sw eas' = Eastern Adoulin #2 with no custom alias configuration. 
- **Improvement**: Waypoints now default to the Frontier Station of non-town zones when a sub-zone destination is not given, defaults to AH for Eastern Adoulin, and MH for Western Adoulin.
- **Improvement**: (Waypoints) Shortcut added to more easily travel to Frontier Station; There are now multiple accepted inputs such as 'front' and 'frontier' to go these WPs. Some users may have struggled with this in the past if unaware of the pre-programmed 'fs' alias.
- **Improvement**: Sortie Device warps now default to S device when a destination is not specified. i.e. //sw
- **Improvement**: Help text readability.
- **Resolved**: (Proto-waypoints) Zoning and warping back to the same location of the same zone is now guarded against.
- **Resolved**: (Survival-Guides) Zoning and warping back to the same location of the same zone is now guarded against.
- **Resolved**: (Abyssea) Warping to the same location is now guarded against.
- **Resolved**: An issue wherein loading or reloading superwarp on multiple characters simultaneously could flash the settings.xml file, resetting to default values. Each character now has their own xml file.
- **Resolved**: Minor bugs.
