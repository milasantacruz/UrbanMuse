# 📊 Auditoría de Páginas y Rutas - Street Muse

**Fecha:** Diciembre 2025  
**Versión:** MVP1  
**Estado:** Activo

---

## 📋 Resumen Ejecutivo

Esta auditoría documenta todas las páginas, rutas y flujos de navegación de la aplicación Street Muse. Se identificaron **15 páginas principales**, **22 páginas de preview** (solo desarrollo), **3 páginas obsoletas** y **2 modales principales**.

---

## 🎯 Páginas Principales (En Uso)

### 1. Páginas de Navegación Principal

| Página | Ruta | Estado | Descripción |
|--------|------|--------|-------------|
| **MapaPage** | `/` | ✅ Activa | Página principal con mapa interactivo de obras |
| **FeedPage** | `/feed` | ✅ Activa | Feed visual de obras de arte callejero |
| **PerfilPage** | `/perfil` | ✅ Activa | Perfil del usuario con rutas y obras favoritas |
| **TopNPage** | `/topn` | ✅ Activa | Top N de rutas favoritas (máximo 10) |

### 2. Páginas de Obras

| Página | Ruta | Estado | Descripción |
|--------|------|--------|-------------|
| **ObraDetailPage** | `/obra/:id` | ✅ Activa | Detalle completo de una obra |
| **PublicarObraPage** | `/obra/publicar` | ✅ Activa | Formulario para publicar nueva obra (solo artistas) |

### 3. Páginas de Artistas

| Página | Ruta | Estado | Descripción |
|--------|------|--------|-------------|
| **ArtistaProfilePage** | `/artista/:id` | ✅ Activa | Perfil del artista con catálogo de obras |

### 4. Páginas de Rutas

| Página | Ruta | Estado | Descripción |
|--------|------|--------|-------------|
| **RutaListPage** | `/rutas` | ✅ Activa | Lista de todas las rutas disponibles |
| **RutaDetailPage** | `/ruta/:id` | ✅ Activa | Detalle completo de una ruta |
| **CreateRutaPage** | `/ruta/create` | ⚠️ Parcial | Página de creación de ruta (no se usa directamente) |

**Nota:** `CreateRutaPage` existe pero **NO se usa**. En su lugar se usa `CreateRutaModal` (modal).

### 5. Páginas de Encuentros

| Página | Ruta | Estado | Descripción |
|--------|------|--------|-------------|
| **EncuentroListPage** | `/encuentros` | ✅ Activa | Lista de encuentros de artistas |
| **EncuentroDetailPage** | `/encuentro/:id` | ✅ Activa | Detalle de un encuentro |
| **CreateEncuentroPage** | `/encuentro/create` | ✅ Activa | Formulario para crear encuentro (solo artistas) |

### 6. Rutas de Compatibilidad (Redirecciones)

| Ruta Antigua | Ruta Nueva | Estado |
|--------------|------------|--------|
| `/top10` | `/topn` | ✅ Redirige |
| `/salidas` | `/encuentros` | ✅ Redirige |
| `/salida/:id` | `/encuentro/:id` | ✅ Redirige |
| `/salida/create` | `/encuentro/create` | ✅ Redirige |

---

## 🎨 Páginas de Preview (Solo Desarrollo)

**Total:** 22 páginas de preview

Estas páginas están bajo la ruta `/preview/*` y se usan solo para desarrollo y testing de componentes.

### Preview Principal
- `PreviewHomePage` - `/preview` - Índice de todas las previews

### Previews de Componentes
1. `ButtonsPreviewPage` - `/preview/buttons`
2. `IconsPreviewPage` - `/preview/icons`
3. `TextStylesPreviewPage` - `/preview/text-styles`
4. `InputsPreviewPage` - `/preview/inputs`
5. `BadgesPreviewPage` - `/preview/badges`
6. `AvatarsPreviewPage` - `/preview/avatars`
7. `DividersPreviewPage` - `/preview/dividers`
8. `LoadingPreviewPage` - `/preview/loading`
9. `SearchBarPreviewPage` - `/preview/search-bar`
10. `ChipsPreviewPage` - `/preview/chips`
11. `MapPinsPreviewPage` - `/preview/map-pins`
12. `TooltipsPreviewPage` - `/preview/tooltips`
13. `DialogsPreviewPage` - `/preview/dialogs`

