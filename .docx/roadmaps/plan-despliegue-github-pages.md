# 🌐 Plan de Despliegue en GitHub Pages

## 🎯 Objetivo

Desplegar la aplicación **Street Muse** (UrbanMuse) en GitHub Pages como una Progressive Web App (PWA) accesible desde cualquier navegador.

---

## 📋 Fase 1: Preparación del Proyecto (1-2 días)

### Tarea 1.1: Verificar Soporte Web de Flutter
**Prioridad:** Alta  
**Tiempo estimado:** 30 minutos

**Pasos:**
- [ ] Verificar que Flutter tenga habilitado el soporte para web:
  ```bash
  flutter doctor
  ```
- [ ] Si no está habilitado, habilitar web:
  ```bash
  flutter config --enable-web
  ```
- [ ] Verificar que el proyecto tenga la carpeta `web/` con los archivos necesarios

**Verificación:**
- [ ] Ejecutar `flutter devices` y verificar que aparece `Chrome` como dispositivo disponible
- [ ] Probar ejecutar la app en web:
  ```bash
  flutter run -d chrome
  ```

---

### Tarea 1.2: Revisar y Configurar Archivos Web
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 horas

#### Archivo: `web/index.html`

**Verificaciones requeridas:**
- [ ] Título de la app correcto
- [ ] Meta tags para SEO
- [ ] Favicon configurado
- [ ] Scripts de Flutter correctos

**Ejemplo de configuración:**
```html
<!DOCTYPE html>
<html>
<head>
  <base href="$FLUTTER_BASE_HREF">
  <meta charset="UTF-8">
  <meta content="IE=Edge" http-equiv="X-UA-Compatible">
  <meta name="description" content="Street Muse - Explora y descubre arte urbano en tu ciudad">
  <meta name="apple-mobile-web-app-capable" content="yes">
  <meta name="apple-mobile-web-app-status-bar-style" content="black">
  <meta name="apple-mobile-web-app-title" content="Street Muse">
  <link rel="apple-touch-icon" href="icons/Icon-192.png">
  <link rel="icon" type="image/png" href="favicon.png"/>
  <title>Street Muse</title>
  <link rel="manifest" href="manifest.json">
  <script>
    var serviceWorkerVersion = null;
    var scriptLoaded = false;
    function loadMainDartJs() {
      if (scriptLoaded) {
        return;
      }
      scriptLoaded = true;
      var scriptTag = document.createElement('script');
      scriptTag.src = 'main.dart.js';
      scriptTag.type = 'application/javascript';
      document.body.append(scriptTag);
    }

    if ('serviceWorker' in navigator) {
      window.addEventListener('load', function () {
        flutter_service_worker.loadServiceWorker().then(function (serviceWorker) {
          serviceWorkerVersion = serviceWorker;
          loadMainDartJs();
        });
      });
    } else {
      loadMainDartJs();
    }
  </script>
</head>
<body>
  <script src="flutter_bootstrap.js" async></script>
</body>
</html>
```

#### Archivo: `web/manifest.json`

**Verificaciones requeridas:**
- [ ] Nombre de la app
- [ ] Descripción
- [ ] Iconos en diferentes tamaños
- [ ] Colores del tema
- [ ] Modo de visualización (standalone, fullscreen, etc.)

**Ejemplo:**
```json
{
    "name": "Street Muse",
    "short_name": "Street Muse",
    "start_url": "/",
    "display": "standalone",
    "background_color": "#F5F8FA",
    "theme_color": "#6BA034",
    "description": "Explora y descubre arte urbano en tu ciudad",
    "orientation": "portrait-primary",
    "prefer_related_applications": false,
    "icons": [
        {
            "src": "icons/Icon-192.png",
            "sizes": "192x192",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-512.png",
            "sizes": "512x512",
            "type": "image/png"
        },
        {
            "src": "icons/Icon-maskable-192.png",
            "sizes": "192x192",
            "type": "image/png",
            "purpose": "maskable"
        },
        {
            "src": "icons/Icon-maskable-512.png",
            "sizes": "512x512",
            "type": "image/png",
            "purpose": "maskable"
        }
    ]
}
```

