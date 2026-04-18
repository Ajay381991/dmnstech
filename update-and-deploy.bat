@echo off
echo ========================================
echo DMNS Tech - Update and Deploy
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed!
    echo Please run setup-git.bat first
    pause
    exit /b 1
)

REM Check for changes
echo [STEP 1] Checking for changes...
git status --short
if %errorlevel% neq 0 (
    echo [ERROR] Not a git repository!
    echo Please run setup-git.bat first
    pause
    exit /b 1
)
echo.

REM Get commit message
set /p message="Enter commit message (e.g., 'Updated hero section'): "
if "%message%"=="" set message="Updated website"

REM Add all changes
echo [STEP 2] Adding changes...
git add .
echo [OK] Changes added!
echo.

REM Commit
echo [STEP 3] Committing changes...
git commit -m "%message%"
if %errorlevel% neq 0 (
    echo [INFO] No changes to commit
    echo.
    pause
    exit /b 0
)
echo [OK] Changes committed!
echo.

REM Push to GitHub
echo [STEP 4] Pushing to GitHub...
git push
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push failed!
    echo.
    echo Try running: git push -u origin main
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo [SUCCESS] Deployed!
echo ========================================
echo.
echo Your changes are being deployed to Cloudflare.
echo This usually takes 30-60 seconds.
echo.
echo Check status at: https://dash.cloudflare.com/
echo Your site: https://dmnstech.pages.dev
echo.
pause
