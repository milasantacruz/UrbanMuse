# 🎨 Plan de Prototipo Figma - Graffiti Trails

## 📋 Objetivo

Crear prototipo interactivo en Figma basado en la documentación del Designer, utilizando el **Syncfusion Flutter UI Kit - Material 3 Theme** como base:
- ✅ **Design Tokens SINCRONIZADOS:** Los colores del proyecto Flutter están sincronizados con las variables de Figma
- Usar componentes del UI Kit directamente (ya tienen los colores correctos)
- Agregar solo colores custom de categorías (Graffiti, Mural, Escultura, Performance)
- Diseñar User Flows principales
- Crear pantallas clave del MVP1
- Desarrollar componentes personalizados basados en el UI Kit

## 🎨 UI Kit Base

**Syncfusion Flutter UI Kit - Material 3 Theme (Community)**
- Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3917-829&m=dev&t=y1ykPsJ878ZyRkH5-1
- Base: Material Design 3
- Componentes Flutter-ready
- Tema personalizable

---

## 🎯 Pantallas a Prototipar (Prioridad)

### Must Have (Core):
1. **MapaPage (Home)** - Pantalla principal con mapa interactivo
2. **FeedPage** - Lista/grid de obras
3. **ObraDetailPage** - Detalle completo de obra
4. **ArtistaProfilePage** - Perfil del artista
5. **CreateRutaPage** - Flujo multi-step de creación de ruta (6 pasos)
6. **Top10Page** - Galería del Top 10 del usuario

### Should Have:
7. **RutaListPage** - Lista de rutas guardadas
8. **RutaDetailPage** - Detalle de ruta con mapa
9. **CreateSalidaPage** - Formulario de salida grupal
10. **Filtros Modal** - Modal de filtros (categoría y artista)

---

## 🎨 Design Tokens a Implementar en Figma

### Estrategia de Personalización

**✅ SINCRONIZADO con UI Kit de Figma**

**Base:** Syncfusion Flutter UI Kit - Material 3 Theme  
**Estado:** ✅ Los colores principales del UI Kit ya coinciden con nuestro código Flutter  
**Primary Color:** #6BA034 (verde) - ✅ Sincronizado entre Figma y Flutter  
**Surface & Outline Colors:** ✅ Todos sincronizados  

**Personalización necesaria:**
1. ✅ Usar componentes del UI Kit tal cual (colores ya correctos)
2. ⚠️ Agregar solo colores de categorías (Graffiti, Mural, Escultura, Performance)
3. ✅ Mantener tipografía Material 3 (Roboto)
4. ✅ Adaptar espaciado a sistema de 8px base

### Colores (Variables de Figma - Sincronizados)
**✅ SINCRONIZADO con Syncfusion Flutter UI Kit - Material 3 Theme**

**Colores Primarios (desde Figma):**
- **Primary:** #6BA034 (verde) - desde Figma variable `primary`
- **Primary Container:** #ECFFDD (desde Figma: `primaryContainer`)
- **On Primary:** #FFFFFF (desde Figma: `onPrimary`)
- **On Primary Container:** #79F500 (desde Figma: `onPrimaryContainer`)
- **Primary Fixed Dim:** #E8FFBC (desde Figma: `primaryFixedDim`) - para dark mode
- **Primary Variants (compatibilidad):** 
  - Primary 600 (dark): #5A8A2A
  - Primary 400 (light): #85B84D

**Colores Secundarios (desde Figma):**
- **Secondary:** #66715B (verde oscuro) - desde Figma variable `secondary` ✅
- **Secondary Container:** #E8F8DE (desde Figma: `secondaryContainer`)
- **On Secondary:** #FFFFFF (desde Figma: `onSecondary`)
- **On Secondary Container:** #1F2B19 (desde Figma: `onSecondaryContainer`)
- **Secondary Variants (compatibilidad):** 
  - Secondary 600 (dark): #4F5947
  - Secondary 400 (light): #7F8A74

**Colores Terciarios (desde Figma):**
- **Tertiary:** #5D7D52 (verde terciario) - desde Figma variable `tertiary`

