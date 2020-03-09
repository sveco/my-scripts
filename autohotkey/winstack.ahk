#1::
	;DesktopScreenCoordinates(x,y,x1,y1)
	MsgBox %x% %y% %x1% %y1%
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,-1920,0,640,1040
return

#2::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,-1280,0,640,1040
return

#3::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,-640,0,640,1040
return

#4::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,0,0,640,1040
return

#5::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,640,0,640,1040
return

#6::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,1280,0,640,1040
return

#7::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,1920,0,640,1040
return

#8::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,2560,0,640,1040
return

#9::
	WinGetTitle, windowName, A
	;MsgBox %windowName%
	WinMove,%windowName%,,3200,0,640,1040
return

;	This will return the x,y cordinates for the top left and bottom right
;	corners of the desktop work area (if 2 monitors, the entire area)

DesktopScreenCoordinates(byref Xmin, byref Ymin, byref Xmax, byref Ymax)
{
	SysGet, Xmin, 76 	; XVirtualScreenleft  	; left side of virtual screen
	SysGet, Ymin, 77	; YVirtualScreenTop		; Top side of virtual screen

	SysGet, VirtualScreenWidth, 78
	SysGet, VirtualScreenHeight, 79

	Xmax := Xmin + VirtualScreenWidth
	Ymax := Ymin + VirtualScreenHeight
	return
} 