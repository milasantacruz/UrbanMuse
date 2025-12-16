# 📱 FeedPage

## 📋 Descripción
Lista/grid de obras de arte urbano en formato visual. Permite explorar, buscar y filtrar obras sin necesidad de interactuar con el mapa. Alternativa de descubrimiento más orientada a "browsing".

**Persona principal:** María (Exploradora Urbana), Diego (Artista Local)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ Feed              🔍  🔽     │ ← App Bar con búsqueda y filtros
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ 🔍 Buscar obra, artista...   ││ ← Search Bar
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ [Todos] [Graffiti] [Mural] →   │ ← Filter Chips (scroll)
├─────────────────────────────────┤
│ ┌───────────┐ ┌───────────┐   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │           │ │           │   │
│ ├───────────┤ ├───────────┤   │
│ │ Título    │ │ Título    │   │
│ │ @artista  │ │ @artista  │   │ ← Grid 2 columnas
│ │ [Mural]   │ │ [Graffiti]│   │
│ │ ❤️ 42     │ │ ❤️ 128    │   │
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │           │ │           │   │
│ └───────────┘ └───────────┘   │
│         ↓ Scroll infinito      │
├─────────────────────────────────┤
│  🗺️     📱     ⭐     👤      │ ← Bottom Navigation
│  Mapa   Feed   Top10  Perfil   │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
**Widget Implementado:** `AppTopBar.home` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "Feed" / "Explorar" - Headline Small | `AppTopBar.home(title: "Explorar")` |
| Icono búsqueda | 24px, abre SearchBar expandida | `actions: [IconButton(icon: AppIcon.search)]` |
| Icono filtros | 24px, abre Modal de Filtros | `actions: [IconButton(icon: AppIcon.filter)]` |
| Badge en filtros | Dot indicator si hay filtros activos | `AppBadge.dot` sobre el icono |
| Altura | 56px | Material 3 standard |

### Search Bar
**Widget Implementado:** `AppSearchBar` ✅  
**Ubicación:** `lib/presentation/widgets/search/app_search_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Placeholder | "Buscar obra, artista, barrio..." | `AppSearchBar(placeholder: "Buscar obra...")` |
| Icono izquierdo | 🔍 20px | Integrado en `AppSearchBar` |
| Clear button | X cuando hay texto | Integrado automático |
| Border | 1px Outline Variant (#CAC4D0) | `AppColors.outlineVariant` |
| Border radius | 28px (pill shape) | Configurado en `AppSearchBar` |
| Altura | 48px o 56px | `AppSearchBar` standard |
| Focus state | Border Primary (#6BA034) | Automático en `AppTextField` |

### Filter Chips
**Widget Implementado:** `AppCategoryFilterChipGroup` ✅  
**Ubicación:** `lib/presentation/widgets/chips/app_filter_chip.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Horizontal scroll | `AppCategoryFilterChipGroup` con `SingleChildScrollView` |
| Primer chip | "Todos" - siempre presente | `AppCategoryFilterChipGroup` incluye "Todos" |
| Otros chips | Por categoría | Chips automáticos por categoría |
| Estilo seleccionado | Filled con color de categoría | `selected: true` |
| Estilo no seleccionado | Outlined | `selected: false` |
| Altura | 32px | Configurado en `AppFilterChip` |

### Obra Card (Grid Item)
**Widget Implementado:** `AppObraCard.grid` ✅  
**Ubicación:** `lib/presentation/widgets/cards/app_obra_card.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Ancho | 50% - 8px (gap) | Grid 2 columnas con `AppObraCard.grid` |
| Imagen | Aspect ratio 4:3 (o 1:1), radius 12px top | `aspectRatio: 4/3` prop |
| Padding contenido | 12px | `AppSpacing.space3` |
| Título | Body Medium (16px), Bold, max 2 líneas | `AppTextStyles.bodyMedium` |
| Artista | Body Small (14px), Neutral 600, prefijo "@" | `AppTextStyles.bodySmall` |
| Badge categoría | CategoryBadge en top-right overlay | Integrado en `AppObraCard` |
| Likes | Body Small, icono ❤️ 14px | `likes` prop |
| Fondo card | Surface (#FEF7FF) | `AppColors.surface` |
| Sombra | shadow-sm | `AppShadows.small` |
| Border radius | 12px | `AppBorderRadius.radiusLg` |
| Gap entre cards | 12px | `AppSpacing.space3` |

**Uso:**
```dart
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    crossAxisSpacing: AppSpacing.space3,
    mainAxisSpacing: AppSpacing.space3,
  ),
  itemBuilder: (context, index) => AppObraCard.grid(
    imageUrl: obras[index].imageUrl,
    titulo: obras[index].titulo,
    artista: obras[index].artista,
    categoria: obras[index].categoria,
    likes: obras[index].likes,
    onTap: () => _navigateToDetail(obras[index]),
  ),
)
```

### Grid Layout
| Elemento | Especificación |
|----------|----------------|
| Columnas | 2 |
| Gap horizontal | 12px |
| Gap vertical | 16px |
| Padding lateral | 16px |
| Scroll | Vertical infinito |

### Bottom Navigation
(Igual que MapaPage, con "Feed" como item activo)

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ App Bar                         │
├─────────────────────────────────┤
│ [Search Bar]                    │
├─────────────────────────────────┤
│ [Filter Chips]                  │
├─────────────────────────────────┤
│ ┌───────────┐ ┌───────────┐   │
│ │ ░░░░░░░░░ │ │ ░░░░░░░░░ │   │
│ │ ░ Skeleton░ │ │ ░ Skeleton░ │   │ ← Skeleton Cards
│ │ ░░░░░░░░░ │ │ ░░░░░░░░░ │   │
│ │ ━━━━━━━━━ │ │ ━━━━━━━━━ │   │
│ │ ━━━━━     │ │ ━━━━━     │   │
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │ ░░░░░░░░░ │ │ ░░░░░░░░░ │   │
│ └───────────┘ └───────────┘   │
└─────────────────────────────────┘
```

