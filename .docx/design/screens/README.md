# 📱 Screens - Guía de Diseño para Figma

Este directorio contiene las especificaciones detalladas de cada pantalla de **Graffiti Trails** para guiar el diseño en Figma.

## 📋 Índice de Pantallas

### Must Have (Core MVP1)
| # | Archivo | Pantalla | Prioridad |
|---|---------|----------|-----------|
| 1 | `01-mapa-page.md` | MapaPage (Home) | 🔴 Crítica |
| 2 | `02-feed-page.md` | FeedPage | 🔴 Alta |
| 3 | `03-obra-detail-page.md` | ObraDetailPage | 🔴 Alta |
| 4 | `04-artista-profile-page.md` | ArtistaProfilePage | 🔴 Alta |
| 5 | `05-create-ruta-page.md` | CreateRutaPage (6 pasos) | 🔴 Crítica |
| 6 | `06-top10-page.md` | TopNPage (Top N de Rutas) | 🟡 Media |

### Should Have
| # | Archivo | Pantalla | Prioridad |
|---|---------|----------|-----------|
| 7 | `07-ruta-list-page.md` | RutaListPage | 🟡 Media |
| 8 | `08-ruta-detail-page.md` | RutaDetailPage | 🟡 Media |
| 9 | `09-create-salida-page.md` | CreateSalidaPage | ⚠️ **OBSOLETO** (Reemplazado por Rutas Dinámicas) |
| 10 | `10-filtros-modal.md` | Modal de Filtros | 🟡 Media |
| 11 | `11-onboarding.md` | Onboarding (3 pantallas) | 🟢 Baja |
| 12 | `12-publicar-obra-page.md` | PublicarObraPage (Solo Artistas) | 🔴 Alta |
| 13 | `13-crear-encuentro-page.md` | CrearEncuentroPage (Solo Artistas) | 🟡 Media |
| 14 | `14-encuentro-detail-page.md` | EncuentroDetailPage | 🟡 Media |

---

## 🎨 Guía de Uso

### Para cada pantalla encontrarás:
1. **Descripción:** Propósito y contexto de la pantalla
2. **Wireframe ASCII:** Estructura visual básica
3. **Componentes:** Lista de elementos UI necesarios con:
   - **Widget Implementado:** Referencia al widget Flutter disponible
   - **Ubicación:** Ruta del archivo en el código
   - **Especificaciones:** Tabla con Elemento | Especificación | Widget
   - **Ejemplos de uso:** Código Dart cuando es relevante
4. **Estados:** Loading, Empty, Error, Success
5. **Interacciones:** Acciones del usuario
6. **Specs Técnicas:** Tamaños, colores, espaciados (usando Design Tokens)
7. **Conexiones:** Navegación hacia/desde otras pantallas

### Tamaño de Frame en Figma
- **Móvil:** 375x812px (iPhone 13)
- **Tablet (opcional):** 768x1024px

### Componentes Base
Usar componentes del **Syncfusion Flutter UI Kit - Material 3 Theme**:
- Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/

---

## 🧩 Componentes Implementados Disponibles

### ✅ Atoms (100% Completo)
- **Buttons:** `AppButton`, `AppFAB` - Primary, Secondary, Outlined, Text, FAB
- **Icons:** `AppIcon`, `CategoryIcon` - Navigation, Action, Category, Map, Social
- **Text Styles:** `AppTextStyles` - Display, Headline, Body, Label, Caption
- **Input Fields:** `AppTextField` - Filled, Outlined, Flat, con validación
- **Avatars:** `AppAvatar`, `AppCircleAvatar` - Small, Medium, Large, XLarge
- **Badges:** `AppBadge`, `CategoryBadge` - Dot, Circle, Rounded, Category
- **Dividers:** `AppDivider` - Horizontal, Vertical, con variantes
- **Loading:** `AppLoader` - Circular, Linear, Overlay

### ✅ Molecules (56% Completo)
- **Search Bar:** `AppSearchBar` - Con placeholders, iconos, callbacks
- **Filter Chips:** `AppFilterChip`, `AppCategoryFilterChipGroup` - Multi-select
- **Map Pins:** `AppMapPin`, `AppMapPinDot`, `AppMapPinCluster` - Por categoría
- **Tooltips:** `AppTooltip` - Normal, With Header
- **Dialogs:** `AppDialogBox` - Con header, content, footer

