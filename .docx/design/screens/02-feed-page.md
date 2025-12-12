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
| Elemento | Especificación |
|----------|----------------|
| Título | "Feed" - Headline Small |
| Icono búsqueda | 24px, abre SearchBar expandida |
| Icono filtros | 24px, abre Modal de Filtros |
| Badge en filtros | Dot indicator si hay filtros activos |
| Altura | 56px |

### Search Bar
| Elemento | Especificación |
|----------|----------------|
| Placeholder | "Buscar obra, artista, barrio..." |
| Icono izquierdo | 🔍 20px |
| Clear button | X cuando hay texto |
| Border | 1px Outline Variant (#CAC4D0) |
| Border radius | 28px (pill shape) |
| Altura | 48px |
| Focus state | Border Primary (#6BA034) |

### Filter Chips
| Elemento | Especificación |
|----------|----------------|
| Layout | Horizontal scroll |
| Primer chip | "Todos" - siempre presente |
| Otros chips | Por categoría |
| Estilo seleccionado | Filled con color de categoría |
| Estilo no seleccionado | Outlined |
| Altura | 32px |

### Obra Card (Grid Item)
| Elemento | Especificación |
|----------|----------------|
| Ancho | 50% - 8px (gap) |
| Imagen | Aspect ratio 4:3 (o 1:1), radius 12px top |
| Padding contenido | 12px |
| Título | Body Medium (16px), Bold, max 2 líneas |
| Artista | Body Small (14px), Neutral 600, prefijo "@" |
| Badge categoría | Chip pequeño con color de categoría |
| Likes | Body Small, icono ❤️ 14px |
| Fondo card | Surface (#FEF7FF) |
| Sombra | shadow-sm |
| Border radius | 12px |
| Gap entre cards | 12px |

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
| Long press en Card | (Opcional) Quick actions: Agregar a Top 10 |

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
- **Top10Page:** Bottom Nav "Top 10"
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
