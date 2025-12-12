# 🎨 ObraDetailPage

## 📋 Descripción
Pantalla de detalle completo de una obra de arte urbano. Muestra toda la información disponible: foto grande, descripción, artista, ubicación, y acciones principales como agregar a Top 10 o ver en mapa.

**Persona principal:** María (Exploradora Urbana), Carlos (Turista Cultural)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀        Obra         ❤️  ⋮   │ ← App Bar con back y acciones
├─────────────────────────────────┤
│                                 │
│                                 │
│        [ IMAGEN HERO ]          │
│        Full width               │
│        Aspect 16:9              │
│                                 │
│                                 │
├─────────────────────────────────┤
│                                 │
│ [Badge: Mural]    ❤️ 142 likes │
│                                 │
│ "Colores de la Ciudad"          │ ← Título H1
│                                 │
│ Por @NombreArtista →            │ ← Link a perfil
│                                 │
│ ─────────────────────────────── │
│                                 │
│ 📍 Ubicación                    │
│ Av. Corrientes 1234, Palermo    │
│ Buenos Aires, Argentina         │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ 📝 Descripción                  │
│ Este mural fue creado en 2023   │
│ durante el festival de arte     │
│ urbano de Buenos Aires...       │
│ [Ver más]                       │
│                                 │
│ ─────────────────────────────── │
│                                 │
│ 📅 Fecha                        │
│ Marzo 2023                      │
│                                 │
├─────────────────────────────────┤
│ [⭐ Agregar a Top 10]  [🗺️ Ver]│ ← Action buttons
│                         en Mapa │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
| Elemento | Especificación |
|----------|----------------|
| Back button | ◀ o ← 24px |
| Título | "Obra" - centrado (opcional, puede ser transparente) |
| Like button | ❤️ 24px, toggle filled/outline |
| More menu | ⋮ 24px (compartir, reportar) |
| Estilo | Transparente sobre imagen, o sólido |

### Imagen Hero
| Elemento | Especificación |
|----------|----------------|
| Ancho | 100% (full width) |
| Aspect ratio | 16:9 o 4:3 |
| Altura | ~210px (16:9) o ~280px (4:3) |
| Tap action | Abre imagen en fullscreen/gallery |
| Gradiente | Overlay degradado bottom para legibilidad |

### Badge de Categoría
| Elemento | Especificación |
|----------|----------------|
| Posición | Debajo de imagen, izquierda |
| Estilo | Chip filled con color de categoría |
| Altura | 28px |
| Icono | 16px del tipo de categoría |

### Contador de Likes
| Elemento | Especificación |
|----------|----------------|
| Posición | Debajo de imagen, derecha |
| Icono | ❤️ 20px, Primary o Neutral |
| Texto | Body Small, ej: "142 likes" |