### Previews de Cards y Componentes Complejos
14. `ObraCardPreviewPage` - `/preview/obra-card`
15. `ArtistCardPreviewPage` - `/preview/artist-card`
16. `RutaCardPreviewPage` - `/preview/ruta-card`
17. `Top10ItemPreviewPage` - `/preview/top10-item`
18. `AppBarsPreviewPage` - `/preview/app-bars`
19. `FilterModalPreviewPage` - `/preview/filter-modal`
20. `ObraPreviewBottomSheetPreviewPage` - `/preview/obra-preview-bottom-sheet`
21. `RouteStepIndicatorPreviewPage` - `/preview/route-step-indicator`
22. `ObraDetailHeaderPreviewPage` - `/preview/obra-detail-header`

---

## 🗑️ Páginas Obsoletas/No Usadas

Estas páginas existen en el sistema de archivos pero **NO están en el router** y **NO se usan**:

| Página | Ubicación | Estado | Razón |
|--------|-----------|--------|-------|
| **ObraListPage** | `pages/obra/obra_list_page.dart` | ❌ No usada | Solo tiene placeholder "Por implementar" |
| **CreateSalidaPage** | `pages/salida/create_salida_page.dart` | ❌ Obsoleta | Reemplazada por `CreateEncuentroPage` |
| **SalidaDetailPage** | `pages/salida/salida_detail_page.dart` | ❌ Obsoleta | Reemplazada por `EncuentroDetailPage` |
| **SalidaListPage** | `pages/salida/salida_list_page.dart` | ❌ Obsoleta | Reemplazada por `EncuentroListPage` |

**Recomendación:** Eliminar estas páginas obsoletas para limpiar el código.

---

## 📱 Modales y Bottom Sheets

### Modales Principales

| Modal | Ubicación | Uso | Estado |
|-------|-----------|-----|--------|
| **CreateRutaModal** | `widgets/modals/create_ruta_modal.dart` | ✅ Activo | Modal para crear ruta desde el mapa |
| **AppObraPreviewBottomSheet** | `widgets/modals/app_obra_preview_bottom_sheet.dart` | ✅ Activo | Preview de obra desde el mapa |
| **AppFilterModal** | `widgets/modals/app_filter_modal.dart` | ✅ Activo | Filtros de obras por categoría/artista |

**Nota Importante:** `CreateRutaModal` es el modal que realmente se usa para crear rutas. Se abre desde `MapaPage` cuando el usuario presiona el botón "Crear Ruta". `CreateRutaPage` existe pero no se usa en el flujo actual.

---

## 🗺️ Mapa de Flujo de Navegación

### Navegación Principal (Bottom Navigation)

```
┌─────────────────────────────────────────────────────────┐
│                    Bottom Navigation                     │
├─────────────────────────────────────────────────────────┤
│  [Perfil]  [Explorar]  [Rutas]  [Top N]                │
└─────────────────────────────────────────────────────────┘
         │          │         │        │
         │          │         │        │
         ▼          ▼         ▼        ▼
    /perfil        /      /rutas    /topn
```

### Flujo desde Mapa (Página Principal)

```
MapaPage (/)
    │
    ├─→ [Toca pin de obra]
    │   └─→ AppObraPreviewBottomSheet (modal)
    │       └─→ [Ver más] → ObraDetailPage (/obra/:id)
    │           └─→ [Ver artista] → ArtistaProfilePage (/artista/:id)
    │
    ├─→ [Botón Crear Ruta]
    │   └─→ CreateRutaModal (modal)
    │       └─→ [Crear] → Vuelve a MapaPage
    │
    ├─→ [Filtros]
    │   └─→ AppFilterModal (modal)
    │
    └─→ [Bottom Nav]
        ├─→ FeedPage (/feed)
        ├─→ PerfilPage (/perfil)
        ├─→ RutaListPage (/rutas)
        └─→ TopNPage (/topn)
```

