# 🛣️ CreateRutaPage (Flujo Multi-Step)

## 📋 Descripción
Flujo de 6 pasos para crear una ruta personalizada de arte urbano. El usuario selecciona puntos A y B, ve obras en el camino, elige cuáles visitar, selecciona medio de transporte, y genera la ruta final.

**Persona principal:** María (Exploradora Urbana), Carlos (Turista Cultural), Ana (Organizadora)

---

## 📊 Resumen de los 6 Pasos

| Paso | Nombre | Acción Principal |
|------|--------|------------------|
| 1 | Punto A | Seleccionar punto de inicio |
| 2 | Punto B | Seleccionar punto de destino |
| 3 | Obras en el Camino | Ver obras detectadas automáticamente |
| 4 | Seleccionar Obras | Elegir qué obras visitar |
| 5 | Transporte | Elegir a pie o en bici |
| 6 | Generar Ruta | Confirmar y guardar |

---

## 🖼️ Wireframe General (Header compartido)

```
┌─────────────────────────────────┐
│ ✕                     Paso 1/6 │ ← Header con close y progreso
├─────────────────────────────────┤
│ [○ ○ ○ ○ ○ ○]                   │ ← Progress indicator
│  ●                              │
├─────────────────────────────────┤
│                                 │
│     [ CONTENIDO DEL PASO ]      │
│                                 │
│                                 │
├─────────────────────────────────┤
│                     [Siguiente] │ ← Footer con navegación
│ (Atrás si paso > 1)             │
└─────────────────────────────────┘
```

---

## 📍 PASO 1: Seleccionar Punto A

### Wireframe
```
┌─────────────────────────────────┐
│ ✕ Nueva Ruta           Paso 1/6│
├─────────────────────────────────┤
│ [● ○ ○ ○ ○ ○]                   │
├─────────────────────────────────┤
│                                 │
│ 📍 ¿Desde dónde sales?         │ ← Título del paso
│                                 │
│ ┌─────────────────────────────┐│
││ 🔍 Buscar dirección...       ││ ← Search input
│└─────────────────────────────┘│
│                                 │
│ [📍 Usar mi ubicación actual]  │ ← Quick action button
│                                 │
├─────────────────────────────────┤
│                                 │
│         [MAPA]                  │
│                                 │
│            📍                   │ ← Pin draggable
│          Punto A                │
│                                 │
│                                 │
├─────────────────────────────────┤
│ Dirección seleccionada:         │
│ Av. Corrientes 1234, Palermo    │ ← Feedback de selección
├─────────────────────────────────┤
│                     [Siguiente →]│
└─────────────────────────────────┘
```

