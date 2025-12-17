#!/bin/bash
# Script para build de web con base href para GitHub Pages

# Configuración
REPO_NAME="UrbanMuse"  # ⚠️ CAMBIAR por el nombre real del repositorio en GitHub
BASE_HREF="/$REPO_NAME/"

echo "🔨 Building Flutter web app for GitHub Pages..."
echo "📦 Repository name: $REPO_NAME"
echo "🔗 Base href: $BASE_HREF"
echo ""

# Limpiar y obtener dependencias
echo "🧹 Cleaning..."
flutter clean

echo "📥 Getting dependencies..."
flutter pub get

# Build para web
echo "🏗️ Building web release..."
flutter build web --release --base-href "$BASE_HREF"

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ Build completed successfully!"
    echo "📁 Output: build/web/"
    echo ""
    echo "📝 Next steps:"
    echo "1. Test locally: cd build/web && python -m http.server 8000"
    echo "2. Run deploy script: bash scripts/deploy_github_pages.sh"
else
    echo ""
    echo "❌ Build failed!"
    exit 1
fi
