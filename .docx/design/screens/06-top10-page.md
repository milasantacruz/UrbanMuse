# ⭐ Top10Page

## 📋 Descripción
Galería personal del usuario con sus 10 obras favoritas de arte urbano. Permite agregar, quitar y reordenar obras. Es una colección curada que representa los gustos del usuario.

**Persona principal:** María (Exploradora Urbana)

---

## 🖼️ Wireframe ASCII

### Estado Normal (con obras)
```
┌─────────────────────────────────┐
│       Mi Top 10       [Editar] │ ← App Bar
├─────────────────────────────────┤
│                                 │
│ ⭐ Tu colección personal        │
│    7 de 10 obras               │ ← Contador
│                                 │
├─────────────────────────────────┤
│ ┌───────────┐ ┌───────────┐   │
│ │ [1]       │ │ [2]       │   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │           │ │           │   │ ← Grid 2 columnas
│ │  Título   │ │  Título   │   │
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │ [3]       │ │ [4]       │   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │           │ │           │   │
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │ [5]       │ │ [6]       │   │
│ │           │ │           │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ └───────────┘ └───────────┘   │
│         ...                    │
├─────────────────────────────────┤
│ [+ Agregar obra]               │ ← Botón agregar (si < 10)
├─────────────────────────────────┤
│  🗺️     📱     ⭐     👤      │
│  Mapa   Feed   Top10  Perfil   │
└─────────────────────────────────┘
```

