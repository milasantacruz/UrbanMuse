# 🔍 FiltrosModal

## 📋 Descripción
Modal de filtros avanzados que permite filtrar obras por categoría y artista. Se utiliza desde el mapa y el feed para refinar la búsqueda de obras.

**Persona principal:** María (Exploradora Urbana), Diego (Artista Local)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│         ━━━━━━━━━━             │ ← Handle
├─────────────────────────────────┤
│                                 │
│ 🔍 Filtros                      │
│                                 │
│ ┌─────────────────────────────┐│
││ [Categoría]  |  [Artista]    ││ ← Tabs
│└─────────────────────────────┘│
├─────────────────────────────────┤
│                                 │
│ Tab: Categoría                  │
│                                 │
│ ☑️ Todos                        │
│                                 │
│ ☑️ 🔴 Graffiti                  │
│ ☑️ 🔵 Mural                     │ ← Checkboxes con colores
│ ☑️ 🟠 Escultura                 │
│ ☑️ 🟣 Performance               │
│                                 │
├─────────────────────────────────┤
│                                 │
│ [Limpiar filtros]    [Aplicar] │ ← Action buttons
│                                 │
└─────────────────────────────────┘
```

### Tab: Artista
```
┌─────────────────────────────────┐
│         ━━━━━━━━━━             │
├─────────────────────────────────┤
│ 🔍 Filtros                      │
│                                 │
│ ┌─────────────────────────────┐│
││ [Categoría]  |  [Artista]    ││
││               ─────────       ││ ← Tab activo
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ 🔍 Buscar artista...         ││ ← Search input
│└─────────────────────────────┘│
│                                 │
│ ☑️ Todos los artistas          │
│                                 │
│ ☑️ [Avatar] @Banksy            │
│ ☑️ [Avatar] @JR                │ ← Lista de artistas
│ ☐ [Avatar] @Invader            │
│ ☐ [Avatar] @Blu               │
│ ☑️ [Avatar] @Jaz               │
│         ↓ Scroll               │
├─────────────────────────────────┤
│ [Limpiar filtros]    [Aplicar] │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### Modal Container
**Widget Implementado:** `AppFilterModal` ✅  
**Ubicación:** `lib/presentation/widgets/modals/app_filter_modal.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tipo | Bottom Sheet | `showModalBottomSheet` con `AppFilterModal` |
| Handle | 4x40px, Neutral 300 | Integrado en `AppFilterModal` |
| Border radius | 16px top | `BorderRadius.vertical(top: Radius.circular(16))` |
| Max height | 80% de pantalla | `maxHeight: MediaQuery.of(context).size.height * 0.8` |
| Padding | 16px | `AppSpacing.space4` |
| Fondo | Surface | `AppColors.surface` |
| Sombra | shadow-xl | `AppShadows.xlarge` |

### Header
**Widget:** Integrado en `AppFilterModal` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Icono | 🔍 24px | `AppIcon` con `AppIconSize.medium` |
| Título | "Filtros" - Headline Small | `AppTextStyles.h3` |
| Close (opcional) | ✕ top-right | `IconButton` con `Icons.close` |

### Tabs
**Widget:** `TabBar` de Material 3 ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Items | "Categoría", "Artista" | `TabBar(tabs: [Tab(text: "Categoría"), Tab(text: "Artista")])` |
| Estilo | Underline tabs | `TabBar` default style |
| Tab activo | Primary, underline 2px | `indicatorColor: AppColors.primary` |
| Tab inactivo | Neutral 600 | `labelColor: AppColors.neutral600` |
| Altura | 48px | `TabBar` default height |

### Tab Categoría
**Widget Implementado:** `AppCategoryFilterChipGroup` integrado en `AppFilterModal` ✅

#### Checkbox "Todos"
**Widget:** `Checkbox` con `ListTile` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Texto | "Todos" | `ListTile(title: Text("Todos"))` |
| Comportamiento | Selecciona/deselecciona todas | `onTap` callback que toggle todos |
| Estilo | Bold cuando activo | `fontWeight: FontWeight.bold` cuando `selected` |

#### Checkbox de Categoría
**Widget:** `ListTile` con `Checkbox` y `CategoryBadge` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row: checkbox + color dot + texto | `ListTile` con `leading: Checkbox(...)` |
| Checkbox | 24px, Primary cuando checked | `Checkbox(value: selected, activeColor: AppColors.primary)` |
| Color dot | 12px, color de categoría | `CategoryBadge.dot` o `Container` con color |
| Texto | Body Medium, nombre de categoría | `AppTextStyles.bodyMedium` |
| Padding vertical | 12px | `AppSpacing.space3` |
| Divider | Línea sutil entre items (opcional) | `AppDivider` entre items |

### Tab Artista
**Widget:** Integrado en `AppFilterModal` con `TabBarView` ✅

#### Search Input
**Widget Implementado:** `AppSearchBar` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Placeholder | "Buscar artista..." | `AppSearchBar(placeholder: "Buscar artista...")` |
| Icono | 🔍 20px, izquierda | Integrado en `AppSearchBar` |
| Border | Outline Variant | `AppColors.outlineVariant` |
| Altura | 44px o 56px | `AppSearchBar` standard |
| Comportamiento | Filtra lista mientras escribe | `onChanged` callback |

#### Checkbox "Todos los artistas"
**Widget:** `Checkbox` con `ListTile` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Texto | "Todos los artistas" | `ListTile(title: Text("Todos los artistas"))` |
| Comportamiento | Selecciona/deselecciona todos | `onTap` callback que toggle todos |

#### Lista de Artistas
**Widget:** `ListTile` con `Checkbox`, `AppAvatar` y `AppTextStyles` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row: checkbox + avatar + handle | `ListTile` con `leading: Checkbox(...)`, `title: Row([Avatar, Text])` |
| Checkbox | 24px, Primary cuando checked | `Checkbox(value: selected, activeColor: AppColors.primary)` |
| Avatar | 32x32px, circular | `AppAvatar.small(imageUrl: artista.avatarUrl)` |
| Handle | @nombre, Body Medium | `AppTextStyles.bodyMedium` con prefijo "@" |
| Scroll | Vertical si hay muchos | `ListView` o `SingleChildScrollView` |

### Footer Actions
**Widgets Implementados:** `AppButton.text`, `AppButton.primary` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row, space-between | `Row(mainAxisAlignment: MainAxisAlignment.spaceBetween)` |
| "Limpiar filtros" | Text button, Neutral 600 | `AppButton.text(label: "Limpiar filtros")` con `AppColors.neutral600` |
| "Aplicar" | Filled button, Primary | `AppButton.primary(label: "Aplicar")` |
| Padding | 16px | `AppSpacing.space4` |
| Border top | 1px Outline Variant | `Border(top: BorderSide(color: AppColors.outlineVariant))` |

---

## 🔄 Estados

### Sin filtros aplicados (Default)
- Todos los checkboxes marcados
- Botón "Aplicar" activo
- "Limpiar" deshabilitado o hidden

### Con filtros aplicados
```
┌─────────────────────────────────┐
│ ☐ Todos                         │
│                                 │
│ ☑️ 🔴 Graffiti                  │ ← Solo algunos seleccionados
│ ☑️ 🔵 Mural                     │
│ ☐ 🟠 Escultura                  │
│ ☐ 🟣 Performance                │
├─────────────────────────────────┤
│ [Limpiar filtros]    [Aplicar] │
│                                 │ ← "Limpiar" ahora activo
└─────────────────────────────────┘
```

### Búsqueda sin resultados (Tab Artista)
```
┌─────────────────────────────────┐
│ ┌─────────────────────────────┐│
││ 🔍 xyz123                     ││
│└─────────────────────────────┘│
│                                 │
│          🔍                     │
│    No encontramos artistas      │
│    con ese nombre               │
│                                 │
│    [Limpiar búsqueda]           │
│                                 │
└─────────────────────────────────┘
```

### Loading (Artistas)
```
┌─────────────────────────────────┐
│ ┌─────────────────────────────┐│
││ 🔍 Buscar artista...         ││
│└─────────────────────────────┘│
│                                 │
│         ⟳                       │
│    Cargando artistas...         │
│                                 │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Swipe down en handle | Cierra modal (sin aplicar) |
| Tap fuera del modal | Cierra modal (sin aplicar) |
| Tap en tab | Cambia entre Categoría y Artista |
| Tap en checkbox | Toggle selección |
| Tap en "Todos" | Selecciona/deselecciona todos |
| Escribir en búsqueda | Filtra lista de artistas |
| Tap en "Limpiar filtros" | Reset a estado default |
| Tap en "Aplicar" | Aplica filtros y cierra |

