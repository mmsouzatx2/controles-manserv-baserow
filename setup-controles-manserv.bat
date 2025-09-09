@echo off
REM Script to add controles-manserv.local to Windows hosts file for network access

echo Setting up controles-manserv.local for network access...
echo.

REM Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo ERROR: This script must be run as Administrator!
    echo.
    echo Right-click on this file and select "Run as administrator"
    echo.
    pause
    exit /b 1
)

REM Check if entry already exists
findstr /C:"controles-manserv.local" %WINDIR%\System32\drivers\etc\hosts >nul
if %errorLevel% equ 0 (
    echo controles-manserv.local already exists in hosts file
) else (
    REM Add entry to hosts file
    echo 10.100.10.208 controles-manserv.local controles-manserv >> %WINDIR%\System32\drivers\etc\hosts
    echo Added controles-manserv.local to hosts file
)

echo.
echo Setup complete!
echo.
echo You can now access Baserow at:
echo   http://controles-manserv.local
echo.
echo Test the connection with:
echo   ping controles-manserv.local
echo.
pause