### Estado de Edición
```
┌─────────────────────────────────┐
│ ✕ Editando Top 10     [Guardar]│
├─────────────────────────────────┤
│                                 │
│ Mantén presionado para          │
│ reordenar • Toca ✕ para quitar │
│                                 │
├─────────────────────────────────┤
│ ┌───────────┐ ┌───────────┐   │
│ │ [1] ✕     │ │ [2] ✕     │   │ ← Botón eliminar visible
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │  ≡ drag   │ │  ≡ drag   │   │ ← Drag handle visible
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │ [3] ✕     │ │ [4] ✕     │   │
│ │  [FOTO]   │ │  [FOTO]   │   │
│ │  ≡ drag   │ │  ≡ drag   │   │
│ └───────────┘ └───────────┘   │
│         ...                    │
├─────────────────────────────────┤
│  [Cancelar]                     │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
| Elemento | Especificación |
|----------|----------------|
| Título | "Mi Top 10" - Headline Small |
| Botón Editar | Text button, derecha |
| Estado edición | Título "Editando Top 10", botón "Guardar" |
| Altura | 56px |

### Header Info
| Elemento | Especificación |
|----------|----------------|
| Icono | ⭐ 24px |
| Texto | "Tu colección personal" - Body Medium |
| Contador | "X de 10 obras" - Body Small, Neutral 600 |
| Padding | 16px |

### Top 10 Grid Item
| Elemento | Especificación |
|----------|----------------|
| Tamaño | ~167px x ~200px |
| Imagen | Aspect ratio 1:1 o 4:3 |
| Border radius | 12px |
| Sombra | shadow-sm |

#### Ranking Badge
| Elemento | Especificación |
|----------|----------------|
| Posición | Top-left, overlap 8px |
| Tamaño | 28x28px |
| Forma | Círculo |
| Fondo | Primary (#6BA034) para 1-3, Neutral 700 para 4-10 |
| Texto | Bold, blanco, 14px |
| Sombra | shadow-md |

#### En Modo Edición
| Elemento | Especificación |
|----------|----------------|
| Delete button | ✕ en círculo rojo, top-right |
| Drag handle | ≡ centrado abajo, Neutral 400 |
| Overlay | Sutil darkening |

### Título de Obra (en card)
| Elemento | Especificación |
|----------|----------------|
| Posición | Bottom, sobre imagen |
| Fondo | Gradiente negro desde abajo |
| Texto | Body Small, blanco, Bold |
| Max líneas | 1-2 |
| Padding | 8px |

### Botón Agregar Obra
| Elemento | Especificación |
|----------|----------------|
| Visibilidad | Solo si < 10 obras |
| Estilo | Outlined, full width |
| Icono | + 20px |
| Texto | "Agregar obra" |
| Altura | 48px |
| Margin | 16px |

### Empty Slots (opcional)
| Elemento | Especificación |
|----------|----------------|
| Visibilidad | Mostrar espacios vacíos si < 10 |
| Estilo | Border dashed, Neutral 300 |
| Icono | + en el centro |
| Tap action | Abre modal de agregar |

---

## 🔄 Estados

### Estado Vacío (0 obras)
```
┌─────────────────────────────────┐
│       Mi Top 10                 │
├─────────────────────────────────┤
│                                 │
│                                 │
│          ⭐                     │
│                                 │
│    Tu Top 10 está vacío         │
│                                 │
│    Agrega tus obras favoritas   │
│    para crear tu colección      │
│    personal                     │
│                                 │
│    [Explorar obras]             │
│                                 │
│                                 │
├─────────────────────────────────┤
│ Bottom Navigation               │
└─────────────────────────────────┘
```

### Loading
```
┌─────────────────────────────────┐
│       Mi Top 10                 │
├─────────────────────────────────┤
│ ┌───────────┐ ┌───────────┐   │
│ │░░░░░░░░░░░│ │░░░░░░░░░░░│   │
│ │░ Skeleton ░│ │░ Skeleton ░│   │
│ │░░░░░░░░░░░│ │░░░░░░░░░░░│   │
│ └───────────┘ └───────────┘   │
│ ┌───────────┐ ┌───────────┐   │
│ │░░░░░░░░░░░│ │░░░░░░░░░░░│   │
│ └───────────┘ └───────────┘   │
└─────────────────────────────────┘
```

### Feedback: Obra agregada
```
┌─────────────────────────────────┐
│  ✅ "Título Obra" agregada a   │ ← Toast/Snackbar
│     tu Top 10                   │
└─────────────────────────────────┘
```

### Feedback: Obra eliminada
```
┌─────────────────────────────────┐
│  ✅ Obra eliminada de tu Top 10│
│                      [Deshacer] │ ← Toast con acción
└─────────────────────────────────┘
```

### Top 10 Completo (intentar agregar más)
```
┌─────────────────────────────────┐
│  ⚠️ Tu Top 10 está completo    │
│     Elimina una obra primero    │
└─────────────────────────────────┘
```

---

## 📋 Modal: Agregar Obra

```
┌─────────────────────────────────┐
│         ━━━━━━━━━━             │ ← Handle
├─────────────────────────────────┤
│                                 │
│ Agregar a Top 10                │
│                                 │
│ ┌─────────────────────────────┐│
││ 🔍 Buscar obra...             ││
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ Obras recientes:                │
│ ┌─────────────────────────────┐│
││ [IMG] "Colores de la Ciudad" ││
││       @Artista • Mural       ││
│├─────────────────────────────┤│
││ [IMG] "Street Dreams"        ││
││       @Artista2 • Graffiti   ││
│├─────────────────────────────┤│
││ [IMG] "Naturaleza Urbana"    ││
││       @Artista3 • Escultura  ││
│└─────────────────────────────┘│
│                                 │
└─────────────────────────────────┘
```

| Elemento | Especificación |
|----------|----------------|
| Tipo | Bottom Sheet |
| Search | Input de búsqueda |
| Lista | Obras vistas recientemente o todas |
| Item | Thumbnail + Título + Artista + Badge |
| Tap action | Agrega al Top 10, cierra modal |

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en obra | Navega a ObraDetailPage |
| Tap en "Editar" | Entra en modo edición |
| Tap en "Guardar" | Sale de edición, guarda orden |
| Tap en "Cancelar" | Sale de edición, descarta cambios |
| Long press en obra | (Normal) Entra en modo edición |
| Drag obra (edición) | Reordena posición |
| Tap en ✕ (edición) | Elimina del Top 10 |
| Tap en "Agregar obra" | Abre modal de selección |
| Tap en empty slot | Abre modal de selección |
| Tap en obra del modal | Agrega y cierra |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Header info:** 64px
- **Grid area:** Scroll vertical
- **Botón agregar:** 80px (48px + margins)
- **Bottom Nav:** 56px + safe area

### Grid
- **Columnas:** 2
- **Gap:** 12px
- **Padding lateral:** 16px
- **Item size:** ~167x200px

### Animaciones
- **Reorder:** Spring animation, 250ms
- **Delete:** Fade out, 200ms
- **Add:** Scale in, 200ms

---

## 🔗 Navegación

### Llega desde:
- Bottom Navigation desde cualquier pantalla
- Después de agregar obra desde ObraDetailPage

### Navega hacia:
- **ObraDetailPage:** Tap en cualquier obra
- **FeedPage:** "Explorar obras" (estado vacío)
- **AgregarObraModal:** Tap en agregar/empty slot

---

## 💡 Notas de Diseño

1. **Ranking visual:** Los números 1-3 destacan más (podio)
2. **Drag & drop intuitivo:** Feedback visual durante drag
3. **Límite claro:** 10 máximo, comunicar cuando está lleno
4. **Persistencia local:** Funciona offline
5. **Modo edición explícito:** Evitar ediciones accidentales
6. **Deshacer disponible:** Para eliminaciones accidentales

---

## ✅ Checklist de Diseño

- [ ] App Bar con título y botón Editar
- [ ] Header con icono y contador
- [ ] Grid 2 columnas
- [ ] Top 10 Item con ranking badge
- [ ] Ranking badge dorado para 1-3
- [ ] Título de obra sobre imagen
- [ ] Modo edición (✕ delete, ≡ drag)
- [ ] Botón "Agregar obra"
- [ ] Empty slots (opcional)
- [ ] Estado vacío
- [ ] Estado loading (skeleton)
- [ ] Modal de agregar obra
- [ ] Toast de feedback
- [ ] Bottom Navigation

---

*Relacionado con:* `ux-flows.md` > Flow 5: Gestionar Top 10
