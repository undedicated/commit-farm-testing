@echo off
cls

:: Check if already a Git repo
if exist .git (
    echo This directory is already a Git repository.
    goto skipInit
)

echo Initializing Git repository...
git init

:skipInit

:: Rename branch to main
git branch -M main

:: Add or set remote origin
git remote remove origin 2>nul
git remote add origin https://github.com/undedicated/commit-farm-testing.git/

:: Add all files and commit
git add .
git commit -m "Initial commit"

:: Push to GitHub
git push -u origin main

echo Setup complete.
pause
