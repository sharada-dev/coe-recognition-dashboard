@echo off
REM Double-click to share the dashboard publicly (local server + Cloudflare tunnel).
REM A browser opens and the public link is copied to your clipboard.
REM Keep the window that appears open during your demo; close it to stop sharing.
powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0share-demo.ps1"
pause