### Flujo desde Feed

```
FeedPage (/feed)
    │
    ├─→ [Toca obra]
    │   └─→ ObraDetailPage (/obra/:id)
    │       ├─→ [Ver artista] → ArtistaProfilePage (/artista/:id)
    │       └─→ [Ver en mapa] → MapaPage (/) con obra centrada
    │
    └─→ [Filtros]
        └─→ AppFilterModal (modal)
```

### Flujo desde Perfil

```
PerfilPage (/perfil)
    │
    ├─→ [Publicar Obra] (solo artistas)
    │   └─→ PublicarObraPage (/obra/publicar)
    │
    ├─→ [Crear Encuentro] (solo artistas)
    │   └─→ CreateEncuentroPage (/encuentro/create)
    │
    ├─→ [Ver Mis Rutas]
    │   └─→ RutaListPage (/rutas)
    │
    ├─→ [Ver Top N]
    │   └─→ TopNPage (/topn)
    │
    └─→ [Toca ruta]
        └─→ RutaDetailPage (/ruta/:id)
```

### Flujo desde Rutas

```
RutaListPage (/rutas)
    │
    ├─→ [Crear Ruta]
    │   └─→ CreateRutaPage (/ruta/create) ⚠️ NO SE USA
    │       (En realidad se abre CreateRutaModal desde MapaPage)
    │
    └─→ [Toca ruta]
        └─→ RutaDetailPage (/ruta/:id)
            └─→ [Toca obra] → ObraDetailPage (/obra/:id)
```

### Flujo desde Top N

```
TopNPage (/topn)
    │
    ├─→ [Ver todas las rutas]
    │   └─→ RutaListPage (/rutas)
    │
    └─→ [Toca ruta]
        └─→ RutaDetailPage (/ruta/:id)
```

### Flujo desde Encuentros

```
EncuentroListPage (/encuentros)
    │
    ├─→ [Crear Encuentro] (solo artistas)
    │   └─→ CreateEncuentroPage (/encuentro/create)
    │
    └─→ [Toca encuentro]
        └─→ EncuentroDetailPage (/encuentro/:id)
            └─→ [Ver artista] → ArtistaProfilePage (/artista/:id)
```

### Flujo desde Artista Profile

```
ArtistaProfilePage (/artista/:id)
    │
    └─→ [Toca obra]
        └─→ ObraDetailPage (/obra/:id)
```

---

## 🔄 Flujos de Navegación Detallados

### Flujo 1: Crear Ruta desde Mapa

```
1. Usuario en MapaPage (/)
   ↓
2. Selecciona punto A en el mapa
   ↓
3. Selecciona punto B en el mapa
   ↓
4. Presiona botón "Crear Ruta"
   ↓
5. Se abre CreateRutaModal (modal)
   ├─ Paso 1: Puntos A y B (completado)
   ├─ Paso 2: Seleccionar obras
   ├─ Paso 3: Transporte y visibilidad
   ├─ Paso 4: Participantes
   └─ Paso 5: Revisión final
   ↓
6. Presiona "Crear Ruta"
   ↓
7. Modal se cierra, vuelve a MapaPage
```

### Flujo 2: Descubrir Obra

```
1. Usuario en MapaPage (/)
   ↓
2. Toca pin de obra en el mapa
   ↓
3. Se abre AppObraPreviewBottomSheet (modal)
   ↓
4. Toca "Ver más"
   ↓
5. Navega a ObraDetailPage (/obra/:id)
   ↓
6. Opciones:
   ├─ Toca "Ver artista" → ArtistaProfilePage (/artista/:id)
   ├─ Toca "Ver en mapa" → MapaPage (/) con obra centrada
   └─ Toca "Agregar a Top N" → Se guarda (no navega)
```

### Flujo 3: Publicar Obra (Artista)

```
1. Usuario en PerfilPage (/perfil)
   ↓
2. Toca "Publicar Obra" (solo visible para artistas)
   ↓
3. Navega a PublicarObraPage (/obra/publicar)
   ↓
4. Completa formulario:
   ├─ Toma/selecciona foto
   ├─ Información básica
   └─ Ubicación en mapa
   ↓
5. Presiona "Publicar"
   ↓
6. Vuelve a PerfilPage
   ↓
7. La obra aparece en el mapa y en su perfil
```

