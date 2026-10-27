@echo off
chcp 65001 >nul
cd /d "%~dp0"
title Open Playbook Studio
echo.
echo   Open Playbook Studio - 开源美式橄榄球战术板
echo   正在启动浏览器...
echo.
start "" "index.html"
timeout /t 2 >nul
