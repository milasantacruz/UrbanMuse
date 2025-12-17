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

# Crear 404.html para manejar rutas SPA
cat > docs/404.html << 'EOF'
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Street Muse</title>
  <script>
    // Redirigir a index.html para manejar rutas SPA
    var path = window.location.pathname;
    var repoName = 'REPO_NAME_PLACEHOLDER';
    var newPath = '/' + repoName + '/index.html' + (path === '/' ? '' : path);
    window.location.replace(newPath);
  </script>
</head>
<body>
  <p>Redirecting...</p>
</body>
</html>
EOF

# Reemplazar placeholder en 404.html
sed -i.bak "s/REPO_NAME_PLACEHOLDER/$REPO_NAME/g" docs/404.html
rm docs/404.html.bak 2>/dev/null || true

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
echo "   https://UrbanMuse.github.io/UrbanMuse/"
echo ""
echo "⏱️  Espera 1-5 minutos para que GitHub Pages se actualice."