---

### Tarea 1.3: Configurar Rutas para GitHub Pages
**Prioridad:** Alta  
**Tiempo estimado:** 1 hora

**Problema:** GitHub Pages sirve la app desde una subruta (ej: `https://usuario.github.io/repo/`), pero Flutter por defecto espera estar en la raíz.

**Solución:** Configurar `base href` en `index.html` y ajustar rutas.

**Pasos:**
1. [ ] Verificar que `index.html` tenga `<base href="$FLUTTER_BASE_HREF">`
2. [ ] Crear script de build que configure el base href correcto
3. [ ] Ajustar rutas en GoRouter si es necesario

**Crear archivo:** `scripts/build_web.sh` (o `.bat` para Windows)
```bash
#!/bin/bash
# Script para build de web con base href para GitHub Pages

REPO_NAME="UrbanMuse"  # Cambiar por el nombre del repositorio
BASE_HREF="/$REPO_NAME/"

echo "Building Flutter web app for GitHub Pages..."
echo "Base href: $BASE_HREF"

flutter build web --base-href "$BASE_HREF" --release

echo "Build completed!"
echo "Output: build/web/"
```

**Para Windows:** `scripts/build_web.bat`
```batch
@echo off
set REPO_NAME=UrbanMuse
set BASE_HREF=/%REPO_NAME%/

echo Building Flutter web app for GitHub Pages...
echo Base href: %BASE_HREF%

flutter build web --base-href "%BASE_HREF%" --release

echo Build completed!
echo Output: build/web/
```

---

### Tarea 1.4: Verificar Dependencias Compatibles con Web
**Prioridad:** Media  
**Tiempo estimado:** 1-2 horas

**Verificaciones:**
- [ ] Todas las dependencias tienen soporte para web
- [ ] Plugins nativos tienen alternativas web o están condicionalmente importados
- [ ] Geolocator funciona en web (requiere HTTPS)
- [ ] Mapas funcionan en web (flutter_map soporta web)
- [ ] Hive funciona en web (IndexedDB)

**Dependencias a verificar:**
- [ ] `geolocator` - ✅ Soporta web (requiere HTTPS)
- [ ] `flutter_map` - ✅ Soporta web
- [ ] `hive` - ✅ Soporta web (usa IndexedDB)
- [ ] `image_picker` - ⚠️ Verificar soporte web
- [ ] `permission_handler` - ⚠️ Verificar soporte web
- [ ] `url_launcher` - ✅ Soporta web
- [ ] `share_plus` - ✅ Soporta web

**Acciones si hay incompatibilidades:**
- [ ] Usar imports condicionales: `import 'package:flutter/foundation.dart'` y `kIsWeb`
- [ ] Crear implementaciones alternativas para web
- [ ] Documentar limitaciones de funcionalidades en web

---

## 📋 Fase 2: Build y Optimización (1-2 días)

### Tarea 2.1: Configurar Build de Release para Web
**Prioridad:** Alta  
**Tiempo estimado:** 1 hora

**Pasos:**
1. [ ] Limpiar builds anteriores:
   ```bash
   flutter clean
   flutter pub get
   ```

2. [ ] Ejecutar build de release:
   ```bash
   flutter build web --release
   ```
   O usar el script con base href:
   ```bash
   bash scripts/build_web.sh
   # O en Windows:
   scripts\build_web.bat
   ```

3. [ ] Verificar que se generó correctamente:
   - [ ] Carpeta `build/web/` existe
   - [ ] Archivo `main.dart.js` existe
   - [ ] Archivos de assets están presentes
   - [ ] `index.html` tiene el base href correcto

**Ubicación del build:**
```
build/web/
├── index.html
├── main.dart.js
├── flutter.js
├── flutter_service_worker.js
├── assets/
├── icons/
└── manifest.json
```

---

### Tarea 2.2: Optimizar Tamaño del Build
**Prioridad:** Media  
**Tiempo estimado:** 2-3 horas

