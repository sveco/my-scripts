; System-wide shortcuts
; -----------------------------------------------------------------------------
; ! requires functions.ahk. load it before this script

; Most used
; -----------------------------------------------------------------------------
#n:: Run notepad.exe
#c:: Run cmd.exe ; uncomment this for ordinary command prompt
;#c:: Run "C:\PortableApps\Scoop\apps\cmder\current\Cmder.exe"
;#c:: DllCall ("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, ComSpec, str, "", str, A_WorkingDir, int, 1) ; uncomment this for command prompt with elevated priviledges
#k:: RunOrActivateProgram("C:\PortableApps\Scoop\apps\keepass\current\KeePass.exe")
#PrintScreen:: Run, "C:\Program Files (x86)\Evernote\Skitch\Skitch.exe"

; Daz krazy mouze
RWin & f::Send, {MButton}

; Total commander is a bit difficult...
; -----------------------------------------------------------------------------
#t::
Run, "C:\PortableApps\Util\totalcmd\TOTALCMD64.EXE" ;"/I=d:\PortableApps\Total Commander XP\Profiles\Prof\main.ini" "/F=d:\PortableApps\Total Commander XP\Profiles\Prof\ftp.ini"
LoopCount = 0
Loop
{
	IfWinExist, ahk_class TNASTYNAGSCREEN
	{
		WinActivate
		ControlGetText, OutputVar, Window7, Total Commander
		;MsgBox, TButton%OutputVar%
		EnvMult OutputVar, -1
		EnvAdd OutputVar, 8
		;MsgBox, TButton%OutputVar%
		ControlClick, Button%OutputVar%
		Send {ENTER}
		break
	}
	else
	{
		Sleep 1000
		LoopCount += 1
	}
	if (%LoopCount% > 10)
		break
}
return

; TRANSPARENCY!!!!
; -----------------------------------------------------------------------------
#p::
	WinGetActiveTitle, Title
	Gui 10: +LastFound +AlwaysOnTop
	GuiID:= WinExist()
	Gui 10: Margin, 0, 0
	WinGet, T, Transparent, % Title
	
	Gui 10: Add, Text, x10 y5 w590 vText, % Title
	If !T
		Gui 10: Add, Slider, x0 y+5 w600 Range0-255 Line10 gTrans vTID Tooltip, 255
	Else
		Gui 10: Add, Slider, x0 y+5 w600 Range0-255 Line10 gTrans vTID Tooltip, % T
	Gui 10: Add, Button, y+10 Default g10GuiClose, Close
	Gui 10: Show, h59, Transparent Control
	SetTimer, changeTitle, 500
Return

Trans:
	Gui 10: Submit, NoHide
	WinSet, Transparent, % TID, % Title
Return

10GuiClose:
	SetTimer, changeTitle, Off
	Gui 10: Destroy
	Title:="", T:=""
Return

changeTitle:
	IfWinNotActive, Transparent Control
	{
		WinGetActiveTitle, NewTitle
		If (Title <> NewTitle)
		{
			Title := NewTitle
			WinGet, T, Transparent, % Title
			GuiControl, 10:, Text, % Title
			If !T
				GuiControl, 10:, TID, 255
			Else
				GuiControl, 10:, TID, % T
		}
	}
Return

; Office bunch
; -----------------------------------------------------------------------------
#w:: Run winword.exe
#x:: Run excel.exe
#o:: Run onenote.exe /sidenote ;open new side note

; Window operations
; -----------------------------------------------------------------------------
#Up:: WinMaximize A
#Down:: WinMinimize A

; Autohotkey related
; -----------------------------------------------------------------------------
; Reload the current AutoHotKey script
^!r::ReloadScript()


; Media
; -----------------------------------------------------------------------------
#m::ToggleMic()

; Misc
; -----------------------------------------------------------------------------

; God mode
#g::Run "Explorer.exe" "Ninja.{ED7BA470-8E54-465E-825C-99712043E01C}"

; Paste as pure text, http://www.autohotkey.com/community/viewtopic.php?t=11427
#v::
Clip0 = %ClipBoardAll%
ClipBoard = %ClipBoard%
Send ^v
Sleep 50
ClipBoard = %Clip0%
VarSetCapacity(Clip0, 0)
Return