### Título de Obra
| Elemento | Especificación |
|----------|----------------|
| Estilo | Headline Large (H1), 28px |
| Weight | Bold (700) |
| Color | OnSurface (#1D1617) |
| Max líneas | 3 |

### Link a Artista
| Elemento | Especificación |
|----------|----------------|
| Texto | "Por @NombreArtista" |
| Estilo | Body Medium, Primary (#6BA034) |
| Icono derecha | → o chevron 16px |
| Tap area | Todo el row |

### Sección de Información
| Elemento | Especificación |
|----------|----------------|
| Título sección | Body Small, Neutral 600, uppercase o icono |
| Contenido | Body Medium, OnSurface |
| Separador | Divider 1px, Outline Variant |
| Padding | 16px vertical entre secciones |

### Sección Ubicación
| Elemento | Especificación |
|----------|----------------|
| Icono | 📍 20px |
| Dirección | Body Medium |
| Ciudad/País | Body Small, Neutral 600 |
| Tap action | (Opcional) Abre en Maps externo |

### Sección Descripción
| Elemento | Especificación |
|----------|----------------|
| Icono | 📝 20px |
| Texto | Body Medium, max 4 líneas colapsado |
| "Ver más" | Text button, Primary |
| Expandido | Sin límite de líneas |

### Sección Fecha
| Elemento | Especificación |
|----------|----------------|
| Icono | 📅 20px |
| Formato | "Marzo 2023" o "15 de marzo, 2023" |

### Action Buttons (Footer)
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, 2 botones 50% cada uno |
| Botón 1 | "Agregar a Top 10" - Filled, Primary |
| Botón 2 | "Ver en Mapa" - Outlined, Primary |
| Altura | 48px cada botón |
| Icono | 20px a la izquierda del texto |
| Posición | Fixed bottom o en scroll |
| Padding | 16px todos lados |
| Fondo | Surface con shadow-lg si fixed |

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ ◀                               │
├─────────────────────────────────┤
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │ ← Skeleton imagen
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
├─────────────────────────────────┤
│ [━━━━]              ━━━━━━━    │
│                                 │
│ ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ │ ← Skeleton texto
│ ━━━━━━━━━━━━━━━━━             │
│                                 │
│ ━━━━━━━━━━━━━━━━               │
│ ━━━━━━━━━━━━━━━━━━━━━━        │
└─────────────────────────────────┘
```

### Ya en Top 10
```
│ [✓ En tu Top 10]    [🗺️ Ver] │ ← Botón cambia a estado activo
│                       en Mapa │
```
- Botón cambia a outlined con check
- Texto: "En tu Top 10"
- Color: Primary
- Tap: Muestra opción de quitar

### Error al cargar
```
┌─────────────────────────────────┐
│ ◀                               │
├─────────────────────────────────┤
│                                 │
│          ⚠️                     │
│    No se pudo cargar           │
│    la obra                      │
│                                 │
│    [Reintentar]                 │
│                                 │
└─────────────────────────────────┘
```

### Imagen no disponible
```
┌─────────────────────────────────┐
│         [Placeholder]           │
│        🖼️ Sin imagen           │
│        disponible               │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en Back | Vuelve a pantalla anterior |
| Tap en ❤️ (header) | Toggle like, actualiza contador |
| Tap en imagen | Abre imagen fullscreen |
| Tap en nombre artista | Navega a ArtistaProfilePage |
| Tap en "Ver más" (descripción) | Expande texto completo |
| Tap en ubicación | (Opcional) Abre en Google Maps |
| Tap en "Agregar a Top 10" | Agrega y muestra feedback |
| Tap en "Ver en Mapa" | Navega a MapaPage centrado en esta obra |
| Tap en ⋮ (more) | Abre menú: Compartir, Reportar |
| Swipe horizontal en imagen | (Si hay galería) Cambia foto |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px (puede ser overlay)
- **Imagen Hero:** 210-280px según ratio
- **Contenido:** Scroll vertical
- **Footer buttons:** 80px (48px botones + 32px padding)

### Espaciado
- **Padding horizontal:** 16px
- **Padding entre secciones:** 16px
- **Gap en action buttons:** 12px

### Colores específicos
- **Badge categoría:** Color de categoría correspondiente
- **Links:** Primary (#6BA034)
- **Dividers:** Outline Variant (#CAC4D0)

---

## 🔗 Navegación

### Llega desde:
- MapaPage (tap en "Ver más" del Bottom Sheet)
- FeedPage (tap en Obra Card)
- ArtistaProfilePage (tap en obra del grid)
- Top10Page (tap en item)
- RutaDetailPage (tap en obra de la ruta)

### Navega hacia:
- **ArtistaProfilePage:** Tap en nombre del artista
- **MapaPage:** Tap en "Ver en Mapa" (centrado en obra)
- **Top10Page:** Después de agregar (opcional, con toast)
- **ImageGalleryModal:** Tap en imagen
- **ShareSheet:** Tap en compartir

---

## 💡 Notas de Diseño

1. **Imagen como protagonista:** Maximizar tamaño y calidad
2. **Información progresiva:** Lo más importante arriba
3. **CTAs siempre visibles:** Footer fixed o prominente
4. **Feedback inmediato:** Al agregar a Top 10
5. **Transición al mapa:** Animación de pin destacándose
6. **Galería de fotos:** Si hay múltiples, dots indicator

---

## ✅ Checklist de Diseño

- [ ] App Bar con back, like y more menu
- [ ] Imagen Hero full width
- [ ] Badge de categoría
- [ ] Contador de likes
- [ ] Título de obra
- [ ] Link a artista (tappable)
- [ ] Sección ubicación
- [ ] Sección descripción (expandible)
- [ ] Sección fecha
- [ ] Botón "Agregar a Top 10"
- [ ] Botón "Ver en Mapa"
- [ ] Estado Loading (skeleton)
- [ ] Estado "Ya en Top 10"
- [ ] Estado Error
- [ ] Imagen fullscreen (modal)
- [ ] Menú compartir/reportar

---

*Relacionado con:* `ux-flows.md` > Flow 1: Descubrir Obra (pasos 5-8)
