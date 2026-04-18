@echo off
echo ========================================
echo DMNS Tech - Git Setup Script
echo ========================================
echo.

REM Check if git is installed
git --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed!
    echo.
    echo Please install Git first:
    echo 1. Go to: https://git-scm.com/download/win
    echo 2. Download and install
    echo 3. Restart this terminal
    echo 4. Run this script again
    echo.
    pause
    exit /b 1
)

echo [OK] Git is installed!
echo.

REM Check if already initialized
if exist .git (
    echo [INFO] Git repository already initialized
    echo.
) else (
    echo [STEP 1] Initializing Git repository...
    git init
    echo [OK] Git initialized!
    echo.
)

REM Configure git (if not already configured)
git config user.name >nul 2>&1
if %errorlevel% neq 0 (
    echo [STEP 2] Configuring Git...
    set /p username="Enter your name: "
    set /p email="Enter your email: "
    git config --global user.name "%username%"
    git config --global user.email "%email%"
    echo [OK] Git configured!
    echo.
) else (
    echo [INFO] Git already configured
    echo.
)

REM Add all files
echo [STEP 3] Adding all files...
git add .
echo [OK] Files added!
echo.

REM Commit
echo [STEP 4] Creating initial commit...
git commit -m "Initial commit - DMNS Tech website with all upgrades"
if %errorlevel% neq 0 (
    echo [INFO] No changes to commit or already committed
) else (
    echo [OK] Committed!
)
echo.

REM Check if remote exists
git remote get-url origin >nul 2>&1
if %errorlevel% neq 0 (
    echo [STEP 5] Connect to GitHub repository
    echo.
    echo Please create a repository on GitHub first:
    echo 1. Go to: https://github.com/new
    echo 2. Repository name: dmnstech-website
    echo 3. Keep it Public
    echo 4. DO NOT add README, .gitignore, or license
    echo 5. Click "Create repository"
    echo.
    set /p repo_url="Enter your repository URL (e.g., https://github.com/username/dmnstech-website.git): "
    git remote add origin %repo_url%
    echo [OK] Remote added!
    echo.
) else (
    echo [INFO] Remote already configured
    echo.
)

REM Push to GitHub
echo [STEP 6] Pushing to GitHub...
echo.
echo You may be prompted to login to GitHub.
echo If asked for password, use a Personal Access Token instead.
echo.
git branch -M main
git push -u origin main
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] Push failed!
    echo.
    echo Common issues:
    echo 1. Authentication failed - Use Personal Access Token instead of password
    echo    Get token from: https://github.com/settings/tokens
    echo 2. Repository doesn't exist - Create it on GitHub first
    echo 3. Remote URL is wrong - Check the URL you entered
    echo.
    pause
    exit /b 1
)

echo.
echo ========================================
echo [SUCCESS] Code pushed to GitHub!
echo ========================================
echo.
echo Next steps:
echo 1. Go to: https://dash.cloudflare.com/
echo 2. Click: Workers and Pages
echo 3. Click: Create application
echo 4. Click: Pages tab
echo 5. Click: Connect to Git
echo 6. Select your repository: dmnstech-website
echo 7. Deploy!
echo.
echo Your site will be live at: https://dmnstech.pages.dev
echo.
pause
