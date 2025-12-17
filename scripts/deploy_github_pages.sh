#!/bin/bash
# Script para desplegar en GitHub Pages

set -e  # Salir si hay error

# Configuración
REPO_NAME="UrbanMuse"  # ⚠️ CAMBIAR por el nombre real del repositorio en GitHub
BASE_HREF="/$REPO_NAME/"

echo "🚀 Iniciando deploy a GitHub Pages..."
echo "📦 Repository: $REPO_NAME"
echo "🔗 Base href: $BASE_HREF"
echo ""

# Limpiar y obtener dependencias
echo "🧹 Limpiando..."
flutter clean

echo "📥 Obteniendo dependencias..."
flutter pub get

# Build para web
echo "🏗️ Construyendo app para web..."
flutter build web --release --base-href "$BASE_HREF"

if [ $? -ne 0 ]; then
    echo "❌ Error en el build!"
    exit 1
fi

# Copiar a docs/
echo "📁 Copiando build a docs/..."
rm -rf docs
mkdir -p docs
cp -r build/web/* docs/

# Crear .nojekyll para evitar procesamiento de Jekyll
touch docs/.nojekyll

# Crear 404.html para manejar rutas SPA (copiando index.html)
# Esto permite que al recargar o abrir una ruta directa, GitHub Pages sirva la app.
cp docs/index.html docs/404.html

echo ""
echo "✅ Build completado en docs/"
echo ""
echo "📝 Próximos pasos:"
echo "1. Revisar cambios: git status"
echo "2. Agregar archivos: git add docs/"
echo "3. Commit: git commit -m 'Deploy: Actualizar GitHub Pages'"
echo "4. Push: git push origin main"
echo ""
echo "🌐 La app estará disponible en:"
echo "   https://milasantacruz.github.io/$REPO_NAME/"
echo ""
echo "⏱️  Espera 1-5 minutos para que GitHub Pages se actualice."
