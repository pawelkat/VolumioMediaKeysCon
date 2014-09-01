VolumioMediaKeysCon
===================

Control Volumio with Media Keys of your Keyboard
AutoHotkey script to control Volumio via http.

The script allows to control your remote Volumio audio player with your PC's (Windows) keyboard shortcuts.

Features:
---------
* sends a commands like PlayPause, Media-next, Media-prev, Volume-up, Volume-down to your remote foobar instance
* displays shortly track info about current audio track as the json response arrives (something like OSD)

Dependecies:
------------
JSON.ahk (https://github.com/cocobelgica/AutoHotkey-JSON/blob/master/JSON.ahk)
HTTPRequest.ahk (http://pastebin.com/5qVVuDxA)

How to make your remote control running:
----------------------------------------
1. install AutoHotkey
2. configure IP addres and port entry in VolumioMediaKeysCon.ahk (URL variable)
5. configure your keyboard shortcuts (AHK manual http://www.autohotkey.com/docs/KeyList.htm). By default they actions are mapped to multimedia keys (PlayPause, Media-next, Media-prev,Volume-up, Volume-down)
5. run VolumioMediaKeysCon.ahk (don't forget to correctly include dependencies). You can add it to Startup.