### Empty (Sin resultados de búsqueda)
```
┌─────────────────────────────────┐
│ [Search Bar: "xyz123"]          │
├─────────────────────────────────┤
│                                 │
│          🔍                     │
│    No encontramos obras         │
│    para "xyz123"                │
│                                 │
│    Intenta con otra búsqueda    │
│    o explora el mapa            │
│                                 │
│    [Explorar Mapa]              │
│                                 │
└─────────────────────────────────┘
```

### Empty (Sin obras con filtro aplicado)
```
┌─────────────────────────────────┐
│ [Filter: Performance]           │
├─────────────────────────────────┤
│                                 │
│          🎭                     │
│    No hay obras de              │
│    Performance todavía          │
│                                 │
│    [Quitar filtros]             │
│                                 │
└─────────────────────────────────┘
```

### Error
```
┌─────────────────────────────────┐
│          ⚠️                     │
│    Error al cargar obras        │
│                                 │
│    [Reintentar]                 │
└─────────────────────────────────┘
```

### Loading More (Scroll infinito)
```
│ ┌───────────┐ ┌───────────┐   │
│ │  [Card]   │ │  [Card]   │   │
│ └───────────┘ └───────────┘   │
│                                 │
│         ⟳ Cargando más...      │ ← Spinner al final
│                                 │
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en Obra Card | Navega a ObraDetailPage |
| Tap en nombre artista | Navega a ArtistaProfilePage |
| Tap en Search Bar | Activa teclado, muestra resultados en tiempo real |
| Tap en Filter Chip | Toggle filtro, actualiza grid |
| Tap en icono filtros | Abre Modal de Filtros (avanzado) |
| Scroll down | Carga más obras (infinite scroll) |
| Pull to refresh | Recarga feed desde inicio |
| Long press en Card | (Opcional) Quick actions: Ver detalles, Ver en mapa |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Search Bar:** 48px + 16px padding vertical = 80px
- **Filter Chips:** 48px (32px chips + padding)
- **Grid área:** Resto del espacio
- **Bottom Nav:** 56px + safe area

### Espaciado
- **Padding horizontal:** 16px
- **Gap entre secciones:** 8px
- **Gap entre cards:** 12px horizontal, 16px vertical

### Cards específicos
- **Imagen aspect ratio:** 4:3 (landscape) o 1:1 (square)
- **Card height:** ~200px aproximado (depende de contenido)
- **Esquinas:** 12px radius

---

## 🔗 Navegación

### Llega desde:
- Bottom Navigation desde cualquier pantalla
- Back desde ObraDetailPage
- Back desde ArtistaProfilePage

### Navega hacia:
- **ObraDetailPage:** Tap en cualquier card
- **ArtistaProfilePage:** Tap en nombre de artista
- **FiltrosModal:** Tap en icono de filtros
- **MapaPage:** Bottom Nav "Mapa"
- **TopNPage:** Bottom Nav "Top N" (rutas favoritas)
- **PerfilPage:** Bottom Nav "Perfil"

---

## 💡 Notas de Diseño

1. **Imágenes de alta calidad:** Las fotos son el foco principal
2. **Lazy loading:** Cargar imágenes progresivamente
3. **Mantener scroll position:** Al volver del detalle, no resetear
4. **Búsqueda en tiempo real:** Resultados mientras se escribe
5. **Filtros combinables:** Categoría + artista + búsqueda
6. **Badge de filtros activos:** Indicador visual claro

---

## ✅ Checklist de Diseño

- [ ] App Bar con título, búsqueda y filtros
- [ ] Search Bar expandible/contraíble
- [ ] Filter Chips horizontales (scroll)
- [ ] Grid 2 columnas
- [ ] Obra Card completo (imagen, título, artista, badge, likes)
- [ ] Bottom Navigation
- [ ] Estado Loading (Skeleton cards)
- [ ] Estado Empty (búsqueda sin resultados)
- [ ] Estado Empty (filtro sin resultados)
- [ ] Estado Error
- [ ] Loading more (spinner al final)
- [ ] Pull to refresh indicator

---

*Relacionado con:* `ux-flows.md` > Flow 4: Explorar por Artista