### Componentes Paso 1
| Elemento | Especificación |
|----------|----------------|
| Título | "¿Desde dónde sales?" - H3 |
| Search input | Autocomplete de direcciones |
| Botón ubicación | Outlined, icono 📍 |
| Mapa | 60% de la altura disponible |
| Pin A | Color Primary (#6BA034), label "A" |
| Feedback dirección | Body Medium, Surface 2 background |
| Botón Siguiente | Filled, Primary, derecha |

---

## 📍 PASO 2: Seleccionar Punto B

### Wireframe
```
┌─────────────────────────────────┐
│ ✕ Nueva Ruta           Paso 2/6│
├─────────────────────────────────┤
│ [● ● ○ ○ ○ ○]                   │
├─────────────────────────────────┤
│                                 │
│ 📍 ¿A dónde vas?               │
│                                 │
│ ┌─────────────────────────────┐│
││ 🔍 Buscar dirección...       ││
│└─────────────────────────────┘│
│                                 │
├─────────────────────────────────┤
│                                 │
│         [MAPA]                  │
│     📍A ─ ─ ─ ─ ─ 📍B          │ ← Línea conectando A y B
│                                 │
│                                 │
├─────────────────────────────────┤
│ Punto A: Av. Corrientes 1234    │
│ Punto B: Plaza Italia           │ ← Resumen de puntos
├─────────────────────────────────┤
│ [← Atrás]           [Siguiente →]│
└─────────────────────────────────┘
```

### Componentes Paso 2
| Elemento | Especificación |
|----------|----------------|
| Título | "¿A dónde vas?" - H3 |
| Search input | Autocomplete de direcciones |
| Mapa | Muestra punto A fijo + punto B draggable |
| Pin A | Primary, opacidad 70% (ya definido) |
| Pin B | Secondary (#66715B), label "B" |
| Línea temporal | Dotted, Neutral 400 |
| Resumen | Card con ambos puntos |

---

## 🎨 PASO 3: Obras en el Camino

### Wireframe
```
┌─────────────────────────────────┐
│ ✕ Nueva Ruta           Paso 3/6│
├─────────────────────────────────┤
│ [● ● ● ○ ○ ○]                   │
├─────────────────────────────────┤
│                                 │
│ 🎨 Obras en tu camino           │
│                                 │
│ Encontramos 12 obras entre      │
│ tu punto A y B                  │
│                                 │
├─────────────────────────────────┤
│                                 │
│         [MAPA]                  │
│     📍A ═══════════ 📍B        │
│         🔴  🔵  🟠             │ ← Pins de obras
│           🔵    🔴  🟣         │
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ Radio de búsqueda             ││
││ [────●────────] 200m          ││ ← Slider de radio
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ 12 obras encontradas            │ ← Contador
│ [Ver lista de obras]            │ ← Opcional: ver lista
├─────────────────────────────────┤
│ [← Atrás]           [Siguiente →]│
└─────────────────────────────────┘
```

### Componentes Paso 3
| Elemento | Especificación |
|----------|----------------|
| Título | "Obras en tu camino" - H3 |
| Subtítulo | Body Medium, Neutral 600 |
| Mapa | Ruta trazada + pins de obras |
| Línea de ruta | Solid, Primary, 4px |
| Pins de obras | Por categoría, clicables |
| Slider radio | 100m - 500m, default 200m |
| Contador | Badge con número |

---

## ✅ PASO 4: Seleccionar Obras

### Wireframe
```
┌─────────────────────────────────┐
│ ✕ Nueva Ruta           Paso 4/6│
├─────────────────────────────────┤
│ [● ● ● ● ○ ○]                   │
├─────────────────────────────────┤
│                                 │
│ ✅ Selecciona las obras         │
│    que quieres visitar          │
│                                 │
│ [🎨 Todo] [Graffiti] [Mural] → │ ← Filtros
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││☑️ "Colores de la Ciudad"      ││
││   Por @Artista1 • Mural       ││
││   📍 200m del camino          ││
│├─────────────────────────────┤│
││☐  "Street Dreams"            ││
││   Por @Artista2 • Graffiti   ││
││   📍 150m del camino          ││
│├─────────────────────────────┤│
││☑️ "Naturaleza Urbana"         ││
││   Por @Artista3 • Escultura  ││
││   📍 180m del camino          ││
│└─────────────────────────────┘│
│         ↓ Scroll               │
├─────────────────────────────────┤
│ 5 obras seleccionadas de 12     │ ← Contador de selección
├─────────────────────────────────┤
│ [← Atrás]           [Siguiente →]│
└─────────────────────────────────┘
```

### Componentes Paso 4
| Elemento | Especificación |
|----------|----------------|
| Título | "Selecciona las obras" - H3 |
| Filtros | Chips horizontales |
| Lista de obras | List items con checkbox |
| Checkbox | Circular o cuadrado, Primary cuando checked |
| Obra item | Título + Artista + Badge + Distancia |
| Distancia | Body Small, Neutral 600 |
| Contador | "X obras seleccionadas de Y" |
| Validación | Mínimo 1, máximo 15 obras |

### Obra List Item
```
┌─────────────────────────────────┐
│ ☑️  ┌──────┐  "Título Obra"     │
│     │[IMG] │  @artista • [Badge]│
│     └──────┘  📍 200m del camino│
└─────────────────────────────────┘
```
| Elemento | Especificación |
|----------|----------------|
| Checkbox | 24px, izquierda |
| Thumbnail | 60x60px, radius 8px |
| Título | Body Medium, Bold, max 1 línea |
| Artista + Badge | Body Small, row |
| Distancia | Body Small, icono 📍 |

---

## 🚶 PASO 5: Medio de Transporte

### Wireframe
```
┌─────────────────────────────────┐
│ ✕ Nueva Ruta           Paso 5/6│
├─────────────────────────────────┤
│ [● ● ● ● ● ○]                   │
├─────────────────────────────────┤
│                                 │
│ 🚶 ¿Cómo vas a recorrer        │
│    la ruta?                     │
│                                 │
├─────────────────────────────────┤
│                                 │
│ ┌─────────────────────────────┐│
││       🚶                       ││
││     A pie                      ││ ← Opción seleccionable
││                               ││
││ [Seleccionado ✓]              ││
│└─────────────────────────────┘│
│                                 │
│ ┌─────────────────────────────┐│
││       🚲                       ││
││     En bici                    ││ ← Opción seleccionable
││                               ││
││ [Seleccionar]                 ││
│└─────────────────────────────┘│
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ Resumen de ruta               ││
││ 📏 Distancia: 2.3 km          ││
││ ⏱️ Tiempo: ~45 min a pie      ││ ← Actualiza según selección
││ 🎨 Obras: 5 seleccionadas     ││
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ [← Atrás]           [Siguiente →]│
└─────────────────────────────────┘
```

### Componentes Paso 5
| Elemento | Especificación |
|----------|----------------|
| Título | "¿Cómo vas a recorrer?" - H3 |
| Cards de transporte | Outlined cuando no seleccionado, Filled Primary cuando seleccionado |
| Icono | 48px, centrado |
| Texto | Body Large, centrado |
| Checkbox/Radio | Visual indicator de selección |
| Card resumen | Surface 2, info actualizable |
| Distancia | Body Medium, icono 📏 |
| Tiempo | Body Medium, icono ⏱️ (calcula según transporte) |
| Obras | Body Medium, icono 🎨 |

### Card de Transporte
| Estado | Especificación |
|--------|----------------|
| No seleccionado | Border Outline Variant, fondo Surface |
| Seleccionado | Border Primary 2px, fondo Primary Container |
| Icono | 48px, Primary cuando seleccionado |

---

## ✨ PASO 6: Generar Ruta

### Wireframe
```
┌─────────────────────────────────┐
│ ✕ Nueva Ruta           Paso 6/6│
├─────────────────────────────────┤
│ [● ● ● ● ● ●]                   │
├─────────────────────────────────┤
│                                 │
│ ✨ ¡Tu ruta está lista!         │
│                                 │
├─────────────────────────────────┤
│                                 │
│         [MAPA PREVIEW]          │
│     📍A ─1─ 2 ─ 3 ─ 4 ─ 📍B    │ ← Ruta optimizada
│              5                  │
│                                 │
├─────────────────────────────────┤
│ Nombre de tu ruta:              │
│ ┌─────────────────────────────┐│
││ Murales de Palermo            ││ ← Input de nombre
│└─────────────────────────────┘│
│ (Opcional)                      │
├─────────────────────────────────┤
│ 📋 Orden de visita:             │
│ 1. "Colores de la Ciudad"  ≡   │
│ 2. "Street Dreams"         ≡   │ ← Lista reordenable
│ 3. "Naturaleza Urbana"     ≡   │
│ 4. "Mural del Sol"         ≡   │
│ 5. "Arte Libre"            ≡   │
├─────────────────────────────────┤
│ [← Atrás]         [Generar Ruta]│ ← CTA principal
└─────────────────────────────────┘
```

### Componentes Paso 6
| Elemento | Especificación |
|----------|----------------|
| Título | "¡Tu ruta está lista!" - H3, con emoji ✨ |
| Mapa preview | Ruta final optimizada, pins numerados |
| Input nombre | Text field, placeholder "Ej: Murales de Palermo" |
| Label opcional | Caption, Neutral 600 |
| Lista reordenable | Drag handles (≡), numbered |
| Botón final | Filled, Primary, "Generar Ruta" |

### Item de Orden
```
┌─────────────────────────────────┐
│ 1.  "Título de Obra"        ≡  │
└─────────────────────────────────┘
```
| Elemento | Especificación |
|----------|----------------|
| Número | Circle badge Primary, 24px |
| Título | Body Medium, ellipsis |
| Drag handle | ≡ icono, 24px, Neutral 400 |

---

## 🔄 Estados Generales

### Loading (Calculando ruta - Paso 3)
```
┌─────────────────────────────────┐
│                                 │
│         ⟳                       │
│    Buscando obras en            │
│    tu camino...                 │
│                                 │
└─────────────────────────────────┘
```

### Sin obras encontradas (Paso 3)
```
┌─────────────────────────────────┐
│                                 │
│         🎨                      │
│    No encontramos obras         │
│    en este recorrido            │
│                                 │
│    Prueba ampliando el radio    │
│    o cambiando los puntos       │
│                                 │
│    [Ampliar radio]              │
│                                 │
└─────────────────────────────────┘
```

### Éxito al generar ruta
```
┌─────────────────────────────────┐
│                                 │
│         ✅                      │
│    ¡Ruta creada!                │
│                                 │
│    "Murales de Palermo"         │
│    guardada en Mis Rutas        │
│                                 │
│    [Ver en Mapa]  [Ir a Rutas]  │
│                                 │
└─────────────────────────────────┘
```

### Error
```
┌─────────────────────────────────┐
│         ⚠️                      │
│    Error al crear la ruta       │
│    [Reintentar]                 │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Compartidos

### Header de Flujo
| Elemento | Especificación |
|----------|----------------|
| Close button | ✕ 24px, izquierda |
| Título | "Nueva Ruta" - Body Large, Bold |
| Indicador paso | "Paso X/6" - Body Small, Neutral 600 |
| Altura | 56px |

### Progress Indicator
| Elemento | Especificación |
|----------|----------------|
| Estilo | 6 dots o linear progress |
| Dot completado | Primary (#6BA034), filled |
| Dot actual | Primary, con anillo |
| Dot pendiente | Neutral 300, outline |
| Tamaño dot | 10px |
| Gap | 8px |

### Footer de Navegación
| Elemento | Especificación |
|----------|----------------|
| Altura | 72px (incluye padding) |
| Botón Atrás | Text button, "← Atrás" (solo paso 2+) |
| Botón Siguiente | Filled Primary, "Siguiente →" |
| Botón Final | Filled Primary, "Generar Ruta" (paso 6) |
| Padding | 16px todos lados |
| Fondo | Surface con border-top |

---

## 👆 Interacciones por Paso

| Paso | Interacciones |
|------|---------------|
| 1 | Buscar dirección, usar ubicación, drag pin, siguiente |
| 2 | Buscar dirección, drag pin, ver resumen, atrás/siguiente |
| 3 | Ver mapa, ajustar slider radio, ver lista, atrás/siguiente |
| 4 | Toggle checkboxes, filtrar, scroll, ver contador, atrás/siguiente |
| 5 | Seleccionar transporte, ver resumen actualizado, atrás/siguiente |
| 6 | Editar nombre, reordenar obras (drag), generar ruta |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **Header:** 56px
- **Progress:** 32px
- **Footer:** 72px
- **Content area:** Resto del espacio (scroll)

### Validaciones
- **Paso 1:** Punto A requerido
- **Paso 2:** Punto B requerido, diferente de A
- **Paso 3:** Al menos 1 obra encontrada para continuar
- **Paso 4:** 1-15 obras seleccionadas
- **Paso 5:** Transporte seleccionado
- **Paso 6:** Nombre opcional (auto-genera si vacío)

---

## 🔗 Navegación

### Llega desde:
- MapaPage (tap en FAB "Crear Ruta")
- Menú lateral
- RutaListPage (botón "Nueva Ruta")

### Navega hacia:
- **MapaPage:** Al cerrar (✕) o al completar (con ruta visible)
- **RutaListPage:** Al completar (opción "Ir a Rutas")
- **RutaDetailPage:** Al completar (ver la ruta creada)

---

## ✅ Checklist de Diseño

### Compartidos
- [ ] Header con close y paso actual
- [ ] Progress indicator (6 pasos)
- [ ] Footer con Atrás/Siguiente

### Paso 1
- [ ] Título "¿Desde dónde sales?"
- [ ] Search input con autocomplete
- [ ] Botón "Usar mi ubicación"
- [ ] Mapa con pin A draggable
- [ ] Feedback de dirección seleccionada

### Paso 2
- [ ] Título "¿A dónde vas?"
- [ ] Search input
- [ ] Mapa con A fijo + B draggable
- [ ] Línea temporal entre puntos
- [ ] Resumen de ambos puntos

### Paso 3
- [ ] Título "Obras en tu camino"
- [ ] Mapa con ruta y pins
- [ ] Slider de radio de búsqueda
- [ ] Contador de obras encontradas
- [ ] Estado sin obras

### Paso 4
- [ ] Título "Selecciona las obras"
- [ ] Filter chips
- [ ] Lista con checkboxes
- [ ] Contador de selección
- [ ] Validación mínimo/máximo

### Paso 5
- [ ] Título "¿Cómo vas a recorrer?"
- [ ] Cards de transporte (A pie, Bici)
- [ ] Estado seleccionado visual
- [ ] Card resumen (distancia, tiempo, obras)

### Paso 6
- [ ] Título "¡Tu ruta está lista!"
- [ ] Mapa preview con ruta
- [ ] Input nombre de ruta
- [ ] Lista reordenable de obras
- [ ] Botón "Generar Ruta"
- [ ] Estado de éxito

---

*Relacionado con:* `ux-flows.md` > Flow 2: Crear Ruta Manual