### Flujo 4: Crear Encuentro (Artista)

```
1. Usuario en PerfilPage (/perfil)
   ↓
2. Toca "Crear Encuentro" (solo visible para artistas)
   ↓
3. Navega a CreateEncuentroPage (/encuentro/create)
   ↓
4. Completa formulario:
   ├─ Ubicación
   ├─ Fecha y hora
   ├─ Descripción
   └─ Configuración de repetición (opcional)
   ↓
5. Presiona "Crear"
   ↓
6. Vuelve a PerfilPage
   ↓
7. El encuentro aparece en EncuentroListPage
```

---

## 📊 Estadísticas

### Páginas por Categoría

| Categoría | Cantidad | Estado |
|-----------|----------|--------|
| **Páginas Principales** | 15 | ✅ Activas |
| **Páginas de Preview** | 22 | 🎨 Solo desarrollo |
| **Páginas Obsoletas** | 4 | ❌ No usadas |
| **Modales/Bottom Sheets** | 3 | ✅ Activos |
| **Total** | 44 | - |

### Rutas Definidas

| Tipo | Cantidad |
|------|----------|
| **Rutas Principales** | 15 |
| **Rutas de Preview** | 22 |
| **Redirecciones** | 4 |
| **Total** | 41 |

---

## ⚠️ Problemas Identificados

### 1. Páginas Duplicadas/No Usadas

- **CreateRutaPage** existe pero **NO se usa**. Se usa `CreateRutaModal` en su lugar.
  - **Recomendación:** Eliminar `CreateRutaPage` o documentar por qué existe.

### 2. Páginas Obsoletas

- **Salida*** pages existen pero están obsoletas (reemplazadas por Encuentro*).
  - **Recomendación:** Eliminar `pages/salida/` completamente.

### 3. Páginas Placeholder

- **ObraListPage** solo tiene placeholder "Por implementar".
  - **Recomendación:** Implementar o eliminar.

---

## ✅ Recomendaciones

### Inmediatas

1. **Eliminar páginas obsoletas:**
   - `pages/salida/create_salida_page.dart`
   - `pages/salida/salida_detail_page.dart`
   - `pages/salida/salida_list_page.dart`

2. **Decidir sobre CreateRutaPage:**
   - Si no se va a usar, eliminarla
   - Si se va a usar, documentar cuándo y por qué

3. **Implementar o eliminar ObraListPage:**
   - Si no se necesita, eliminarla
   - Si se necesita, implementarla

### Futuras

1. **Documentar flujos de navegación** en código con comentarios
2. **Agregar tests de navegación** para asegurar que las rutas funcionan
3. **Considerar lazy loading** para páginas de preview (solo cargar en modo debug)

---

## 📝 Notas Técnicas

### Sistema de Navegación

- **GoRouter:** Se usa `go_router` para manejo de rutas
- **Navegación:** 
  - `context.go()` - Reemplaza la ruta actual
  - `context.push()` - Apila nueva ruta
  - `Navigator.pop()` - Cierra modales/bottom sheets

### Bottom Navigation

- **4 secciones principales:**
  1. Perfil (índice 0)
  2. Explorar/Mapa (índice 1)
  3. Rutas (índice 2)
  4. Top N (índice 3)

### Modales vs Páginas

- **CreateRutaModal:** Se usa modal en lugar de página para mantener el mapa visible
- **AppObraPreviewBottomSheet:** Bottom sheet para preview rápido sin salir del mapa
- **AppFilterModal:** Modal para filtros sin perder contexto

---

## 🔗 Referencias

- **Router:** `lib/presentation/routes/app_router.dart`
- **Layout Principal:** `lib/presentation/layouts/main_layout.dart`
- **Bottom Navigation:** `lib/presentation/widgets/app_bars/app_bottom_nav.dart`

---

*Documento generado automáticamente*  
*Última actualización: Diciembre 2025*
