; -----------------------------------------------------------------------------
; Functions
; -----------------------------------------------------------------------------


; Function to run a program or activate an already running instance
; -----------------------------------------------------------------------------
RunOrActivateProgram(Program, WorkingDir="", WindowSize=""){
    SplitPath Program, ExeFile
    Process, Exist, %ExeFile%
    PID = %ErrorLevel%
    if (PID = 0) {
    	Run, %Program%, %WorkingDir%, %WindowSize%
    }else{
    	WinActivate, ahk_pid %PID%
    }
}

;Reload the current AutoHotKey script
; -----------------------------------------------------------------------------
ReloadScript(){
	SplashTextOn, , , Reloading....
	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	SplashTextOff
	MsgBox, 4,, The script could not be reloaded. Would you like to open it for editing?
	IfMsgBox, Yes, Edit
	return
}

; Generates guid and send input. Requires guid.exe
; -----------------------------------------------------------------------------
GenerateGuid(){
	tempfile = c:\temp\guid.txt
	path = "c:\PortableApps\Utils\CmdLine\guid.exe"
	clipboard =  
	Send ^x
	ClipWait, 0
	text = %clipboard%
	RunWait, %comspec% /c %path% %text%>%tempfile%, , Hide
	Sleep, 100
	FileRead, guid, %tempfile%
	Sleep, 100
	clipboard = %guid%
	Send ^v
	guid =
	return
}

; Toggles microphone, requires nircmd.exe
; -----------------------------------------------------------------------------
ToggleMic(){
	vMyVar := vMyVar ? false : true
	x1 := "Mic " . (vMyVar ? "Off" : "On")
	SplashTextOn, 200, 30, Media, %x1%  
	Run, "C:\Users\janko.svetlik\Documents\My Scripts\NirCmd\nircmd.exe" mutesysvolume 2 "Microphone"
	Sleep, 200
	SplashTextOff
	return
}