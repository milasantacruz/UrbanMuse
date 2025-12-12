# 🎨 Component Preview System

Sistema de visualización y testing de componentes de diseño para UrbanMuse (Graffiti Trails).

## 📋 Descripción

Este sistema permite visualizar y testear todos los componentes de UI de la aplicación de forma aislada, facilitando el desarrollo, testing y validación de diseño antes de integrarlos en las pantallas finales.

## 🎯 Objetivo

- Visualizar componentes de forma aislada
- Testear diferentes estados de componentes (normal, hover, disabled, loading)
- Validar que los colores y tokens estén sincronizados con Figma
- Documentar el uso de cada componente
- Facilitar el desarrollo iterativo

## 🚀 Rutas Disponibles

### Página Principal
- **Ruta:** `/preview`
- **Componente:** `PreviewHomePage`
- **Descripción:** Índice de todos los componentes disponibles organizados por categoría (Atoms, Molecules, Organisms)

### Botones
- **Ruta:** `/preview/buttons`
- **Componente:** `ButtonsPreviewPage`
- **Descripción:** Showcase de todos los botones del sistema
- **Variantes:**
  - Primary (Filled)
  - Primary (Outlined)
  - Text (Flat)
  - Secondary
  - FAB (Regular, Large, Extended)
  - Estados: Normal, Loading, Disabled
  - Con iconos: Left, Right, Both

### Icons
- **Ruta:** `/preview/icons`
- **Componente:** `IconsPreviewPage`
- **Descripción:** Showcase de todos los iconos (Navigation, Action, Category, Map, Social, UI)

### Text Styles
- **Ruta:** `/preview/text-styles`
- **Componente:** `TextStylesPreviewPage`
- **Descripción:** Showcase de tipografía (Display, Headline, Title, Label, Body)

### Input Fields
- **Ruta:** `/preview/inputs`
- **Componente:** `InputsPreviewPage`
- **Descripción:** Showcase de campos de texto (Filled, Outlined, Flat, validación)

### Badges
- **Ruta:** `/preview/badges`
- **Componente:** `BadgesPreviewPage`
- **Descripción:** Showcase de badges (Dot, Circle, Rounded, Category, Notification)

### Avatars
- **Ruta:** `/preview/avatars`
- **Componente:** `AvatarsPreviewPage`
- **Descripción:** Showcase de avatares (Simple, Verified, Editable, con imágenes 3D)
- **Assets:** 6 imágenes de avatares 3D en `lib/assets/`

### Dividers
- **Ruta:** `/preview/dividers`
- **Componente:** `DividersPreviewPage`
- **Descripción:** Showcase de separadores (Horizontal, Vertical, Full-width, Inset, Middle-inset, With Subhead)

### Loading Indicators
- **Ruta:** `/preview/loading`
- **Componente:** `LoadingPreviewPage`
- **Descripción:** Showcase de loaders (Circular, Linear, Button, Overlay, con progreso)

---

## 🎉 ¡ATOMS 100% COMPLETOS!

Todos los componentes atómicos han sido implementados y están disponibles para uso.

---

## 🧬 Molecules (Componentes Moleculares)

### Search Bar
- **Ruta:** `/preview/search-bar`
- **Componente:** `SearchBarPreviewPage`
- **Descripción:** Barra de búsqueda con placeholders específicos, iconos, callbacks y ejemplo interactivo

### Filter Chips
- **Ruta:** `/preview/chips`
- **Componente:** `ChipsPreviewPage`
- **Descripción:** Chips de filtro con multi-select, single-select, categorías con colores

## 🦠 Organisms (Organismos)

Componentes organizacionales complejos que combinan átomos y moléculas.

### Obra Card
- **Ruta:** `/preview/obra-card`
- **Componente:** `ObraCardPreviewPage`
- **Descripción:** Tarjetas de obra con 3 variantes (grid, list, compact)

**Variantes:**
- `AppObraCard.grid` - Vertical para grids 2 columnas
- `AppObraCard.list` - Horizontal para listas/búsqueda
- `AppObraCardCompact` - Mini para horizontal scroll

**Características:**
- Aspect ratios configurables (4:3, 16:9, 1:1)
- Category badge overlay
- Favorite toggle con contador de likes
- Title (max 2 líneas), Artist, Location
- Shadow elevation 2, border radius 12px

