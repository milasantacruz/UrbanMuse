# 🛣️ CreateRutaPage (Flujo Multi-Step)

## 📋 Descripción
Flujo de 6 pasos para crear una ruta personalizada de arte urbano en Buenos Aires (CABA). El usuario selecciona puntos A y B, ve obras en el camino, elige cuáles visitar, selecciona modo de transporte (bici o a pie), y guarda la ruta con opciones: privada, pública estática, o pública dinámica (evento repetitivo con rrule).

**Persona principal:** María (Exploradora Urbana - Visitante), Carlos (Turista Cultural - Visitante), Ana (Organizadora - Visitante)  
**Enfoque:** Rutas principalmente en bici (aunque también a pie)  
**Ubicación:** Buenos Aires (CABA) específicamente

---

## 📊 Resumen de los 6 Pasos

| Paso | Nombre | Acción Principal |
|------|--------|------------------|
| 1 | Punto A | Seleccionar punto de inicio |
| 2 | Punto B | Seleccionar punto de destino |
| 3 | Obras en el Camino | Ver obras detectadas automáticamente |
| 4 | Seleccionar Obras | Elegir qué obras visitar |
| 5 | Modo de Transporte | Elegir en bici (principal) o a pie |
| 6 | Guardar y Configurar | Nombre, opciones (privada/pública estática/pública dinámica), configurar repetición si es dinámica |

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
**Widgets Implementados:** `AppTextField`, `AppButton`, `AppMapPin` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "¿Desde dónde sales?" - H3 | `AppTextStyles.h3` |
| Search input | Autocomplete de direcciones | `AppTextField` con `onChanged` para autocomplete |
| Botón ubicación | Outlined, icono 📍 | `AppButton.outlined(icon: Icons.my_location)` |
| Mapa | 60% de la altura disponible | Mapa provider (Google Maps, Mapbox, etc.) |
| Pin A | Color Primary (#6BA034), label "A" | `AppMapPin(category: MapPinCategory.userLocation, number: null)` con label "A" |
| Feedback dirección | Body Medium, Surface 2 background | `Text` con `AppTextStyles.bodyMedium` y `AppColors.surface2` |
| Botón Siguiente | Filled, Primary, derecha | `AppButton.primary(label: "Siguiente →")` |

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
**Widgets Implementados:** `AppCategoryFilterChipGroup`, `AppObraCard.list`, `Checkbox` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "Selecciona las obras" - H3 | `AppTextStyles.h3` |
| Filtros | Chips horizontales | `AppCategoryFilterChipGroup` |
| Lista de obras | List items con checkbox | `ListView` con `AppObraCard.list` + `Checkbox` |
| Checkbox | Circular o cuadrado, Primary cuando checked | `Checkbox(value: selected, onChanged: ...)` con `AppColors.primary` |
| Obra item | Título + Artista + Badge + Distancia | `AppObraCard.list` con props adicionales |
| Distancia | Body Small, Neutral 600 | `AppTextStyles.bodySmall` con `AppColors.neutral600` |
| Contador | "X obras seleccionadas de Y" | `Text` con contador dinámico |
| Validación | Mínimo 1, máximo 15 obras | Validación en `onNext` callback |

### Obra List Item
**Widget:** `AppObraCard.list` con `Checkbox` wrapper ✅

```
┌─────────────────────────────────┐
│ ☑️  ┌──────┐  "Título Obra"     │
│     │[IMG] │  @artista • [Badge]│
│     └──────┘  📍 200m del camino│
└─────────────────────────────────┘
```
| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Checkbox | 24px, izquierda | `Checkbox` con `size: 24` |
| Thumbnail | 60x60px, radius 8px | Integrado en `AppObraCard.list` |
| Título | Body Medium, Bold, max 1 línea | `AppTextStyles.bodyMedium` |
| Artista + Badge | Body Small, row | `AppTextStyles.bodySmall` + `CategoryBadge` |
| Distancia | Body Small, icono 📍 | `AppTextStyles.bodySmall` con `AppIcon` |

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
│ 🚲 ¿Cómo vas a recorrer        │
│    la ruta?                     │
│                                 │
├─────────────────────────────────┤
│                                 │
│ ┌─────────────────────────────┐│
││       🚲                       ││
││     En bici                    ││ ← Opción principal (recomendado)
││                               ││
││ [Seleccionado ✓]              ││
│└─────────────────────────────┘│
│                                 │
│ ┌─────────────────────────────┐│
││       🚶                       ││
││     A pie                      ││ ← Opción secundaria
││                               ││
││ [Seleccionar]                 ││
│└─────────────────────────────┘│
│                                 │
├─────────────────────────────────┤
│ ┌─────────────────────────────┐│
││ Resumen de ruta               ││
││ 📏 Distancia: 2.3 km          ││
││ ⏱️ Tiempo: ~12 min en bici    ││ ← Actualiza según selección (bici/a pie)
││ 🎨 Obras: 5 seleccionadas     ││
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ [← Atrás]           [Siguiente →]│
└─────────────────────────────────┘
```

### Componentes Paso 5
**Widgets Implementados:** `AppButton`, `Card` con `Container` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "¿Cómo vas a recorrer?" - H3 | `AppTextStyles.h3` |
| Cards de transporte | Outlined cuando no seleccionado, Filled Primary cuando seleccionado | `Card` con `Container` y `border` o `color` según estado |
| Icono | 48px, centrado | `AppIcon` con `AppIconSize.extraLarge` |
| Texto | Body Large, centrado | `AppTextStyles.bodyLarge` con `textAlign: TextAlign.center` |
| Checkbox/Radio | Visual indicator de selección | `Radio` widget o `Checkbox` |
| Card resumen | Surface 2, info actualizable | `Card` con `AppColors.surface2` |
| Distancia | Body Medium, icono 📏 | `AppTextStyles.bodyMedium` con `AppIcon` |
| Tiempo | Body Medium, icono ⏱️ (calcula según transporte) | `AppTextStyles.bodyMedium` con `AppIcon` |
| Obras | Body Medium, icono 🎨 | `AppTextStyles.bodyMedium` con `AppIcon` |

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
│                                 │
├─────────────────────────────────┤
│ 📋 Orden de visita:             │
│ 1. "Colores de la Ciudad"  ≡   │
│ 2. "Street Dreams"         ≡   │ ← Lista reordenable
│ 3. "Naturaleza Urbana"     ≡   │
│ 4. "Mural del Sol"         ≡   │
│ 5. "Arte Libre"            ≡   │
├─────────────────────────────────┤
│ ¿Cómo quieres guardar la ruta?  │
│                                 │
│ ○ Privada                       │ ← Solo para mí
│   (Solo tú puedes verla)         │
│                                 │
│ ○ Pública estática              │ ← Compartida, sin fecha
│   (Otros pueden verla y usarla) │
│                                 │
│ ○ Pública dinámica              │ ← Evento repetitivo
│   (Evento que se repite)        │
│                                 │
│ Si seleccionas "Pública dinámica":│
│ ┌─────────────────────────────┐│
││ Repetición: [Semanal ▼]      ││ ← Diario/Semanal/Mensual/Anual (rrule)
││ Fecha inicial: [15/03/2025]  ││ ← Date picker
││ Hora: [10:00 AM]             ││ ← Time picker
││ Punto encuentro: [Plaza...]  ││ ← Input
││ ☑ Permitir que cualquiera   ││ ← Toggle
││   se una                     ││
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ [← Atrás]         [Guardar Ruta]│ ← CTA principal
└─────────────────────────────────┘
```

### Componentes Paso 6
**Widgets Implementados:** `AppTextField`, `AppButton`, `AppMapPin` (numerados), `ReorderableListView` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "¡Tu ruta está lista!" - H3, con emoji ✨ | `AppTextStyles.h3` |
| Mapa preview | Ruta final optimizada, pins numerados | Mapa con `AppMapPin(number: 1, 2, 3...)` |
| Input nombre | Text field, placeholder "Ej: Murales de Palermo" | `AppTextField(placeholder: "Ej: Murales de Palermo")` |
| Label opcional | Caption, Neutral 600 | `AppTextStyles.caption` con `AppColors.neutral600` |
| Lista reordenable | Drag handles (≡), numbered | `ReorderableListView` con `AppMapPin` numerados |
| Botón final | Filled, Primary, "Generar Ruta" | `AppButton.primary(label: "Generar Ruta")` |

### Item de Orden
**Widget:** `ListTile` con `AppBadge.circle` y `AppIcon` ✅

```
┌─────────────────────────────────┐
│ 1.  "Título de Obra"        ≡  │
└─────────────────────────────────┘
```
| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Número | Circle badge Primary, 24px | `AppBadge.circle(label: "1", backgroundColor: AppColors.primary)` |
| Título | Body Medium, ellipsis | `AppTextStyles.bodyMedium` con `overflow: TextOverflow.ellipsis` |
| Drag handle | ≡ icono, 24px, Neutral 400 | `AppIcon` con `Icons.drag_handle` y `AppColors.neutral400` |

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
**Widget Implementado:** `AppTopBar.create` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Close button | ✕ 24px, izquierda | `AppTopBar.create(onClose: ...)` |
| Título | "Nueva Ruta" - Body Large, Bold | `title: "Nueva Ruta"` con `AppTextStyles.bodyLarge` |
| Indicador paso | "Paso X/6" - Body Small, Neutral 600 | `subtitle: "Paso X/6"` con `AppTextStyles.bodySmall` |
| Altura | 56px | Material 3 standard |

### Progress Indicator
**Widget Implementado:** `AppRouteStepIndicator` ✅  
**Ubicación:** `lib/presentation/widgets/modals/route_step_indicator.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | 6 dots o linear progress | `AppRouteStepIndicator` con 6 pasos |
| Dot completado | Primary (#6BA034), filled | `AppColors.primary` |
| Dot actual | Primary, con anillo | `AppColors.primary` con borde |
| Dot pendiente | Neutral 300, outline | `AppColors.neutral300` |
| Tamaño dot | 10px | Configurado en `AppRouteStepIndicator` |
| Gap | 8px | `AppSpacing.space2` |

**Uso:**
```dart
AppRouteStepIndicator(
  currentStep: 1,
  totalSteps: 6,
  labels: ['Punto A', 'Punto B', 'Obras', 'Seleccionar', 'Transporte', 'Generar'],
)
```

### Footer de Navegación
**Widgets Implementados:** `AppButton.text`, `AppButton.primary` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Altura | 72px (incluye padding) | `Container` con `height: 72` |
| Botón Atrás | Text button, "← Atrás" (solo paso 2+) | `AppButton.text(label: "← Atrás")` |
| Botón Siguiente | Filled Primary, "Siguiente →" | `AppButton.primary(label: "Siguiente →")` |
| Botón Final | Filled Primary, "Guardar Ruta" (paso 6) | `AppButton.primary(label: "Guardar Ruta")` |
| Opciones guardado | Radio buttons (Privada/Pública estática/Pública dinámica) | `Radio` widgets con `AppTextStyles.bodyMedium` |
| Configuración dinámica | Si selecciona dinámica: Selector repetición, Date/Time pickers, Toggle | Usar `rrule` para manejo de repeticiones |
| Padding | 16px todos lados | `AppSpacing.space4` |
| Fondo | Surface con border-top | `AppColors.surface` con `Border(top: BorderSide(...))` |

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
