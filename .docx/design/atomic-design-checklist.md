# 🔬 Atomic Design - Checklist y Plan de Implementación Figma

**Proyecto:** Graffiti Trails (UrbanMuse)  
**Base:** Syncfusion Flutter UI Kit - Material 3 Theme  
**Colores:** ✅ Sincronizados (ver `color-sync-report.md`)  
**Última actualización:** 12 de Diciembre, 2025

---

## 📊 Progreso General

### Flutter Implementation Status

| Nivel | Progreso | Completados | Total | Estado |
|-------|----------|-------------|-------|--------|
| **Design Tokens** | 100% | 5/5 | 5 | ✅ Completo |
| **Atoms** | 100% | 8/8 | 8 | ✅ Completo |
| **Molecules** | 56% | 5/9 | 9 | 🔄 En progreso |
| **Organisms** | 100% | 10/10 | 10 | ✅ Completo |
| **Templates** | 0% | 0/6 | 6 | ⏳ Pendiente |
| **Pages** | 0% | 0/9 | 9 | ⏳ Pendiente |

### 🎯 Completado Recientemente

- ✅ **Design Tokens Flutter** - Colores, Typography, Spacing, Border Radius, Shadows
- ✅ **Button Components (Atom)** - Primary, Secondary, Outlined, Text, FAB con todos los estados
- ✅ **Icon Components (Atom)** - Navigation, Action, Category (con colores), Map, Social, UI icons
- ✅ **Text Styles (Atom)** - Display, Headline, Body, Label, Caption, Button con preview completo
- ✅ **Input Fields (Atom)** - Text Field con modos Filled, Outlined, Flat, validación y estados
- ✅ **Filter Modal (Organism)** - Modal de filtros con categorías, artistas, search y acciones ✨
- ✅ **Obra Preview Bottom Sheet (Organism)** - Bottom sheet para preview de obra desde mapa/feed ✨
- ✅ **Top 10 Grid Item (Organism)** - Items del grid Top 10 con ranking, overlay y remove button ✨
- ✅ **Ruta Card (Organism)** - Tarjetas de ruta con mapa, stats (distance, duration, obras), transport icon y acciones ✨
- ✅ **App Bars & Navigation (Organism)** - Top bars (home, detail, create, map) + Bottom nav + Map bar ✨
- ✅ **Artist Card (Organism)** - Tarjetas de artista con avatar, bio, stats y botón de acción ✨
- ✅ **Obra Card (Organism)** - Tarjetas de obra (grid, list, compact) con badges y favoritos ✨
- ✅ **Route Step Indicator (Organism)** - Indicador de pasos para creación de rutas (6 pasos) con labels ✨
- ✅ **Filter Chips (Molecule)** - Chips de filtro multi-select, grupos, categorías con colores ✨
- ✅ **Search Bar (Molecule)** - Barra de búsqueda basada en AppTextField, modos filled/outlined/flat
- ✅ **Map Pins (Molecule)** - Pins de mapa por categoría, numerados, con avatar, clusters ✨
- ✅ **ATOMS 100% COMPLETOS** - ¡Todos los componentes atómicos implementados! 🎉
- ✅ **Tooltip (Molecule)** - Tooltips Normal y With Header, basados en Figma ✨
- ✅ **Dialog Box (Molecule)** - Diálogos con header/footer, confirm/alert helpers ✨

### 🎯 Siguiente en la Lista

1. **Artista Card (Organism)** - Tarjeta de artista con avatar y stats
2. **Ruta Card (Organism)** - Tarjeta de ruta con mapa preview
3. **App Bar (Organism)** - Barra de navegación superior con variantes

---

## 📋 Estructura de Carpetas en Figma

```
📱 Graffiti Trails - MVP1
│
├── 🎨 Design Tokens
│   ├── Colors (Variables) ✅ Del UI Kit
│   ├── Typography (Text Styles) ✅ Del UI Kit
│   ├── Spacing (Layout Grids)
│   ├── Border Radius
│   └── Shadows/Elevation
│
├── ⚛️ Atoms (Átomos)
│   ├── 01. Buttons
│   ├── 02. Icons
│   ├── 03. Text Styles
│   ├── 04. Input Fields
│   ├── 05. Avatars
│   ├── 06. Badges
│   ├── 07. Dividers
│   └── 08. Loading Indicators
│
├── 🧬 Molecules (Moléculas)
│   ├── 01. Search Bar
│   ├── 02. Filter Chip Group
│   ├── 03. Category Badge
│   ├── 04. Map Pin
│   ├── 05. Rating Display
│   ├── 06. Tooltip
│   ├── 07. Dialog Box
│   ├── 08. Image with Overlay
│   └── 09. Empty State Message
│
├── 🦠 Organisms (Organismos)
│   ├── 01. App Bar / Navigation Bar
│   ├── 02. Bottom Navigation
│   ├── 03. Obra Card
│   ├── 04. Artista Card
│   ├── 05. Ruta Card
│   ├── 06. Top 10 Grid Item
│   ├── 07. Filter Modal
│   ├── 08. Bottom Sheet (Obra Preview)
│   ├── 09. Obra Detail Header
│   └── 10. Route Step Indicator
│
├── 📐 Templates (Plantillas)
│   ├── 01. Map Template
│   ├── 02. Feed/Grid Template
│   ├── 03. Detail Page Template
│   ├── 04. Form Template
│   ├── 05. List Template
│   └── 06. Empty State Template
│
└── 📱 Pages (Páginas)
    ├── 01. MapaPage (Home)
    ├── 02. FeedPage
    ├── 03. ObraDetailPage
    ├── 04. ArtistaProfilePage
    ├── 05. CreateRutaPage (6 pasos)
    ├── 06. Top10Page
    ├── 07. RutaListPage
    ├── 08. RutaDetailPage
    └── 09. CreateSalidaPage
```

---

## ⚛️ NIVEL 1: Atoms (Átomos)

### 01. Buttons ✅

**Fuente:** Syncfusion UI Kit (usar directamente)  
**Estado:** ✅ Implementado en Flutter

