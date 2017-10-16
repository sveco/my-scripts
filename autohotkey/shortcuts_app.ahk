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