# 👤 ArtistaProfilePage

## 📋 Descripción
Perfil público de un artista de arte urbano. Muestra su información, biografía, enlaces a redes sociales, y un grid/lista de todas sus obras registradas en la app.

**Persona principal:** Diego (Artista Local), Carlos (Turista Cultural)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀      Artista        ↗️  ⋮   │ ← App Bar
├─────────────────────────────────┤
│                                 │
│         ┌─────────┐            │
│         │         │            │
│         │ [AVATAR]│            │ ← Avatar circular
│         │  120px  │            │
│         └─────────┘            │
│                                 │
│      "Nombre del Artista"       │ ← Nombre H2
│         @instagram_handle       │ ← Handle/username
│                                 │
│  ┌───────────────────────────┐ │
│  │ Artista urbano argentino  │ │
│  │ especializado en murales  │ │ ← Bio
│  │ de gran formato...        │ │
│  └───────────────────────────┘ │
│                                 │
│  [📸 Instagram]  [🌐 Web]      │ ← Social links
│                                 │
├─────────────────────────────────┤
│  📊 Estadísticas               │
│  ┌─────────┬─────────┬───────┐ │
│  │ 24      │ 1.2K    │ 8     │ │
│  │ Obras   │ Likes   │ Rutas │ │ ← Stats row
│  └─────────┴─────────┴───────┘ │
├─────────────────────────────────┤
│  🎨 Obras (24)                  │
│                                 │
│ ┌───────────┐ ┌───────────┐   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │ ← Grid de obras
│ │           │ │           │   │
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │           │ │           │   │
│ └───────────┘ └───────────┘   │
│         ↓ Scroll               │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
| Elemento | Especificación |
|----------|----------------|
| Back button | ◀ 24px |
| Título | "Artista" - centrado |
| Share button | ↗️ 24px (compartir perfil) |
| More menu | ⋮ 24px (reportar) |
| Fondo | Surface o transparente |

### Header del Artista
| Elemento | Especificación |
|----------|----------------|
| Layout | Column, centrado |
| Padding | 24px top, 16px sides |
| Background | Surface o gradiente sutil |

