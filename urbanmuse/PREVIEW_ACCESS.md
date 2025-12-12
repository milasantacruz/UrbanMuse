# 🎨 Acceso al Sistema de Preview de Componentes

## 🚀 Opciones de Acceso

### 1. Desde la Aplicación (Más Fácil)

**Cuando la app esté corriendo:**

1. La app inicia en la página principal (MapaPage)
2. Verás un **botón flotante verde** en la esquina inferior derecha que dice **"Preview Components"**
3. Haz clic en ese botón
4. ¡Listo! Estarás en el sistema de preview

```
┌─────────────────────────────────┐
│ 🗺️ Graffiti Trails            │
├─────────────────────────────────┤
│                                 │
│  Mapa Page - Por implementar    │
│                                 │
│                                 │
│                                 │
│                    ┌──────────┐ │
│                    │ 👁️ Preview│ │ ← Click aquí
│                    │ Components│ │
│                    └──────────┘ │
└─────────────────────────────────┘
```

### 2. URL Directa en el Navegador

Una vez que la app esté corriendo, puedes navegar directamente en el navegador:

**Índice de componentes:**
```
http://localhost:[puerto]/preview
```

**Showcase de botones:**
```
http://localhost:[puerto]/preview/buttons
```

> **Nota:** El puerto varía cada vez que ejecutas la app. Ejemplo: `http://localhost:65399/preview`

### 3. Desde el Código (Context Navigation)

En cualquier parte de la app con acceso a `BuildContext`:

```dart
// Navegar al índice de preview
context.push('/preview');

// Navegar directamente a botones
context.push('/preview/buttons');

// Navegar desde un botón
ElevatedButton(
  onPressed: () => context.push('/preview'),
  child: const Text('Ver Preview'),
)
```

---

## 🔄 Pasos para Ejecutar la App

### Primera Vez o Después de Cambios

1. **Limpia el build cache:**
   ```bash
   flutter clean
   flutter pub get
   ```

2. **Ejecuta la app:**
   ```bash
   # Para Web (recomendado para preview)
   flutter run -d chrome
   
   # O para Windows Desktop
   flutter run -d windows
   ```

3. **Espera a que compile** (la primera vez puede tardar unos minutos)

4. **Busca el botón verde** "Preview Components" en la página principal

---

## 🎯 Lo que Verás

### Página Principal del Preview (`/preview`)

```
┌─────────────────────────────────────┐
│ 🎨 Component Showcase              │
├─────────────────────────────────────┤
│                                     │
│ ⚛️ Atoms                            │
│ ┌─────────────────────────────┐   │
│ │ 🔘 Buttons          ✓ Impl. │   │ ← Click aquí
│ └─────────────────────────────┘   │
│ ┌─────────────────────────────┐   │
│ │ 🎯 Icons         Próximamente│   │
│ └─────────────────────────────┘   │
│                                     │
│ 🧬 Molecules                        │
│ ...                                 │
└─────────────────────────────────────┘
```

### Showcase de Botones (`/preview/buttons`)

```
┌─────────────────────────────────────┐
│ ← Buttons Preview                   │
├─────────────────────────────────────┤
│                                     │
│ Primary Buttons (Filled)            │
│ ┌─────────────┐                    │
│ │Primary Button│                   │
│ └─────────────┘                    │
│                                     │
│ ┌────────────────┐                 │
│ │+ With Left Icon│                 │
│ └────────────────┘                 │
│                                     │
│ Primary Buttons (Outlined)          │
│ ┌─────────────┐                    │
│ │Outlined Button│                  │
│ └─────────────┘                    │
│                                     │
│ Text Buttons (Flat)                 │
│ Text Button                         │
│                                     │
│ Floating Action Buttons             │
│ [+] [+] [+ Crear Ruta]             │
│                                     │
│ Button Combinations                 │
│ ...                                 │
└─────────────────────────────────────┘
```

---

## 🐛 Solución de Problemas

### Problema: "Solo veo Mapa Page por implementar"

**Causa:** La app no se reinició completamente después de agregar las nuevas páginas.

**Solución:**
1. Detén la app (`Ctrl+C` o botón Stop)
2. Ejecuta:
   ```bash
   flutter clean
   flutter pub get
   flutter run -d chrome
   ```
3. Espera a que compile completamente
4. Busca el botón "Preview Components"

### Problema: "El botón no aparece"

**Causa:** Hot reload no aplicó los cambios en MapaPage.

**Solución:**
1. En la terminal donde corre Flutter, presiona `R` (mayúscula) para **Hot Restart**
2. O reinicia la app completamente

### Problema: "Error al navegar a /preview"

**Causa:** Las rutas no están registradas correctamente.

**Solución:**
1. Verifica que `app_router.dart` tenga las rutas `/preview` y `/preview/buttons`
2. Reinicia la app completamente

---

## 📝 Siguientes Pasos

Una vez que puedas acceder al preview:

1. ✅ **Explora el índice** (`/preview`)
2. ✅ **Revisa los botones** (`/preview/buttons`)
3. ✅ **Testa diferentes estados** (hover, click, disabled)
4. ✅ **Compara con Figma** para validar colores
5. ⚠️ **Espera más componentes** (icons, inputs, cards...)

---

## 🎨 Colores a Verificar

Cuando veas los botones, verifica que los colores coincidan con Figma:

- ✅ **Primary Button:** Verde #6BA034
- ✅ **Outlined Button:** Borde verde #6BA034
- ✅ **Text on Primary:** Blanco #FFFFFF
- ✅ **Secondary Container:** Verde claro #E8F8DE

---

*Guía de acceso creada: 11 de Diciembre, 2025*  
*Sistema de Preview listo para usar* ✅

