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
| Elemento | Especificación |
|----------|----------------|
| Tipo | Bottom Sheet |
| Handle | 4x40px, Neutral 300 |
| Border radius | 16px top |
| Max height | 80% de pantalla |
| Padding | 16px |
| Fondo | Surface |
| Sombra | shadow-xl |

### Header
| Elemento | Especificación |
|----------|----------------|
| Icono | 🔍 24px |
| Título | "Filtros" - Headline Small |
| Close (opcional) | ✕ top-right |

### Tabs
| Elemento | Especificación |
|----------|----------------|
| Items | "Categoría", "Artista" |
| Estilo | Underline tabs |
| Tab activo | Primary, underline 2px |
| Tab inactivo | Neutral 600 |
| Altura | 48px |

### Tab Categoría

#### Checkbox "Todos"
| Elemento | Especificación |
|----------|----------------|
| Texto | "Todos" |
| Comportamiento | Selecciona/deselecciona todas |
| Estilo | Bold cuando activo |

#### Checkbox de Categoría
| Elemento | Especificación |
|----------|----------------|
| Layout | Row: checkbox + color dot + texto |
| Checkbox | 24px, Primary cuando checked |
| Color dot | 12px, color de categoría |
| Texto | Body Medium, nombre de categoría |
| Padding vertical | 12px |
| Divider | Línea sutil entre items (opcional) |

### Tab Artista

#### Search Input
| Elemento | Especificación |
|----------|----------------|
| Placeholder | "Buscar artista..." |
| Icono | 🔍 20px, izquierda |
| Border | Outline Variant |
| Altura | 44px |
| Comportamiento | Filtra lista mientras escribe |

#### Checkbox "Todos los artistas"
| Elemento | Especificación |
|----------|----------------|
| Texto | "Todos los artistas" |
| Comportamiento | Selecciona/deselecciona todos |

#### Lista de Artistas
| Elemento | Especificación |
|----------|----------------|
| Layout | Row: checkbox + avatar + handle |
| Checkbox | 24px, Primary cuando checked |
| Avatar | 32x32px, circular |
| Handle | @nombre, Body Medium |
| Scroll | Vertical si hay muchos |

### Footer Actions
| Elemento | Especificación |
|----------|----------------|
| Layout | Row, space-between |
| "Limpiar filtros" | Text button, Neutral 600 |
| "Aplicar" | Filled button, Primary |
| Padding | 16px |
| Border top | 1px Outline Variant |

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