- [x] **Primary Button (Filled)**
  - [x] Default state
  - [x] Hover state
  - [x] Active/Pressed state
  - [x] Disabled state
  - [x] Loading state
  - Color: Primary (#6BA034) ✅
  
- [x] **Secondary Button (Outlined)**
  - [x] Default state
  - [x] Hover state
  - [x] Active/Pressed state
  - [x] Disabled state
  - Border: Primary (#6BA034) ✅
  
- [x] **Text Button**
  - [x] Default state
  - [x] Hover state
  - [x] Active/Pressed state
  - [x] Disabled state
  
- [x] **FAB (Floating Action Button)**
  - [x] Default (Primary color)
  - [x] Large FAB
  - [x] Extended FAB (con texto)
  - Shadow: elevation 6 ✅

**Variants:** 4 estados × 4 tipos = 16 variantes ✅  
**Implementación Flutter:** `lib/presentation/widgets/buttons/`  
**Preview:** `/preview/buttons` ✅

---

### 02. Icons ✅

**Fuente:** Material Icons o Iconos del UI Kit  
**Estado:** ✅ Implementado en Flutter

- [x] **Navigation Icons**
  - [x] home / home_filled
  - [x] explore / explore_filled
  - [x] route / route_filled
  - [x] favorite / favorite_filled
  - [x] profile / profile_filled
  
- [x] **Action Icons**
  - [x] search
  - [x] filter / filter_filled
  - [x] add
  - [x] share
  - [x] close
  - [x] back/arrow_back
  - [x] more_vert (3 dots)
  - [x] edit
  - [x] delete
  
- [x] **Category Icons** (con colores específicos)
  - [x] graffiti (#E74C3C)
  - [x] mural (#3498DB)
  - [x] escultura (#F39C12)
  - [x] performance (#9B59B6)
  
- [x] **Map Icons**
  - [x] location / location_filled
  - [x] my_location
  - [x] directions
  - [x] directions_walk
  - [x] directions_bike
  
- [x] **Social Icons**
  - [x] share
  - [x] group / group_filled
  - [x] person / person_filled

- [x] **UI Icons**
  - [x] check / check_circle
  - [x] error / warning / info
  - [x] visibility / visibility_off
  - [x] calendar / time
  - [x] arrows / chevrons / expand

**Tamaños:** 16px, 24px, 32px, 48px ✅  
**Implementación Flutter:** `lib/presentation/widgets/icons/`  
**Preview:** `/preview/icons` ✅

---

### 03. Text Styles ✅

**Fuente:** Syncfusion UI Kit (usar directamente)  
**Estado:** ✅ Implementado en Flutter

- [x] **Display** (32px/40px, Bold) ✅
- [x] **H1 - Headline Large** (28px/36px, Bold) ✅
- [x] **H2 - Headline Medium** (24px/32px, SemiBold) ✅
- [x] **H3 - Headline Small** (20px/28px, SemiBold) ✅
- [x] **Body Large** (18px/26px, Regular) ✅
- [x] **Body Medium** (16px/24px, Regular) ✅
- [x] **Body Small** (14px/20px, Regular) ✅
- [x] **Label** (14px/20px, SemiBold) ✅
- [x] **Caption** (12px/16px, Regular) ✅
- [x] **Button** (14px/20px, Medium) ✅

**Fonts:** Expletus Sans (Display/Headline/Title), Exo 2 (Label/Body) ✅ Google Fonts  
**Implementación Flutter:** `lib/core/theme/app_text_styles.dart`  
**Preview:** `/preview/text-styles` ✅

---

### 04. Input Fields ✅

**Fuente:** Syncfusion UI Kit (adaptar)  
**Estado:** ✅ Implementado en Flutter

- [x] **Text Field**
  - [x] Default state
  - [x] Focused state
  - [x] Hovered state
  - [x] Error state (con icono y mensaje)
  - [x] Success state (con icono y mensaje)
  - [x] Disabled state
  - [x] With helper text
  - [x] With error text
  - [x] With prefix icon ✅
  - [x] With suffix icon ✅
  - [x] Required field indicator ✅
  
- [x] **Text Area** (multiline)
  - [x] Default state
  - [x] Focused state
  - [x] With maxLines configuration ✅
  
- [x] **Modos:**
  - [x] Filled (con fondo) ✅
  - [x] Outlined (solo borde) ✅
  - [x] Flat (solo borde inferior) ✅

- [x] **Tamaños:**
  - [x] Default (56px height) ✅
  - [x] Compact (40px height) ✅

**Variants:** Filled/Outlined/Flat × Normal/Focused/Hover/Disabled/Success/Error = 18 variantes ✅  
**Implementación Flutter:** `lib/presentation/widgets/inputs/`  
**Preview:** `/preview/inputs` ✅

---

### 05. Avatars ✅

**Fuente:** Syncfusion UI Kit (adaptar)  
**Estado:** ✅ Implementado en Flutter

- [x] **AppAvatar** (Main Component) ✅
  - [x] Small (32px) ✅
  - [x] Medium (48px) ✅
  - [x] Large (64px) ✅
  - [x] XLarge (88px - Figma default) ✅
  - [x] With image URL ✅
  - [x] With initials (texto) ✅
  - [x] Placeholder color ✅

- [x] **Badge Variants** ✅
  - [x] None (simple avatar)
  - [x] Verified (badge azul con check)
  - [x] Edit (badge con icono de cámara + callback)
  - Badge size: 26.67px (XLarge), escalable según tamaño
  - Badge background: #1C212B

- [x] **AppCircleAvatar** (Simplified) ✅
  - [x] Cualquier tamaño personalizable
  - [x] Para uso en listas y cards
  - [x] Con iniciales o imagen

**Implementación Flutter:** `lib/presentation/widgets/avatars/`  
**Preview:** `/preview/avatars` ✅

---

### 06. Badges ✅

**Fuente:** Syncfusion UI Kit Chips (adaptar)  
**Estado:** ✅ Implementado en Flutter

- [x] **Badge Dot** (6x6px) ✅
  - [x] Simple punto de notificación
  - [x] Colores personalizables
  
- [x] **Badge Circle** (16x16px) ✅
  - [x] Con número/letra central
  - [x] Font: Roboto Medium 11px
  - [x] Border radius: 26px (circular)
  
- [x] **Badge Rounded** ✅
  - [x] Con texto largo
  - [x] Padding horizontal: 4px
  - [x] Border radius: 12px
  - [x] Font: Roboto Medium 11px

- [x] **Category Badge** ✅
  - [x] Graffiti (color: #E74C3C)
  - [x] Mural (color: #3498DB)
  - [x] Escultura (color: #F39C12)
  - [x] Performance (color: #9B59B6)
  - [x] Dot, Circle y Rounded variants
  
- [x] **Notification Badge** ✅
  - [x] Overlay sobre iconos
  - [x] Auto-manejo de conteo (99+)
  - [x] Dot mode para indicador simple

**Variants:** Dot/Circle/Rounded × 4 categorías + colores custom = 12+ variantes ✅  
**Implementación Flutter:** `lib/presentation/widgets/badges/`  
**Preview:** `/preview/badges` ✅

---

### 07. Dividers ✅

- [x] **Horizontal Divider** ✅
  - [x] Full width ✅
  - [x] Inset (con padding izquierdo 16px) ✅
  - [x] Middle-inset (con padding horizontal 16px) ✅
  - [x] With Subhead (divider + subencabezado) ✅
  - Color: OnSurfaceVariant (#323232)
  
- [x] **Vertical Divider** ✅
  - [x] Full width ✅
  - [x] Inset (con padding superior) ✅
  - [x] Middle-inset (con padding ambos lados) ✅
  - Grosor: 1px
  
**Figma Reference:** [Dividers Component](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2031-165)

**Implementación Flutter:** `lib/presentation/widgets/dividers/`  
**Preview:** `/preview/dividers` ✅
  
- [ ] **Vertical Divider**
  - [ ] Small (16px)
  - [ ] Medium (24px)

---

### 08. Loading Indicators ✅

**Fuente:** Material 3 Components

- [x] **Circular Progress Indicator** ✅
  - [x] Small (24px) ✅
  - [x] Medium (40px) ✅
  - [x] Large (56px) ✅
  - [x] XLarge (72px) ✅
  - [x] Stroke widths: 2px, 4px, 6px, 8px ✅
  - [x] Indeterminate (animado) ✅
  - [x] Determinate (con progreso 0-100%) ✅
  - Color: Primary (#6BA034)
  
- [x] **Linear Progress Indicator** ✅
  - [x] Determinate (con progreso) ✅
  - [x] Indeterminate (animado) ✅
  - [x] Custom colors y height ✅
  
- [x] **AppLoaderButton** ✅
  - [x] Loader pequeño para botones (20px) ✅
  
- [x] **AppLoaderOverlay** ✅
  - [x] Loader con overlay de pantalla completa ✅
  - [x] Con mensaje personalizable ✅

**Figma Reference:** 
- [Progress Gradient Ring](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2033-201)
- [Progress Gradient](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2033-204)

**Implementación Flutter:** `lib/presentation/widgets/loading/`  
**Preview:** `/preview/loading` ✅

---

## 🧬 NIVEL 2: Molecules (Moléculas)

### 01. Search Bar ✅

**Componentes:** Input Field + Icon + Clear Button

- [x] **Search Bar Component** ✅
  - [x] Estado vacío (placeholder "Buscar obras...") ✅
  - [x] Estado con texto y botón clear ✅
  - [x] Estado focused ✅
  - [x] Con resultados (ejemplo interactivo) ✅
  - [x] Placeholders específicos (obras, artistas, rutas) ✅
  - [x] Custom colors (primary, secondary, accent) ✅
  - [x] Estado deshabilitado ✅
  - [x] Callbacks (onChange, onSubmitted, onClear) ✅

**Especificaciones:**
- Altura: 56px normal, 40px compact (igual que inputs estándar)
- Border radius: 28px / 20px (completamente redondeado)
- Border: 1px sólido, Secondary (#66715B)
- Placeholder: Roboto Regular 16px / 14px
- Iconos: Search (default), Clear (con texto)
- Padding horizontal: 16px

**Figma Reference:** [Search Bar Component](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2034-360)

**Implementación Flutter:** `lib/presentation/widgets/search/`  
**Preview:** `/preview/search-bar` ✅

---

### 02. Filter Chips ✅

**Componentes:** Filter Chip + Chip Group + Category Chip Group

- [x] **AppFilterChip** ✅
  - [x] Estados: Normal, Selected, Disabled ✅
  - [x] Con iconos (avatar, checkmark, delete) ✅
  - [x] Colores personalizados ✅
  - [x] Altura: 32px ✅
  - [x] Border radius: 8px ✅
  - [x] Font: Roboto Medium 14px ✅
  
- [x] **AppFilterChipGroup** ✅
  - [x] Horizontal scroll ✅
  - [x] Multi-select mode ✅
  - [x] Single-select mode ✅
  - [x] Callbacks onSelectionChanged ✅
  - [x] Gap configurable (default 8px) ✅
  
- [x] **AppCategoryFilterChipGroup** ✅
  - [x] Chips con colores de categoría ✅
  - [x] Iconos circulares de color ✅
  - [x] Graffiti, Mural, Escultura, Performance ✅

**Especificaciones:**
- Altura: 32px
- Border radius: 8px
- Font: Roboto Medium 14px, line-height 20px, tracking 0.014px
- Padding: 5px horizontal
- Icon sizes: 18px (left/avatar), 14px (right/close)
- Normal: background #f7f2fb, border #79747e
- Selected: background #e8f8de (secondaryContainer), border #e8f8de

**Figma Reference:** [Chips Component](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2064-501)

**Implementación Flutter:** `lib/presentation/widgets/chips/`  
**Preview:** `/preview/chips` ✅

---

### 03. Category Badge

**Componentes:** Badge + Icon

- [ ] **Category Badge con Icono**
  - [ ] Graffiti: Icon + Badge (#E74C3C)
  - [ ] Mural: Icon + Badge (#3498DB)
  - [ ] Escultura: Icon + Badge (#F39C12)
  - [ ] Performance: Icon + Badge (#9B59B6)
  
**Variants:** 4 categorías × 2 estados = 8 variantes

---

### 04. Map Pin ✅

**Componentes:** Icon + Color background + Shadow  
**Estado:** ✅ Implementado en Flutter

- [x] **AppMapPin Component** ✅
  - [x] Graffiti (red #E74C3C) ✅
  - [x] Mural (blue #3498DB) ✅
  - [x] Escultura (orange #F39C12) ✅
  - [x] Performance (purple #9B59B6) ✅
  - [x] User Location (primary green #6BA034) ✅
  - [x] Generic/Default (primary green) ✅
  - [x] Selected state (con borde más grueso y glow) ✅
  - [x] Tamaños: Small, Medium, Large, XLarge ✅
  - [x] Con número (para rutas 1-10) ✅
  - [x] Con avatar (imagen de artista) ✅
  - [x] Animación de pulso (user location) ✅
  
- [x] **AppMapPinDot** (simplificado) ✅
  - [x] Versión punto para zoom alejado ✅
  - [x] Tamaños configurables ✅
  
- [x] **AppMapPinCluster** (agrupación) ✅
  - [x] Muestra cantidad de obras (5, 12, 99+) ✅
  - [x] Colores personalizables ✅

**Tamaño base:** 40px × 50px (teardrop shape)  
**Figma Reference:** [Markers](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/?node-id=2036-431)

**Implementación Flutter:** `lib/presentation/widgets/map_pins/`  
**Preview:** `/preview/map-pins` ✅

---

### 05. Rating Display

**Componentes:** Stars + Text

- [ ] **Rating Component**
  - [ ] 5 stars (filled/half/empty)
  - [ ] Text: "4.5 (120 reviews)"
  - Color: Warning (#F39C12) para stars

---

### 06. Tooltip ✅

**Componentes:** Container + Text + Icon (opcional)
**Estado:** ✅ Implementado en Flutter

- [x] **AppTooltip** (Main Component)
  - [x] **Type: Normal**
    - [x] Background: OnSurface (#1C1B1F)
    - [x] Text color: OnInverseSurface (#F4EFF4)
    - [x] Border radius: 2px
    - [x] Padding: 3px vertical, 8px horizontal
    - [x] Font: Roboto Regular 12px, line-height 16px
  - [x] **Type: With Header**
    - [x] Header text: Roboto Medium 12px
    - [x] Body text: Roboto Regular 12px
    - [x] Close icon (12px, opcional)
    - [x] Border radius: 4px
    - [x] Padding: 8px
    - [x] Width: 181px (configurable)
    - [x] Gap interno: 12px

- [x] **AppTooltipWrapper** (Helper Widget)
  - [x] Envuelve widgets con tooltip on tap/long press
  - [x] Auto-posicionamiento
  - [x] Auto-hide para tooltip normal

**Figma Reference:** [Tooltip Component](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3975-28867)

**Variants:** Normal / With Header × Close Icon on/off = 4 variantes ✅
**Implementación Flutter:** `lib/presentation/widgets/tooltips/`  
**Preview:** `/preview/tooltips` ✅

---

### 07. Dialog Box ✅

**Componentes:** Container + Header + Content + Footer
**Estado:** ✅ Implementado en Flutter

- [x] **AppDialogBox** (Main Component)
  - [x] **Header Section** (opcional)
    - [x] Title: Roboto Regular 24px, line-height 32px
    - [x] Close icon: 24px (en container 32px)
    - [x] Background: Surface3 (#EEF4E8)
    - [x] Padding: 24px horizontal, 24px top, 16px bottom
    - [x] Border radius top: 36px
  - [x] **Content Area**
    - [x] Fondo: Surface3 (#EEF4E8)
    - [x] Área flexible para contenido personalizado
  - [x] **Footer Section** (opcional)
    - [x] Botones: Cancel (outline) + OK (primary)
    - [x] Gap entre botones: 12px
    - [x] Padding: 24px
    - [x] Border radius bottom: 36px
    - [x] Height: 88px

- [x] **Constructores especializados**
  - [x] `AppDialogBox.simple()` - Solo contenido
  - [x] `AppDialogBox.confirm()` - Con header y footer completo
  - [x] `AppDialogBox.alert()` - Solo botón OK

- [x] **Helper Functions**
  - [x] `showAppDialog()` - Muestra dialog de confirmación
  - [x] `showAppAlert()` - Muestra alert simple

**Especificaciones:**
- Width: 417px (ajustable)
- Height: 316px (ajustable según contenido)
- Border radius: 36px (7xl)
- Primary button color: #6BA034
- Cancel button: Transparent con texto primary

**Figma Reference:** [Dialog Box Component](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2134-781)

**Variants:** Header on/off × Footer on/off × Icon on/off = 8 variantes ✅
**Implementación Flutter:** `lib/presentation/widgets/dialogs/`  
**Preview:** `/preview/dialogs` ✅

---

### 08. Image with Overlay

**Componentes:** Image + Gradient Overlay + Text

- [ ] **Image Overlay Component**
  - [ ] Image placeholder
  - [ ] Bottom gradient (black 0% → 60% opacity)
  - [ ] Text overlay (white)
  - [ ] Category badge (top-right corner)

---

### 09. Empty State Message

**Componentes:** Icon + Heading + Body text

- [ ] **Empty State**
  - [ ] Large icon (48px)
  - [ ] Heading (H3)
  - [ ] Body text
  - [ ] Optional CTA button
  
**Variantes:**
- "No hay obras cerca"
- "Top 10 vacío"
- "Sin rutas guardadas"

---

## 🦠 NIVEL 3: Organisms (Organismos)

### 01. App Bar / Navigation Bar ✅

**Fuente:** Syncfusion UI Kit (adaptar)  
**Componentes:** Container + Logo/Title + Actions  
**Estado:** ✅ Implementado en Flutter

- [x] **AppTopBar.home** (MapaPage, FeedPage) ✅
  - [x] Title: "Graffiti Trails" / "Explorar" ✅
  - [x] Search icon (right) ✅
  - [x] Filter icon (right) ✅
  - [x] Background: Surface (#FEF7FF) ✅
  - [x] Elevation: 0 ✅
  
- [x] **AppTopBar.detail** (Detail Pages) ✅
  - [x] Back button (left) ✅
  - [x] Title (center) ✅
  - [x] Share icon (right) ✅
  - [x] More icon (right) ✅
  
- [x] **AppTopBar.create** (Create/Edit) ✅
  - [x] Close button (left) ✅
  - [x] Title: "Crear Ruta" (center) ✅
  - [x] Save/Next button (right) ✅

- [x] **AppTopBar.map** (Transparente) ✅

- [x] **AppMapBar** (Botones flotantes) ✅
  - [x] Search, Filter, Location buttons ✅

**Height:** 56px (Material 3 standard)  
**Figma:** https://www.figma.com/design/.../node-id=2044-2028  
**Preview:** `/preview/app-bars` ✅

---

### 02. Bottom Navigation ✅

**Fuente:** Syncfusion UI Kit (usar directamente)  
**Componentes:** 4 Navigation Items + Icons + Labels  
**Estado:** ✅ Implementado en Flutter

- [x] **AppBottomNav** ✅
  - [x] Item: Mapa (map icon) ✅
  - [x] Item: Explorar (explore icon) ✅
  - [x] Item: Rutas (route icon) ✅
  - [x] Item: Top 10 (star icon) ✅
  - [x] Estados: Selected, Unselected ✅
  - [x] Color selected: Primary (#6BA034) ✅

- [x] **AppBottomNavWithFAB** (con FAB) ✅

**Height:** 80px (Material 3 standard)  
**Figma:** https://www.figma.com/design/.../node-id=2044-571  
**Preview:** `/preview/app-bars` ✅

---

### 03. Obra Card ✅

**Componentes:** Image + Text + Badges + Actions  
**Estado:** ✅ Implementado en Flutter

- [x] **AppObraCard.grid** (Grid Version para FeedPage) ✅
  - [x] Image con aspect ratio configurable (4:3, 16:9, 1:1) ✅
  - [x] Category Badge (top-right overlay) ✅
  - [x] Title (H3, max 2 líneas) ✅
  - [x] Artist name (body small) ✅
  - [x] Location (body small + icon place) ✅
  - [x] Favorite icon (top-left con toggle) ✅
  - [x] Likes count ✅
  - [x] Shadow: Elevation 2 (AppShadows.small) ✅
  - [x] Border radius: 12px ✅
  - [x] onTap callback ✅
  
- [x] **AppObraCard.list** (List Version para Búsqueda) ✅
  - [x] Horizontal layout ✅
  - [x] Image (square, 80px) ✅
  - [x] Content (title + artist + location) ✅
  - [x] Category badge ✅
  - [x] Chevron icon (right) ✅
  - [x] onTap callback ✅
  
- [x] **AppObraCardCompact** (Mini Version) ✅
  - [x] Width: 120px ✅
  - [x] Image cuadrada ✅
  - [x] Title + Artist ✅
  - [x] Category dot indicator ✅
  - [x] Para horizontal scroll ✅

**Especificaciones:**
- Border radius: 12px
- Shadow: Elevation 2 (0 4px 6px rgba(0, 0, 0, 0.1))
- Padding contenido: 12px (AppSpacing.space3)
- Gap elementos: 8px / 4px
- Grid: 2 columnas, gap 12px, aspect ratio 0.75
- List: height 80px, horizontal layout

**Figma Reference:** [Obra Card Component](https://www.figma.com/design/.../node-id=2040-13)

**Implementación Flutter:** `lib/presentation/widgets/cards/`  
**Preview:** `/preview/obra-card` ✅

**Casos de uso:**
- Feed page grid (2 columnas)
- Resultados de búsqueda (lista horizontal)
- Obras relacionadas (compact horizontal scroll)
- Perfil de artista (grid de obras)
- Top 10 (grid especial)

---

### 04. Artista Card ✅

**Componentes:** Avatar + Text + Stats + Button  
**Estado:** ✅ Implementado en Flutter

- [x] **AppArtistCard** (Standard Version) ✅
  - [x] Avatar (72px / 88px xLarge) ✅
  - [x] Artist name (H3) ✅
  - [x] Bio (body small, max 2 líneas) ✅
  - [x] Stats row (obras count + followers) ✅
  - [x] Stats con iconos (palette, people) ✅
  - [x] Formateo de números (1k, 1M) ✅
  - [x] "Ver perfil" button (outlined, isExpanded) ✅
  - [x] Shadow: Elevation 2 (AppShadows.small) ✅
  - [x] Padding: 16px (AppSpacing.space4) ✅
  - [x] Border radius: 12px ✅
  - [x] Background: Secondary (#66715B) ✅
  - [x] Text color: OnSecondary (blanco) ✅
  
- [x] **AppArtistCard.compact** (Sin botón) ✅
  - [x] Version compacta para grids ✅
  - [x] Avatar 64px (large) ✅
  - [x] Padding: 12px ✅
  - [x] Sin botón de acción ✅
  
- [x] **AppArtistCardHorizontal** (List Version) ✅
  - [x] Layout horizontal ✅
  - [x] Avatar 48px (medium) ✅
  - [x] Contenido: Name + Bio + Stats ✅
  - [x] Chevron icon (right) ✅
  - [x] Padding: 12px ✅

**Especificaciones:**
- Border radius: 12px
- Shadow: Elevation 2 (0 4px 6px rgba(0, 0, 0, 0.1))
- Padding: 16px standard, 12px compact
- Avatar sizes: xLarge (88px), Large (64px), Medium (48px)
- Background: Secondary (#66715B)
- Text: OnSecondary (blanco) con opacity variations
- Stats con tooltips
- Soporte para avatares: image URL, local asset, o initials

**Figma Reference:** [Artist Card Component](https://www.figma.com/design/.../node-id=2043-2173)

**Implementación Flutter:** `lib/presentation/widgets/cards/`  
**Preview:** `/preview/artist-card` ✅

**Casos de uso:**
- Feed de artistas destacados
- Resultados de búsqueda de artistas
- Sección "Artistas relacionados"
- Grid de artistas en exploración
- Lista de seguidores/siguiendo

---

### 05. Ruta Card ✅

**Componentes:** Map thumbnail + Text + Stats + Actions  
**Estado:** ✅ Implementado en Flutter

- [x] **AppRutaCard** (Standard Version) ✅
  - [x] Map thumbnail/placeholder (16:9) ✅
  - [x] Route name (H3) ✅
  - [x] Stats row: Distance + Duration + Obras count ✅
  - [x] Transport icon badge (walk/bike/car) ✅
  - [x] Date created (con formato relativo) ✅
  - [x] Action buttons (Share, Delete) ✅
  - [x] Shadow: Elevation 2 ✅
  - [x] Border radius: 12px ✅
  - [x] Background: Secondary (#66715B) ✅
  - [x] Text: OnSecondary (blanco) ✅
  
- [x] **AppRutaCard.compact** (Sin acciones) ✅
  - [x] Versión compacta para grids ✅
  - [x] Sin fecha ni action buttons ✅
  - [x] Padding: 12px ✅
  
- [x] **AppRutaCardHorizontal** (List Version) ✅
  - [x] Layout horizontal ✅
  - [x] Map thumbnail cuadrado (80px) ✅
  - [x] Stats compactos ✅
  - [x] Chevron icon (right) ✅
  - [x] Height: 100px ✅

- [x] **TransportType Enum** ✅
  - [x] walk (directions_walk) ✅
  - [x] bike (directions_bike) ✅
  - [x] car (directions_car) ✅

**Especificaciones:**
- Border radius: 12px
- Shadow: Elevation 2 (0 4px 6px rgba(0, 0, 0, 0.1))
- Map thumbnail: 16:9 aspect ratio
- Transport badge: circular, 40px, primary color
- Stats icons: 16px
- Padding: 16px standard, 12px compact
- Background: Secondary (#66715B)
- Text: OnSecondary (blanco) con opacity variations
- Formateo inteligente de duración (min, h, h m)
- Formateo relativo de fechas (Hoy, Ayer, hace X días)

**Implementación Flutter:** `lib/presentation/widgets/cards/`  
**Preview:** `/preview/ruta-card` ✅

**Casos de uso:**
- Lista de rutas guardadas
- Rutas sugeridas/destacadas
- Historial de rutas completadas
- Selección de ruta para salida grupal

---

### 06. Top 10 Grid Item ✅

**Componentes:** Image + Ranking Number + Overlay  
**Estado:** ✅ Implementado en Flutter

- [x] **AppTop10Item** ✅
  - [x] Large image (square o 4:5) ✅
  - [x] Ranking number (top-left) ✅
    - [x] Circle background (primary color) ✅
    - [x] White number (1-10) ✅
    - [x] Size: 40px ✅
  - [x] Title overlay (bottom) ✅
  - [x] Gradient overlay (negro 0% → 60% opacity) ✅
  - [x] Remove button (top-right, pequeño) ✅
  - [x] Border radius: 12px ✅
  - [x] Shadow: Elevation 2 ✅
  - [x] Aspect ratio configurable (1.0 square, 0.8 portrait) ✅
  
- [x] **AppTop10Grid** ✅
  - [x] Grid de 2 columnas ✅
  - [x] Spacing configurable ✅
  - [x] Aspect ratio configurable ✅
  - [x] Callbacks onItemTap y onItemRemove ✅
  - [x] Soporte para lista de Top10ItemData ✅
  
- [x] **AppTop10EmptySlot** ✅
  - [x] Slot vacío para < 10 obras ✅
  - [x] Placeholder con icono y texto ✅
  - [x] Border dashed ✅
  - [x] onTap callback ✅

- [x] **Top10ItemData Model** ✅
  - [x] imageUrl, titulo, ranking ✅

**Especificaciones:**
- Border radius: 12px
- Shadow: Elevation 2 (0 4px 6px rgba(0, 0, 0, 0.1))
- Ranking badge: 40px circle, primary color, white number
- Remove button: 32px circle, error color, white icon
- Gradient overlay: 80px height, black 0% → 60% opacity
- Title: bodySmall, white, bold, max 2 líneas
- Grid: 2 columnas, spacing 12px
- Aspect ratios: 1.0 (square), 0.8 (4:5 portrait)

**Implementación Flutter:** `lib/presentation/widgets/cards/`  
**Preview:** `/preview/top10-item` ✅

**Casos de uso:**
- Top10Page con grid de 10 obras
- Ranking visual de obras favoritas
- Reordenamiento (drag & drop futuro)
- Empty slots cuando hay < 10 obras
- Eliminación de obras del Top 10

---

### 07. Filter Modal ✅

**Fuente:** Syncfusion UI Kit Bottom Sheet (adaptar)  
**Componentes:** Modal + Filter Groups + Buttons  
**Estado:** ✅ Implementado en Flutter

- [x] **AppFilterModal** (Bottom Sheet) ✅
  - [x] Handle bar (top, 40px width, 4px height) ✅
  - [x] Title: "Filtros" (H2) ✅
  - [x] Close button (top-right) ✅
  - [x] **Section: Categorías** ✅
    - [x] Filter Chip Group (múltiple selección) ✅
    - [x] AppCategoryFilterChipGroup integrado ✅
  - [x] **Section: Artistas** ✅
    - [x] Search bar (AppSearchBar) ✅
    - [x] Artist list con checkboxes circulares ✅
    - [x] Filtrado en tiempo real ✅
    - [x] Empty state cuando no hay resultados ✅
  - [x] Dividers entre secciones (AppDivider) ✅
  - [x] **Footer:** ✅
    - [x] "Limpiar" button (text) ✅
    - [x] "Aplicar filtros" button (primary) ✅
    - [x] Shadow superior para separación ✅
  
- [x] **AppFilterModal.show()** (Helper) ✅
  - [x] showModalBottomSheet wrapper ✅
  - [x] Retorna Map con categories y artists ✅
  - [x] Height: 70% de pantalla ✅
  - [x] Border radius: 28px (top corners) ✅

**Especificaciones:**
- Height: 70% de pantalla (configurable)
- Border radius: 28px (top corners)
- Handle bar: 40px × 4px, rounded 2px
- Padding: 16px (AppSpacing.space4)
- Background: Surface (#FEF7FF)
- Scrollable content area
- Footer sticky con shadow
- Checkboxes: 24px circle, primary color cuando seleccionado

**Implementación Flutter:** `lib/presentation/widgets/modals/`  
**Preview:** `/preview/filter-modal` ✅

**Casos de uso:**
- FeedPage - Filtrar obras por categoría y artista
- MapaPage - Filtrar pins en el mapa
- Búsqueda avanzada
- Filtros múltiples con estado persistente

---

### 08. Bottom Sheet (Obra Preview) ✅

**Componentes:** Handle + Image + Text + CTA  
**Estado:** ✅ Implementado en Flutter

- [x] **AppObraPreviewBottomSheet** ✅
  - [x] Handle bar (40px × 4px, rounded 2px) ✅
  - [x] Small image (80px height, full width) ✅
  - [x] Title (H3 - AppTextStyles.h3) ✅
  - [x] Artist name (Body Medium, onSurfaceVariant) ✅
  - [x] Category badge (CategoryBadge.rounded) ✅
  - [x] Distance from user (opcional, con icono location_on) ✅
  - [x] "Ver detalles" button (primary, expanded) ✅
  - [x] Swipe up para expandir a full detail (futuro) ⏳

- [x] **AppObraPreviewBottomSheet.show()** (Helper) ✅
  - [x] showModalBottomSheet wrapper ✅
  - [x] Height inicial: 25% de pantalla (configurable) ✅
  - [x] Border radius: 28px (top corners) ✅
  - [x] Background: secondaryContainer ✅

**Especificaciones:**
- Height inicial: 25% de pantalla (configurable via `initialHeight`)
- Border radius: 28px (top corners)
- Handle bar: 40px × 4px, rounded 2px
- Image: 80px height, full width, BoxFit.cover
- Padding: 16px (AppSpacing.space4)
- Background: secondaryContainer (#E8F8DE)
- Title: H3, max 2 líneas, ellipsis
- Category badge: CategoryBadge.rounded con colores específicos
- Distance: Opcional, con icono location_on (16px)
- Button: Primary, expanded width

**Implementación Flutter:** `lib/presentation/widgets/modals/`  
**Preview:** `/preview/obra-preview-bottom-sheet` ✅

**Casos de uso:**
- MapaPage - Al tocar un pin, mostrar preview
- FeedPage - Al tocar una card, mostrar preview
- Navegación rápida a ObraDetailPage
- Preview antes de ver detalles completos

---

### 09. Obra Detail Header ✅

**Componentes:** Hero Image + Gradient + Back Button + Actions  
**Estado:** ✅ Implementado en Flutter

- [x] **AppObraDetailHeader** ✅
  - [x] Hero image (full width, aspect ratio configurable 16:9, 4:3, 1:1) ✅
  - [x] Bottom gradient overlay (negro 0% → 60% opacity) ✅
  - [x] Back button (top-left, floating con fondo semi-transparente) ✅
  - [x] Share button (top-right, floating) ✅
  - [x] Favorite button (top-right, floating, con estado toggle) ✅
  - [x] Title overlay (bottom, sobre gradiente, texto blanco) ✅
  - [x] Category badge (top-right, debajo de botones, con color de categoría) ✅
  - [x] Aspect ratio configurable ✅
  - [x] Callback onImageTap (para fullscreen) ✅
  - [x] Opción showTitleOverlay (ocultar título) ✅
  - [x] Loading state para imagen ✅
  - [x] Error state para imagen (placeholder) ✅

**Implementación Flutter:** `lib/presentation/widgets/headers/`  
**Preview:** `/preview/obra-detail-header` ✅

---

### 10. Route Step Indicator ✅

**Componentes:** Step Numbers + Progress Line + Labels
**Estado:** ✅ Implementado en Flutter

- [x] **AppRouteStepIndicator** (Main Component)
  - [x] 6 steps numbered (1-6) ✅
  - [x] Progress line connecting steps ✅
  - [x] Current step highlighted (primary color) ✅
  - [x] Completed steps (check icon) ✅
  - [x] Future steps (gray) ✅
  - [x] Step labels below numbers ✅
  - [x] Horizontal layout, scrollable ✅
  - [x] Constructor `createRuta` con labels predefinidos ✅
  - [x] Pasos personalizables (número y labels) ✅
  - [x] Modo scrollable/no-scrollable ✅

**Especificaciones:**
- Step circle: 40px
- Completed: Primary color + check icon (24px)
- Current: Primary color + number + shadow
- Upcoming: Gray (neutral300) + border + number
- Connector line: 40px width, 2px height
- Label: Roboto 12px, 60px width (fixed), max 2 lines
- Padding horizontal: 16px
- Gap entre elementos: 4px

**Figma Reference:** Basado en Material 3 Stepper y design system de Graffiti Trails

**Implementación Flutter:** `lib/presentation/widgets/step_indicators/`  
**Preview:** `/preview/route-step-indicator` ✅

**Casos de uso:**
- CreateRutaPage - Indicador de 6 pasos del flujo
- Formularios multi-step
- Procesos guiados con pasos

---

## 📐 NIVEL 4: Templates (Plantillas)

### 01. Map Template

**Wireframe de página con mapa**

- [ ] **Map Page Template**
  - [ ] App Bar (fixed top)
  - [ ] Map area (full screen behind)
  - [ ] Search Bar (floating, top)
  - [ ] Filter Chips (horizontal scroll, below search)
  - [ ] FAB "Crear Ruta" (bottom-right)
  - [ ] Bottom Navigation (fixed bottom)
  - [ ] Obra Preview Bottom Sheet (optional)

---

### 02. Feed/Grid Template

**Wireframe de lista o grid**

- [ ] **Feed/Grid Template**
  - [ ] App Bar (fixed top)
  - [ ] Search Bar
  - [ ] Filter Chips
  - [ ] Grid de Cards (2 columnas, scroll vertical)
  - [ ] Bottom Navigation (fixed bottom)
  - [ ] Empty State (cuando no hay resultados)

---

### 03. Detail Page Template

**Wireframe de página de detalle**

- [ ] **Detail Page Template**
  - [ ] Hero Image Header (scrollable)
  - [ ] Back button (floating, top-left)
  - [ ] Content sections (scroll)
  - [ ] Sticky CTA button (bottom)
  - [ ] Optional: Bottom Navigation

---

### 04. Form Template

**Wireframe de formulario multi-step**

- [ ] **Form Template**
  - [ ] App Bar (Close + Title + Next)
  - [ ] Step Indicator (top)
  - [ ] Form content (scroll)
  - [ ] Input Fields
  - [ ] Action buttons (Atrás + Siguiente)

---

### 05. List Template

**Wireframe de lista simple**

- [ ] **List Template**
  - [ ] App Bar
  - [ ] List items (vertical scroll)
  - [ ] Dividers
  - [ ] Empty state
  - [ ] Bottom Navigation

---

### 06. Empty State Template

**Wireframe de estado vacío**

- [ ] **Empty State Template**
  - [ ] App Bar
  - [ ] Centered content:
    - [ ] Icon
    - [ ] Heading
    - [ ] Description
    - [ ] CTA button
  - [ ] Bottom Navigation

---

## 📱 NIVEL 5: Pages (Páginas)

### 01. MapaPage (Home)

**Template:** Map Template

- [ ] **MapaPage - Estado Normal**
  - [ ] App Bar con título
  - [ ] Mapa con pins de categorías
  - [ ] Search Bar (floating)
  - [ ] Filter Chips (Todas, Graffiti, Mural, Escultura, Performance)
  - [ ] FAB "Crear Ruta" (bottom-right)
  - [ ] Bottom Navigation (Mapa selected)
  - [ ] Pins de colores según categoría
  
- [ ] **MapaPage - Con Bottom Sheet**
  - [ ] Mapa con pin seleccionado
  - [ ] Obra Preview Bottom Sheet visible
  
- [ ] **MapaPage - Búsqueda Activa**
  - [ ] Search Bar con texto
  - [ ] Resultados filtrados en mapa

**Frames:** 3 estados

---

### 02. FeedPage

**Template:** Feed/Grid Template

- [ ] **FeedPage - Grid de Obras**
  - [ ] App Bar "Explorar"
  - [ ] Search Bar
  - [ ] Filter Chips
  - [ ] Grid 2 columnas con Obra Cards
  - [ ] 6-8 cards visibles
  - [ ] Bottom Navigation (Explorar selected)
  
- [ ] **FeedPage - Vacío**
  - [ ] Empty State: "No se encontraron obras"
  - [ ] Botón "Limpiar filtros"

**Frames:** 2 estados

---

### 03. ObraDetailPage

**Template:** Detail Page Template

- [ ] **ObraDetailPage - Completo**
  - [ ] Hero Image Header (obra image)
  - [ ] Back button (top-left)
  - [ ] Share button (top-right)
  - [ ] Category Badge
  - [ ] **Content:**
    - [ ] Section: Información básica
      - [ ] Title (H1)
      - [ ] Artist name (clickable)
      - [ ] Category badge
      - [ ] Location (con icono)
      - [ ] Date
    - [ ] Section: Descripción
      - [ ] Body text (expandible)
    - [ ] Section: Detalles
      - [ ] Info rows (Técnica, Dimensiones, etc.)
    - [ ] Section: Artista Preview
      - [ ] Artista Card (mini)
    - [ ] Section: Obras Relacionadas
      - [ ] Horizontal scroll de Obra Cards
  - [ ] **Sticky Bottom:**
    - [ ] "Agregar a Top 10" button (primary)
    - [ ] "Ver en mapa" button (outlined)

**Frames:** 1 estado completo

---

### 04. ArtistaProfilePage

**Template:** Detail Page Template

- [ ] **ArtistaProfilePage**
  - [ ] Header:
    - [ ] Cover image (opcional)
    - [ ] Avatar (center, 120px)
    - [ ] Artist name (H1)
    - [ ] Bio (body)
  - [ ] Stats row (Obras + Seguidores + Likes)
  - [ ] Tabs: "Obras" | "Sobre el artista"
  - [ ] **Tab Obras:**
    - [ ] Grid de Obra Cards (del artista)
  - [ ] **Tab Sobre:**
    - [ ] Bio completa
    - [ ] Redes sociales
    - [ ] Contacto

**Frames:** 2 tabs

---

### 05. CreateRutaPage (6 pasos)

**Template:** Form Template

- [ ] **Paso 1: Seleccionar Punto A**
  - [ ] App Bar "Crear Ruta" + Close
  - [ ] Step Indicator (1/6)
  - [ ] Mapa interactivo
  - [ ] Instrucción: "Selecciona el punto de inicio"
  - [ ] Marker A en mapa
  - [ ] Button "Siguiente" (bottom)
  
- [ ] **Paso 2: Seleccionar Punto B**
  - [ ] Step Indicator (2/6)
  - [ ] Mapa con Marker A fijo
  - [ ] Instrucción: "Selecciona el punto final"
  - [ ] Marker B en mapa
  - [ ] Buttons "Atrás" + "Siguiente"
  
- [ ] **Paso 3: Obras en el Camino**
  - [ ] Step Indicator (3/6)
  - [ ] Mapa con ruta dibujada
  - [ ] Pins de obras en el camino
  - [ ] Info: "X obras encontradas"
  - [ ] Buttons "Atrás" + "Siguiente"
  
- [ ] **Paso 4: Seleccionar Obras**
  - [ ] Step Indicator (4/6)
  - [ ] Filter Chips (categorías + artistas)
  - [ ] Lista de obras con checkboxes
  - [ ] Mini Obra Cards (seleccionables)
  - [ ] Counter: "X obras seleccionadas"
  - [ ] Buttons "Atrás" + "Siguiente"
  
- [ ] **Paso 5: Medio de Transporte**
  - [ ] Step Indicator (5/6)
  - [ ] Instrucción: "¿Cómo vas a recorrer la ruta?"
  - [ ] Selector:
    - [ ] A pie (icon + label)
    - [ ] En bici (icon + label)
  - [ ] Buttons "Atrás" + "Siguiente"
  
- [ ] **Paso 6: Generar Ruta**
  - [ ] Step Indicator (6/6)
  - [ ] Mapa con ruta final
  - [ ] Obras seleccionadas (pins numerados)
  - [ ] Input: Nombre de la ruta
  - [ ] Resumen:
    - [ ] Distancia total
    - [ ] Duración estimada
    - [ ] Obras incluidas (count)
  - [ ] Buttons "Atrás" + "Guardar Ruta" (primary)

**Frames:** 6 pasos completos

---

### 06. Top10Page

**Template:** Feed/Grid Template

- [ ] **Top10Page - Con Obras**
  - [ ] App Bar "Mi Top 10"
  - [ ] Grid 2 columnas
  - [ ] 10 Top 10 Grid Items (con ranking 1-10)
  - [ ] Drag handles (para reordenar)
  - [ ] Empty slots (si < 10 obras)
  - [ ] Bottom Navigation (Top 10 selected)
  
- [ ] **Top10Page - Vacío**
  - [ ] Empty State: "Tu Top 10 está vacío"
  - [ ] Descripción
  - [ ] Button "Explorar obras"

**Frames:** 2 estados

---

### 07. RutaListPage

**Template:** List Template

- [ ] **RutaListPage**
  - [ ] App Bar "Mis Rutas"
  - [ ] FAB "Crear Ruta"
  - [ ] Lista vertical de Ruta Cards
  - [ ] 4-5 rutas visibles
  - [ ] Bottom Navigation (Rutas selected)
  
- [ ] **RutaListPage - Vacío**
  - [ ] Empty State: "No tienes rutas guardadas"
  - [ ] Button "Crear primera ruta"

**Frames:** 2 estados

---

### 08. RutaDetailPage

**Template:** Detail Page Template

- [ ] **RutaDetailPage**
  - [ ] Map Header (ruta dibujada con pins)
  - [ ] Back button
  - [ ] Share button
  - [ ] **Content:**
    - [ ] Route name (H1)
    - [ ] Stats row (Distancia + Duración + Obras)
    - [ ] Transport icon
    - [ ] Date created
    - [ ] Section: "Obras en esta ruta"
      - [ ] Lista numerada de Obra Cards (mini)
      - [ ] Orden de visita (1, 2, 3...)
    - [ ] Section: "Convertir en salida grupal"
      - [ ] Info text
      - [ ] Button "Crear salida grupal"
  - [ ] Sticky bottom: "Iniciar navegación" (primary)

**Frames:** 1 estado completo

---

### 09. CreateSalidaPage

**Template:** Form Template

- [ ] **CreateSalidaPage**
  - [ ] App Bar "Nueva Salida Grupal"
  - [ ] **Form Fields:**
    - [ ] Input: Nombre de la salida
    - [ ] Input: Descripción
    - [ ] Date Picker: Fecha y hora
    - [ ] Input: Punto de encuentro
    - [ ] Input: Cupo máximo (number)
    - [ ] Ruta asociada (readonly, pre-filled)
  - [ ] Preview de la ruta (mini map)
  - [ ] Buttons:
    - [ ] "Cancelar" (text)
    - [ ] "Crear salida" (primary)

**Frames:** 1 estado completo

---

## 📊 Resumen de Entregables

### Componentes Totales por Nivel

| Nivel | Cantidad | Variantes Aprox. |
|-------|----------|------------------|
| **Atoms** | 8 categorías | ~50 variantes |
| **Molecules** | 9 componentes | ~30 variantes |
| **Organisms** | 10 componentes | ~20 variantes |
| **Templates** | 6 templates | 6 wireframes |
| **Pages** | 9 páginas | 25 frames |

**Total:** ~41 componentes + 25 frames de páginas

---

## 🎯 Plan de Implementación (Orden Sugerido)

### Fase 1: Foundation (1-2 días)

- [x] **Día 1: Setup y Tokens** ✅
  - [x] Crear archivo Figma
  - [x] Duplicar componentes del Syncfusion UI Kit
  - [x] Verificar variables de color ✅
  - [ ] Crear colores de categorías (custom)
  - [x] Configurar layout grids (8px base)

- [x] **Día 1-2: Atoms (Parcial - 75%)** 🔄
  - [x] Buttons (del UI Kit) ✅ Implementado en Flutter
  - [x] Icons (Material Icons) ✅ Implementado en Flutter
  - [x] Text Styles (del UI Kit) ✅ Implementado en Flutter
  - [x] Input Fields (del UI Kit, adaptar) ✅ Implementado en Flutter
  - [x] Badges (Dot, Circle, Rounded, Category) ✅ Implementado en Flutter
  - [x] Avatars (con badges verified/edit) ✅ Implementado en Flutter
  - [x] Dividers (Horizontal/Vertical, variantes) ✅ Implementado en Flutter
  - [x] Loading Indicators (Circular/Linear, todos los tamaños) ✅ Implementado en Flutter

### Fase 2: Components (2-3 días)

- [ ] **Día 3: Molecules**
  - [ ] Search Bar
  - [ ] Filter Chip Group
  - [ ] Map Pin (custom, importante)
  - [ ] Category Badge con icono
  - [ ] Tooltip (Normal + With Header)
  - [ ] Dialog Box (con variantes)
  - [ ] Image with Overlay
  - [ ] Rating Display
  - [ ] Empty State Message

- [ ] **Día 4-5: Organisms**
  - [ ] App Bar (3 variantes)
  - [ ] Bottom Navigation
  - [ ] Obra Card (grid + list) ⭐ Crítico
  - [ ] Artista Card
  - [ ] Ruta Card
  - [ ] Top 10 Grid Item
  - [ ] Filter Modal
  - [ ] Bottom Sheet (Obra Preview)
  - [ ] Obra Detail Header
  - [ ] Route Step Indicator

### Fase 3: Templates (1 día)

- [ ] **Día 6: Templates Base**
  - [ ] Map Template (wireframe)
  - [ ] Feed/Grid Template
  - [ ] Detail Page Template
  - [ ] Form Template
  - [ ] List Template
  - [ ] Empty State Template

### Fase 4: Pages - Core MVP (2-3 días)

- [ ] **Día 7: Páginas Principales**
  - [ ] MapaPage (3 estados) ⭐ Crítico
  - [ ] FeedPage (2 estados) ⭐ Crítico
  - [ ] ObraDetailPage ⭐ Crítico

- [ ] **Día 8: Páginas Secundarias**
  - [ ] ArtistaProfilePage
  - [ ] Top10Page (2 estados)
  - [ ] RutaListPage (2 estados)

- [ ] **Día 9: Flujo de Creación**
  - [ ] CreateRutaPage (6 pasos) ⭐ Flujo completo
  - [ ] RutaDetailPage
  - [ ] CreateSalidaPage

### Fase 5: Prototipado (1 día)

- [ ] **Día 10: Interacciones**
  - [ ] Conectar flujos principales
  - [ ] Agregar transiciones (Material 3 motion)
  - [ ] Configurar overlays (modales, bottom sheets)
  - [ ] Probar navegación end-to-end

### Fase 6: Refinamiento (Opcional, 1-2 días)

- [ ] Revisar consistencia de espaciado
- [ ] Validar colores en todos los componentes
- [ ] Agregar estados hover/pressed
- [ ] Documentar componentes
- [ ] Exportar assets necesarios

---

## ✅ Checklist de Validación Final

### Design Tokens
- [x] Colores sincronizados con Flutter ✅
- [x] Variables de color aplicadas correctamente ✅
- [x] Text styles consistentes ✅
- [x] Spacing sistema 8px aplicado ✅
- [x] Border radius configurados ✅

### Componentes
- [x] **Atoms:** Buttons ✅ Icons ✅ Text Styles ✅ Input Fields ✅ Badges ✅ Avatars ✅ (2/8 pendientes)
- [ ] Todas las Molecules creadas
- [ ] Todos los Organisms creados
- [x] Componentes reutilizables (como Components en Figma) ✅
- [x] Variants configuradas correctamente ✅
- [ ] Auto Layout aplicado donde corresponde

### Templates
- [ ] 6 templates creados
- [ ] Wireframes claros y documentados
- [ ] Layout grids aplicados

### Páginas
- [ ] 9 páginas principales completas
- [ ] Estados vacíos considerados
- [ ] Estados de error considerados
- [ ] Todas las pantallas conectadas en prototipo

### Prototipo
- [ ] Navegación entre páginas funcional
- [ ] Modales y bottom sheets funcionan
- [ ] Transiciones aplicadas
- [ ] Flujo de creación de ruta completo y navegable
- [ ] Flujo de exploración completo
- [ ] Flujo de Top 10 completo

### Exportación
- [ ] Assets de iconos exportados (si custom)
- [ ] Map pins exportados como PNG
- [ ] Category badges exportados
- [ ] Documentación de componentes lista

---

## 📚 Referencias

- **UI Kit Base:** [Syncfusion Flutter UI Kit](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-)
- **Colores:** `color-sync-report.md` ✅ Sincronizados
- **Design System:** `design-system.md`
- **User Flows:** `ux-flows.md`
- **Material 3:** [Material Design 3](https://m3.material.io)
- **Atomic Design:** [Brad Frost - Atomic Design](https://atomicdesign.bradfrost.com/)

---

## 💡 Tips de Implementación

1. **Usa Auto Layout en TODO:** Facilita ajustes y hace componentes responsivos
2. **Crea Components de inmediato:** No esperes a terminar para componentizar
3. **Nombra todo con claridad:** Usa prefijos (atom/, molecule/, organism/)
4. **Variantes son tus amigas:** Configura variantes para estados (default, hover, active)
5. **Documenta mientras creas:** Agrega descripciones a componentes complejos
6. **Prueba en mobile:** Usa preview en dispositivo móvil para validar tamaños
7. **Exporta frecuentemente:** Guarda versiones del archivo regularmente
8. **Colabora con desarrollo:** Muestra avances al equipo de código para validar

---

*Plan creado para diseño progresivo en Figma*  
*Estimado total: 10-12 días para prototipo completo*  
*Fecha: 11 de Diciembre, 2025*