**Colores Adicionales del Sistema (desde Figma):**
- **Gray (Secondary Color):** #253341 (desde Figma)
- **Black-color:** #1D1617 (desde Figma)
- **Gray 1:** #7B6F72 (desde Figma)
- **Dark:** #15202B (desde Figma)
- **White:** #F5F8FA (desde Figma)

**Surface Colors (desde Figma):**
- **Surface:** #FEF7FF (desde Figma: `surface`)
- **Surface 1:** #F7F2FB (desde Figma: `surface1`)
- **Surface 2:** #F3EDF7 (desde Figma: `surface2`)
- **Surface 5:** #E4ECE0 (desde Figma: `surface5`)
- **On Surface:** #1D1617 (desde Figma: `Black-color`)
- **On Surface Variant:** #4A4F45 (desde Figma: `onSurfaceVariant`)

**Outline (desde Figma):**
- **Outline Variant:** #CAC4D0 (desde Figma: `outlineVariant`)

**Colores de Categorías (Custom):**
- Graffiti: #E74C3C
- Mural: #3498DB
- Escultura: #F39C12
- Performance: #9B59B6

**Neutros (Material 3):**
- Neutral 50: #FAFAFA
- Neutral 100: #F5F5F5
- Neutral 200: #EEEEEE
- Neutral 300: #E0E0E0
- Neutral 400: #BDBDBD
- Neutral 500: #9E9E9E
- Neutral 600: #757575
- Neutral 700: #616161
- Neutral 800: #424242
- Neutral 900: #1C1B1F (onSurface)

**Estados:**
- Success: #27AE60
- Warning: #F39C12
- Error: #E74C3C
- Info: #3498DB

### Tipografía (Text Styles)
**Base Material 3 del UI Kit (Roboto):**

**Desde Figma UI Kit:**
- Mantener tipografías del Material 3 (Roboto)
- Font sizes y line heights ya configurados en el UI Kit

**Ajustes personalizados (si necesario):**
- **Display:** 32px/40px, Bold 700
- **Headline Large (H1):** 28px/36px, Bold 700
- **Headline Medium (H2):** 24px/32px, SemiBold 600
- **Headline Small (H3):** 20px/28px, SemiBold 600
- **Body Large:** 18px/26px, Regular 400 (ajustar si difiere del UI Kit)
- **Body Medium:** 16px/24px, Regular 400 ✅ (desde Figma: `Regular/BodyMedium`)
- **Body Small:** 14px/20px, Regular 400 ✅ (desde Figma: `Regular/Body`)
- **Label:** 12px/16px, Regular 400 ✅ (desde Figma: `Regular/Label`)
- **Label Strong:** 12px/16px, Medium 500 ✅ (desde Figma: `Medium/LabelStrong`)

### Espaciado (Layout Grids / Spacing)
**Material 3 usa sistema de 4px, nosotros 8px:**
- Adaptar spacing tokens: 4px, 8px, 12px, 16px, 24px, 32px, 40px, 48px, 64px, 80px
- Usar Layout Grids del Material 3 pero ajustar a nuestro sistema

### Componentes Base del UI Kit a Usar
**Del Syncfusion Flutter UI Kit:**
- ✅ Botones (Elevated, Filled, Outlined, Text)
- ✅ Inputs (Text Field, Text Area, Search)
- ✅ Cards (Elevated, Filled, Outlined)
- ✅ Badges (Filled, Outlined)
- ✅ Bottom Sheets
- ✅ Dialogs/Modales
- ✅ Navigation (Bottom Navigation, App Bar)
- ✅ Lists (List Items, Dividers)
- ✅ Chips (Assist, Filter, Input, Suggestion)

**Componentes Personalizados a Crear:**
- 🎨 Cards de Obra (basado en Card del UI Kit)
- 🎨 Cards de Artista (basado en Card del UI Kit)
- 🎨 Pins de Mapa (custom, usando colores de categorías)
- 🎨 Badges de Categoría (basado en Chip del UI Kit)
- 🎨 Top 10 Grid Item (custom)

---

## 📱 Estructura del Prototipo en Figma