---

## 📐 Especificaciones Técnicas

### Layout
- **Width:** 100% de pantalla
- **Max height:** 80% de pantalla
- **Border radius:** 16px top-left, top-right

### Tabs
- **Altura:** 48px
- **Padding horizontal:** 16px por tab

### Lista items
- **Altura item:** 48px
- **Padding vertical:** 12px

### Animaciones
- **Entrada:** Slide up, 300ms
- **Salida:** Slide down, 200ms
- **Tab switch:** Fade, 150ms

---

## 🔗 Navegación

### Se abre desde:
- MapaPage (tap en icono filtros o badge de filtros)
- FeedPage (tap en icono filtros en App Bar)

### Al cerrar:
- Vuelve a la pantalla anterior
- Si se aplicaron filtros, actualiza la vista (mapa/feed)

---

## 💡 Notas de Diseño

1. **Respuesta inmediata:** Preview de resultados mientras selecciona (opcional)
2. **Badge de filtros activos:** En el botón que abre el modal
3. **Persistencia:** Recordar últimos filtros aplicados
4. **Reseteable:** Siempre poder volver al estado "todos"
5. **Combinable:** Categoría + Artista funcionan juntos

---

## 🎯 Lógica de Filtrado

### Categoría
- Si "Todos" está marcado → mostrar todas las categorías
- Si se desmarca una categoría → "Todos" se desmarca
- Si se marcan todas las individuales → "Todos" se marca

### Artista
- Si "Todos los artistas" está marcado → no filtrar por artista
- Si se seleccionan artistas específicos → mostrar solo obras de esos artistas

### Combinación
- Los filtros se aplican con AND:
  - Categoría: Graffiti, Mural
  - Artista: Banksy
  - Resultado: Obras que sean (Graffiti O Mural) Y (de Banksy)

---

## ✅ Checklist de Diseño

- [ ] Bottom Sheet container
- [ ] Handle de arrastre
- [ ] Header con título
- [ ] Tabs (Categoría | Artista)
- [ ] Tab Categoría:
  - [ ] Checkbox "Todos"
  - [ ] Checkbox por categoría con color dot
- [ ] Tab Artista:
  - [ ] Search input
  - [ ] Checkbox "Todos los artistas"
  - [ ] Lista de artistas con avatar
- [ ] Botón "Limpiar filtros"
- [ ] Botón "Aplicar"
- [ ] Estado búsqueda sin resultados
- [ ] Estado loading artistas

---

*Relacionado con:* `ux-flows.md` > Task Flow 1: Filtrar Obras en el Mapa
