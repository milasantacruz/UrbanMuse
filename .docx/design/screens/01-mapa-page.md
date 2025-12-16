# 🗺️ MapaPage (Home)

## 📋 Descripción
Pantalla principal de la app. Muestra un mapa interactivo con pins de obras de arte urbano. Es el punto de entrada principal y la navegación central de la experiencia.

**Persona principal:** María (Exploradora Urbana), Carlos (Turista Cultural)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ Graffiti Trails    🔍  ≡     │ ← App Bar
├─────────────────────────────────┤
│ [🎨 Graffiti] [🖼️ Mural] [🗿]  │ ← Filter Chips (horizontal scroll)
├─────────────────────────────────┤
│                                 │
│         🔴    🔵               │
│     🔴         🟠              │ ← Mapa con Pins
│           🟣       🔴          │    (colores por categoría)
│     🔵                🔵       │
│               📍               │ ← Ubicación usuario
│         🟠         🔴          │
│                                 │
│                         [+ ]   │ ← FAB "Crear Ruta"
│                                 │
├─────────────────────────────────┤
│  🗺️     📱     ⭐     👤      │ ← Bottom Navigation
│  Mapa   Feed   Top10  Perfil   │
└─────────────────────────────────┘
```

### Bottom Sheet (al tocar un pin)
```
┌─────────────────────────────────┐
│         ━━━━━━━━━━             │ ← Handle
├─────────────────────────────────┤
│ ┌─────────┐  Mural "Colores    │
│ │         │  de la Ciudad"     │
│ │ [FOTO]  │  Por: @ArtistaNom  │
│ │         │  [Badge: Mural]    │
│ └─────────┘  📍 Palermo        │
│                                 │
│ [ Ver más detalles →       ]   │ ← Botón principal
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### Header (App Bar)
**Widget Implementado:** `AppTopBar.home` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "Graffiti Trails" - Body Medium, Bold | `AppTopBar.home(title: "Graffiti Trails")` |
| Icono búsqueda | 24px, outline, tappable | `actions: [IconButton(icon: AppIcon.search)]` |
| Icono menú | 24px, hamburger/drawer | `actions: [IconButton(icon: AppIcon.menu)]` |
| Fondo | Surface (#FEF7FF) | `backgroundColor: AppColors.surface` |
| Altura | 56px | Material 3 standard |

### Filter Chips (Categorías)
**Widget Implementado:** `AppCategoryFilterChipGroup` ✅  
**Ubicación:** `lib/presentation/widgets/chips/app_filter_chip.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Horizontal scroll | `AppCategoryFilterChipGroup` con `SingleChildScrollView` |
| Chip style | Outlined o Filled según selección | `AppFilterChip` con `selected` state |
| Chips | Graffiti (#E74C3C), Mural (#3498DB), Escultura (#F39C12), Performance (#9B59B6) | Colores desde `AppColors.category*` |
| Tamaño | Height 32px, padding 12px horizontal | Configurado en `AppFilterChip` |
| Icono | 16px a la izquierda del texto | `CategoryIcon` integrado |
| Selección | Multiple (toggle) | `onSelected` callback con estado |

### Mapa
| Elemento | Especificación |
|----------|----------------|
| Provider | Placeholder o mockup estático |
| Zoom inicial | Nivel de barrio |
| Centro | Ubicación del usuario o Buenos Aires centro |
| Padding inferior | 80px (para bottom nav) |

### Pins de Mapa
**Widget Implementado:** `AppMapPin` ✅  
**Ubicación:** `lib/presentation/widgets/map_pins/app_map_pin.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | 32x40px (small), 40x50px (medium) | `AppMapPin(size: MapPinSize.small/medium)` |
| Forma | Teardrop (lágrima) | Custom painter en `AppMapPin` |
| Borde | 2px blanco | `borderWidth` configurable |
| Sombra | shadow-md | `showShadow: true` |
| Colores | Por categoría (ver palette) | `category: MapPinCategory.graffiti/mural/etc` |
| Estado activo | Scale 1.3x + elevación | `isSelected: true` (borde más grueso + glow) |
| Icono interior | Icono de categoría 16px, blanco | Icono automático según categoría |

### Pin de Ubicación del Usuario
**Widget Implementado:** `AppMapPin` con `animate: true` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | 40x50px (medium) | `AppMapPin(size: MapPinSize.medium)` |
| Color | Primary (#6BA034) | `category: MapPinCategory.userLocation` |
| Efecto | Pulso animado (círculo expandiéndose) | `animate: true` |
| Centro | Icono de persona | Icono automático |

### FAB (Floating Action Button)
**Widget Implementado:** `AppFAB` ✅  
**Ubicación:** `lib/presentation/widgets/buttons/app_fab.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Posición | Bottom-right, 16px margin | `Positioned` o `FloatingActionButton` |
| Tamaño | 56x56px | `AppFAB` standard size |
| Color | Primary (#6BA034) | `AppFAB(color: AppColors.primary)` |
| Icono | "route" o "add" - 24px, blanco | `AppFAB(icon: Icons.route)` |
| Sombra | shadow-lg | Elevation 6 (Material 3) |
| Label (opcional) | "Crear Ruta" | `AppFAB.extended(label: "Crear Ruta")` |

### Bottom Sheet (Preview de Obra)
**Widget Implementado:** `AppObraPreviewBottomSheet` ✅  
**Ubicación:** `lib/presentation/widgets/modals/app_obra_preview_bottom_sheet.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Handle | 4x40px, Neutral 300, centrado | Incluido en `AppObraPreviewBottomSheet` |
| Border radius | 28px top | `borderRadius: BorderRadius.vertical(top: Radius.circular(28))` |
| Padding | 16px | `AppSpacing.space4` |
| Sombra | shadow-xl | Elevation del modal |
| Imagen | 80px height, full width | `imageUrl` prop |
| Título obra | H3 (20px), max 2 líneas | `AppTextStyles.h3` |
| Nombre artista | Body Medium, onSurfaceVariant | `AppTextStyles.bodyMedium` |
| Badge categoría | CategoryBadge.rounded | `CategoryBadge.rounded` integrado |
| Ubicación | Body Small, icono location_on 16px | Opcional `distance` prop |
| Botón | Primary, "Ver detalles" | `AppButton.primary` integrado |
| Animación | Slide up desde bottom | `showModalBottomSheet` estándar |

**Uso:**
```dart
AppObraPreviewBottomSheet.show(
  context: context,
  imageUrl: obra.imageUrl,
  titulo: obra.titulo,
  artista: obra.artista,
  categoria: obra.categoria,
  onVerDetalles: () => Navigator.push(...),
);
```

### Bottom Navigation
**Widget Implementado:** `AppBottomNav` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_bottom_nav.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Items | Mapa, Feed, Top N, Perfil | `AppBottomNav` con 4 items |
| Altura | 80px (incluir safe area) | Material 3 standard |
| Item activo | Primary (#6BA034), filled icon | `selectedIndex` prop |
| Item inactivo | Neutral 600, outline icon | Automático |
| Labels | Caption (12px) | `AppTextStyles.caption` |
| Fondo | Surface (#FEF7FF) | `AppColors.surface` |
| Elevación | shadow-sm o border-top | Material 3 elevation |

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ App Bar                         │
├─────────────────────────────────┤
│ [Skeleton chips ━━━ ━━━ ━━━]   │
├─────────────────────────────────┤
│                                 │
│     [Mapa cargando...]         │
│     ⟳ Spinner central          │
│                                 │
├─────────────────────────────────┤
│ Bottom Navigation               │
└─────────────────────────────────┘
```

### Empty (Sin obras cercanas)
```
┌─────────────────────────────────┐
│ [Mapa sin pins]                 │
│                                 │
│  ┌─────────────────────────┐   │
│  │  🎨                      │   │
│  │  No hay obras cercanas   │   │
│  │  Explora otras zonas     │   │
│  │  [Ampliar búsqueda]      │   │
│  └─────────────────────────┘   │
└─────────────────────────────────┘
```

### Error (Sin conexión)
```
┌─────────────────────────────────┐
│  ⚠️ Sin conexión               │
│  Mostrando datos guardados     │
│  [Reintentar]                   │
└─────────────────────────────────┘
```

### Permiso de ubicación denegado
```
┌─────────────────────────────────┐
│  📍 Activa tu ubicación        │
│  Para ver obras cercanas        │
│  [Ir a Configuración]           │
│  [Continuar sin ubicación]      │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en pin | Abre Bottom Sheet con preview |
| Tap en "Ver más" (bottom sheet) | Navega a ObraDetailPage |
| Tap en nombre artista (bottom sheet) | Navega a ArtistaProfilePage |
| Tap en FAB | Navega a CreateRutaPage (paso 1) |
| Tap en Filter Chip | Toggle filtro, actualiza pins |
| Swipe down en Bottom Sheet | Cierra preview |
| Pinch en mapa | Zoom in/out |
| Drag en mapa | Pan/navegar |
| Tap en icono búsqueda | Abre modal de búsqueda |
| Tap en Bottom Nav item | Cambia de pantalla |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **Safe area top:** 44px (notch)
- **Safe area bottom:** 34px (home indicator)
- **App Bar height:** 56px
- **Filter chips height:** 48px
- **Bottom Nav height:** 56px + safe area
- **Mapa:** Ocupa todo el espacio restante

### Espaciado
- **Padding lateral:** 16px
- **Gap entre chips:** 8px
- **FAB margin:** 16px desde bordes

### Colores específicos
- **Fondo mapa:** Usar estilo de mapa claro
- **App Bar:** Surface (#FEF7FF)
- **Bottom Nav:** Surface (#FEF7FF)

---

## 🔗 Navegación

### Llega desde:
- App launch (pantalla inicial)
- Bottom Navigation desde cualquier pantalla
- "Ver en mapa" desde ObraDetailPage

### Navega hacia:
- **ObraDetailPage:** Tap en "Ver más" del Bottom Sheet
- **ArtistaProfilePage:** Tap en nombre de artista
- **CreateRutaPage:** Tap en FAB
- **FeedPage:** Bottom Nav "Feed"
- **TopNPage:** Bottom Nav "Top N" (rutas favoritas)
- **PerfilPage:** Bottom Nav "Perfil"
- **SearchModal:** Tap en icono búsqueda

---

## 💡 Notas de Diseño

1. **El mapa es el protagonista:** Maximizar espacio visible
2. **Pins agrupados:** Considerar clusters cuando hay muchos pins juntos
3. **Bottom Sheet parcial:** No cubrir todo el mapa, dejar contexto visible
4. **Transiciones suaves:** Animaciones de 250-350ms
5. **Colores vibrantes en pins:** Destacar sobre el mapa
6. **FAB siempre visible:** No ocultar al hacer scroll/pan

---

## ✅ Checklist de Diseño

- [ ] App Bar con búsqueda y menú
- [ ] Filter Chips horizontales (4 categorías)
- [ ] Mapa placeholder/mockup
- [ ] Pins por categoría (4 colores)
- [ ] Pin de ubicación del usuario
- [ ] FAB "Crear Ruta"
- [ ] Bottom Sheet preview de obra
- [ ] Bottom Navigation (4 items)
- [ ] Estado Loading
- [ ] Estado Empty
- [ ] Estado Error
- [ ] Estado sin permiso de ubicación

---

*Relacionado con:* `ux-flows.md` > Flow 1: Descubrir Obra
