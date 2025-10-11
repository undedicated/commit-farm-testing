@echo off
cls
setlocal EnableDelayedExpansion

:: Characters allowed in the commit message
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
set "RAND="

:: Generate a 20-character random string
for /l %%i in (1,1,20) do (
    set /a "randIndex=!RANDOM! %% 62"
    set "char=!chars:~!randIndex!,1!"
    set "RAND=!RAND!!char!"
)

:: Write the random string to a file
echo !RAND! > bot.txt

:: Git commit & push
git add bot.txt
git commit -m "!RAND!"
git push origin main

:: Optional delay between commits (e.g., 10 seconds)
timeout /t 10 > nul

:: Loop again
goto :start