**Optimizaciones:**
- [ ] Habilitar tree-shaking (ya está por defecto en release)
- [ ] Verificar tamaño del `main.dart.js` (objetivo: < 2MB)
- [ ] Optimizar imágenes (convertir a WebP cuando sea posible)
- [ ] Verificar que no se incluyan assets innecesarios
- [ ] Habilitar compresión gzip en GitHub Pages (automático)

**Comandos útiles:**
```bash
# Ver tamaño del build
du -sh build/web/

# Ver tamaño de archivos individuales
du -h build/web/* | sort -h

# Verificar main.dart.js
ls -lh build/web/main.dart.js
```

**Si el tamaño es muy grande:**
- [ ] Revisar dependencias no utilizadas
- [ ] Usar code splitting si es posible
- [ ] Optimizar imports
- [ ] Considerar lazy loading de rutas

---

### Tarea 2.3: Probar Build Localmente
**Prioridad:** Alta  
**Tiempo estimado:** 1 hora

**Pasos:**
1. [ ] Servir el build localmente:
   ```bash
   cd build/web
   python -m http.server 8000
   # O con Node.js:
   npx http-server -p 8000
   # O con PHP:
   php -S localhost:8000
   ```

2. [ ] Abrir en navegador: `http://localhost:8000`

3. [ ] Verificar funcionalidades:
   - [ ] La app carga correctamente
   - [ ] Navegación funciona
   - [ ] Mapas se muestran (si aplica)
   - [ ] Geolocalización funciona (requiere HTTPS o localhost)
   - [ ] Rutas funcionan correctamente
   - [ ] Assets se cargan
   - [ ] No hay errores en consola

4. [ ] Probar en diferentes navegadores:
   - [ ] Chrome/Edge
   - [ ] Firefox
   - [ ] Safari (si está disponible)

---

## 📋 Fase 3: Configuración de GitHub (1 día)

### Tarea 3.1: Preparar Repositorio
**Prioridad:** Alta  
**Tiempo estimado:** 30 minutos

**Pasos:**
1. [ ] Verificar que el repositorio esté en GitHub
2. [ ] Crear rama `gh-pages` (opcional, se puede usar `main` o `docs`)
3. [ ] Configurar `.gitignore` para no ignorar `build/web/` (o crear carpeta `docs/`)

**Opciones de estructura:**

**Opción 1: Usar carpeta `docs/` (Recomendado)**
- [ ] Copiar contenido de `build/web/` a `docs/`
- [ ] Configurar GitHub Pages para servir desde `/docs`
- [ ] Ventaja: No necesita rama separada

**Opción 2: Usar rama `gh-pages`**
- [ ] Crear rama `gh-pages`
- [ ] Copiar contenido de `build/web/` a la raíz de `gh-pages`
- [ ] Configurar GitHub Pages para servir desde rama `gh-pages`
- [ ] Ventaja: Separación clara entre código y deploy

**Opción 3: Usar carpeta raíz en `main`**
- [ ] Copiar contenido de `build/web/` a carpeta `web-build/` o similar
- [ ] Configurar GitHub Pages para servir desde esa carpeta
- [ ] Ventaja: Todo en una rama

**Recomendación:** Usar **Opción 1** (carpeta `docs/`) por simplicidad.

---

### Tarea 3.2: Crear Script de Deploy
**Prioridad:** Alta  
**Tiempo estimado:** 1 hora

**Crear archivo:** `scripts/deploy_github_pages.sh`

```bash
#!/bin/bash
# Script para desplegar en GitHub Pages

set -e  # Salir si hay error

REPO_NAME="UrbanMuse"  # Cambiar por el nombre del repositorio
BASE_HREF="/$REPO_NAME/"

echo "🚀 Iniciando deploy a GitHub Pages..."

# Limpiar y obtener dependencias
echo "📦 Limpiando y obteniendo dependencias..."
flutter clean
flutter pub get

# Build para web
echo "🔨 Construyendo app para web..."
flutter build web --release --base-href "$BASE_HREF"

# Copiar a docs/
echo "📁 Copiando build a docs/..."
rm -rf docs
mkdir -p docs
cp -r build/web/* docs/

# Crear .nojekyll para evitar procesamiento de Jekyll
touch docs/.nojekyll

# Agregar CNAME si se usa dominio personalizado (opcional)
# echo "tudominio.com" > docs/CNAME

echo "✅ Build completado en docs/"
echo ""
echo "📝 Próximos pasos:"
echo "1. Revisar cambios: git status"
echo "2. Agregar archivos: git add docs/"
echo "3. Commit: git commit -m 'Deploy: Actualizar GitHub Pages'"
echo "4. Push: git push origin main"
echo ""
echo "🌐 La app estará disponible en:"
echo "   https://TU_USUARIO.github.io/$REPO_NAME/"
```

