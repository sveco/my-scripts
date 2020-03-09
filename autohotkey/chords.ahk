; Uses chords (2 key sequences) to run commands
; Ctrl+` activates chord, then enter two letter chord
; -----------------------------------------------------------------------------
^`::
SplashTextOn, 250, 100,Chords active, c+p - command prompt`r`ns+g - search selected with google  `r`no+t - make current window on top   
Input, TextEntry1, L1,{Esc}{Enter}{F1}{Down}{Up}
endKey=%ErrorLevel%
WinSetTitle, Chords active, , %TextEntry1% +
Input, TextEntry2, L1 T1,{Esc}{Enter}

timeout=%ErrorLevel%

entry=%TextEntry1%%TextEntry2%
SplashTextOff

if entry=cp
{
    ; Command prompt
    run cmd
}
else if entry=ca
{
    ; Calculator
    run calc
}
; -----------------------------------------------------------------------------
; Search Google for selected text
; -----------------------------------------------------------------------------	
else if entry=sg
{
	MyClip := ClipboardAll
	clipboard = ; empty the clipboard
	Send, ^c
	ClipWait 
	Run http://www.google.com/#hl=en&q=%clipboard%
	Clipboard := MyClip
}
; -----------------------------------------------------------------------------
; Convert dollar to euro using google
; -----------------------------------------------------------------------------	
else if entry=cc
{
	MyClip := ClipboardAll
	clipboard = ; empty the clipboard
	Send, ^c
	ClipWait 
	Run "http://www.google.com/#hl=en&q=%clipboard%+usd+in+eur"
	Clipboard := MyClip
}
; -----------------------------------------------------------------------------
; Toggle on-top status of active window
; -----------------------------------------------------------------------------	
else if entry=ot
{
	WinGetPos, X, Y, , , A  ; "A" to get the active window's pos.
	WinSet, AlwaysOnTop, Toggle, A
	title := "Window set on top"
	SplashTextOn, , , %title%
	WinMove, %title%, , % X+5,% Y-30
	Sleep, 300
	SplashTextOff
}
; -----------------------------------------------------------------------------
; Insert current date and time
; -----------------------------------------------------------------------------	
else if entry=it
{
	;MyClip := ClipboardAll
	FormatTime, TimeString,, yyyy/MM/dd hh:mm
	;clipboard = %TimeString%
	Send, %TimeString%
	;Clipboard := MyClip
}
; -----------------------------------------------------------------------------
; Media
; -----------------------------------------------------------------------------
else if entry=mn
{
	WinGetPos, X, Y, , , A
	Send, {Media_Next}
	title := "Media - Next"
	SplashTextOn, , , %title%
	WinMove, %title%, , % X+5,% Y-30
	Sleep, 300
	SplashTextOff
}
else if entry=mb
{
	WinGetPos, X, Y, , , A
	Send, {Media_Prev}
	title := "Media - Back"
	SplashTextOn, , , %title%
	WinMove, %title%, , % X+5,% Y-30
	Sleep, 300
	SplashTextOff
}
else if entry=tm
{
	ToggleMic()
}
return
