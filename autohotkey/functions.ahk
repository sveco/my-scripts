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
	path = "c:\PortableApps\Utils\CmdLine\guid.exe"
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
; Standard output to variable
;------------------------------------------------------------------------------
StdOutStream( sCmd, Callback = "" ) { ; Modified  :  SKAN 31-Aug-2013 http://goo.gl/j8XJXY                             
  Static StrGet := "StrGet"           ; Thanks to :  HotKeyIt         http://goo.gl/IsH1zs                                   
                                      ; Original  :  Sean 20-Feb-2007 http://goo.gl/mxCdn
                                    
  DllCall( "CreatePipe", UIntP,hPipeRead, UIntP,hPipeWrite, UInt,0, UInt,0 )
  DllCall( "SetHandleInformation", UInt,hPipeWrite, UInt,1, UInt,1 )

  VarSetCapacity( STARTUPINFO, 68, 0  )      ; STARTUPINFO          ;  http://goo.gl/fZf24
  NumPut( 68,         STARTUPINFO,  0 )      ; cbSize
  NumPut( 0x100,      STARTUPINFO, 44 )      ; dwFlags    =>  STARTF_USESTDHANDLES = 0x100 
  NumPut( hPipeWrite, STARTUPINFO, 60 )      ; hStdOutput
  NumPut( hPipeWrite, STARTUPINFO, 64 )      ; hStdError

  VarSetCapacity( PROCESS_INFORMATION, 16 )  ; PROCESS_INFORMATION  ;  http://goo.gl/b9BaI      
  
  If ! DllCall( "CreateProcess", UInt,0, UInt,&sCmd, UInt,0, UInt,0 ;  http://goo.gl/USC5a
              , UInt,1, UInt,0x08000000, UInt,0, UInt,0
              , UInt,&STARTUPINFO, UInt,&PROCESS_INFORMATION ) 
   Return "" 
   , DllCall( "CloseHandle", UInt,hPipeWrite ) 
   , DllCall( "CloseHandle", UInt,hPipeRead )
   , DllCall( "SetLastError", Int,-1 )     

  hProcess := NumGet( PROCESS_INFORMATION, 0 )                 
  hThread  := NumGet( PROCESS_INFORMATION, 4 )                      

  DllCall( "CloseHandle", UInt,hPipeWrite )

  AIC := ( SubStr( A_AhkVersion, 1, 3 ) = "1.0" )                   ;  A_IsClassic 
  VarSetCapacity( Buffer, 4096, 0 ), nSz := 0 
  
  While DllCall( "ReadFile", UInt,hPipeRead, UInt,&Buffer, UInt,4094, UIntP,nSz, Int,0 ) {

   tOutput := ( AIC && NumPut( 0, Buffer, nSz, "Char" ) && VarSetCapacity( Buffer,-1 ) ) 
              ? Buffer : %StrGet%( &Buffer, nSz, "CP850" )

   Isfunc( Callback ) ? %Callback%( tOutput, A_Index ) : sOutput .= tOutput

  }                   
 
  DllCall( "GetExitCodeProcess", UInt,hProcess, UIntP,ExitCode )
  DllCall( "CloseHandle",  UInt,hProcess  )
  DllCall( "CloseHandle",  UInt,hThread   )
  DllCall( "CloseHandle",  UInt,hPipeRead )
  DllCall( "SetLastError", UInt,ExitCode  )

Return Isfunc( Callback ) ? %Callback%( "", 0 ) : sOutput      
}