**Para Windows:** `scripts/deploy_github_pages.bat`

```batch
@echo off
setlocal enabledelayedexpansion

set REPO_NAME=UrbanMuse
set BASE_HREF=/%REPO_NAME%/

echo 🚀 Iniciando deploy a GitHub Pages...

echo 📦 Limpiando y obteniendo dependencias...
call flutter clean
call flutter pub get

echo 🔨 Construyendo app para web...
call flutter build web --release --base-href "%BASE_HREF%"

echo 📁 Copiando build a docs/...
if exist docs rmdir /s /q docs
mkdir docs
xcopy /E /I /Y build\web\* docs\

echo. > docs\.nojekyll

echo ✅ Build completado en docs/
echo.
echo 📝 Próximos pasos:
echo 1. Revisar cambios: git status
echo 2. Agregar archivos: git add docs/
echo 3. Commit: git commit -m "Deploy: Actualizar GitHub Pages"
echo 4. Push: git push origin main
```

**Hacer ejecutables los scripts:**
```bash
chmod +x scripts/deploy_github_pages.sh
chmod +x scripts/build_web.sh
```

---

### Tarea 3.3: Configurar GitHub Pages
**Prioridad:** Alta  
**Tiempo estimado:** 15 minutos

**Pasos en GitHub:**
1. [ ] Ir al repositorio en GitHub
2. [ ] Ir a **Settings** → **Pages**
3. [ ] En **Source**, seleccionar:
   - **Branch:** `main` (o la rama que uses)
   - **Folder:** `/docs` (si usas Opción 1)
   - O **Branch:** `gh-pages` / **Folder:** `/ (root)` (si usas Opción 2)
4. [ ] Hacer clic en **Save**
5. [ ] Esperar unos minutos para que GitHub procese
6. [ ] La URL será: `https://TU_USUARIO.github.io/REPO_NAME/`

**Nota:** Si el repositorio es privado, necesitas GitHub Pro para GitHub Pages.

---

### Tarea 3.4: Agregar .nojekyll
**Prioridad:** Media  
**Tiempo estimado:** 5 minutos

**Problema:** GitHub Pages usa Jekyll por defecto, que puede procesar archivos y causar problemas.

**Solución:** Crear archivo `.nojekyll` en la carpeta de deploy.

**Pasos:**
- [ ] Crear archivo `docs/.nojekyll` (vacío)
- [ ] O agregar al script de deploy: `touch docs/.nojekyll`

---

## 📋 Fase 4: Primer Deploy (1 hora)

### Tarea 4.1: Ejecutar Deploy
**Prioridad:** Alta  
**Tiempo estimado:** 30 minutos

**Pasos:**
1. [ ] Ejecutar script de deploy:
   ```bash
   bash scripts/deploy_github_pages.sh
   # O en Windows:
   scripts\deploy_github_pages.bat
   ```

2. [ ] Verificar que `docs/` se creó correctamente:
   ```bash
   ls -la docs/
   ```

3. [ ] Revisar cambios:
   ```bash
   git status
   ```

4. [ ] Agregar archivos:
   ```bash
   git add docs/
   git add scripts/  # Si agregaste scripts nuevos
   ```

5. [ ] Commit:
   ```bash
   git commit -m "Deploy: Configurar GitHub Pages para Street Muse"
   ```

6. [ ] Push:
   ```bash
   git push origin main
   ```