### ✅ Organisms (100% Completo)
- **App Bars:** `AppTopBar` - Home, Detail, Create, Map variants
- **Bottom Navigation:** `AppBottomNav`, `AppBottomNavWithFAB`
- **Obra Card:** `AppObraCard` - Grid, List, Compact variants
- **Artist Card:** `AppArtistCard` - Standard, Compact, Horizontal
- **Ruta Card:** `AppRutaCard` - Standard, Compact, Horizontal
- **Top N Item (Rutas):** `AppTop10Item`, `AppTop10Grid` - Con ranking y overlay (ahora para rutas, no obras)
- **Filter Modal:** `AppFilterModal` - Bottom sheet con categorías y artistas
- **Obra Preview Bottom Sheet:** `AppObraPreviewBottomSheet` - Preview rápido
- **Obra Detail Header:** `AppObraDetailHeader` - Hero image con gradiente
- **Route Step Indicator:** `AppRouteStepIndicator` - 6 pasos con labels

### 📚 Referencias de Implementación
- **Design Tokens:** `lib/core/theme/` - Colors, Typography, Spacing, Shadows
- **Widgets:** `lib/presentation/widgets/` - Todos los componentes
- **Preview Pages:** `/preview/*` - Páginas de visualización y testing

### 🎯 Estado del Design System
- **Design Tokens:** ✅ 100% (5/5) - Colors, Typography, Spacing, Border Radius, Shadows
- **Atoms:** ✅ 100% (8/8) - Buttons, Icons, Text Styles, Inputs, Avatars, Badges, Dividers, Loading
- **Molecules:** 🔄 56% (5/9) - Search Bar ✅, Filter Chips ✅, Map Pins ✅, Tooltips ✅, Dialogs ✅
- **Organisms:** ✅ 100% (10/10) - Todos los componentes complejos implementados
- **Templates:** ⏳ 0% (0/6) - Pendiente de diseño en Figma
- **Pages:** ⏳ 0% (0/9) - Pendiente de implementación en Flutter

### 📖 Cómo Usar Esta Documentación

1. **Para Diseñadores (Figma):**
   - Usa los wireframes ASCII como guía de estructura
   - Consulta las especificaciones de cada componente
   - Revisa los widgets implementados para mantener consistencia
   - Usa los Design Tokens del UI Kit base

2. **Para Desarrolladores (Flutter):**
   - Cada componente tiene su widget correspondiente listado
   - Revisa la ubicación del archivo para importar correctamente
   - Usa los ejemplos de código cuando están disponibles
   - Consulta las páginas de preview (`/preview/*`) para ver implementaciones

3. **Para Product Managers:**
   - Revisa los flujos de usuario en cada screen
   - Consulta las interacciones y estados
   - Verifica que las conexiones de navegación sean correctas

---

## 🎯 Orden de Diseño Recomendado

1. **Semana 1:** MapaPage + ObraDetailPage (flujo principal)
2. **Semana 2:** FeedPage + ArtistaProfilePage
3. **Semana 3:** CreateRutaPage (6 pasos)
4. **Semana 4:** TopNPage (rutas) + RutaListPage + RutaDetailPage
5. **Semana 5:** PublicarObraPage + CrearEncuentroPage + EncuentroDetailPage + Modal de Filtros + Onboarding

---

---

## 📝 Notas de Actualización

**Última actualización:** 12 de Diciembre, 2025

### Cambios Recientes:
- ✅ Actualizada documentación con referencias a widgets implementados
- ✅ Agregadas secciones "Widget Implementado" en todas las screens
- ✅ Incluidos ejemplos de código Dart para uso de componentes
- ✅ Referencias a Design Tokens (`AppColors`, `AppTextStyles`, `AppSpacing`, etc.)
- ✅ Links a ubicaciones de archivos en el código Flutter
- ✅ **Actualización importante:** Top 10 de obras → Top N de rutas (máximo 10)
- ✅ **Nuevas funcionalidades:** Publicar obra (Artistas), Crear encuentro (Artistas)
- ✅ **Rutas dinámicas:** Eventos repetitivos con rrule (reemplaza CreateSalidaPage)
- ✅ **Enfoque geográfico:** Buenos Aires (CABA) específicamente
- ✅ **Modo de transporte:** Principalmente bici (también a pie)

### Próximos Pasos:
- [ ] Agregar screenshots de componentes implementados
- [ ] Crear diagramas de flujo de navegación
- [ ] Documentar estados de error y edge cases
- [ ] Agregar especificaciones de animaciones y transiciones

---

*Documentación mantenida en sincronización con el código Flutter*
