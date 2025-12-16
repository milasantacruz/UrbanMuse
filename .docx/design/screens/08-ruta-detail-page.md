# 🗺️ RutaDetailPage

## 📋 Descripción
Vista detallada de una ruta guardada. Muestra el mapa con el recorrido completo, lista de obras en orden, información de la ruta (distancia, tiempo), y acciones como iniciar recorrido o crear salida grupal.

**Persona principal:** Carlos (Turista Cultural), Ana (Organizadora)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ "Murales de Palermo"    ⋮   │ ← App Bar con título de ruta
├─────────────────────────────────┤
│                                 │
│         [MAPA GRANDE]           │
│                                 │
│     📍A ─1─ 2 ─ 3 ─ 4 ─ 📍B    │ ← Ruta con pins numerados
│              5                  │
│                                 │
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ 📊 Resumen                    ││
││                               ││
││ 📏 2.3 km  ⏱️ ~45 min a pie  ││
││ 🎨 5 obras                    ││ ← Stats card
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ 📍 Recorrido                    │
│                                 │
│ ● Inicio: Av. Corrientes 1234   │
│ │                               │
│ 1 ┌─────────────────────────┐   │
│ │ │[IMG] "Colores Ciudad"   │   │
│ │ │      @Artista • Mural   │   │
│ │ └─────────────────────────┘   │
│ │                               │ ← Timeline de obras
│ 2 ┌─────────────────────────┐   │
│ │ │[IMG] "Street Dreams"    │   │
│ │ │      @Artista • Graffiti│   │
│ │ └─────────────────────────┘   │
│ │                               │
│ 3 ┌─────────────────────────┐   │
│   │[IMG] "Naturaleza Urbana"│   │
│   └─────────────────────────┘   │
│ │                               │
│ ● Fin: Plaza Italia             │
│         ↓ Scroll               │
├─────────────────────────────────┤
│ [🚶 Iniciar]  [👥 Crear Salida]│ ← Action buttons
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
**Widget Implementado:** `AppTopBar.detail` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Back button | ◀ 24px | `AppTopBar.detail(onBack: ...)` |
| Título | Nombre de la ruta - Body Large, ellipsis | `title: ruta.nombre` con `overflow: TextOverflow.ellipsis` |
| More menu | ⋮ (Editar, Eliminar, Compartir) | `actions: [PopupMenuButton(...)]` |
| Estilo | Surface o transparente sobre mapa | `transparent: true` o `backgroundColor: AppColors.surface` |

### Mapa de Ruta
| Elemento | Especificación |
|----------|----------------|
| Altura | 40% de la pantalla (~320px) | `AspectRatio` o `Container` con height |
| Contenido | Ruta completa visible, pins numerados | Mapa provider con `AppMapPin` numerados |
| Interacción | Tap en pin abre preview de obra | `onTap` callback en `AppMapPin` |
| Zoom controls | Opcional, +/- buttons | Mapa provider controls |

