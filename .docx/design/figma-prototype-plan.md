# 🎨 Plan de Prototipo Figma - Graffiti Trails

## 📋 Objetivo

Crear prototipo interactivo en Figma basado en la documentación del Designer, utilizando el **Syncfusion Flutter UI Kit - Material 3 Theme** como base:
- Adaptar componentes del UI Kit a nuestro Design System
- Personalizar colores y tipografía según nuestros tokens
- User Flows principales
- Pantallas clave del MVP1
- Componentes personalizados basados en el UI Kit

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

**Base:** Usar componentes del Syncfusion Flutter UI Kit - Material 3  
**Personalización:** Adaptar colores, tipografía y espaciado según nuestro Design System

### Colores (Variables de Figma)
**Personalización del tema Material 3:**
- **Primary Color:** #FF6B35 (naranja vibrante) - reemplazar primary del Material 3
- **Primary Variants:** #E55A2B (dark), #FF8C5A (light)
- **Secondary Color:** #2D3142 (gris oscuro) - reemplazar secondary del Material 3
- **Secondary Variants:** #1A1D29 (dark), #4A5068 (light)

**Colores de Categorías (Custom):**
- Graffiti: #E74C3C
- Mural: #3498DB
- Escultura: #F39C12
- Performance: #9B59B6

**Neutros (Material 3 adaptados):**
- Usar escala de neutros del Material 3 pero ajustar a nuestros valores:
  - Neutral 50: #FAFAFA
  - Neutral 100-900: escala completa hasta #212121

**Estados (Material 3):**
- Success: #27AE60
- Warning: #F39C12
- Error: #E74C3C
- Info: #3498DB

### Tipografía (Text Styles)
**Base Material 3 + Personalización:**
- Usar tipografías del Material 3 (Roboto por defecto) pero ajustar tamaños:
- **Display:** 32px/40px, Bold 700
- **Headline Large (H1):** 28px/36px, Bold 700
- **Headline Medium (H2):** 24px/32px, SemiBold 600
- **Headline Small (H3):** 20px/28px, SemiBold 600
- **Body Large:** 18px/26px, Regular 400
- **Body Medium:** 16px/24px, Regular 400
- **Body Small:** 14px/20px, Regular 400
- **Label Large:** 14px/20px, SemiBold 600
- **Label Medium:** 12px/16px, Medium 500

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

### Paso 1: Setup del Archivo Figma y UI Kit
1. Crear nuevo archivo en Figma
2. **Duplicar componentes necesarios del Syncfusion Flutter UI Kit:**
   - Abrir el UI Kit: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3917-829&m=dev&t=y1ykPsJ878ZyRkH5-1
   - Duplicar componentes base: Buttons, Inputs, Cards, Chips, Bottom Sheets, Dialogs
   - Copiar al archivo de Graffiti Trails
3. Configurar frames para móvil (375x812px - iPhone 13)
4. Crear estructura de páginas

### Paso 2: Personalizar Design Tokens
**Referencia:** Ver `figma-variables-structure.md` para estructura detallada

1. **Duplicar y Adaptar Variables de Color del Material 3:**
   - Duplicar colección "Colors" del UI Kit
   - **Primary Colors:**
     - Cambiar Primary (Light) a #FF6B35
     - Cambiar Primary (Dark) a #FF8C5A
     - Ajustar Primary Container y On Primary según Material 3
   - **Secondary Colors:**
     - Cambiar Secondary (Light) a #2D3142
     - Cambiar Secondary (Dark) a #4A5068
     - Ajustar Secondary Container y On Secondary
   - **Colores Custom de Categorías:**
     - Crear nueva colección "Categories" o agregar a Colors
     - Graffiti: #E74C3C
     - Mural: #3498DB
     - Escultura: #F39C12
     - Performance: #9B59B6
   - **Neutros:**
     - Mantener estructura del Material 3
     - Ajustar valores según nuestra escala (#FAFAFA a #212121)

2. **Duplicar y Adaptar Variables de Tipografía:**
   - Duplicar colección "Typography" del UI Kit
   - Mantener font families (Roboto)
   - **Ajustar Font Sizes:**
     - Display: 32px (ajustar desde Material 3)
     - Headline Large: 28px
     - Headline Medium: 24px
     - Headline Small: 20px
     - Body Large: 18px
     - Body Medium: 16px
     - Body Small: 14px
     - Label Large: 14px
     - Label Medium: 12px
   - Ajustar line-heights según nuestro sistema
   - Mantener font weights (400, 500, 600, 700)

3. **Duplicar y Adaptar Variables de Espaciado:**
   - Duplicar colección "Spacing" del UI Kit
   - **Adaptar a sistema de 8px base:**
     - Crear nueva escala: 4px, 8px, 12px, 16px, 24px, 32px, 40px, 48px, 64px, 80px
     - O ajustar valores existentes del Material 3 (que usa 4px base)

4. **Duplicar Variables de Border Radius y Elevation:**
   - Duplicar colecciones del UI Kit
   - Mantener valores del Material 3 (son estándar)

5. **Configurar Layout Grids:**
   - Adaptar sistema de espaciado a 8px base
   - Configurar grids para móvil (12 columnas, 16px gutter, 16px margin)

### Paso 3: Personalizar Componentes Base
1. **Adaptar componentes del UI Kit:**
   - Botones: aplicar colores personalizados
   - Inputs: mantener estilo Material 3, ajustar colores
   - Cards: usar como base, personalizar para nuestras necesidades
   - Chips: adaptar para badges de categoría
2. **Crear componentes custom:**
   - Obra Card (basado en Card del UI Kit)
   - Artista Card (basado en Card del UI Kit)
   - Map Pin (custom, usando colores de categorías)
   - Top 10 Grid Item (custom)

### Paso 4: Pantallas Principales
1. **Usar componentes del UI Kit como base:**
   - App Bar del Material 3
   - Bottom Navigation del Material 3
   - List Items del Material 3
2. **Diseñar pantallas:**
   - MapaPage con mapa mockup + componentes UI Kit
   - FeedPage con grid usando Cards personalizadas
   - ObraDetailPage usando Cards y Botones del UI Kit
   - ArtistaProfilePage con componentes adaptados
   - CreateRutaPage (6 pasos) usando Inputs y Botones del UI Kit
   - Top10Page con grid custom

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
  - [ ] Colección Colors duplicada y personalizada
  - [ ] Colección Typography duplicada y ajustada
  - [ ] Colección Spacing adaptada a 8px base
  - [ ] Colección Categories creada (custom)
  - [ ] Aliases y referencias configuradas correctamente
  - [ ] Modos Light y Dark configurados
- [ ] Design tokens personalizados aplicados (colores, tipografía)
- [ ] Componentes del UI Kit adaptados a nuestros colores usando variables
- [ ] Componentes custom creados basados en el UI Kit
- [ ] Pantallas principales diseñadas usando componentes del UI Kit
- [ ] Flujos interactivos conectados
- [ ] Colores consistentes (Material 3 + custom)
- [ ] Tipografía respeta nuestro design system
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

*Documento generado para guiar la creación del prototipo en Figma*  
*Fecha: Inicio del proyecto*  
*Estado: Listo para implementación en Figma usando Syncfusion UI Kit*

