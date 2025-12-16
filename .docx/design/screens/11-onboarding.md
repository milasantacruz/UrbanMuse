# 🎬 Onboarding

## 📋 Descripción
Secuencia de 3 pantallas de introducción que se muestran al abrir la app por primera vez. Explica las funcionalidades principales de Graffiti Trails de forma visual y concisa.

**Persona principal:** Todos los usuarios nuevos

---

## 🖼️ Pantalla 1: Descubre Arte Urbano

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│     ┌───────────────────────┐  │
│     │                       │  │
│     │    [ILUSTRACIÓN]      │  │
│     │    Mapa con pins      │  │
│     │    de obras           │  │
│     │                       │  │
│     └───────────────────────┘  │
│                                 │
│                                 │
│         🗺️ Descubre            │ ← Título
│       Arte Urbano               │
│                                 │
│    Explora grafitis, murales    │
│    y esculturas cerca de ti     │ ← Subtítulo
│    o en cualquier ciudad        │
│                                 │
│                                 │
│         ● ○ ○                   │ ← Page indicator
│                                 │
│                                 │
│                     [Siguiente] │ ← Botón
│        [Omitir]                 │
│                                 │
└─────────────────────────────────┘
```

---

## 🖼️ Pantalla 2: Crea tus Rutas

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│     ┌───────────────────────┐  │
│     │                       │  │
│     │    [ILUSTRACIÓN]      │  │
│     │    Ruta con pins      │  │
│     │    conectados A→B     │  │
│     │                       │  │
│     └───────────────────────┘  │
│                                 │
│                                 │
│        🛣️ Crea tus             │
│          Rutas                  │
│                                 │
│    Planifica recorridos con     │
│    las obras que más te         │
│    interesen                    │
│                                 │
│                                 │
│         ○ ● ○                   │
│                                 │
│                                 │
│ [Anterior]          [Siguiente] │
│        [Omitir]                 │
│                                 │
└─────────────────────────────────┘
```

---

## 🖼️ Pantalla 3: Explora en Grupo

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│     ┌───────────────────────┐  │
│     │                       │  │
│     │    [ILUSTRACIÓN]      │  │
│     │    Grupo de personas  │  │
│     │    mirando arte       │  │
│     │                       │  │
│     └───────────────────────┘  │
│                                 │
│                                 │
│      👥 Explora en              │
│          Grupo                  │
│                                 │
│    Organiza salidas grupales    │
│    y comparte la experiencia    │
│    con otros amantes del arte   │
│                                 │
│                                 │
│         ○ ○ ●                   │
│                                 │
│                                 │
│ [Anterior]          [Comenzar!] │ ← CTA final
│                                 │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### Ilustración/Imagen
**Widget:** `Image` o `SvgPicture` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | ~280x280px o 60% del ancho | `SizedBox(width: 280, height: 280)` o `AspectRatio` |
| Posición | Centro-superior | `Center` o `Align` |
| Estilo | Ilustración vectorial o imagen | `Image.asset` o `SvgPicture.asset` |
| Colores | Palette de la app (Primary, categorías) | Usar `AppColors` |
| Animación | (Opcional) Lottie o entrada sutil | `AnimatedOpacity` o `Lottie` package |

