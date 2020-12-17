; System-wide shortcuts
; -----------------------------------------------------------------------------
; ! requires functions.ahk. load it before this script

; Most used
; -----------------------------------------------------------------------------
#n:: Run notepad.exe
#c:: Run "shell:appsFolder\Microsoft.WindowsTerminal_8wekyb3d8bbwe!App" ; uncomment this for windows store terminal app
;#c:: DllCall ("shell32\ShellExecuteA", uint, 0, str, "RunAs", str, ComSpec, str, "", str, A_WorkingDir, int, 1) ; uncomment this for command prompt with elevated priviledges
#k:: Run, "D:\PortableApps\Scoop\apps\keepass\current\KeePass.exe"
#PrintScreen:: Run, "F:\Program Files (x86)\Evernote\Skitch\Skitch.exe"
#y:: Run "D:\PortableApps\Security\Truecrypt\Truecrypt.exe"
#t:: Run, "D:\PortableApps\totalcmd\TOTALCMD64.EXE"
;Browser_Search::MButton

; Office bunch
; -----------------------------------------------------------------------------
#w:: Run winword.exe
#x:: Run excel.exe
;#o:: Run outlook.exe

; Window operations
; -----------------------------------------------------------------------------
#Up:: WinMaximize A
#Down:: WinMinimize A


; Autohotkey related
; -----------------------------------------------------------------------------
; Reload the current AutoHotKey script
^!r::ReloadScript()


; Misc
; -----------------------------------------------------------------------------

; Guid generator
#g::GenerateGuid()

; Paste as pure text, http://www.autohotkey.com/community/viewtopic.php?t=11427
#v::
Clip0 = %ClipBoardAll%
ClipBoard = %ClipBoard%
Send ^v
Sleep 50
ClipBoard = %Clip0%
VarSetCapacity(Clip0, 0)
Return