7. [ ] Esperar 1-5 minutos para que GitHub Pages se actualice

8. [ ] Verificar en: `https://TU_USUARIO.github.io/REPO_NAME/`

---

### Tarea 4.2: Verificar Deploy
**Prioridad:** Alta  
**Tiempo estimado:** 30 minutos

**Verificaciones:**
- [ ] La app carga correctamente
- [ ] No hay errores 404
- [ ] Assets se cargan (imágenes, iconos)
- [ ] Navegación funciona
- [ ] Rutas funcionan correctamente
- [ ] Service Worker se registra (si está habilitado)
- [ ] Manifest.json se carga
- [ ] La app es instalable como PWA (si está configurado)

**Herramientas de verificación:**
- Chrome DevTools → Application → Service Workers
- Chrome DevTools → Application → Manifest
- Chrome DevTools → Network (verificar que no hay 404)
- Lighthouse (auditoría PWA)

---

## 📋 Fase 5: Optimizaciones y Mejoras (Opcional, 1-2 días)

### Tarea 5.1: Configurar HTTPS (Automático)
**Prioridad:** Baja  
**Tiempo estimado:** Automático

**Nota:** GitHub Pages proporciona HTTPS automáticamente. No se requiere configuración adicional.

---

### Tarea 5.2: Optimizar SEO
**Prioridad:** Media  
**Tiempo estimado:** 2-3 horas

**Mejoras:**
- [ ] Meta tags en `index.html`:
  - `description`
  - `keywords`
  - `og:title`, `og:description`, `og:image` (Open Graph)
  - `twitter:card` (Twitter Cards)
- [ ] Sitemap.xml (opcional)
- [ ] robots.txt (opcional)

**Ejemplo de meta tags:**
```html
<meta name="description" content="Street Muse - Explora y descubre arte urbano en tu ciudad. Encuentra grafitis, murales, esculturas y más.">
<meta name="keywords" content="arte urbano, grafiti, murales, street art, Buenos Aires">
<meta property="og:title" content="Street Muse - Arte Urbano">
<meta property="og:description" content="Explora y descubre arte urbano en tu ciudad">
<meta property="og:image" content="https://TU_USUARIO.github.io/REPO_NAME/icons/Icon-512.png">
<meta property="og:url" content="https://TU_USUARIO.github.io/REPO_NAME/">
<meta name="twitter:card" content="summary_large_image">
```

---

### Tarea 5.3: Configurar Analytics (Opcional)
**Prioridad:** Baja  
**Tiempo estimado:** 1 hora

**Opciones:**
- [ ] Google Analytics
- [ ] Plausible Analytics
- [ ] Firebase Analytics

**Ejemplo con Google Analytics:**
```html
<!-- En index.html, antes de </head> -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

---

### Tarea 5.4: Configurar Dominio Personalizado (Opcional)
**Prioridad:** Baja  
**Tiempo estimado:** 1 hora

**Pasos:**
1. [ ] Comprar dominio (si no tienes)
2. [ ] Crear archivo `docs/CNAME` con el dominio:
   ```
   tudominio.com
   www.tudominio.com
   ```
3. [ ] Configurar DNS:
   - Tipo: `CNAME`
   - Nombre: `@` o `www`
   - Valor: `TU_USUARIO.github.io`
4. [ ] Esperar propagación DNS (puede tardar horas)
5. [ ] Verificar en GitHub Pages settings que detecta el dominio

---

## 📋 Fase 6: Automatización con GitHub Actions (Opcional, 1 día)

### Tarea 6.1: Crear Workflow de CI/CD
**Prioridad:** Baja  
**Tiempo estimado:** 2-3 horas

**Crear archivo:** `.github/workflows/deploy.yml`

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main  # Cambiar si usas otra rama principal
  workflow_dispatch:  # Permite ejecutar manualmente

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'  # Ajustar a tu versión
          channel: 'stable'
      
      - name: Get dependencies
        run: flutter pub get
      
      - name: Build web
        run: flutter build web --release --base-href "/${{ github.event.repository.name }}/"
      
      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
          # O si usas docs/:
          # publish_dir: ./build/web
          # destination_dir: ./docs
```