### Avatar
| Elemento | Especificación |
|----------|----------------|
| Tamaño | 120x120px |
| Forma | Circular (border-radius: full) |
| Borde | 4px, Primary (#6BA034) |
| Fallback | Iniciales del nombre o icono genérico |
| Tap action | (Opcional) Ver foto grande |

### Nombre del Artista
| Elemento | Especificación |
|----------|----------------|
| Estilo | Headline Medium (H2), 24px |
| Weight | Bold (700) |
| Color | OnSurface (#1D1617) |
| Alignment | Center |
| Max líneas | 2 |

### Handle/Username
| Elemento | Especificación |
|----------|----------------|
| Estilo | Body Medium, Neutral 600 |
| Prefijo | "@" |
| Alignment | Center |
| Tap action | (Opcional) Copia al clipboard |

### Biografía
| Elemento | Especificación |
|----------|----------------|
| Estilo | Body Medium |
| Color | OnSurface Variant (#4A4F45) |
| Max líneas | 4 colapsado |
| Alignment | Center |
| "Ver más" | Text button si hay más texto |
| Padding | 16px horizontal |

### Social Links
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, centrado, gap 12px |
| Botones | Outlined, con icono + texto |
| Iconos | 20px (Instagram, Web, Twitter, etc.) |
| Altura | 36px |
| Tap action | Abre link externo |

### Stats Row
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, 3 columnas iguales |
| Separador | Divider vertical 1px |
| Número | Headline Small (20px), Bold |
| Label | Caption (12px), Neutral 600 |
| Alignment | Center en cada columna |
| Stats | Obras, Likes totales, Rutas |

### Sección Obras
| Elemento | Especificación |
|----------|----------------|
| Título | "Obras (24)" - Body Large, Bold |
| Icono | 🎨 20px |
| Padding | 16px |

### Grid de Obras
| Elemento | Especificación |
|----------|----------------|
| Columnas | 2 o 3 |
| Gap | 4px (estilo Instagram) o 12px |
| Aspect ratio | 1:1 (cuadrado) |
| Border radius | 0 (estilo Instagram) o 8px |
| Tap action | Navega a ObraDetailPage |

### Obra Thumbnail
| Elemento | Especificación |
|----------|----------------|
| Tamaño | (375-32-8)/2 = ~167px si 2 cols |
| Overlay | Badge de categoría (esquina) opcional |
| Loading | Placeholder gris o shimmer |

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ ◀      Artista                  │
├─────────────────────────────────┤
│         ┌─────────┐            │
│         │ ░░░░░░░ │            │ ← Skeleton avatar
│         │ ░░░░░░░ │            │
│         └─────────┘            │
│       ━━━━━━━━━━━━━            │
│         ━━━━━━━━               │ ← Skeleton text
│                                 │
│  ━━━━━━━━━━━━━━━━━━━━━━━━━━   │
│  ━━━━━━━━━━━━━━━━━━━━━        │
│                                 │
├─────────────────────────────────┤
│ ┌───────┐ ┌───────┐ ┌───────┐ │
│ │ ━━    │ │ ━━    │ │ ━━    │ │ ← Skeleton stats
│ │ ━━━   │ │ ━━━   │ │ ━━━   │ │
│ └───────┘ └───────┘ └───────┘ │
├─────────────────────────────────┤
│ ┌───────┐ ┌───────┐ ┌───────┐ │
│ │░░░░░░░│ │░░░░░░░│ │░░░░░░░│ │ ← Skeleton grid
│ │░░░░░░░│ │░░░░░░░│ │░░░░░░░│ │
│ └───────┘ └───────┘ └───────┘ │
└─────────────────────────────────┘
```

### Sin Obras
```
┌─────────────────────────────────┐
│  🎨 Obras (0)                   │
├─────────────────────────────────┤
│                                 │
│          🎨                     │
│    Este artista aún no         │
│    tiene obras registradas      │
│                                 │
│    ¡Pronto habrá más!          │
│                                 │
└─────────────────────────────────┘
```

### Error
```
┌─────────────────────────────────┐
│ ◀                               │
├─────────────────────────────────┤
│                                 │
│          ⚠️                     │
│    No se pudo cargar           │
│    el perfil                    │
│                                 │
│    [Reintentar]                 │
│                                 │
└─────────────────────────────────┘
```

### Artista no encontrado
```
┌─────────────────────────────────┐
│          👤                     │
│    Artista no encontrado        │
│                                 │
│    [Volver]                     │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en Back | Vuelve a pantalla anterior |
| Tap en Share | Abre share sheet con link al perfil |
| Tap en Avatar | (Opcional) Abre imagen grande |
| Tap en handle | (Opcional) Copia al clipboard |
| Tap en "Ver más" (bio) | Expande biografía completa |
| Tap en Instagram | Abre perfil de Instagram (externo) |
| Tap en Web | Abre website del artista (externo) |
| Tap en obra del grid | Navega a ObraDetailPage |
| Scroll down | Carga más obras si hay paginación |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Header (avatar + nombre + bio + links):** ~280px
- **Stats row:** 80px
- **Sección obras:** Título 48px + grid scroll

### Espaciado
- **Padding horizontal:** 16px
- **Padding vertical entre secciones:** 24px
- **Gap en social links:** 12px
- **Gap en grid:** 4px o 12px

### Grid específico
- **2 columnas:** ~167px cada imagen
- **3 columnas:** ~111px cada imagen (más compacto)

---

## 🔗 Navegación

### Llega desde:
- ObraDetailPage (tap en nombre del artista)
- FeedPage (tap en nombre del artista en card)
- MapaPage Bottom Sheet (tap en nombre del artista)
- Búsqueda (si busca artista directamente)

### Navega hacia:
- **ObraDetailPage:** Tap en cualquier obra del grid
- **Instagram:** Link externo
- **Website:** Link externo
- **ShareSheet:** Tap en compartir

---

## 💡 Notas de Diseño

1. **Avatar destacado:** El artista es el protagonista
2. **Bio concisa:** No saturar con texto, expandible
3. **Links visibles:** Redes sociales accesibles
4. **Grid visual:** Las obras hablan por sí solas
5. **Stats como validación social:** Número de obras y likes
6. **Consistencia con Instagram:** Patrón familiar para usuarios

---

## ✅ Checklist de Diseño

- [ ] App Bar con back, share y more
- [ ] Avatar grande (120px) con borde
- [ ] Nombre del artista
- [ ] Handle (@username)
- [ ] Biografía (expandible)
- [ ] Social links (Instagram, Web)
- [ ] Stats row (Obras, Likes, Rutas)
- [ ] Sección título "Obras"
- [ ] Grid de obras (2 o 3 columnas)
- [ ] Estado Loading (skeleton)
- [ ] Estado Sin obras
- [ ] Estado Error
- [ ] Estado Artista no encontrado

---

*Relacionado con:* `ux-flows.md` > Flow 4: Explorar por Artista
