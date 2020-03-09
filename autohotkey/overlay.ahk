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


#1::
	DesktopScreenCoordinates(xmin, ymin, xmax, ymax)
	SysGet, mcount, MonitorCount
	

	Input, textEntry1, L1,{Esc}{Enter}{F1}{Down}{Up}
	endKey=%ErrorLevel%
	
	if (textEntry1>mcount)
	{
		return
	} else {
		width:=(xmax-xmin)/mcount
		xpos:=xmin + width*(textEntry1-1)
		ypos:=0
		
		;text coordinates
		x1:=width/2-10
		y1:=ymax/2-40

		;show screen overlay
		Gui, Color, 000000
		Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
		Gui, Font, s96 cFFFFFF
		Gui, Add, Text, center x%x1% y%y1%, 1
		WinSet, Transparent, 80
		Gui, Show, x%xpos% y%ypos% w%width% h1080
	}

	;number of vertical splits
	Input, textEntry2, L1,{Esc}{Enter}
	timeout=%ErrorLevel%
	
	if(textEntry2=1)
	{
		;do nothing
	}
	else if(textEntry2=2)
	{
		x11:=width/4-10
		x12:=width/4*3-10
		;show screen overlay
		Gui, Destroy
		Gui, Color, 000000
		Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
		Gui, Font, s96 cFFFFFF
		Gui, Add, Text, center x%x11% y%y1%, 1
		Gui, Add, Text, center x%x12% y%y1%, 2
		WinSet, Transparent, 80
		Gui, Show, x%xpos% y%ypos% w%width% h1080
	}
	else if(textEntry2=3)
	{
		x3:=width/6
		x11:=x3-10
		x12:=x3*3-10
		x13:=x3*5-10
		;show screen overlay
		Gui, Destroy
		Gui, Color, 000000
		Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
		Gui, Font, s96 cFFFFFF
		Gui, Add, Text, center x%x11% y%y1%, 1
		Gui, Add, Text, center x%x12% y%y1%, 2
		Gui, Add, Text, center x%x13% y%y1%, 3
		WinSet, Transparent, 80
		Gui, Show, x%xpos% y%ypos% w%width% h1080
	}	

	;number of vertical splits
	Input, textEntry3, L1,{Esc}{Enter}
	timeout=%ErrorLevel%
	
	if(textEntry3=1)
	{
		;do nothing
	}
	else if(textEntry3=2)
	{
		if(textEntry2=1)
		{
			x11:=width/4-10
			
			y11:=ymax/4-40
			y12:=ymax/4*3-40
			
			;show screen overlay
			Gui, Destroy
			Gui, Color, 000000
			Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
			Gui, Font, s96 cFFFFFF
			
			Gui, Add, Text, center x%x11% y%y11%, 1
			Gui, Add, Text, center x%x11% y%y12%, 2
			
			WinSet, Transparent, 80
			Gui, Show, x%xpos% y%ypos% w%width% h1080
		}	
		else if(textEntry2=2)
		{
			x11:=width/4-10
			x12:=width/4*3-10
			
			y11:=ymax/4-40
			y12:=ymax/4*3-40
			
			;show screen overlay
			Gui, Destroy
			Gui, Color, 000000
			Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
			Gui, Font, s96 cFFFFFF
			
			Gui, Add, Text, center x%x11% y%y11%, 1
			Gui, Add, Text, center x%x12% y%y11%, 2
			Gui, Add, Text, center x%x11% y%y12%, 3
			Gui, Add, Text, center x%x12% y%y12%, 4
			
			WinSet, Transparent, 80
			Gui, Show, x%xpos% y%ypos% w%width% h1080
		}
		else if (textEntry2=3)
		{
			x3:=width/6
			x11:=x3-10
			x12:=x3*3-10
			x13:=x3*5-10
			
			y11:=ymax/4-40
			y12:=ymax/4*3-40
			
			;show screen overlay
			Gui, Destroy
			Gui, Color, 000000
			Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
			Gui, Font, s96 cFFFFFF
			
			Gui, Add, Text, center x%x11% y%y11%, 1
			Gui, Add, Text, center x%x12% y%y11%, 2
			Gui, Add, Text, center x%x13% y%y11%, 3
			Gui, Add, Text, center x%x11% y%y12%, 4
			Gui, Add, Text, center x%x12% y%y12%, 5
			Gui, Add, Text, center x%x13% y%y12%, 6
			
			WinSet, Transparent, 80
			Gui, Show, x%xpos% y%ypos% w%width% h1080
		}
	}
	else if(textEntry3=3)
	{
		if(textEntry2=2)
		{
			x11:=width/4-10
			x12:=width/4*3-10
			
			y3:=ymax/6
			y11:=y3-40
			y12:=y3*3-40
			y13:=y3*5-40
			
			;show screen overlay
			Gui, Destroy
			Gui, Color, 000000
			Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
			Gui, Font, s96 cFFFFFF
			
			Gui, Add, Text, center x%x11% y%y11%, 1
			Gui, Add, Text, center x%x12% y%y11%, 2
			Gui, Add, Text, center x%x11% y%y12%, 3
			Gui, Add, Text, center x%x12% y%y12%, 4
			Gui, Add, Text, center x%x11% y%y13%, 5
			Gui, Add, Text, center x%x12% y%y13%, 6
			
			WinSet, Transparent, 80
			Gui, Show, x%xpos% y%ypos% w%width% h1080
		}
		else if (textEntry2=3)
		{
			x3:=width/6
			x11:=x3-10
			x12:=x3*3-10
			x13:=x3*5-10
			
			y3:=ymax/6
			y11:=y3-40
			y12:=y3*3-40
			y13:=y3*5-40
			
			;show screen overlay
			Gui, Destroy
			Gui, Color, 000000
			Gui, +LastFound +AlwaysOnTop +ToolWindow -Caption
			Gui, Font, s96 cFFFFFF
			
			Gui, Add, Text, center x%x11% y%y11%, 1
			Gui, Add, Text, center x%x12% y%y11%, 2
			Gui, Add, Text, center x%x13% y%y11%, 3
			Gui, Add, Text, center x%x11% y%y12%, 4
			Gui, Add, Text, center x%x12% y%y12%, 5
			Gui, Add, Text, center x%x13% y%y12%, 6
			Gui, Add, Text, center x%x11% y%y13%, 7
			Gui, Add, Text, center x%x12% y%y13%, 8
			Gui, Add, Text, center x%x13% y%y13%, 9
			
			WinSet, Transparent, 80
			Gui, Show, x%xpos% y%ypos% w%width% h1080
		}
	}
	
	entry=%textEntry1%%textEntry2%%textEntry3%
	MsgBox, %entry%
	
	Gui, Destroy
	;Sleep, 2000
return