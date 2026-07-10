@echo off
REM ============================================================
REM  Kudos COE Dashboard - meeting demo launcher
REM  Double-click this file to start the local server and
REM  open the dashboard in your browser.
REM  Close the black python window when you're done.
REM ============================================================
cd /d "%~dp0"
echo Starting local server on http://localhost:8000/ ...
start "Kudos demo server" python -m http.server 8000
timeout /t 2 /nobreak >nul
start "" http://localhost:8000/
echo.
echo Dashboard opening in your browser.
echo Keep the other window open during your meeting; close it to stop.
