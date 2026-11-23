@echo off
title Black Mac Cursors - Installer
setlocal
:: Ask for admin rights if needed (copying to C:\Windows\Cursors needs them)
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)
set "DST=C:\Windows\Cursors\BlackMac"
if not exist "%DST%" mkdir "%DST%"
echo Copying cursor files to %DST% ...
copy /Y "%~dp0*.cur" "%DST%\" >nul
copy /Y "%~dp0*.ani" "%DST%\" >nul
if not exist "%DST%\arrow.cur" (
    echo.
    echo ERROR: files did not copy. Make sure you extracted the whole ZIP folder first,
    echo then run Install.bat again from inside the extracted folder.
    pause
    exit /b 1
)
echo Registering the "Black Mac" scheme ...
set "P=%DST%"
reg add "HKCU\Control Panel\Cursors\Schemes" /v "Black Mac" /t REG_SZ /d "%P%\arrow.cur,%P%\help.cur,%P%\appstarting.ani,%P%\wait.ani,%P%\cross.cur,%P%\ibeam.cur,%P%\pen.cur,%P%\no.cur,%P%\size_ns.cur,%P%\size_we.cur,%P%\size_nwse.cur,%P%\size_nesw.cur,%P%\size_all.cur,%P%\up.cur,%P%\hand.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "Arrow" /t REG_SZ /d "%P%\arrow.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "Help" /t REG_SZ /d "%P%\help.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "AppStarting" /t REG_SZ /d "%P%\appstarting.ani" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "Wait" /t REG_SZ /d "%P%\wait.ani" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "Crosshair" /t REG_SZ /d "%P%\cross.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "IBeam" /t REG_SZ /d "%P%\ibeam.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "NWPen" /t REG_SZ /d "%P%\pen.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "No" /t REG_SZ /d "%P%\no.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "SizeNS" /t REG_SZ /d "%P%\size_ns.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "SizeWE" /t REG_SZ /d "%P%\size_we.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "SizeNWSE" /t REG_SZ /d "%P%\size_nwse.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "SizeNESW" /t REG_SZ /d "%P%\size_nesw.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "SizeAll" /t REG_SZ /d "%P%\size_all.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "UpArrow" /t REG_SZ /d "%P%\up.cur" /f >nul
reg add "HKCU\Control Panel\Cursors" /v "Hand" /t REG_SZ /d "%P%\hand.cur" /f >nul
:: Apply the new cursors right away without logging out
RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters
echo.
echo Done! Your cursor should be the black arrow now.
echo If it did not change, open Settings - Bluetooth ^& devices - Mouse -
echo Additional mouse settings - Pointers, pick the "Black Mac" scheme and click Apply.
echo.
pause
