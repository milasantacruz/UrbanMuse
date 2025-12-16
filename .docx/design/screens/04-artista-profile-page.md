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
**Widget Implementado:** `AppTopBar.detail` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Back button | ◀ 24px | `AppTopBar.detail(onBack: ...)` |
| Título | "Artista" - centrado | `title: "Artista", centerTitle: true` |
| Share button | ↗️ 24px (compartir perfil) | `actions: [IconButton(icon: AppIcon.share)]` |
| More menu | ⋮ 24px (reportar) | `actions: [PopupMenuButton(...)]` |
| Fondo | Surface o transparente | `backgroundColor: AppColors.surface` |

### Header del Artista
| Elemento | Especificación |
|----------|----------------|
| Layout | Column, centrado |
| Padding | 24px top, 16px sides | `AppSpacing.space5, AppSpacing.space4` |
| Background | Surface o gradiente sutil | `AppColors.surface` |

### Avatar
**Widget Implementado:** `AppAvatar` ✅  
**Ubicación:** `lib/presentation/widgets/avatars/app_avatar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | 120x120px | `AppAvatar.xlarge(size: 120)` o custom |
| Forma | Circular (border-radius: full) | `AppAvatar` es circular por defecto |
| Borde | 4px, Primary (#6BA034) | `border: Border.all(color: AppColors.primary, width: 4)` |
| Fallback | Iniciales del nombre o icono genérico | `AppAvatar` con `initials` o `placeholder` |
| Tap action | (Opcional) Ver foto grande | `GestureDetector` wrapper |

### Nombre del Artista
**Widget:** `Text` con `AppTextStyles.h2` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Headline Medium (H2), 24px | `AppTextStyles.h2` |
| Weight | Bold (700) | Incluido en `AppTextStyles.h2` |
| Color | OnSurface (#1D1617) | `AppColors.onSurface` |
| Alignment | Center | `textAlign: TextAlign.center` |
| Max líneas | 2 | `maxLines: 2` |

### Handle/Username
**Widget:** `Text` con `AppTextStyles.bodyMedium` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Body Medium, Neutral 600 | `AppTextStyles.bodyMedium` con `AppColors.neutral600` |
| Prefijo | "@" | Concatenar "@" al inicio |
| Alignment | Center | `textAlign: TextAlign.center` |
| Tap action | (Opcional) Copia al clipboard | `GestureDetector` con `Clipboard.setData` |

### Biografía
**Widget:** `Text` con `AppTextStyles.bodyMedium` + `AppButton.text` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Body Medium | `AppTextStyles.bodyMedium` |
| Color | OnSurface Variant (#4A4F45) | `AppColors.onSurfaceVariant` |
| Max líneas | 4 colapsado | `maxLines: 4, overflow: TextOverflow.ellipsis` |
| Alignment | Center | `textAlign: TextAlign.center` |
| "Ver más" | Text button si hay más texto | `AppButton.text(label: "Ver más")` |
| Padding | 16px horizontal | `AppSpacing.space4` |

### Social Links
**Widget:** `AppButton.outlined` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row, centrado, gap 12px | `Row(mainAxisAlignment: MainAxisAlignment.center)` |
| Botones | Outlined, con icono + texto | `AppButton.outlined(icon: ..., label: ...)` |
| Iconos | 20px (Instagram, Web, Twitter, etc.) | `AppIcon` con `AppIconSize.small` |
| Altura | 36px | `AppButton` compact size |
| Tap action | Abre link externo | `url_launcher` package |

### Stats Row
**Widget:** `Row` con `AppDivider.vertical` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Layout | Row, 3 columnas iguales | `Row` con `Expanded` para cada stat |
| Separador | Divider vertical 1px | `AppDivider.vertical` |
| Número | Headline Small (20px), Bold | `AppTextStyles.h3` |
| Label | Caption (12px), Neutral 600 | `AppTextStyles.caption` con `AppColors.neutral600` |
| Alignment | Center en cada columna | `Column(mainAxisAlignment: MainAxisAlignment.center)` |
| Stats | Obras, Likes totales, Rutas | Custom widget con datos |

### Sección Obras
**Widget:** `Text` con `AppTextStyles.bodyLarge` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Título | "Obras (24)" - Body Large, Bold | `AppTextStyles.bodyLarge` con `fontWeight: FontWeight.bold` |
| Icono | 🎨 20px | `AppIcon` con `AppIconSize.small` |
| Padding | 16px | `AppSpacing.space4` |

### Grid de Obras
**Widget:** `AppObraCard.grid` en `GridView` ✅  
**Ubicación:** `lib/presentation/widgets/cards/app_obra_card.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Columnas | 2 o 3 | `GridView.count(crossAxisCount: 2 o 3)` |
| Gap | 4px (estilo Instagram) o 12px | `crossAxisSpacing` y `mainAxisSpacing` |
| Aspect ratio | 1:1 (cuadrado) | `AppObraCard.grid(aspectRatio: 1.0)` |
| Border radius | 0 (estilo Instagram) o 8px | Configurado en `AppObraCard` |
| Tap action | Navega a ObraDetailPage | `onTap` callback en `AppObraCard` |

### Obra Thumbnail
**Widget:** `AppObraCard.grid` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tamaño | (375-32-8)/2 = ~167px si 2 cols | Calculado por `GridView` |
| Overlay | Badge de categoría (esquina) opcional | Integrado en `AppObraCard` |
| Loading | Placeholder gris o shimmer | `AppLoader` o `CircularProgressIndicator` |

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