**Alternativa usando carpeta docs/:**

```yaml
name: Deploy to GitHub Pages

on:
  push:
    branches:
      - main
  workflow_dispatch:

jobs:
  build-and-deploy:
    runs-on: ubuntu-latest
    
    steps:
      - name: Checkout code
        uses: actions/checkout@v3
      
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
        with:
          flutter-version: '3.24.0'
          channel: 'stable'
      
      - name: Get dependencies
        run: flutter pub get
      
      - name: Build web
        run: flutter build web --release --base-href "/${{ github.event.repository.name }}/"
      
      - name: Copy to docs
        run: |
          rm -rf docs
          mkdir docs
          cp -r build/web/* docs/
          touch docs/.nojekyll
      
      - name: Commit and push
        run: |
          git config --local user.email "action@github.com"
          git config --local user.name "GitHub Action"
          git add docs/
          git commit -m "Deploy: Actualizar GitHub Pages [skip ci]" || exit 0
          git push
```

---

## ✅ Checklist Completo de Deploy

### Preparación
- [ ] Flutter web habilitado (`flutter config --enable-web`)
- [ ] `web/index.html` configurado correctamente
- [ ] `web/manifest.json` configurado
- [ ] Iconos en `web/icons/` (192x192, 512x512, maskable)
- [ ] Favicon en `web/favicon.png`
- [ ] Dependencias compatibles con web verificadas

### Build
- [ ] Script de build creado (`scripts/build_web.sh` o `.bat`)
- [ ] Base href configurado correctamente
- [ ] Build de release ejecutado exitosamente
- [ ] Build probado localmente
- [ ] Tamaño del build verificado (< 5MB recomendado)

### GitHub
- [ ] Repositorio en GitHub
- [ ] Script de deploy creado
- [ ] Carpeta `docs/` o rama `gh-pages` preparada
- [ ] Archivo `.nojekyll` creado
- [ ] GitHub Pages configurado en Settings

### Deploy
- [ ] Script de deploy ejecutado
- [ ] Archivos en `docs/` (o `gh-pages`)
- [ ] Commit y push realizados
- [ ] GitHub Pages activo
- [ ] App accesible en la URL

### Verificación
- [ ] App carga correctamente
- [ ] No hay errores 404
- [ ] Assets se cargan
- [ ] Navegación funciona
- [ ] Rutas funcionan correctamente
- [ ] Service Worker funciona (si aplica)
- [ ] PWA instalable (si aplica)

---

## 🚨 Problemas Comunes y Soluciones

### Problema 1: Rutas no funcionan (404 al recargar)
**Causa:** GitHub Pages no tiene soporte para SPA routing nativo.

**Solución:** Agregar `404.html` que redirija a `index.html`:

```html
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Street Muse</title>
  <script>
    var path = window.location.pathname;
    var newPath = '/REPO_NAME/index.html' + path;
    window.location.replace(newPath);
  </script>
</head>
<body>
  <p>Redirecting...</p>
</body>
</html>
```

O usar el plugin de GoRouter para manejar rutas en web.

---

### Problema 2: Assets no se cargan
**Causa:** Rutas relativas incorrectas o base href mal configurado.

**Solución:**
- Verificar que `base href` esté correcto en `index.html`
- Verificar que assets estén en `web/assets/` o referenciados correctamente
- Usar rutas absolutas desde la raíz: `/REPO_NAME/assets/...`

---

### Problema 3: Geolocalización no funciona
**Causa:** Geolocator requiere HTTPS en producción (excepto localhost).

**Solución:**
- GitHub Pages ya proporciona HTTPS automáticamente
- Verificar que la app esté en HTTPS (no HTTP)
- Agregar manejo de errores si el usuario no permite ubicación

---

### Problema 4: Mapas no se muestran
**Causa:** API key de mapas no configurada o tiles no cargan.

**Solución:**
- Verificar que las tiles de mapas estén configuradas para web
- `flutter_map` funciona en web, pero verificar configuración
- Considerar usar tiles públicas o configurar API key

---