### Frames Principales:
```
📱 Graffiti Trails MVP1
├── 🎨 Design System
│   ├── UI Kit Base (Syncfusion Material 3)
│   │   └── [Duplicar componentes necesarios del UI Kit]
│   ├── Colors (Variables)
│   │   ├── Material 3 Theme (personalizado)
│   │   └── Custom Colors (Categorías)
│   ├── Typography (Text Styles)
│   │   └── Material 3 + Custom sizes
│   ├── Spacing (Layout Grids)
│   │   └── Sistema 8px adaptado
│   └── Components
│       ├── Base (del UI Kit)
│       │   ├── Buttons
│       │   ├── Inputs
│       │   ├── Cards
│       │   ├── Badges/Chips
│       │   └── Modals/Bottom Sheets
│       └── Custom (personalizados)
│           ├── Obra Card
│           ├── Artista Card
│           ├── Ruta Card
│           ├── Map Pin
│           └── Top 10 Grid Item
│
├── 📱 Screens
│   ├── 01. MapaPage (Home)
│   ├── 02. FeedPage
│   ├── 03. ObraDetailPage
│   ├── 04. ArtistaProfilePage
│   ├── 05. CreateRutaPage
│   │   ├── Step 1: Seleccionar Punto A
│   │   ├── Step 2: Seleccionar Punto B
│   │   ├── Step 3: Obras en el Camino
│   │   ├── Step 4: Seleccionar Obras
│   │   ├── Step 5: Medio de Transporte
│   │   └── Step 6: Generar Ruta
│   ├── 06. Top10Page
│   ├── 07. RutaListPage
│   ├── 08. RutaDetailPage
│   └── 09. CreateSalidaPage
│
└── 🔄 User Flows
    ├── Flow 1: Descubrir Obra
    ├── Flow 2: Crear Ruta
    ├── Flow 3: Salida Grupal
    └── Flow 4: Explorar Artista
```

---

## 🛠️ Pasos para Crear el Prototipo

