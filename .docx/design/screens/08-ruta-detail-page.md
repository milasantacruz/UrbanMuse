# 🗺️ RutaDetailPage

## 📋 Descripción
Vista detallada de una ruta guardada. Muestra el mapa con el recorrido completo, lista de obras en orden, información de la ruta (distancia, tiempo), y acciones como iniciar recorrido o crear salida grupal.

**Persona principal:** Carlos (Turista Cultural), Ana (Organizadora)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ "Murales de Palermo"    ⋮   │ ← App Bar con título de ruta
├─────────────────────────────────┤
│                                 │
│         [MAPA GRANDE]           │
│                                 │
│     📍A ─1─ 2 ─ 3 ─ 4 ─ 📍B    │ ← Ruta con pins numerados
│              5                  │
│                                 │
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ 📊 Resumen                    ││
││                               ││
││ 📏 2.3 km  ⏱️ ~45 min a pie  ││
││ 🎨 5 obras                    ││ ← Stats card
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ 📍 Recorrido                    │
│                                 │
│ ● Inicio: Av. Corrientes 1234   │
│ │                               │
│ 1 ┌─────────────────────────┐   │
│ │ │[IMG] "Colores Ciudad"   │   │
│ │ │      @Artista • Mural   │   │
│ │ └─────────────────────────┘   │
│ │                               │ ← Timeline de obras
│ 2 ┌─────────────────────────┐   │
│ │ │[IMG] "Street Dreams"    │   │
│ │ │      @Artista • Graffiti│   │
│ │ └─────────────────────────┘   │
│ │                               │
│ 3 ┌─────────────────────────┐   │
│   │[IMG] "Naturaleza Urbana"│   │
│   └─────────────────────────┘   │
│ │                               │
│ ● Fin: Plaza Italia             │
│         ↓ Scroll               │
├─────────────────────────────────┤
│ [🚶 Iniciar]  [👥 Crear Salida]│ ← Action buttons
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
| Elemento | Especificación |
|----------|----------------|
| Back button | ◀ 24px |
| Título | Nombre de la ruta - Body Large, ellipsis |
| More menu | ⋮ (Editar, Eliminar, Compartir) |
| Estilo | Surface o transparente sobre mapa |

### Mapa de Ruta
| Elemento | Especificación |
|----------|----------------|
| Altura | 40% de la pantalla (~320px) |
| Contenido | Ruta completa visible, pins numerados |
| Interacción | Tap en pin abre preview de obra |
| Zoom controls | Opcional, +/- buttons |

### Línea de Ruta (en mapa)
| Elemento | Especificación |
|----------|----------------|
| Color | Primary (#6BA034) |
| Ancho | 4px |
| Estilo | Sólido o dotted |

### Pins Numerados
| Elemento | Especificación |
|----------|----------------|
| Tamaño | 32x32px |
| Fondo | Primary |
| Número | Bold, blanco, centrado |
| Borde | 2px blanco |

### Pin Inicio/Fin
| Elemento | Especificación |
|----------|----------------|
| Inicio (A) | Pin Primary con "A" o flag |
| Fin (B) | Pin Secondary con "B" o checkered flag |

### Stats Card
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, 3 items |
| Fondo | Surface 2 |
| Border radius | 12px |
| Padding | 16px |
| Icons | 📏 📱 🎨 - 20px |
| Values | Body Medium, Bold |
| Labels | Caption, Neutral 600 |

### Timeline Section
| Elemento | Especificación |
|----------|----------------|
| Título | "📍 Recorrido" - Body Large, Bold |
| Layout | Vertical timeline |

### Timeline Item
```
┌─────────────────────────────────┐
│ 1 ┌──────┐  "Título Obra"       │
│ │ │[IMG] │  @artista • [Badge]  │
│ │ └──────┘                      │
│ │                               │
└─────────────────────────────────┘
```
| Elemento | Especificación |
|----------|----------------|
| Número | Circle badge, 24px, Primary |
| Línea | 2px, Neutral 300, vertical |
| Thumbnail | 60x60px, radius 8px |
| Título | Body Medium, Bold, max 1 línea |
| Subtítulo | Body Small, @artista + Badge |
| Tap action | Navega a ObraDetailPage |

### Punto Inicio/Fin (Timeline)
| Elemento | Especificación |
|----------|----------------|
| Icono | ● círculo, 12px |
| Color | Primary (inicio), Secondary (fin) |
| Label | "Inicio: [dirección]" / "Fin: [dirección]" |
| Texto | Body Small, Neutral 600 |

### Action Buttons (Footer)
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, 2 botones |
| "Iniciar" | Filled Primary, icono 🚶 |
| "Crear Salida" | Outlined Primary, icono 👥 |
| Altura | 48px cada uno |
| Posición | Fixed bottom o scroll |
| Padding | 16px |

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ ◀                               │
├─────────────────────────────────┤
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │ ← Skeleton mapa
│ ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░ │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ ━━━━━  ━━━━━  ━━━━━         ││ ← Skeleton stats
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ ━━━━━━━━━━                     │
│ ○ ┌───────┐ ━━━━━━━━━         │
│ │ │░░░░░░░│ ━━━━━             │ ← Skeleton timeline
│ │ └───────┘                   │
│ ○ ┌───────┐ ━━━━━━━━━         │
│   │░░░░░░░│ ━━━━━             │
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
│    la ruta                      │
│                                 │
│    [Reintentar]                 │
│                                 │
└─────────────────────────────────┘
```

### Iniciando Recorrido (feedback)
```
┌─────────────────────────────────┐
│  🚶 Iniciando navegación...     │
│     Abriendo mapas              │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en Back | Vuelve a RutaListPage |
| Tap en ⋮ | Abre menú (Editar, Eliminar, Compartir) |
| Tap en pin del mapa | Muestra preview de obra |
| Tap en obra del timeline | Navega a ObraDetailPage |
| Tap en "Iniciar" | Abre navegación externa (Google Maps) |
| Tap en "Crear Salida" | Navega a CreateSalidaPage |
| Pinch en mapa | Zoom in/out |
| Scroll | Navega por timeline |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Mapa:** ~280-320px (40%)
- **Stats card:** ~80px
- **Timeline:** Scroll, resto del espacio
- **Footer:** 80px

### Espaciado
- **Padding horizontal:** 16px
- **Gap entre secciones:** 16px
- **Gap en timeline:** 12px entre items

---

## 🔗 Navegación

### Llega desde:
- RutaListPage (tap en card o "Ver")
- Después de crear ruta (desde CreateRutaPage)
- MapaPage (si hay ruta activa)

### Navega hacia:
- **ObraDetailPage:** Tap en obra del timeline
- **CreateSalidaPage:** Tap en "Crear Salida"
- **Google Maps:** Tap en "Iniciar" (externa)
- **CreateRutaPage:** "Editar" desde menú

---

## ✅ Checklist de Diseño

- [ ] App Bar con título de ruta y menú
- [ ] Mapa grande con ruta trazada
- [ ] Pins numerados en mapa
- [ ] Pins de inicio (A) y fin (B)
- [ ] Stats card (distancia, tiempo, obras)
- [ ] Sección "Recorrido" con timeline
- [ ] Timeline items con obras
- [ ] Puntos de inicio y fin en timeline
- [ ] Botón "Iniciar"
- [ ] Botón "Crear Salida"
- [ ] Estado Loading (skeleton)
- [ ] Estado Error
- [ ] Menú contextual (Editar, Eliminar, Compartir)

---

*Relacionado con:* `ux-flows.md` > Flow 3: Convertir Ruta en Salida Grupal (pasos 3-4)
