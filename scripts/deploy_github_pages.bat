@echo off
setlocal enabledelayedexpansion

REM Configuración
set REPO_NAME=UrbanMuse
set BASE_HREF=/%REPO_NAME%/

echo 🚀 Iniciando deploy a GitHub Pages...
echo 📦 Repository: %REPO_NAME%
echo 🔗 Base href: %BASE_HREF%
echo.

REM Limpiar y obtener dependencias
echo 🧹 Limpiando...
call flutter clean

echo 📥 Obteniendo dependencias...
call flutter pub get

REM Build para web
echo 🏗️ Construyendo app para web...
call flutter build web --release --base-href "%BASE_HREF%"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Error en el build!
    exit /b 1
)

REM Copiar a docs/
echo 📁 Copiando build a docs/...
if exist docs rmdir /s /q docs
mkdir docs
xcopy /E /I /Y build\web\* docs\

REM Crear .nojekyll
echo. > docs\.nojekyll

REM Crear 404.html para manejar rutas SPA (copiando index.html)
REM Esto permite que al recargar o abrir una ruta directa, GitHub Pages sirva la app.
copy /Y docs\index.html docs\404.html >nul

echo.
echo ✅ Build completado en docs/
echo.
echo 📝 Próximos pasos:
echo 1. Revisar cambios: git status
echo 2. Agregar archivos: git add docs/
echo 3. Commit: git commit -m "Deploy: Actualizar GitHub Pages"
echo 4. Push: git push origin main
echo.
echo 🌐 La app estará disponible en:
echo    https://milasantacruz.github.io/%REPO_NAME%/
echo.
echo ⏱️  Espera 1-5 minutos para que GitHub Pages se actualice.
