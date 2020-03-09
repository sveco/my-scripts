#2::
	SysGet, mcount, MonitorCount
	Input, textEntry1, L1,{Esc}{Enter}{F1}{Down}{Up}
	endKey=%ErrorLevel%
	if (textEntry1>mcount)
	{
	 return
	} else {
		SysGet, v, Monitor, textEntry1
		MsgBox %vLeft% %vTop% %vRight% %vBottom%
	}
return