# ⭐ TopNPage (Top N de Rutas)

> **IMPORTANTE:** Esta página ahora muestra **rutas** (no obras). El Top N de rutas reemplaza al Top 10 de obras. Máximo 10 rutas para Visitantes y Artistas.

## 📋 Descripción
Galería personal del usuario con hasta 10 rutas favoritas (Top N). Permite agregar, quitar y reordenar rutas. Es una colección curada de rutas en bici (o a pie) para acceso rápido. Reemplaza el Top 10 de obras.

**Persona principal:** María (Exploradora Urbana - Visitante)  
**Tipo de usuario:** Disponible para Visitantes y Artistas  
**Nota:** Muestra rutas, no obras. Cada item incluye preview de mapa, nombre, obras incluidas, distancia y modo de transporte.

---

## 🖼️ Wireframe ASCII

### Estado Normal (con obras)
```
┌─────────────────────────────────┐
│    Mi Top N (Rutas)   [Editar] │ ← App Bar
├─────────────────────────────────┤
│                                 │
│ ⭐ Tus rutas favoritas          │
│    7 de 10 rutas               │ ← Contador
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
│ [+ Agregar Ruta]               │ ← Botón agregar (si < 10)
├─────────────────────────────────┤
│  🗺️     📱     ⭐     👤      │
│  Mapa   Feed   Top10  Perfil   │
└─────────────────────────────────┘
```

### Estado de Edición
```
┌─────────────────────────────────┐
│ ✕ Editando Top N      [Guardar]│
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
**Widget Implementado:** `AppTopBar.home` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "Mi Top 10" - Headline Small | `AppTopBar.home(title: "Mi Top 10")` |
| Botón Editar | Text button, derecha | `actions: [AppButton.text(label: "Editar")]` |
| Estado edición | Título "Editando Top 10", botón "Guardar" | Cambiar `title` y `actions` dinámicamente |
| Altura | 56px | Material 3 standard |

### Header Info
**Widget:** `Column` con `AppTextStyles` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Icono | ⭐ 24px | `AppIcon` con `AppIconSize.medium` |
| Texto | "Tu colección personal" - Body Medium | `AppTextStyles.bodyMedium` |
| Contador | "X de 10 obras" - Body Small, Neutral 600 | `AppTextStyles.bodySmall` con `AppColors.neutral600` |
| Padding | 16px | `AppSpacing.space4` |

### Top N Grid Item (Rutas)
**Widget Implementado:** `AppTop10Item` ✅ (Reutilizable para rutas)  
**Ubicación:** `lib/presentation/widgets/cards/app_top10_item.dart`  
**Nota:** Ahora muestra rutas en lugar de obras. Cada item debe mostrar:
- Preview de mapa de la ruta
- Nombre de la ruta
- Número de obras incluidas
- Distancia total
- Modo de transporte (bici/a pie)

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | ~167px x ~200px | Calculado por `AppTop10Grid` |
| Imagen | Aspect ratio 1:1 o 4:3 | `AppTop10Item(aspectRatio: 1.0 o 0.75)` |
| Border radius | 12px | `AppBorderRadius.radiusLg` |
| Sombra | shadow-sm | `AppShadows.small` |

#### Ranking Badge
**Widget:** Integrado en `AppTop10Item` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Posición | Top-left, overlap 8px | `Positioned` en `AppTop10Item` |
| Tamaño | 28x28px | Configurado en `AppTop10Item` |
| Forma | Círculo | `BoxShape.circle` |
| Fondo | Primary (#6BA034) para 1-3, Neutral 700 para 4-10 | `AppColors.primary` o `AppColors.neutral700` |
| Texto | Bold, blanco, 14px | `AppTextStyles.bodySmall` con `fontWeight: FontWeight.bold` |
| Sombra | shadow-md | `AppShadows.medium` |

#### En Modo Edición
**Widget:** Integrado en `AppTop10Item` con `isEditing` prop ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Delete button | ✕ en círculo rojo, top-right | `IconButton` con `AppColors.error` |
| Drag handle | ≡ centrado abajo, Neutral 400 | `Icon` con `AppColors.neutral400` |
| Overlay | Sutil darkening | `Container` con `Colors.black.withValues(alpha: 0.2)` |

### Título de Obra (en card)
**Widget:** Integrado en `AppTop10Item` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Posición | Bottom, sobre imagen | `Positioned` bottom en `AppTop10Item` |
| Fondo | Gradiente negro desde abajo | `LinearGradient` integrado |
| Texto | Body Small, blanco, Bold | `AppTextStyles.bodySmall` con `color: Colors.white` |
| Max líneas | 1-2 | `maxLines: 2` |
| Padding | 8px | `AppSpacing.space2` |

### Botón Agregar Obra
**Widget Implementado:** `AppButton.outlined` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Visibilidad | Solo si < 10 obras | Conditional rendering |
| Estilo | Outlined, full width | `AppButton.outlined` con `Expanded` |
| Icono | + 20px | `AppIcon` con `AppIconSize.small` |
| Texto | "Agregar obra" | `label: "Agregar obra"` |
| Altura | 48px | `AppButton` standard height |
| Margin | 16px | `AppSpacing.space4` |

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
│   Tu Top N está vacío            │
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
│     tu Top N                    │
└─────────────────────────────────┘
```

### Feedback: Obra eliminada
```
┌─────────────────────────────────┐
│ ✅ Ruta eliminada de tu Top N  │
│                      [Deshacer] │ ← Toast con acción
└─────────────────────────────────┘
```

### Top N Completo (intentar agregar más)
```
┌─────────────────────────────────┐
│ ⚠️ Tu Top N está completo      │
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
│ Agregar Ruta a Top N            │
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
| Tap action | Agrega ruta al Top N, cierra modal |

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
| Tap en ✕ (edición) | Elimina ruta del Top N |
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

*Relacionado con:* `ux-flows.md` > Flow 5: Gestionar Top N de Rutas  
*Nota:* Disponible para Visitantes y Artistas. Muestra rutas (no obras).
