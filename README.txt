Muzzle

A LOTRO (Lord of The Rings Online) Lua Plugin.


Short Description:

Muzzle trolls, spam, and keywords with a customizable list.


Long Description:

Muzzle trolls, spam, and keywords by filtering chat with a list of player names and keywords. Muzzle accomplishes this by forwarding wanted chat to the Standard channel, and leaving out unwanted chat.  Muzzle never prevents you from grouping, trading, or playing with other players, even if they are Muzzled.


New features:

+ Highlight messages to your player name in world chat.
+ An option for the filtering of trade channel within Configuration.lua and via toggle. <See Commands>


Suggested Usage:

Create a new chat tab for World chat.
It's recommended to rename this tab to 'Unmuzzled' or just '.',
and not pay any attention to this tab.
Right-click this tab. On the menu choose 'Change Filters',
and tick on 'World'.

Create another new tab for Standard.
It's recommended to rename this tab to 'Muzzled',
to signify that this is the tab you will want to read the chat from.
Right-click this tab. On the menu choose 'Change Filters',
and tick on 'Standard'.
Then left click the Chat Bubble icon to the bottom left of
the chat. On the menu choose 'Output Channel'
and tick on 'World'.


Installation:

Required Prerequisite: Turbine Utilities
https://www.lotrointerface.com/downloads/info1064-TurbineUtilities.html

Failure have Turbine Utilities installed may give an error like:
..f the Rings Online\Plugins\GitForked\Muzzle\Main.lua:187: attempt to index field 'UI' (a nil value)

Unzip or 'Extact All' of the Muzzle*.zip into the proper plugin folder as described below.

Installation folder for Linux or Steam:
.steam/steam/steamapps/compatdata/212500/pfx/dosdevices/c:/users/steamuser/My Documents/The Lord of the Rings Online/Plugins/

Installation folder for Windows:
c:/users/<USERNAME>/My Documents/The Lord of the Rings Online/Plugins/

If the 'Plugins' folder does not exist, create it.

The folder structure should look like:
../Plugins/GitForked/Muzzle

Log in to the LOTRO game and your server, and on the right side of the character select screen click the button for 'Manage Plugins'.
Click the green refresh arrow to refresh the list of plugins installed.
Find 'Muzzle' in the list and left click it.
Under 'About', change 'Automatically Load For' to 'All Characters'.


Commands:

/Muzzle reload
Will reload the Muzzle plugin. This is useful if you have added names or keywords, since a reload is required for the new names or keywords to take effect.  This command prevents having to log your character out and back in.

/Muzzle name
Display your player name.

/Muzzle version
Display the version of the Muzzle plugin.

/Muzzle fonts
Display the font colors configuration (set in Configuration.lua).

/Muzzle verbose
Toggle to enable or disable verbose mode (for debugging your list).

/Muzzle trade
Toggle to enable or disable filtering of the trade channel.

/Muzzle ?
Display the Muzzle Help Menu.


Special Thanks:

To Geramond for suggesting the working title "Troll Muzzle";
(later shortened to just Muzzle.)


Available from:

https://github.com/Git-Forked/Muzzle        <--(LATEST UPDATES)
https://www.lotrointerface.com/downloads/info1212-Muzzle.html


Share Muzzle:

Muzzle trolls, spam, and keywords by filtering chat with a CUSTOMIZABLE list. A FREE & open source plugin. Trolls complaining about the Muzzle plugin is proof that it works. See them no more: https://lotrointerface.com/downloads/info1212-Muzzle.html
