; -----------------------------------------------------------------------------
; Application-specific shortcuts
; -----------------------------------------------------------------------------

; Total commander
; -----------------------------------------------------------------------------
;Creates new date folder within Total Commander
F9::
IfWinActive, ahk_class TTOTAL_CMD
{
	FormatTime, TimeString,, yyyy-MM-dd
	Send, {F7}
	Send, %TimeString%
	Send, {ENTER}
}
return

;XButton1::
;IfWinActive, ahk_class MozillaWindowClass
;{
;	Send, ^{PgUp}
;}
;return

;XButton2::
;IfWinActive, ahk_class MozillaWindowClass
;{
;	Send, ^{PgDn}
;}
;return

XButton1 & WheelUp::Send, ^{PgUp}
XButton1 & WheelDown::Send, ^{PgDn}
XButton2 & MButton::
IfWinActive, ahk_class MozillaWindowClass
{
	Send, ^{F4}
	Sleep, 1000
}
return