### Línea de Ruta (en mapa)
| Elemento | Especificación |
|----------|----------------|
| Color | Primary (#6BA034) | `AppColors.primary` |
| Ancho | 4px | `strokeWidth: 4` |
| Estilo | Sólido o dotted | `strokeDashArray` para dotted |

### Pins Numerados
**Widget Implementado:** `AppMapPin` con `number` prop ✅  
**Ubicación:** `lib/presentation/widgets/map_pins/app_map_pin.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | 40x50px (medium) | `AppMapPin(size: MapPinSize.medium)` |
| Fondo | Primary | `category: MapPinCategory.generic` o custom color |
| Número | Bold, blanco, centrado | `AppMapPin(number: 1, 2, 3...)` |
| Borde | 2px blanco | Integrado en `AppMapPin` |

### Pin Inicio/Fin
**Widget:** `AppMapPin` con labels personalizados ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Inicio (A) | Pin Primary con "A" o flag | `AppMapPin(category: MapPinCategory.userLocation)` con label "A" |
| Fin (B) | Pin Secondary con "B" o checkered flag | `AppMapPin(category: MapPinCategory.generic, customColor: AppColors.secondary)` con label "B" |

### Stats Card
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, 3 items |
| Fondo | Surface 2 |
| Border radius | 12px |
| Padding | 16px |
| Icons | 📏 📱 🎨 - 20px |
| Values | Body Medium, Bold |
| Labels | Caption, Neutral 600 |

### Timeline Section
| Elemento | Especificación |
|----------|----------------|
| Título | "📍 Recorrido" - Body Large, Bold |
| Layout | Vertical timeline |

### Timeline Item
```
┌─────────────────────────────────┐
│ 1 ┌──────┐  "Título Obra"       │
│ │ │[IMG] │  @artista • [Badge]  │
│ │ └──────┘                      │
│ │                               │
└─────────────────────────────────┘
```
| Elemento | Especificación |
|----------|----------------|
| Número | Circle badge, 24px, Primary |
| Línea | 2px, Neutral 300, vertical |
| Thumbnail | 60x60px, radius 8px |
| Título | Body Medium, Bold, max 1 línea |
| Subtítulo | Body Small, @artista + Badge |
| Tap action | Navega a ObraDetailPage |

### Punto Inicio/Fin (Timeline)
| Elemento | Especificación |
|----------|----------------|
| Icono | ● círculo, 12px |
| Color | Primary (inicio), Secondary (fin) |
| Label | "Inicio: [dirección]" / "Fin: [dirección]" |
| Texto | Body Small, Neutral 600 |

### Action Buttons (Footer)
**Widgets Implementados:** `AppButton.primary`, `AppButton.outlined` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row, 2 botones | `Row` con `Expanded` para cada botón |
| "Iniciar" | Filled Primary, icono 🚶 | `AppButton.primary(icon: Icons.directions_walk, label: "Iniciar")` |
| "Crear Salida" | Outlined Primary, icono 👥 | `AppButton.outlined(icon: Icons.group, label: "Crear Salida")` |
| Altura | 48px cada uno | `AppButton` standard height |
| Posición | Fixed bottom o scroll | `Positioned` o en `Column` |
| Padding | 16px | `AppSpacing.space4` |

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ ◀                               │
├─────────────────────────────────┤
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │ ← Skeleton mapa
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ ━━━━━  ━━━━━  ━━━━━         ││ ← Skeleton stats
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ ━━━━━━━━━━                     │
│ ○ ┌───────┐ ━━━━━━━━━         │
│ │ │░░░░░░░│ ━━━━━             │ ← Skeleton timeline
│ │ └───────┘                   │
│ ○ ┌───────┐ ━━━━━━━━━         │
│   │░░░░░░░│ ━━━━━             │
└─────────────────────────────────┘
```

### Error
```
┌─────────────────────────────────┐
│ ◀                               │
├─────────────────────────────────┤
│                                 │
│          ⚠️                     │
│    No se pudo cargar           │
│    la ruta                      │
│                                 │
│    [Reintentar]                 │
│                                 │
└─────────────────────────────────┘
```

### Iniciando Recorrido (feedback)
```
┌─────────────────────────────────┐
│  🚶 Iniciando navegación...     │
│     Abriendo mapas              │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en Back | Vuelve a RutaListPage |
| Tap en ⋮ | Abre menú (Editar, Eliminar, Compartir) |
| Tap en pin del mapa | Muestra preview de obra |
| Tap en obra del timeline | Navega a ObraDetailPage |
| Tap en "Iniciar" | Abre navegación externa (Google Maps) |
| Tap en "Crear Salida" | Navega a CreateSalidaPage |
| Pinch en mapa | Zoom in/out |
| Scroll | Navega por timeline |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Mapa:** ~280-320px (40%)
- **Stats card:** ~80px
- **Timeline:** Scroll, resto del espacio
- **Footer:** 80px

### Espaciado
- **Padding horizontal:** 16px
- **Gap entre secciones:** 16px
- **Gap en timeline:** 12px entre items

---

## 🔗 Navegación

### Llega desde:
- RutaListPage (tap en card o "Ver")
- Después de crear ruta (desde CreateRutaPage)
- MapaPage (si hay ruta activa)

### Navega hacia:
- **ObraDetailPage:** Tap en obra del timeline
- **CreateSalidaPage:** Tap en "Crear Salida"
- **Google Maps:** Tap en "Iniciar" (externa)
- **CreateRutaPage:** "Editar" desde menú

---

## ✅ Checklist de Diseño

- [ ] App Bar con título de ruta y menú
- [ ] Mapa grande con ruta trazada
- [ ] Pins numerados en mapa
- [ ] Pins de inicio (A) y fin (B)
- [ ] Stats card (distancia, tiempo, obras)
- [ ] Sección "Recorrido" con timeline
- [ ] Timeline items con obras
- [ ] Puntos de inicio y fin en timeline
- [ ] Botón "Iniciar"
- [ ] Botón "Crear Salida"
- [ ] Estado Loading (skeleton)
- [ ] Estado Error
- [ ] Menú contextual (Editar, Eliminar, Compartir)

---

*Relacionado con:* `ux-flows.md` > Flow 3: Convertir Ruta en Salida Grupal (pasos 3-4)