> **📍 NOTA IMPORTANTE:** Los Design Tokens de Flutter están sincronizados con las variables del Syncfusion UI Kit. El color primario del UI Kit (#6BA034 verde) ya está implementado en nuestro código. Solo necesitas agregar los colores custom de categorías.

### Paso 1: Setup del Archivo Figma y UI Kit
1. Crear nuevo archivo en Figma
2. **Duplicar componentes necesarios del Syncfusion Flutter UI Kit:**
   - Abrir el UI Kit: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3917-829&m=dev&t=y1ykPsJ878ZyRkH5-1
   - Duplicar componentes base: Buttons, Inputs, Cards, Chips, Bottom Sheets, Dialogs
   - Copiar al archivo de Graffiti Trails
   - **Los componentes ya tienen los colores correctos (primary: #6BA034)**
3. Configurar frames para móvil (375x812px - iPhone 13)
4. Crear estructura de páginas

### Paso 2: Personalizar Design Tokens
**Referencia:** Ver `figma-variables-structure.md` para estructura detallada

1. **✅ Variables de Color (SINCRONIZADAS con UI Kit):**
   - **IMPORTANTE:** El Syncfusion UI Kit ya tiene las variables correctas
   - **Primary Colors (ya configurados en Figma):**
     - Primary: #6BA034 (verde) ✅
     - Primary Container: #ECFFDD ✅
     - On Primary: #FFFFFF ✅
     - On Primary Container: #79F500 ✅
     - Primary Fixed Dim: #E8FFBC ✅
   - **Secondary Colors (ya en Figma):**
     - Secondary: #66715B (verde oscuro) ✅
     - Secondary Container: #E8F8DE ✅
     - On Secondary: #FFFFFF ✅
     - On Secondary Container: #1F2B19 ✅
   - **Tertiary Colors (ya en Figma):**
     - Tertiary: #5D7D52 ✅
   - **Surface Colors (ya en Figma):**
     - Surface: #FEF7FF ✅
     - Surface 1: #F7F2FB ✅
     - Surface 2: #F3EDF7 ✅
     - Surface 5: #E4ECE0 ✅
     - On Surface: #1D1617 (Black-color) ✅
     - On Surface Variant: #4A4F45 ✅
   - **Outline (ya en Figma):**
     - Outline Variant: #CAC4D0 ✅
   - **Colores del Sistema (ya en Figma):**
     - Gray (Secondary Color): #253341 ✅
     - Black-color: #1D1617 ✅
     - Gray 1: #7B6F72 ✅
     - Dark: #15202B ✅
     - White: #F5F8FA ✅
   - **Colores Custom de Categorías (agregar si no existen):**
     - Crear nueva colección "Categories" o agregar a Colors
     - Graffiti: #E74C3C
     - Mural: #3498DB
     - Escultura: #F39C12
     - Performance: #9B59B6
   - **Neutros (Material 3):**
     - Mantener estructura del Material 3
     - Verificar escala (#FAFAFA a #1C1B1F)

2. **✅ Variables de Tipografía (USAR del UI Kit):**
   - **IMPORTANTE:** Mantener las variables de Typography del UI Kit
   - Font families: Roboto (Material 3) ✅
   - **Font Sizes y Line Heights ya configurados:**
     - Body Medium: 16px/24px ✅ (desde Figma: `Regular/BodyMedium`)
     - Body: 14px/20px ✅ (desde Figma: `Regular/Body`)
     - Body Large: 22px/28px ✅ (desde Figma: `Medium/BodyLargeStrong`)
     - Label: 12px/16px ✅ (desde Figma: `Regular/Label`)
     - Label Strong: 12px/16px, Medium 500 ✅
   - **Ajustes opcionales (solo si necesario):**
     - Display: 32px/40px para títulos hero
     - Headlines: 28px, 24px, 20px según nivel
   - Font weights: 400 (Regular), 500 (Medium), 600 (SemiBold), 700 (Bold) ✅

3. **Duplicar y Adaptar Variables de Espaciado:**
   - Duplicar colección "Spacing" del UI Kit
   - **Adaptar a sistema de 8px base:**
     - Crear nueva escala: 4px, 8px, 12px, 16px, 24px, 32px, 40px, 48px, 64px, 80px
     - O ajustar valores existentes del Material 3 (que usa 4px base)

4. **✅ Variables de Border Radius y Elevation (MANTENER del UI Kit):**
   - Usar colecciones del UI Kit directamente
   - Valores del Material 3 son estándar y consistentes ✅
   - No requieren modificación

5. **Configurar Layout Grids:**
   - Adaptar sistema de espaciado a 8px base
   - Configurar grids para móvil (12 columnas, 16px gutter, 16px margin)

### Paso 3: Usar y Personalizar Componentes
1. **✅ Usar componentes del UI Kit directamente (ya tienen colores correctos):**
   - Botones: usar tal cual (primary color #6BA034 ya aplicado) ✅
   - Inputs: usar tal cual (outline y surface colors ya correctos) ✅
   - Cards: usar como base (elevation y borders ya configurados) ✅
   - Chips: usar como base, agregar variantes con colores de categoría
   - Bottom Sheets: usar tal cual ✅
   - Dialogs/Modals: usar tal cual ✅
   - Navigation: App Bar y Bottom Navigation ya listos ✅
   
2. **Crear componentes custom (basados en UI Kit):**
   - **Obra Card:** Basado en Card del UI Kit + Badge de categoría (colores custom)
   - **Artista Card:** Basado en Card del UI Kit + Avatar + Stats
   - **Map Pin:** Custom desde cero, usando colores de categorías (iconos + color de fondo)
   - **Top 10 Grid Item:** Basado en Card + número de ranking + imagen hero
   - **Category Badge:** Basado en Chip del UI Kit, colores de categorías personalizados

### Paso 4: Diseñar Pantallas Principales
1. **✅ Usar componentes del UI Kit directamente:**
   - App Bar del Material 3 (primary color ya aplicado) ✅
   - Bottom Navigation del Material 3 (surface colors ya correctos) ✅
   - List Items del Material 3 ✅
   - Buttons (Elevated, Filled, Outlined) ✅
   - Text Fields (con outline color correcto) ✅
   
2. **Diseñar pantallas usando componentes listos:**
   - **MapaPage:** Mapa mockup + App Bar + FAB (Floating Action Button del UI Kit) + Map Pins custom
   - **FeedPage:** Grid 2 columnas + Obra Cards custom + Search Bar (UI Kit) + Filter Chips
   - **ObraDetailPage:** Imagen hero + Card (UI Kit) + Buttons (UI Kit) + Category Badge custom
   - **ArtistaProfilePage:** Header custom + Cards (UI Kit) + List Items (UI Kit)
   - **CreateRutaPage (6 pasos):** Mapa + Stepper indicator + Text Fields (UI Kit) + Buttons (UI Kit)
   - **Top10Page:** Grid custom + Top 10 Items custom + Empty State
   - **RutaListPage:** List Items (UI Kit) + Ruta Cards custom
   - **RutaDetailPage:** Mapa + Card (UI Kit) + Info sections
   - **CreateSalidaPage:** Form usando Text Fields (UI Kit) + Date Picker + Buttons

### Paso 5: Prototipado Interactivo
1. Conectar pantallas con prototipos
2. Agregar interacciones (tap, swipe) usando componentes del UI Kit
3. Configurar animaciones de transición (Material 3 motion)

---

## 📐 Especificaciones Técnicas

### Tamaños de Frame
- **Móvil:** 375x812px (iPhone 13)
- **Tablet (opcional):** 768x1024px

### Grid System
- **Columnas:** 12 columnas
- **Gutter:** 16px
- **Margin:** 16px

### Breakpoints (si aplica)
- Móvil: 375px
- Tablet: 768px

---

## 🎨 Elementos Visuales Clave

### MapaPage
- Mapa de fondo (mockup o placeholder)
- Pins de categorías (colores diferenciados)
- Bottom sheet para preview de obra
- Botón flotante "Crear Ruta"
- Barra de filtros superior

### FeedPage
- Grid de 2 columnas
- Cards de obra con imagen, título, artista, categoría
- Barra de búsqueda
- Filtros

### ObraDetailPage
- Imagen hero (full width)
- Información completa
- Botón "Agregar a Top 10"
- Link a artista
- Botón "Ver en mapa"

### CreateRutaPage
- Mapa interactivo en cada paso
- Indicador de progreso (1/6, 2/6, etc.)
- Botones "Siguiente" y "Atrás"
- Inputs y selectores según paso

---

## ✅ Checklist de Validación

Antes de considerar el prototipo completo:

- [ ] UI Kit base duplicado e integrado
- [ ] **Variables de Figma configuradas:**
  - [✅] Colección Colors del UI Kit (ya sincronizada con Flutter)
    - [✅] Primary: #6BA034 (verde) - sincronizado
    - [✅] Surface colors: #FEF7FF, #F7F2FB, etc. - sincronizados
    - [✅] OnSurface: #1C1B1F - sincronizado
    - [✅] Outline Variant: #CAC4D0 - sincronizado
  - [ ] Colección Categories creada (custom) - **Pendiente:**
    - [ ] Graffiti: #E74C3C
    - [ ] Mural: #3498DB
    - [ ] Escultura: #F39C12
    - [ ] Performance: #9B59B6
  - [ ] Colección Typography verificada (Roboto, tamaños ajustados)
  - [ ] Colección Spacing adaptada a 8px base
  - [ ] Modos Light y Dark configurados (si aplica)
- [ ] Componentes del UI Kit usados directamente (ya tienen colores correctos)
- [ ] Componentes custom creados basados en el UI Kit:
  - [ ] Obra Card (con badges de categoría)
  - [ ] Artista Card
  - [ ] Map Pin (usando colores de categorías)
  - [ ] Top 10 Grid Item
- [ ] Pantallas principales diseñadas usando componentes del UI Kit
- [ ] Flujos interactivos conectados
- [ ] Colores consistentes entre Figma y Flutter ✅
- [ ] Tipografía respeta Material 3 y nuestros ajustes
- [ ] Espaciado respeta sistema de 8px
- [ ] Estados de componentes (hover, active, disabled) del Material 3
- [ ] Estados vacíos y de error considerados
- [ ] Prototipo navegable end-to-end
- [ ] Componentes son reutilizables y consistentes con Material 3

---

## 📚 Referencias

- **UI Kit Base:** [Syncfusion Flutter UI Kit - Material 3 Theme](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3917-829&m=dev&t=y1ykPsJ878ZyRkH5-1)
- **Estructura de Variables:** Ver `figma-variables-structure.md` (estructura detallada de variables, colecciones, aliases y conexiones)
- **Design System:** Ver `design-system.md`
- **User Flows:** Ver `ux-flows.md`

---

## 🔄 Estado de Sincronización

**✅ SINCRONIZADO: Figma ↔ Flutter**

Los Design Tokens del proyecto Flutter están sincronizados con las variables del Syncfusion Flutter UI Kit - Material 3 Theme:

| Token | Figma Variable | Valor | Estado |
|-------|---------------|-------|--------|
| **Primary Colors** | | | |
| Primary | `primary` | #6BA034 | ✅ Sincronizado |
| Primary Container | `primaryContainer` | #ECFFDD | ✅ Sincronizado |
| OnPrimary | `onPrimary` | #FFFFFF | ✅ Sincronizado |
| OnPrimaryContainer | `onPrimaryContainer` | #79F500 | ✅ Sincronizado |
| Primary Fixed Dim | `primaryFixedDim` | #E8FFBC | ✅ Sincronizado |
| **Secondary Colors** | | | |
| Secondary | `secondary` | #66715B | ✅ Sincronizado |
| Secondary Container | `secondaryContainer` | #E8F8DE | ✅ Sincronizado |
| OnSecondary | `onSecondary` | #FFFFFF | ✅ Sincronizado |
| OnSecondaryContainer | `onSecondaryContainer` | #1F2B19 | ✅ Sincronizado |
| **Tertiary Colors** | | | |
| Tertiary | `tertiary` | #5D7D52 | ✅ Sincronizado |
| **Surface Colors** | | | |
| Surface | `surface` | #FEF7FF | ✅ Sincronizado |
| Surface 1 | `surface1` | #F7F2FB | ✅ Sincronizado |
| Surface 2 | `surface2` | #F3EDF7 | ✅ Sincronizado |
| Surface 5 | `surface5` | #E4ECE0 | ✅ Sincronizado |
| OnSurface | `Black-color` | #1D1617 | ✅ Sincronizado |
| OnSurfaceVariant | `onSurfaceVariant` | #4A4F45 | ✅ Sincronizado |
| **System Colors** | | | |
| Gray (Secondary) | `Gray (Secondary Color)` | #253341 | ✅ Sincronizado |
| Black | `Black-color` | #1D1617 | ✅ Sincronizado |
| Gray 1 | `gray-1` | #7B6F72 | ✅ Sincronizado |
| Dark | `Dark` | #15202B | ✅ Sincronizado |
| White | `White` | #F5F8FA | ✅ Sincronizado |
| OutlineVariant | `outlineVariant` | #CAC4D0 | ✅ Sincronizado |
| **Categorías (Custom)** | | | |
| Graffiti | (custom) | #E74C3C | ⚠️ Por agregar en Figma |
| Mural | (custom) | #3498DB | ⚠️ Por agregar en Figma |
| Escultura | (custom) | #F39C12 | ⚠️ Por agregar en Figma |
| Performance | (custom) | #9B59B6 | ⚠️ Por agregar en Figma |

**Próximos pasos:**
1. Agregar colores de categorías al archivo de Figma
2. Usar componentes del UI Kit directamente (ya tienen los colores correctos)
3. Diseñar pantallas usando la paleta sincronizada

---

*Documento generado para guiar la creación del prototipo en Figma*  
*Fecha: Inicio del proyecto*  
*Última actualización: Sincronización de Design Tokens con Figma*  
*Estado: Design Tokens sincronizados ✅ | Listo para diseño de pantallas*