### Próximos Componentes (Organisms)
- `/preview/artista-card` - Artista cards con avatar y stats
- `/preview/ruta-card` - Ruta cards con mapa preview
- `/preview/app-bar` - App bar variations
- `/preview/bottom-nav` - Bottom navigation

## 📁 Estructura de Archivos

```
lib/
├── assets/                           # Assets del proyecto
│   ├── 3d_avatar_1.png              # Avatar 3D 1
│   ├── 3d_avatar_2.png              # Avatar 3D 2
│   ├── 3d_avatar_3.png              # Avatar 3D 3
│   ├── 3d_avatar_4.png              # Avatar 3D 4
│   ├── 3d_avatar_5.png              # Avatar 3D 5
│   └── 3d_avatar_6.png              # Avatar 3D 6
│
├── core/
│   └── theme/                        # Design tokens
│       ├── app_colors.dart
│       ├── app_text_styles.dart
│       ├── app_spacing.dart
│       ├── app_border_radius.dart
│       └── app_shadows.dart
│
└── presentation/
    ├── pages/
    │   └── preview/
    │       ├── README.md                      # Este archivo
    │       ├── preview_home_page.dart         # Índice de preview
    │       ├── buttons_preview_page.dart      # Preview de botones
    │       ├── icons_preview_page.dart        # Preview de iconos
    │       ├── text_styles_preview_page.dart  # Preview de tipografía
    │       ├── inputs_preview_page.dart       # Preview de inputs
    │       ├── badges_preview_page.dart       # Preview de badges
    │       └── avatars_preview_page.dart      # Preview de avatares
    │
    └── widgets/
        ├── buttons/
        │   ├── buttons.dart
        │   ├── app_button.dart
        │   └── app_fab.dart
        ├── icons/
        │   ├── icons.dart
        │   ├── app_icon.dart
        │   └── category_icon.dart
        ├── inputs/
        │   ├── inputs.dart
        │   └── app_text_field.dart
        ├── badges/
        │   ├── badges.dart
        │   └── app_badge.dart
        └── avatars/
            ├── avatars.dart
            └── app_avatar.dart
```

## 🎨 Componentes Implementados

