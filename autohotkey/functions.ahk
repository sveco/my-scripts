; -----------------------------------------------------------------------------
; Functions
; -----------------------------------------------------------------------------

DetectHiddenText, On
DetectHiddenWindows, On

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
	path = "c:\Portable Apps\Utils\CmdLine\guid.exe"
	clipboard =  
	Send ^x
	ClipWait, 0
	text = %clipboard%
	RunWait, %comspec% /c %path% %text%>%tempfile%, , Hide
	Sleep, 50
	FileRead, guid, %tempfile%
	Sleep, 50
	clipboard = %guid%
	Send ^v
	guid =
	return
}

; Run spotify if not loaded
; -----------------------------------------------------------------------------
RunSpotify(){
Process, Exist, "Spotify.exe"
    PID = %ErrorLevel%
    if (PID = 0) {
    	Run, "C:\Users\Yan\AppData\Roaming\Spotify\Spotify.exe"
    }
	return
}