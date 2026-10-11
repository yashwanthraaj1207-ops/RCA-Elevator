@echo off
title ELEVATOR-RCA Prototype
cd /d "%~dp0"
echo ========================================================
echo    Starting ELEVATOR-RCA Simulation & Diagnostics
echo ========================================================
echo.
echo Opening browser at http://localhost:5173 ...
echo Press Ctrl+C in this window anytime to stop the server.
echo.
start http://localhost:5173
npm run dev
