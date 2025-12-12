# 📋 RutaListPage

## 📋 Descripción
Lista de todas las rutas guardadas del usuario. Permite ver, editar y eliminar rutas, además de crear nuevas. Es el centro de gestión de rutas personales.

**Persona principal:** Ana (Organizadora de Salidas), Carlos (Turista Cultural)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ Mis Rutas           [+ Nueva]│ ← App Bar
├─────────────────────────────────┤
│                                 │
│ 🛣️ Tienes 3 rutas guardadas    │ ← Header info
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ ┌──────┐                      ││
││ │[MAPA]│  "Murales de Palermo"││
││ │mini  │  📍 A → B            ││ ← Ruta Card
││ └──────┘  🎨 5 obras • 2.3 km ││
││           ⏱️ ~45 min a pie    ││
││                               ││
││ [Ver] [Crear Salida] [⋮]     ││
│└─────────────────────────────┘│
│                                 │
│ ┌─────────────────────────────┐│
││ ┌──────┐                      ││
││ │[MAPA]│  "Arte en La Boca"   ││
││ │mini  │  📍 A → B            ││
││ └──────┘  🎨 8 obras • 3.1 km ││
││           ⏱️ ~20 min en bici  ││
││                               ││
││ [Ver] [Crear Salida] [⋮]     ││
│└─────────────────────────────┘│
│                                 │
│ ┌─────────────────────────────┐│
││ ┌──────┐                      ││
││ │[MAPA]│  "Graffitis Centro"  ││
││ │mini  │  📍 A → B            ││
││ └──────┘  🎨 6 obras • 1.8 km ││
││           ⏱️ ~30 min a pie    ││
│└─────────────────────────────┘│
│         ↓ Scroll               │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
| Elemento | Especificación |
|----------|----------------|
| Back button | ◀ 24px |
| Título | "Mis Rutas" - Headline Small |
| Nueva ruta | "+ Nueva" - Text button o icon |
| Altura | 56px |

### Header Info
| Elemento | Especificación |
|----------|----------------|
| Icono | 🛣️ 24px |
| Texto | "Tienes X rutas guardadas" - Body Medium |
| Padding | 16px |
| Fondo | Surface 2 |

### Ruta Card
| Elemento | Especificación |
|----------|----------------|
| Layout | Row (mapa mini + info) o Column |
| Fondo | Surface |
| Border radius | 12px |
| Padding | 16px |
| Sombra | shadow-sm |
| Margin bottom | 12px |

### Mapa Mini (Thumbnail)
| Elemento | Especificación |
|----------|----------------|
| Tamaño | 80x80px |
| Border radius | 8px |
| Contenido | Preview de la ruta (estático) |
| Fallback | Placeholder con icono 🗺️ |

### Info de Ruta
| Elemento | Especificación |
|----------|----------------|
| Título | Body Large, Bold, max 2 líneas |
| Puntos | "📍 A → B" - Body Small, Neutral 600 |
| Stats row 1 | "🎨 X obras • X km" - Body Small |
| Stats row 2 | "⏱️ ~X min [transporte]" - Body Small, Neutral 600 |

### Action Buttons (en card)
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, gap 8px |
| "Ver" | Text button, Primary |
| "Crear Salida" | Outlined button, Primary |
| More menu | ⋮ (Editar, Eliminar, Compartir) |

---

## 🔄 Estados

### Estado Vacío
```
┌─────────────────────────────────┐
│ ◀ Mis Rutas           [+ Nueva]│
├─────────────────────────────────┤
│                                 │
│                                 │
│          🛣️                     │
│                                 │
│    No tienes rutas guardadas    │
│                                 │
│    Crea tu primera ruta para    │
│    explorar arte urbano         │
│                                 │
│    [+ Crear mi primera ruta]    │
│                                 │
│                                 │
└─────────────────────────────────┘
```

### Loading
```
┌─────────────────────────────────┐
│ ┌─────────────────────────────┐│
││ ┌──────┐ ━━━━━━━━━━━━━━━━━━ ││
││ │░░░░░░│ ━━━━━━━━━━━        ││
││ │░░░░░░│ ━━━━━━━━━━━━━━     ││ ← Skeleton
││ └──────┘                     ││
│└─────────────────────────────┘│
│ ┌─────────────────────────────┐│
││ ┌──────┐ ━━━━━━━━━━━━━━━━━━ ││
││ │░░░░░░│ ━━━━━━━━━━━        ││
│└─────────────────────────────┘│
└─────────────────────────────────┘
```

### Confirmación de Eliminación
```
┌─────────────────────────────────┐
│                                 │
│   ⚠️ ¿Eliminar esta ruta?      │
│                                 │
│   "Murales de Palermo"          │
│                                 │
│   Esta acción no se puede       │
│   deshacer                      │
│                                 │
│   [Cancelar]    [Eliminar]      │
│                                 │
└─────────────────────────────────┘
```

### Feedback: Ruta Eliminada
```
┌─────────────────────────────────┐
│  ✅ Ruta eliminada              │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en "+ Nueva" | Navega a CreateRutaPage |
| Tap en Ruta Card | Navega a RutaDetailPage |
| Tap en "Ver" | Navega a RutaDetailPage |
| Tap en "Crear Salida" | Navega a CreateSalidaPage (con ruta preseleccionada) |
| Tap en ⋮ | Abre menú contextual |
| Tap en "Editar" (menú) | Navega a CreateRutaPage en modo edición |
| Tap en "Eliminar" (menú) | Muestra dialog de confirmación |
| Tap en "Compartir" (menú) | Abre share sheet |
| Pull to refresh | Recarga lista |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Header info:** 56px
- **Lista:** Scroll vertical, resto del espacio

### Card dimensions
- **Width:** Full width - 32px (padding)
- **Min height:** ~140px
- **Mapa mini:** 80x80px

### Espaciado
- **Padding horizontal:** 16px
- **Gap entre cards:** 12px

---

## 🔗 Navegación

### Llega desde:
- Menú lateral / Drawer
- Después de crear ruta (opción "Ir a Rutas")
- Back desde RutaDetailPage

### Navega hacia:
- **CreateRutaPage:** Tap en "+ Nueva"
- **RutaDetailPage:** Tap en card o "Ver"
- **CreateSalidaPage:** Tap en "Crear Salida"

---

## ✅ Checklist de Diseño

- [ ] App Bar con back, título y "+ Nueva"
- [ ] Header info con contador
- [ ] Ruta Card completa
- [ ] Mapa mini thumbnail
- [ ] Info de ruta (título, puntos, stats)
- [ ] Action buttons (Ver, Crear Salida, ⋮)
- [ ] Menú contextual (Editar, Eliminar, Compartir)
- [ ] Estado vacío
- [ ] Estado loading (skeleton)
- [ ] Dialog de confirmación de eliminación
- [ ] Toast de feedback

---

*Relacionado con:* `ux-flows.md` > Flow 3: Convertir Ruta en Salida Grupal
