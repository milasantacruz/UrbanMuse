# 📋 RutaListPage

## 📋 Descripción
Lista de todas las rutas guardadas del usuario. Permite ver, editar y eliminar rutas, además de crear nuevas. Es el centro de gestión de rutas personales.

**Persona principal:** Ana (Organizadora de Salidas), Carlos (Turista Cultural)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ Mis Rutas           [+ Nueva]│ ← App Bar
├─────────────────────────────────┤
│                                 │
│ 🛣️ Tienes 3 rutas guardadas    │ ← Header info
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ ┌──────┐                      ││
││ │[MAPA]│  "Murales de Palermo"││
││ │mini  │  📍 A → B            ││ ← Ruta Card
││ └──────┘  🎨 5 obras • 2.3 km ││
││           ⏱️ ~45 min a pie    ││
││                               ││
││ [Ver] [Crear Salida] [⋮]     ││
│└─────────────────────────────┘│
│                                 │
│ ┌─────────────────────────────┐│
││ ┌──────┐                      ││
││ │[MAPA]│  "Arte en La Boca"   ││
││ │mini  │  📍 A → B            ││
││ └──────┘  🎨 8 obras • 3.1 km ││
││           ⏱️ ~20 min en bici  ││
││                               ││
││ [Ver] [Crear Salida] [⋮]     ││
│└─────────────────────────────┘│
│                                 │
│ ┌─────────────────────────────┐│
││ ┌──────┐                      ││
││ │[MAPA]│  "Graffitis Centro"  ││
││ │mini  │  📍 A → B            ││
││ └──────┘  🎨 6 obras • 1.8 km ││
││           ⏱️ ~30 min a pie    ││
│└─────────────────────────────┘│
│         ↓ Scroll               │
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
| Título | "Mis Rutas" - Headline Small | `title: "Mis Rutas"` |
| Nueva ruta | "+ Nueva" - Text button o icon | `actions: [AppButton.text(label: "+ Nueva")]` |
| Altura | 56px | Material 3 standard |

### Header Info
**Widget:** `Container` con `AppTextStyles` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Icono | 🛣️ 24px | `AppIcon` con `AppIconSize.medium` |
| Texto | "Tienes X rutas guardadas" - Body Medium | `AppTextStyles.bodyMedium` |
| Padding | 16px | `AppSpacing.space4` |
| Fondo | Surface 2 | `AppColors.surface2` |