### Título
**Widget:** `Text` con `AppTextStyles.h1` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Headline Large (28px) | `AppTextStyles.h1` |
| Weight | Bold (700) | Incluido en `AppTextStyles.h1` |
| Color | OnSurface (#1D1617) | `AppColors.onSurface` |
| Icono | Emoji 24px antes del texto | `Text` con emoji o `AppIcon` |
| Alignment | Center | `textAlign: TextAlign.center` |

### Subtítulo
**Widget:** `Text` con `AppTextStyles.bodyMedium` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Body Medium (16px) | `AppTextStyles.bodyMedium` |
| Color | OnSurface Variant (#4A4F45) | `AppColors.onSurfaceVariant` |
| Alignment | Center | `textAlign: TextAlign.center` |
| Max width | 280px | `SizedBox(width: 280)` o `ConstrainedBox` |
| Max líneas | 3 | `maxLines: 3` |

### Page Indicator (Dots)
**Widget:** `Row` con `Container` circulares ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Dots | 3 círculos | `Row` con 3 `Container` |
| Tamaño | 8px cada uno | `width: 8, height: 8` |
| Gap | 12px | `AppSpacing.space3` |
| Activo | Primary (#6BA034), filled | `AppColors.primary` con `BoxShape.circle` |
| Inactivo | Neutral 300, outlined o filled gris | `AppColors.neutral300` |
| Posición | Centro, debajo del subtítulo | `Center` widget |

### Botón "Siguiente"
**Widget Implementado:** `AppButton.primary` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Filled, Primary | `AppButton.primary(label: "Siguiente")` |
| Texto | "Siguiente" (pantallas 1-2) | `label: "Siguiente"` |
| Posición | Bottom-right | `Align(alignment: Alignment.bottomRight)` |
| Ancho | Auto o 50% | `SizedBox` o `Expanded` |
| Altura | 48px | `AppButton` standard height |

### Botón "Anterior"
**Widget Implementado:** `AppButton.text` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Text button | `AppButton.text(label: "Anterior")` |
| Texto | "Anterior" | `label: "Anterior"` |
| Posición | Bottom-left | `Align(alignment: Alignment.bottomLeft)` |
| Visibilidad | Solo pantallas 2-3 | Conditional rendering |

### Botón "Omitir"
**Widget Implementado:** `AppButton.text` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Text button, Neutral 600 | `AppButton.text(label: "Omitir")` con `AppColors.neutral600` |
| Texto | "Omitir" | `label: "Omitir"` |
| Posición | Centro-bottom o top-right | `Center` o `Align` |
| Visibilidad | Pantallas 1-2 | Conditional rendering |

### Botón "Comenzar" (Pantalla final)
**Widget Implementado:** `AppButton.primary` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Filled, Primary, más grande | `AppButton.primary(label: "¡Comenzar!")` |
| Texto | "¡Comenzar!" | `label: "¡Comenzar!"` |
| Posición | Bottom-right o full width | `Expanded` para full width |
| Ancho | 50% o 100% | `SizedBox` o `Expanded` |
| Altura | 56px | `AppButton` large size |

---

## 🔄 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap "Siguiente" | Avanza a siguiente pantalla |
| Tap "Anterior" | Vuelve a pantalla anterior |
| Tap "Omitir" | Salta a pantalla principal (Mapa) |
| Tap "Comenzar" | Va a pantalla principal (Mapa) |
| Swipe left | Avanza a siguiente pantalla |
| Swipe right | Vuelve a pantalla anterior |
| Tap en dot | (Opcional) Salta a esa pantalla |

---

## 🎨 Contenido por Pantalla

### Pantalla 1: Descubre
| Elemento | Contenido |
|----------|-----------|
| Icono | 🗺️ |
| Título | "Descubre Arte Urbano" |
| Subtítulo | "Explora grafitis, murales y esculturas cerca de ti o en cualquier ciudad" |
| Ilustración | Mapa con pins de colores (categorías) |

### Pantalla 2: Rutas
| Elemento | Contenido |
|----------|-----------|
| Icono | 🛣️ |
| Título | "Crea tus Rutas" |
| Subtítulo | "Planifica recorridos con las obras que más te interesen" |
| Ilustración | Ruta conectando puntos A→B con obras |

### Pantalla 3: Grupo
| Elemento | Contenido |
|----------|-----------|
| Icono | 👥 |
| Título | "Explora en Grupo" |
| Subtítulo | "Organiza salidas grupales y comparte la experiencia con otros amantes del arte" |
| Ilustración | Personas explorando arte juntas |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **Safe area:** Respetar notch y home indicator
- **Ilustración area:** ~50% superior
- **Texto area:** ~30% centro
- **Navigation area:** ~20% inferior

### Espaciado
- **Padding horizontal:** 32px (más amplio que otras pantallas)
- **Gap entre título y subtítulo:** 16px
- **Gap entre subtítulo y dots:** 32px
- **Gap entre dots y botones:** 48px

### Animaciones
- **Transición entre pantallas:** Slide horizontal, 300ms
- **Ilustraciones:** Fade in o scale up, 400ms
- **Dots:** Morphing suave entre estados

---

## 🔗 Navegación

### Condiciones de aparición:
- Primera vez que se abre la app
- Flag en storage local: `hasSeenOnboarding = false`

### Después del onboarding:
- Navega a MapaPage (Home)
- Guarda flag: `hasSeenOnboarding = true`

### Si se omite:
- Navega directamente a MapaPage
- Guarda flag igualmente

---

## 💡 Notas de Diseño

1. **No intrusivo:** Siempre opción de omitir
2. **Visual primero:** Ilustraciones grandes, texto mínimo
3. **Progresión clara:** Dots indican posición
4. **Swipeable:** Gesto natural para navegar
5. **Memorable:** Colores y estilo coherentes con la app
6. **No repetir:** Solo se muestra una vez

---

## 🎨 Ideas para Ilustraciones

### Pantalla 1 - Descubre
- Mapa estilizado de una ciudad
- Pins de colores (rojo, azul, naranja, morado) dispersos
- Icono de ubicación del usuario
- Estilo: flat design, colores vibrantes

### Pantalla 2 - Rutas
- Línea conectando punto A a punto B
- Pins numerados (1, 2, 3) en el camino
- Persona caminando o en bici
- Estilo: ilustración vectorial

### Pantalla 3 - Grupo
- Grupo de 3-4 personas mirando un mural
- Mural colorido de fondo
- Personas con teléfonos/cámaras
- Estilo: friendly, diverso

---

## ✅ Checklist de Diseño

### General
- [ ] Container full screen
- [ ] Safe area respetada
- [ ] Page indicator (3 dots)
- [ ] Animación de transición

### Pantalla 1
- [ ] Ilustración "Mapa con pins"
- [ ] Título con emoji 🗺️
- [ ] Subtítulo "Explora..."
- [ ] Botón "Siguiente"
- [ ] Botón "Omitir"

### Pantalla 2
- [ ] Ilustración "Ruta A→B"
- [ ] Título con emoji 🛣️
- [ ] Subtítulo "Planifica..."
- [ ] Botón "Anterior"
- [ ] Botón "Siguiente"
- [ ] Botón "Omitir"

### Pantalla 3
- [ ] Ilustración "Grupo explorando"
- [ ] Título con emoji 👥
- [ ] Subtítulo "Organiza..."
- [ ] Botón "Anterior"
- [ ] Botón "¡Comenzar!"
- [ ] Sin "Omitir" (ya es la última)

---

*Relacionado con:* `ux-flows.md` > User Journey: Primera Experiencia