### Problema 5: Build muy grande
**Causa:** Dependencias grandes o assets sin optimizar.

**Solución:**
- Revisar dependencias no utilizadas
- Optimizar imágenes (WebP)
- Habilitar tree-shaking (ya está en release)
- Considerar code splitting

---

## 📝 Comandos Rápidos

### Build y Deploy Manual
```bash
# Build
flutter build web --release --base-href "/REPO_NAME/"

# Copiar a docs
rm -rf docs && mkdir docs && cp -r build/web/* docs/ && touch docs/.nojekyll

# Git
git add docs/
git commit -m "Deploy: Actualizar GitHub Pages"
git push origin main
```

### Verificar Localmente
```bash
cd build/web
python -m http.server 8000
# Abrir http://localhost:8000
```

### Limpiar y Rebuild
```bash
flutter clean
flutter pub get
flutter build web --release --base-href "/REPO_NAME/"
```

---

## 📚 Recursos Útiles

### Documentación Oficial
- [Flutter - Build and release a web app](https://docs.flutter.dev/deployment/web)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Progressive Web Apps](https://web.dev/progressive-web-apps/)

### Herramientas
- [Lighthouse](https://developers.google.com/web/tools/lighthouse) - Auditoría PWA
- [Web.dev Measure](https://web.dev/measure/) - Análisis de performance
- [Can I Use](https://caniuse.com/) - Compatibilidad de APIs web

---

## 🎯 Próximos Pasos Inmediatos

1. **Verificar Flutter web habilitado**
   ```bash
   flutter doctor
   flutter config --enable-web
   ```

2. **Revisar archivos web**
   - `web/index.html`
   - `web/manifest.json`
   - `web/icons/`

3. **Crear scripts de build y deploy**
   - `scripts/build_web.sh` (o `.bat`)
   - `scripts/deploy_github_pages.sh` (o `.bat`)

4. **Probar build localmente**
   ```bash
   flutter build web --release
   cd build/web && python -m http.server 8000
   ```

5. **Configurar GitHub Pages**
   - Settings → Pages → Source: `/docs`

6. **Ejecutar primer deploy**
   ```bash
   bash scripts/deploy_github_pages.sh
   git add docs/ && git commit -m "Deploy" && git push
   ```

---

**Última actualización:** $(date)  
**Responsable:** Equipo de desarrollo  
**Estado:** ✅ Preparación completada - Listo para deploy

---

## ✅ Tareas Completadas

### Archivos Web Actualizados
- ✅ `web/index.html` - Meta tags y título actualizados
- ✅ `web/manifest.json` - Nombre, colores y descripción actualizados

### Scripts Creados
- ✅ `scripts/build_web.sh` - Script de build para Linux/Mac
- ✅ `scripts/build_web.bat` - Script de build para Windows
- ✅ `scripts/deploy_github_pages.sh` - Script de deploy para Linux/Mac
- ✅ `scripts/deploy_github_pages.bat` - Script de deploy para Windows

### Configuración
- ✅ `.gitignore` actualizado (docs/ no está ignorado)

---

## 🚀 Próximos Pasos Inmediatos

1. **Verificar Flutter web habilitado:**
   ```bash
   flutter doctor
   flutter config --enable-web
   ```

2. **Actualizar nombre del repositorio en scripts:**
   - Editar `scripts/build_web.sh` (línea 5): `REPO_NAME="TU_REPO_NAME"`
   - Editar `scripts/deploy_github_pages.sh` (línea 6): `REPO_NAME="TU_REPO_NAME"`
   - Hacer lo mismo en los archivos `.bat` para Windows

3. **Probar build localmente:**
   ```bash
   bash scripts/build_web.sh
   cd build/web
   python -m http.server 8000
   ```

4. **Configurar GitHub Pages:**
   - Ir a Settings → Pages
   - Source: Branch `main`, Folder `/docs`

5. **Ejecutar primer deploy:**
   ```bash
   bash scripts/deploy_github_pages.sh
   git add docs/
   git commit -m "Deploy: Configurar GitHub Pages"
   git push origin main
   ```