### Ruta Card
**Widget Implementado:** `AppRutaCard` ✅  
**Ubicación:** `lib/presentation/widgets/cards/app_ruta_card.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row (mapa mini + info) o Column | `AppRutaCard` con layout configurable |
| Fondo | Surface | `AppColors.surface` |
| Border radius | 12px | `AppBorderRadius.radiusLg` |
| Padding | 16px | `AppSpacing.space4` |
| Sombra | shadow-sm | `AppShadows.small` |
| Margin bottom | 12px | `AppSpacing.space3` |

### Mapa Mini (Thumbnail)
**Widget:** Integrado en `AppRutaCard` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | 80x80px | Configurado en `AppRutaCard` |
| Border radius | 8px | `AppBorderRadius.radiusMd` |
| Contenido | Preview de la ruta (estático) | Mapa thumbnail o placeholder |
| Fallback | Placeholder con icono 🗺️ | `AppIcon` con `Icons.map` |

### Info de Ruta
**Widget:** Integrado en `AppRutaCard` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | Body Large, Bold, max 2 líneas | `AppTextStyles.bodyLarge` con `fontWeight: FontWeight.bold` |
| Puntos | "📍 A → B" - Body Small, Neutral 600 | `AppTextStyles.bodySmall` con `AppColors.neutral600` |
| Stats row 1 | "🎨 X obras • X km" - Body Small | `AppTextStyles.bodySmall` con iconos |
| Stats row 2 | "⏱️ ~X min [transporte]" - Body Small, Neutral 600 | `AppTextStyles.bodySmall` con `AppColors.neutral600` |

### Action Buttons (en card)
**Widgets Implementados:** `AppButton.text`, `AppButton.outlined`, `PopupMenuButton` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row, gap 8px | `Row` con `AppSpacing.space2` |
| "Ver" | Text button, Primary | `AppButton.text(label: "Ver")` |
| "Crear Salida" | Outlined button, Primary | `AppButton.outlined(label: "Crear Salida")` |
| More menu | ⋮ (Editar, Eliminar, Compartir) | `PopupMenuButton` con items |

---

## 🔄 Estados

### Estado Vacío
```
┌─────────────────────────────────┐
│ ◀ Mis Rutas           [+ Nueva]│
├─────────────────────────────────┤
│                                 │
│                                 │
│          🛣️                     │
│                                 │
│    No tienes rutas guardadas    │
│                                 │
│    Crea tu primera ruta para    │
│    explorar arte urbano         │
│                                 │
│    [+ Crear mi primera ruta]    │
│                                 │
│                                 │
└─────────────────────────────────┘
```

### Loading
```
┌─────────────────────────────────┐
│ ┌─────────────────────────────┐│
││ ┌──────┐ ━━━━━━━━━━━━━━━━━━ ││
││ │░░░░░░│ ━━━━━━━━━━━        ││
││ │░░░░░░│ ━━━━━━━━━━━━━━     ││ ← Skeleton
││ └──────┘                     ││
│└─────────────────────────────┘│
│ ┌─────────────────────────────┐│
││ ┌──────┐ ━━━━━━━━━━━━━━━━━━ ││
││ │░░░░░░│ ━━━━━━━━━━━        ││
│└─────────────────────────────┘│
└─────────────────────────────────┘
```

### Confirmación de Eliminación
```
┌─────────────────────────────────┐
│                                 │
│   ⚠️ ¿Eliminar esta ruta?      │
│                                 │
│   "Murales de Palermo"          │
│                                 │
│   Esta acción no se puede       │
│   deshacer                      │
│                                 │
│   [Cancelar]    [Eliminar]      │
│                                 │
└─────────────────────────────────┘
```

### Feedback: Ruta Eliminada
```
┌─────────────────────────────────┐
│  ✅ Ruta eliminada              │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en "+ Nueva" | Navega a CreateRutaPage |
| Tap en Ruta Card | Navega a RutaDetailPage |
| Tap en "Ver" | Navega a RutaDetailPage |
| Tap en "Crear Salida" | Navega a CreateSalidaPage (con ruta preseleccionada) |
| Tap en ⋮ | Abre menú contextual |
| Tap en "Editar" (menú) | Navega a CreateRutaPage en modo edición |
| Tap en "Eliminar" (menú) | Muestra dialog de confirmación |
| Tap en "Compartir" (menú) | Abre share sheet |
| Pull to refresh | Recarga lista |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Header info:** 56px
- **Lista:** Scroll vertical, resto del espacio

### Card dimensions
- **Width:** Full width - 32px (padding)
- **Min height:** ~140px
- **Mapa mini:** 80x80px

### Espaciado
- **Padding horizontal:** 16px
- **Gap entre cards:** 12px

---

## 🔗 Navegación

### Llega desde:
- Menú lateral / Drawer
- Después de crear ruta (opción "Ir a Rutas")
- Back desde RutaDetailPage

### Navega hacia:
- **CreateRutaPage:** Tap en "+ Nueva"
- **RutaDetailPage:** Tap en card o "Ver"
- **CreateSalidaPage:** Tap en "Crear Salida"

---

## ✅ Checklist de Diseño

- [ ] App Bar con back, título y "+ Nueva"
- [ ] Header info con contador
- [ ] Ruta Card completa
- [ ] Mapa mini thumbnail
- [ ] Info de ruta (título, puntos, stats)
- [ ] Action buttons (Ver, Crear Salida, ⋮)
- [ ] Menú contextual (Editar, Eliminar, Compartir)
- [ ] Estado vacío
- [ ] Estado loading (skeleton)
- [ ] Dialog de confirmación de eliminación
- [ ] Toast de feedback

---

*Relacionado con:* `ux-flows.md` > Flow 3: Convertir Ruta en Salida Grupal
