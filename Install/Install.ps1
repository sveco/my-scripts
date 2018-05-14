function run-this {
    param ($file)
    $logfile = 'log.txt'

    $job = Invoke-Command -ScriptBlock {
       try
       {
            $desc = Get-Content $file -First 1
            Write-Host -NoNewline $desc.TrimStart('#') " ... "
            
            $innerjob = Invoke-Command -ScriptBlock { & $file -WarningAction SilentlyContinue *> $logfile }
       }
       catch
       {
           Write-Host " Fail " -BackgroundColor Red -ForegroundColor Black 
           Write-Host $_  -ForegroundColor Red
           return $_
       }
       Write-Host " OK " -BackgroundColor Green -ForegroundColor Black
    } 
}

Get-ChildItem 'c:\Users\janko.svetlik\Documents\my-scripts\Install' | ForEach-Object {
    if($_.Extension -eq ".ps1" -and $_.Name -ne "Install.ps1") 
    { 
        run-this -file $_.FullName
    } 
}
