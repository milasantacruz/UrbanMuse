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

### Próximos Componentes

- `/preview/icons` - Icons (Material + Custom)
- `/preview/text-styles` - Typography styles
- `/preview/inputs` - Input fields y text areas
- `/preview/search-bar` - Search bar component
- `/preview/badges` - Category badges
- `/preview/map-pins` - Map pins por categoría
- `/preview/obra-card` - Obra cards (grid y list)
- `/preview/app-bar` - App bar variations
- `/preview/bottom-nav` - Bottom navigation

## 📁 Estructura de Archivos

```
lib/presentation/
├── pages/
│   └── preview/
│       ├── README.md                 # Este archivo
│       ├── preview_home_page.dart    # Página índice de preview
│       └── buttons_preview_page.dart # Preview de botones
└── widgets/
    └── buttons/
        ├── buttons.dart              # Export file
        ├── app_button.dart           # Componente de botón
        └── app_fab.dart              # Componente de FAB
```

## 🎨 Componentes Implementados

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

## 🎨 Design Tokens

Los componentes utilizan los design tokens definidos en:
- `lib/core/theme/app_colors.dart` - Colores sincronizados con Figma
- `lib/core/theme/app_text_styles.dart` - Tipografía
- `lib/core/theme/app_spacing.dart` - Espaciado
- `lib/core/theme/app_border_radius.dart` - Border radius
- `lib/core/theme/app_shadows.dart` - Sombras

### Colores Principales
- **Primary:** #6BA034 (verde) ✅ Sincronizado con Figma
- **Secondary:** #66715B (verde oscuro) ✅ Sincronizado con Figma
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

