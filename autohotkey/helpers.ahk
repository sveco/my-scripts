; Includes
; -----------------------------------------------------------------------------
#Include functions.ahk
#Include chords.ahk
#Include shortcuts.ahk
#Include shortcuts_app.ahk
#Include autotext.ahk

; Tray menu
Menu, Tray, NoStandard
Menu, Tray, Standard


; Reduce mouse sensitivity temporarily, http://www.autohotkey.com/community/viewtopic.php?t=14795
; -----------------------------------------------------------------------------
^RShift::DllCall("SystemParametersInfo", Int,113, Int,0, UInt,1, Int,2)
^RShift Up::DllCall("SystemParametersInfo", Int,113, Int,0, UInt,10, Int,2)

return