### ✅ Design Tokens
Todos los design tokens están definidos en `lib/core/theme/`:
- **Colores:** Sincronizados con Figma (#6BA034 primary, etc.)
- **Tipografía:** Expletus Sans y Exo 2 via Google Fonts
- **Espaciado:** Sistema base 8px
- **Border Radius:** sm(4px), md(8px), lg(12px), xl(16px), full(999px)
- **Sombras:** Elevation 1-4

### ✅ Botones (Buttons)

#### `AppButton`
Botón personalizado siguiendo Material 3 y sincronizado con Figma.

**Constructores:**
```dart
// Primary filled button
AppButton.primary(
  label: 'Button',
  onPressed: () {},
)

// Primary outlined button
AppButton.primaryOutlined(
  label: 'Button',
  onPressed: () {},
)

// Text button (flat)
AppButton.text(
  label: 'Button',
  onPressed: () {},
)

// Secondary button
AppButton.secondary(
  label: 'Button',
  onPressed: () {},
)
```

**Propiedades:**
- `label` (String): Texto del botón
- `onPressed` (VoidCallback?): Callback al presionar (null = disabled)
- `leftIcon` (Widget?): Icono a la izquierda
- `rightIcon` (Widget?): Icono a la derecha
- `isLoading` (bool): Estado de carga
- `isExpanded` (bool): Ocupa todo el ancho disponible

**Variantes:**
- Type: `Primary`, `Secondary`
- Mode: `Filled`, `Outlined`, `Text`
- States: Normal, Hover, Pressed, Focused, Disabled (automático)

#### `AppFAB`
Floating Action Button siguiendo Material 3.

**Constructores:**
```dart
// Regular FAB
AppFAB.regular(
  icon: Icon(Icons.add),
  onPressed: () {},
)

// Large FAB
AppFAB.large(
  icon: Icon(Icons.add),
  onPressed: () {},
)

// Extended FAB
AppFAB.extended(
  icon: Icon(Icons.add),
  label: 'Crear Ruta',
  onPressed: () {},
)
```

### ✅ Avatares (Avatars)

#### `AppAvatar`
Avatar personalizado con badges de verificación y edición.

**Constructores:**
```dart
// Avatar simple con imagen local
AppAvatar.simple(
  imageUrl: 'lib/assets/3d_avatar_1.png',
  size: AvatarSize.medium,
)

// Avatar simple con iniciales (fallback)
AppAvatar.simple(
  initials: 'DM',
  size: AvatarSize.medium,
)

// Avatar verificado (badge azul)
AppAvatar.verified(
  imageUrl: 'lib/assets/3d_avatar_1.png',
)

// Avatar editable (badge de editar)
AppAvatar.editable(
  imageUrl: 'lib/assets/3d_avatar_2.png',
  onEdit: () => _pickImage(),
)
```

**Tamaños:**
- `AvatarSize.small` - 32px
- `AvatarSize.medium` - 48px (default)
- `AvatarSize.large` - 64px
- `AvatarSize.xLarge` - 88px

#### `AppCircleAvatar`
Avatar simplificado para listas y comentarios.

```dart
// Con imagen remota
AppCircleAvatar(
  imageUrl: 'https://example.com/avatar.jpg',
  size: 40,
)

// Con imagen local
AppCircleAvatar(
  imageUrl: 'lib/assets/3d_avatar_1.png',
  size: 40,
)

// Con iniciales
AppCircleAvatar(
  initials: 'DM',
  size: 40,
  backgroundColor: AppColors.primary,
)
```

**Assets:**
- 6 imágenes de avatares 3D en `lib/assets/`:
  - `3d_avatar_1.png` - `3d_avatar_6.png`
- Soporte para imágenes locales (`lib/assets/`) y remotas (URLs)
- Fallback automático a iniciales si no hay imagen

### ✅ Dividers (Separadores)

#### `AppDivider`
Separador horizontal o vertical siguiendo Material 3 y sincronizado con Figma.

**Constructores:**
```dart
// Horizontal full-width (sin padding)
AppDivider.fullWidth()

// Horizontal con inset izquierdo (16px)
AppDivider.inset()

// Horizontal con inset en ambos lados (16px)
AppDivider.middleInset()

// Divider con subencabezado
AppDivider.withSubhead(
  subheadText: 'Obras Recientes',
)

// Vertical full-width
AppDivider.verticalFullWidth(
  height: 120,
)

// Vertical con inset superior
AppDivider.verticalInset()

// Vertical con inset en ambos lados
AppDivider.verticalMiddleInset()

// Custom color y grosor
AppDivider.fullWidth(
  color: AppColors.primary,
  thickness: 2,
)
```

**Especificaciones:**
- Grosor por defecto: 1px
- Color por defecto: `onSurfaceVariant` (#323232)
- Padding Inset: 16px
- Gap Subhead: 4px
- Orientaciones: Horizontal y Vertical

**Casos de uso:**
- Separar elementos en listas
- Dividir secciones de contenido
- Crear secciones con subencabezados
- Navegación horizontal con separadores verticales

### ✅ Loading Indicators (Loaders)

#### `AppLoader`
Loader circular siguiendo Material 3 y sincronizado con Figma.

**Constructores:**
```dart
// Tamaños predefinidos
AppLoader.small()    // 24px
AppLoader.medium()   // 40px (default Figma)
AppLoader.large()    // 56px
AppLoader.xLarge()   // 72px

// Con color primario
AppLoader.primary(
  loaderSize: LoaderSize.large,
)

// Con progreso específico (0.0 - 1.0)
AppLoader.large(
  value: 0.5,  // 50% de progreso
)

// Custom
AppLoader(
  loaderSize: LoaderSize.large,
  color: AppColors.tertiary,
  strokeWidth: 6.0,
  value: 0.7,
)
```

**Tamaños:**
- `LoaderSize.small` - 24px, stroke 2px
- `LoaderSize.medium` - 40px, stroke 4px (default Figma)
- `LoaderSize.large` - 56px, stroke 6px
- `LoaderSize.xLarge` - 72px, stroke 8px

#### `AppLinearLoader`
Barra de progreso lineal horizontal.

```dart
// Indeterminado (animado)
AppLinearLoader.indeterminate()

// Con progreso
AppLinearLoader.determinate(
  progress: 0.7,  // 70%
)

// Custom
AppLinearLoader(
  value: 0.5,
  color: AppColors.tertiary,
  backgroundColor: AppColors.surfaceVariant,
  height: 8.0,
)
```

#### `AppLoaderButton`
Loader pequeño para usar dentro de botones.

```dart
AppButton.primary(
  label: 'Loading...',
  icon: AppLoaderButton(),
  onPressed: null,
)
```

#### `AppLoaderOverlay`
Loader con overlay de pantalla completa.

```dart
AppLoaderOverlay(
  loaderSize: LoaderSize.large,
  message: 'Cargando datos...\nPor favor espera',
  overlayColor: Colors.black,
  overlayOpacity: 0.5,
)
```

**Especificaciones:**
- Tamaño base: 40px (Figma)
- Stroke widths: 2px, 4px, 6px, 8px
- Color por defecto: `primary` (#6BA034)
- Modos: Indeterminate (animado) y Determinate (con progreso)

**Casos de uso:**
- Carga de datos (indeterminate)
- Progreso de descarga/subida (determinate)
- Estados de loading en botones
- Pantallas de carga con overlay
- Progress bars en cards

---

## 🧬 Molecules (Componentes Moleculares)

### ✅ Search Bar (Barra de Búsqueda)

#### `AppSearchBar`
Barra de búsqueda siguiendo Material 3 y sincronizada con Figma.

**Constructores:**
```dart
// Básico
AppSearchBar()

// Con placeholders específicos
AppSearchBar.obras()      // "Buscar obras de arte urbano..."
AppSearchBar.artistas()   // "Buscar artistas..."
AppSearchBar.rutas()      // "Buscar rutas..."

// Con controller y callbacks
AppSearchBar(
  controller: _searchController,
  placeholder: 'Buscar...',
  onChanged: (value) {
    // Búsqueda en tiempo real
  },
  onSubmitted: (value) {
    // Búsqueda al presionar enter
  },
  onClear: () {
    // Acción al limpiar
  },
)

// Custom colors
AppSearchBar(
  borderColor: AppColors.primary,
  textColor: AppColors.primary,
  iconColor: AppColors.primary,
  backgroundColor: Colors.white,
)

// Deshabilitado
AppSearchBar(
  placeholder: 'Búsqueda deshabilitada...',
  enabled: false,
)
```

**Especificaciones:**
- Altura: 56px normal, 40px compact (igual que inputs)
- Border radius: 28px / 20px (completamente redondeado)
- Border: 1px sólido, Secondary (#66715B)
- Placeholder: Roboto Regular 16px / 14px
- Iconos: Search (default), Clear (cuando hay texto)
- Padding horizontal: 16px

**Casos de uso:**
- Búsqueda de obras en feed
- Búsqueda de artistas
- Búsqueda de rutas
- Filtrado en listas
- Búsqueda en app bar

### ✅ Filter Chips (Chips de Filtro)

#### `AppFilterChip`
Chip de filtro individual siguiendo Material 3 y sincronizado con Figma.

**Constructores:**
```dart
// Básico
AppFilterChip(
  label: 'Graffiti',
  isSelected: true,
  onSelected: (selected) { },
)

// Con avatar
AppFilterChip(
  label: 'Popular',
  avatar: Icon(Icons.star, size: 18),
  onSelected: (selected) { },
)

// Con checkmark
AppFilterChip(
  label: 'Reciente',
  isSelected: true,
  showCheckmark: true,
  onSelected: (selected) { },
)

// Con delete
AppFilterChip(
  label: 'Tag',
  isSelected: true,
  onSelected: (selected) { },
  onDeleted: () {
    // Borrar chip
  },
)

// Custom colors
AppFilterChip(
  label: 'Mural',
  isSelected: true,
  selectedColor: AppColors.categoryMural.withOpacity(0.2),
  textColor: AppColors.categoryMural,
  onSelected: (selected) { },
)
```

#### `AppFilterChipGroup`
Grupo de chips con scroll horizontal y selección múltiple/única.

```dart
// Multi-select
AppFilterChipGroup(
  labels: ['Graffiti', 'Mural', 'Escultura'],
  selectedLabels: _selectedCategories,
  onSelectionChanged: (selected) {
    setState(() => _selectedCategories = selected);
  },
  multiSelect: true,
)

// Single-select
AppFilterChipGroup(
  labels: ['A pie', 'En bici', 'En auto'],
  selectedLabels: [_selectedTransport],
  onSelectionChanged: (selected) {
    setState(() => _selectedTransport = selected.first);
  },
  multiSelect: false,
)
```

#### `AppCategoryFilterChipGroup`
Grupo especializado para categorías de obras con iconos de color.

```dart
AppCategoryFilterChipGroup(
  selectedCategories: _selectedCategories,
  onSelectionChanged: (selected) {
    setState(() => _selectedCategories = selected);
  },
)
```

**Especificaciones:**
- Altura: 32px
- Border radius: 8px
- Font: Roboto Medium 14px, line-height 20px, tracking 0.014px
- Padding: 5px horizontal
- Icon sizes: 18px (left/avatar), 14px (right/close)
- Normal: background #f7f2fb, border #79747e, text #49454f
- Selected: background #e8f8de, border #e8f8de, text #1d1b20

**Casos de uso:**
- Filtros de categorías en feed/mapa
- Selección de tags
- Filtros de transporte en rutas
- Búsquedas recientes
- Opciones de ordenamiento

---

## 🎨 Design Tokens

Los componentes utilizan los design tokens definidos en:
- `lib/core/theme/app_colors.dart` - Colores sincronizados con Figma
- `lib/core/theme/app_text_styles.dart` - Tipografía con Google Fonts
- `lib/core/theme/app_spacing.dart` - Espaciado
- `lib/core/theme/app_border_radius.dart` - Border radius
- `lib/core/theme/app_shadows.dart` - Sombras

### Colores Principales
- **Primary:** #6BA034 (verde) ✅ Sincronizado con Figma
- **Secondary:** #66715B (verde oscuro) ✅ Sincronizado con Figma
- **Base:** Syncfusion Flutter UI Kit - Material 3 Theme

### Tipografía
- **Display/Headline/Title:** Expletus Sans ✅ Google Fonts
- **Label/Body:** Exo 2 ✅ Google Fonts
- **Base:** Syncfusion Flutter UI Kit - Material 3 Theme

## 🔧 Uso del Sistema de Preview

### Para Desarrolladores

1. **Acceder al preview:**
   ```dart
   // En cualquier parte de la app, navegar a:
   context.push('/preview');
   // o
   context.push('/preview/buttons');
   ```

2. **Agregar nuevo componente:**
   ```dart
   // 1. Crear el componente en lib/presentation/widgets/
   // 2. Crear página de preview en lib/presentation/pages/preview/
   // 3. Agregar ruta en app_router.dart
   // 4. Agregar tile en preview_home_page.dart
   ```

3. **Estructura de página de preview:**
   ```dart
   class ComponentPreviewPage extends StatelessWidget {
     @override
     Widget build(BuildContext context) {
       return Scaffold(
         appBar: AppBar(title: Text('Component Name')),
         body: SingleChildScrollView(
           padding: EdgeInsets.all(AppSpacing.space4),
           child: Column(
             children: [
               // Secciones de variantes
               _buildSection(
                 title: 'Variant Name',
                 description: 'Description',
                 children: [
                   // Ejemplos del componente
                 ],
               ),
             ],
           ),
         ),
       );
     }
   }
   ```

### Para Diseñadores

1. Acceder a `/preview` para ver todos los componentes
2. Verificar que los colores coincidan con Figma
3. Validar spacing, border radius, shadows
4. Testear diferentes estados (normal, hover, disabled)
5. Proporcionar feedback sobre ajustes necesarios

## 📝 Checklist para Nuevos Componentes

Al agregar un nuevo componente al sistema de preview:

- [ ] Implementar el componente en `lib/presentation/widgets/`
- [ ] Crear export file si es categoría nueva
- [ ] Crear página de preview en `lib/presentation/pages/preview/`
- [ ] Agregar ruta en `app_router.dart`
- [ ] Agregar tile en `preview_home_page.dart`
- [ ] Verificar colores sincronizados con Figma
- [ ] Incluir todas las variantes del componente
- [ ] Incluir todos los estados (normal, disabled, loading, etc.)
- [ ] Agregar ejemplos de uso común
- [ ] Documentar en este README
- [ ] Sin errores de linter

## 🎯 Siguientes Pasos

1. ✅ Implementar sistema de botones
2. ⚠️ Implementar iconos y badges
3. ⚠️ Implementar inputs y search bar
4. ⚠️ Implementar cards (Obra, Artista, Ruta)
5. ⚠️ Implementar navigation components

## 📚 Referencias

- **Figma UI Kit:** [Syncfusion Flutter UI Kit - Material 3 Theme](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-)
- **Design Tokens:** `.docx/design/color-sync-report.md`
- **Atomic Design:** `.docx/design/atomic-design-checklist.md`
- **Material 3:** [Material Design 3](https://m3.material.io)

---

*Sistema creado: 11 de Diciembre, 2025*  
*Estado: En desarrollo activo*

