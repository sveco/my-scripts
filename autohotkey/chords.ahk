; Uses chords (2 key sequences) to run commands
; Ctrl+` activates chord, then enter two letter chord
; -----------------------------------------------------------------------------
^`::
SplashTextOn, , , Chords active
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
return
