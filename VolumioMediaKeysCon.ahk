
;This script uses foo_httpcontrol server to control Foobar
;It uses keyboard MediaKeys (PlayPause, Media-next, Media-prev,Volume-up, Volume-down) to send requests. 
;One can map any keyboard shortcut; follow AutoHotkey manual
;Info about currently playing track will be displayed as OSD, as soon as response from server is arrived

#include httprequest.ahk
#include JSON.ahk

global URL := "http://volumio.local/api/v1/commands/"

CustomColor = EEAA99  ; Can be any RGB color (it will be made transparent below).
Gui +LastFound +AlwaysOnTop -Caption +ToolWindow  ; +ToolWindow avoids a taskbar button and an alt-tab menu item.
Gui, Color, %CustomColor%
Gui, Font, s20  ; Set a large font size (32-point).
Gui, Add, Text, vMyText cRed  ; XX & YY serve to auto-size the window.
; Make all pixels of this color transparent and make the text itself translucent (150):
WinSet, TransColor, %CustomColor% 160
OnMessage(0x404,"AHK_NotifyTrayIcon")

DisplayInfo(responce, time) {
	j := JSON.parse(responce)
	strMsg := j.volume
	GuiControl,, MyText, %strMsg%
	GuiControl, Move, MyText, W1920
	Gui, Show, AutoSize x1 yCenter NoActivate  ; NoActivate avoids deactivating the currently active window.
	SetTimer, RemoveWindow, % time
	return strB	
}
RemoveWindow:
	Gui, Hide

Media_Play_Pause::
HTTPRequest(URL . "?cmd=toggle")
return

Media_Next::
HTTPRequest(URL . "?cmd=next")
return

Media_Prev::
HTTPRequest(URL . "?cmd=prev")
return

Volume_Down::
    HTTPRequest(URL . "?cmd=volume&volume=minus")
return

Volume_Up::
    HTTPRequest(URL . "?cmd=volume&volume=plus")
return
