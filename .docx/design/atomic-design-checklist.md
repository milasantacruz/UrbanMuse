# 🔬 Atomic Design - Checklist y Plan de Implementación Figma

**Proyecto:** Graffiti Trails (UrbanMuse)  
**Base:** Syncfusion Flutter UI Kit - Material 3 Theme  
**Colores:** ✅ Sincronizados (ver `color-sync-report.md`)

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
│   ├── 06. Info Row (Icon + Text)
│   ├── 07. Image with Overlay
│   └── 08. Empty State Message
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

### 01. Buttons

**Fuente:** Syncfusion UI Kit (usar directamente)

- [ ] **Primary Button (Filled)**
  - [ ] Default state
  - [ ] Hover state
  - [ ] Active/Pressed state
  - [ ] Disabled state
  - Color: Primary (#6BA034)
  
- [ ] **Secondary Button (Outlined)**
  - [ ] Default state
  - [ ] Hover state
  - [ ] Active/Pressed state
  - [ ] Disabled state
  - Border: Primary (#6BA034)
  
- [ ] **Text Button**
  - [ ] Default state
  - [ ] Hover state
  - [ ] Active/Pressed state
  - [ ] Disabled state
  
- [ ] **FAB (Floating Action Button)**
  - [ ] Default (Primary color)
  - [ ] Extended FAB (con texto)
  - Shadow: elevation 6

**Variants:** 4 estados × 4 tipos = 16 variantes

---

### 02. Icons

**Fuente:** Material Icons o Iconos del UI Kit

- [ ] **Navigation Icons**
  - [ ] home
  - [ ] explore/feed
  - [ ] route
  - [ ] favorite/top10
  - [ ] profile
  
- [ ] **Action Icons**
  - [ ] search
  - [ ] filter
  - [ ] add
  - [ ] share
  - [ ] close
  - [ ] back/arrow_back
  - [ ] more_vert (3 dots)
  
- [ ] **Category Icons**
  - [ ] graffiti (spray can)
  - [ ] mural (brush)
  - [ ] sculpture (cube 3D)
  - [ ] performance (theater masks)
  
- [ ] **Map Icons**
  - [ ] location/pin
  - [ ] my_location
  - [ ] directions
  
- [ ] **Social Icons**
  - [ ] share
  - [ ] group
  - [ ] person

**Tamaños:** 16px, 24px, 32px, 48px

---

### 03. Text Styles

**Fuente:** Syncfusion UI Kit (usar directamente)

- [ ] **Display Large** (32px/40px, Bold)
- [ ] **Headline Large** (28px/36px, Bold)
- [ ] **Headline Medium** (24px/32px, SemiBold)
- [ ] **Headline Small** (20px/28px, SemiBold)
- [ ] **Body Large** (18px/26px, Regular)
- [ ] **Body Medium** (16px/24px, Regular) ✅ Ya en UI Kit
- [ ] **Body Small** (14px/20px, Regular) ✅ Ya en UI Kit
- [ ] **Label Large** (14px/20px, SemiBold)
- [ ] **Label Medium** (12px/16px, Medium) ✅ Ya en UI Kit
- [ ] **Caption** (12px/16px, Regular)

**Colores aplicados:**
- OnSurface (#1D1617)
- OnSurfaceVariant (#4A4F45)
- Primary (#6BA034)

---

### 04. Input Fields

**Fuente:** Syncfusion UI Kit (adaptar)

- [ ] **Text Field**
  - [ ] Default state
  - [ ] Focused state
  - [ ] Error state
  - [ ] Disabled state
  - [ ] With helper text
  - [ ] With error text
  
- [ ] **Text Area** (multiline)
  - [ ] Default state
  - [ ] Focused state
  
- [ ] **Search Field**
  - [ ] With search icon
  - [ ] With clear button
  - [ ] Default state
  - [ ] Focused state

**Variants:** 4 estados base

---

### 05. Avatars

- [ ] **Avatar Circular**
  - [ ] Small (32px)
  - [ ] Medium (48px)
  - [ ] Large (72px)
  - [ ] With image placeholder
  - [ ] With initials (texto)

---

### 06. Badges

**Fuente:** Syncfusion UI Kit Chips (adaptar)

- [ ] **Category Badge**
  - [ ] Graffiti (color: #E74C3C)
  - [ ] Mural (color: #3498DB)
  - [ ] Escultura (color: #F39C12)
  - [ ] Performance (color: #9B59B6)
  - Estados: Default, Selected
  
- [ ] **Status Badge**
  - [ ] Small dot + text
  - [ ] Success, Warning, Error

---

### 07. Dividers

- [ ] **Horizontal Divider**
  - [ ] Full width
  - [ ] Inset (con padding)
  - Color: OutlineVariant (#CAC4D0)
  
- [ ] **Vertical Divider**
  - [ ] Small (16px)
  - [ ] Medium (24px)

---

### 08. Loading Indicators

**Fuente:** Material 3 Components

- [ ] **Circular Progress Indicator**
  - [ ] Small (16px)
  - [ ] Medium (24px)
  - [ ] Large (48px)
  - Color: Primary (#6BA034)
  
- [ ] **Linear Progress Indicator**
  - [ ] Determinate
  - [ ] Indeterminate

---

## 🧬 NIVEL 2: Molecules (Moléculas)

### 01. Search Bar

**Componentes:** Input Field + Icon + Clear Button

- [ ] **Search Bar Component**
  - [ ] Estado vacío (placeholder "Buscar obras...")
  - [ ] Estado con texto
  - [ ] Estado focused
  - [ ] Con resultados (dropdown opcional)

**Auto Layout:** Horizontal, padding 12px

---

### 02. Filter Chip Group

**Componentes:** Múltiples Category Badges + Scroll

- [ ] **Filter Chip Group**
  - [ ] Horizontal scroll
  - [ ] Con todas las categorías
  - [ ] Estados: None selected, One selected, Multiple selected
  - [ ] Gap: 8px entre chips

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

### 04. Map Pin

**Componentes:** Icon + Color background + Shadow

- [ ] **Map Pin Component**
  - [ ] Graffiti (red)
  - [ ] Mural (blue)
  - [ ] Escultura (orange)
  - [ ] Performance (purple)
  - [ ] Default/Generic (primary green)
  - [ ] Selected state (con border)
  
**Tamaño:** 32px × 40px (teardrop shape)

---

### 05. Rating Display

**Componentes:** Stars + Text

- [ ] **Rating Component**
  - [ ] 5 stars (filled/half/empty)
  - [ ] Text: "4.5 (120 reviews)"
  - Color: Warning (#F39C12) para stars

---

### 06. Info Row

**Componentes:** Icon + Text

- [ ] **Info Row Component**
  - [ ] Icon (24px) + Label
  - [ ] Variants: Location, Artist, Date, Distance, Duration
  - Gap: 8px
  
**Ejemplos:**
- 📍 "Av. Corrientes 1234"
- 👤 "Diego Mural"
- 📅 "Enero 2024"

---

### 07. Image with Overlay

**Componentes:** Image + Gradient Overlay + Text

- [ ] **Image Overlay Component**
  - [ ] Image placeholder
  - [ ] Bottom gradient (black 0% → 60% opacity)
  - [ ] Text overlay (white)
  - [ ] Category badge (top-right corner)

---

### 08. Empty State Message

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

### 01. App Bar / Navigation Bar

**Fuente:** Syncfusion UI Kit (adaptar)

**Componentes:** Container + Logo/Title + Actions

- [ ] **App Bar - Home (MapaPage)**
  - [ ] Title: "Graffiti Trails"
  - [ ] Search icon (right)
  - [ ] Filter icon (right)
  - Background: Surface (#FEF7FF)
  - Elevation: 0
  
- [ ] **App Bar - Detail Pages**
  - [ ] Back button (left)
  - [ ] Title (center)
  - [ ] Share icon (right)
  - [ ] More icon (right)
  
- [ ] **App Bar - Create/Edit**
  - [ ] Close button (left)
  - [ ] Title: "Crear Ruta" (center)
  - [ ] Save/Next button (right)

**Height:** 56px (Material 3 standard)

---

### 02. Bottom Navigation

**Fuente:** Syncfusion UI Kit (usar directamente)

**Componentes:** 4-5 Navigation Items + Icons + Labels

- [ ] **Bottom Navigation Bar**
  - [ ] Item: Mapa (home icon)
  - [ ] Item: Explorar (explore icon)
  - [ ] Item: Rutas (route icon)
  - [ ] Item: Top 10 (favorite icon)
  - Estados: Selected, Unselected
  - Color selected: Primary (#6BA034)

**Height:** 80px (Material 3 standard)

---

### 03. Obra Card

**Componentes:** Image + Text + Badges + Actions

- [ ] **Obra Card - Grid Version** (para FeedPage)
  - [ ] Image (16:9 ratio)
  - [ ] Category Badge (top-right overlay)
  - [ ] Title (H3, 2 lines max)
  - [ ] Artist name (body small)
  - [ ] Location (body small + icon)
  - [ ] Favorite icon (top-right)
  - Shadow: Elevation 2
  - Border radius: 12px
  
- [ ] **Obra Card - List Version** (alternativo)
  - [ ] Horizontal layout
  - [ ] Image (square, 80px)
  - [ ] Content (title + artist + location)
  - [ ] Category badge
  - [ ] Chevron icon (right)

**Dimensiones Grid:** 
- 2 columnas en móvil
- Gap: 16px
- Card width: (Screen width - 48px) / 2

---

### 04. Artista Card

**Componentes:** Avatar + Text + Stats + Button

- [ ] **Artista Card**
  - [ ] Avatar (72px)
  - [ ] Artist name (H3)
  - [ ] Bio (body small, 2 lines)
  - [ ] Stats row (obras count + followers)
  - [ ] "Ver perfil" button (outlined)
  - Shadow: Elevation 2
  - Padding: 16px

---

### 05. Ruta Card

**Componentes:** Map thumbnail + Text + Stats + Actions

- [ ] **Ruta Card**
  - [ ] Map thumbnail/placeholder (16:9)
  - [ ] Route name (H3)
  - [ ] Stats row: Distance + Duration + Obras count
  - [ ] Transport icon (walk/bike)
  - [ ] Date created
  - [ ] Action buttons (Share, Delete)
  - Shadow: Elevation 2

---

### 06. Top 10 Grid Item

**Componentes:** Image + Ranking Number + Overlay

- [ ] **Top 10 Item**
  - [ ] Large image (square or 4:5)
  - [ ] Ranking number (large, top-left)
    - Circle background (primary color)
    - White number (1-10)
  - [ ] Title overlay (bottom)
  - [ ] Gradient overlay
  - [ ] Remove button (top-right, small)

**Grid:** 2 columnas

---

### 07. Filter Modal

**Fuente:** Syncfusion UI Kit Bottom Sheet (adaptar)

**Componentes:** Modal + Filter Groups + Buttons

- [ ] **Filter Modal Bottom Sheet**
  - [ ] Handle bar (top)
  - [ ] Title: "Filtros"
  - [ ] Close button
  - [ ] **Section: Categorías**
    - [ ] Filter Chip Group (múltiple selección)
  - [ ] **Section: Artistas**
    - [ ] Search bar
    - [ ] Artist list (checkboxes)
  - [ ] Dividers entre secciones
  - [ ] **Footer:**
    - [ ] "Limpiar" button (text)
    - [ ] "Aplicar filtros" button (primary)
  
**Height:** 60-70% de pantalla

---

### 08. Bottom Sheet (Obra Preview)

**Componentes:** Handle + Image + Text + CTA

- [ ] **Obra Preview Bottom Sheet**
  - [ ] Handle bar
  - [ ] Small image (80px height, full width)
  - [ ] Title (H3)
  - [ ] Artist name
  - [ ] Category badge
  - [ ] Distance from user
  - [ ] "Ver detalles" button (primary)
  - Swipe up para expandir a full detail

**Height inicial:** 25% de pantalla

---

### 09. Obra Detail Header

**Componentes:** Hero Image + Gradient + Back Button + Actions

- [ ] **Detail Header**
  - [ ] Hero image (full width, 40% height)
  - [ ] Bottom gradient overlay
  - [ ] Back button (top-left, floating)
  - [ ] Share button (top-right)
  - [ ] Favorite button (top-right)
  - [ ] Title overlay (bottom)
  - [ ] Category badge (top-right, below buttons)

---

### 10. Route Step Indicator

**Componentes:** Step Numbers + Progress Line + Labels

- [ ] **Step Indicator (Stepper)**
  - [ ] 6 steps numbered (1-6)
  - [ ] Progress line connecting steps
  - [ ] Current step highlighted (primary color)
  - [ ] Completed steps (check icon)
  - [ ] Future steps (gray)
  - [ ] Step labels below numbers
  
**Horizontal layout, scrollable**

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
| **Molecules** | 8 componentes | ~25 variantes |
| **Organisms** | 10 componentes | ~20 variantes |
| **Templates** | 6 templates | 6 wireframes |
| **Pages** | 9 páginas | 25 frames |

**Total:** ~41 componentes + 25 frames de páginas

---

## 🎯 Plan de Implementación (Orden Sugerido)

### Fase 1: Foundation (1-2 días)

- [ ] **Día 1: Setup y Tokens**
  - [ ] Crear archivo Figma
  - [ ] Duplicar componentes del Syncfusion UI Kit
  - [ ] Verificar variables de color ✅
  - [ ] Crear colores de categorías (custom)
  - [ ] Configurar layout grids (8px base)

- [ ] **Día 1-2: Atoms**
  - [ ] Buttons (del UI Kit) ✅
  - [ ] Text Styles (del UI Kit) ✅
  - [ ] Input Fields (del UI Kit, adaptar)
  - [ ] Icons (Material Icons)
  - [ ] Avatars
  - [ ] Category Badges (custom)
  - [ ] Dividers
  - [ ] Loading Indicators

### Fase 2: Components (2-3 días)

- [ ] **Día 3: Molecules**
  - [ ] Search Bar
  - [ ] Filter Chip Group
  - [ ] Map Pin (custom, importante)
  - [ ] Category Badge con icono
  - [ ] Info Row
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
- [ ] Colores sincronizados con Flutter ✅
- [ ] Variables de color aplicadas correctamente
- [ ] Text styles consistentes
- [ ] Spacing sistema 8px aplicado
- [ ] Border radius configurados

### Componentes
- [ ] Todos los Atoms creados
- [ ] Todas las Molecules creadas
- [ ] Todos los Organisms creados
- [ ] Componentes reutilizables (como Components en Figma)
- [ ] Variants configuradas correctamente
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

