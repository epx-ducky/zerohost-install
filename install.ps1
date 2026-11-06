# ZeroHost installer for Windows (x86_64). No admin rights needed.
#   irm https://raw.githubusercontent.com/epx-ducky/zerohost-install/main/install.ps1 | iex
$ErrorActionPreference = "Stop"
$ProgressPreference = "SilentlyContinue"   # Invoke-WebRequest is many times slower with the progress bar
$url = "https://github.com/epx-ducky/zerohost-install/releases/latest/download/zerohost-windows-x86_64.zip"
$dest = Join-Path $env:LOCALAPPDATA "ZeroHost"
$zip = Join-Path $env:TEMP "zerohost-windows.zip"

Write-Host "Lade ZeroHost fuer Windows ..."
Invoke-WebRequest -Uri $url -OutFile $zip
if (Test-Path $dest) { Remove-Item -Recurse -Force $dest }
Expand-Archive -Path $zip -DestinationPath $dest
Remove-Item $zip

$bat = Join-Path $dest "zerohost\ZeroHost.bat"
$lnk = Join-Path ([Environment]::GetFolderPath("Desktop")) "ZeroHost.lnk"
$s = (New-Object -ComObject WScript.Shell).CreateShortcut($lnk)
$s.TargetPath = $bat
$s.WorkingDirectory = Split-Path $bat
$s.IconLocation = Join-Path $dest "zerohost\ZeroHost.ico"
$s.Save()

Write-Host "Installiert in $dest, Verknuepfung 'ZeroHost' auf dem Desktop. Starte ..."
Start-Process $bat
