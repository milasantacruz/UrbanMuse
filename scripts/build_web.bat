@echo off
REM Script para build de web con base href para GitHub Pages

REM Configuración
set REPO_NAME=UrbanMuse
set BASE_HREF=/%REPO_NAME%/

echo 🔨 Building Flutter web app for GitHub Pages...
echo 📦 Repository name: %REPO_NAME%
echo 🔗 Base href: %BASE_HREF%
echo.

REM Limpiar y obtener dependencias
echo 🧹 Cleaning...
call flutter clean

echo 📥 Getting dependencies...
call flutter pub get

REM Build para web
echo 🏗️ Building web release...
call flutter build web --release --base-href "%BASE_HREF%"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Build completed successfully!
    echo 📁 Output: build\web\
    echo.
    echo 📝 Next steps:
    echo 1. Test locally: cd build\web ^&^& python -m http.server 8000
    echo 2. Run deploy script: scripts\deploy_github_pages.bat
) else (
    echo.
    echo ❌ Build failed!
    exit /b 1
)
