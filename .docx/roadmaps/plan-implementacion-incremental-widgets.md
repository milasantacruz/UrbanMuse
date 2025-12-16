# 📋 Plan de Implementación Incremental - Reemplazo de Widgets Nativos

## 🎯 Objetivo

Reemplazar todos los widgets nativos de Flutter por widgets personalizados desarrollados en la etapa de preview para garantizar la fidelidad con el prototipo de Figma.

---

## 📊 Resumen Ejecutivo

### Estado Actual
- **Páginas auditadas:** 15 páginas principales
- **Widgets nativos identificados:** 7 tipos principales
- **Widgets personalizados disponibles:** 20+ widgets custom
- **Páginas que cumplen requisitos:** 3/15 (20%)
- **Páginas que requieren cambios:** 12/15 (80%)

### Widgets Nativos a Reemplazar
1. `TextButton` → `AppButton.text`
2. `OutlinedButton` → `AppButton.primaryOutlined`
3. `IconButton` → `AppButton` con variantes apropiadas
4. `Container` (con gestos) → Widgets custom específicos
5. `InkWell` → Widgets custom con gestos
6. `CheckboxListTile` → Widget custom (a crear)
7. `Card` → `AppObraCard` u otros widgets custom según contexto

---

## 🗺️ Fases de Implementación

### **FASE 1: Preparación y Widgets Faltantes** (3-5 días)

#### Tarea 1.1: Crear Widgets Faltantes
**Prioridad:** Alta  
**Tiempo estimado:** 2-3 días

##### Widget: `AppCheckboxListTile`
**Ubicación:** `urbanmuse/lib/presentation/widgets/forms/app_checkbox_list_tile.dart`

**Requisitos:**
- Debe seguir el diseño de Figma
- Debe usar el tema de la app (Material 3)
- Debe soportar estados: enabled, disabled, checked, unchecked
- Debe tener animaciones suaves

**Código base sugerido:**
```dart
class AppCheckboxListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;
  final Widget? leading;
  
  const AppCheckboxListTile({
    Key? key,
    required this.title,
    this.subtitle,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implementación siguiendo diseño Figma
  }
}
```

##### Widget: `AppClickableContainer`
**Ubicación:** `urbanmuse/lib/presentation/widgets/common/app_clickable_container.dart`

**Requisitos:**
- Reemplazo para `Container` con `InkWell` o `GestureDetector`
- Debe seguir el diseño de Figma
- Debe tener efectos visuales (ripple, elevation, etc.)

**Código base sugerido:**
```dart
class AppClickableContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final double? elevation;
  final BorderRadius? borderRadius;
  
  const AppClickableContainer({
    Key? key,
    required this.child,
    this.onTap,
    this.padding,
    this.margin,
    this.color,
    this.elevation,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Implementación siguiendo diseño Figma
  }
}
```

#### Tarea 1.2: Documentar Widgets Existentes
**Prioridad:** Media  
**Tiempo estimado:** 1 día

- Crear documentación de uso para cada widget custom
- Incluir ejemplos de código
- Documentar variantes y parámetros

#### Tarea 1.3: Crear Tests Unitarios Base
**Prioridad:** Media  
**Tiempo estimado:** 1 día

- Tests básicos para widgets nuevos
- Tests de regresión para widgets existentes

---

### **FASE 2: Páginas de Navegación Principal** (4-6 días)

#### Tarea 2.1: `MapaPage`
**Prioridad:** Alta  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/mapa/mapa_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.map` (correcto)
- ✅ Ya usa `CustomMap` (correcto)
- ✅ Ya usa `AppMapBar` (correcto)
- ✅ Ya usa `AppFAB` (correcto)
- ❌ Reemplazar `IconButton` en acciones del mapa → `AppButton` con variante apropiada
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Código de ejemplo:**
```dart
// ANTES
IconButton(
  icon: Icon(Icons.my_location),
  onPressed: () => _centerMap(),
)

// DESPUÉS
AppButton.text(
  leftIcon: Icon(Icons.my_location, size: 20),
  onPressed: () => _centerMap(),
)
```

**Criterios de aceptación:**
- [ ] No quedan `IconButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 2.2: `FeedPage`
**Prioridad:** Alta  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/feed/feed_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.home` (correcto)
- ✅ Ya usa `AppObraCard` (correcto)
- ✅ Ya usa `AppSearchBar` (correcto)
- ✅ Ya usa `AppFilterModal` (correcto)
- ❌ Reemplazar `TextButton` en filtros → `AppButton.text`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Código de ejemplo:**
```dart
// ANTES
TextButton(
  onPressed: () => _showFilters(),
  child: Text('Filtros'),
)

// DESPUÉS
AppButton.text(
  label: 'Filtros',
  onPressed: () => _showFilters(),
)
```

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 2.3: `PerfilPage`
**Prioridad:** Alta  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/perfil/perfil_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.detail` (correcto)
- ✅ Ya usa `AppAvatar` (correcto)
- ❌ Reemplazar `OutlinedButton` en acciones → `AppButton.primaryOutlined`
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Código de ejemplo:**
```dart
// ANTES
OutlinedButton(
  onPressed: () => _editProfile(),
  child: Text('Editar perfil'),
)

// DESPUÉS
AppButton.primaryOutlined(
  label: 'Editar perfil',
  onPressed: () => _editProfile(),
)
```

**Criterios de aceptación:**
- [ ] No quedan `OutlinedButton` nativos
- [ ] No quedan `TextButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

### **FASE 3: Páginas de Detalle** (5-7 días)

#### Tarea 3.1: `ObraDetailPage`
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 días  
**Archivo:** `urbanmuse/lib/presentation/pages/obra/obra_detail_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.detail` (correcto)
- ✅ Ya usa `AppObraDetailHeader` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ❌ Reemplazar `IconButton` en acciones → `AppButton` con variante apropiada
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica
- ❌ Revisar `InkWell` → Widgets custom apropiados

**Criterios de aceptación:**
- [ ] No quedan `IconButton` nativos
- [ ] No quedan `InkWell` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 3.2: `ArtistaProfilePage`
**Prioridad:** Alta  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/artista/artista_profile_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.detail` (correcto)
- ✅ Ya usa `AppAvatar` (correcto)
- ✅ Ya usa `AppArtistCard` (correcto)
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Reemplazar `OutlinedButton` → `AppButton.primaryOutlined`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] No quedan `OutlinedButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 3.3: `RutaDetailPage`
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 días  
**Archivo:** `urbanmuse/lib/presentation/pages/ruta/ruta_detail_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.detail` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ❌ Reemplazar `IconButton` → `AppButton` con variante apropiada
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica
- ❌ Revisar `Card` → `AppObraCard` u otro widget custom según contexto

**Criterios de aceptación:**
- [ ] No quedan `IconButton` nativos
- [ ] No quedan `Card` nativos (excepto donde sea necesario para estructura)
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 3.4: `EncuentroDetailPage`
**Prioridad:** Media  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/encuentro/encuentro_detail_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.detail` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

### **FASE 4: Páginas de Listado** (3-4 días)

#### Tarea 4.1: `RutaListPage`
**Prioridad:** Alta  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/ruta/ruta_list_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.home` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica
- ❌ Revisar `Card` → Widgets custom apropiados

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] No quedan `Card` nativos (excepto donde sea necesario para estructura)
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 4.2: `EncuentroListPage`
**Prioridad:** Media  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/encuentro/encuentro_list_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.home` (correcto)
- ✅ Ya usa `EncuentroCard` (correcto)
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 4.3: `TopNPage`
**Prioridad:** Media  
**Tiempo estimado:** 1 día  
**Archivo:** `urbanmuse/lib/presentation/pages/topn/topn_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.detail` (correcto)
- ✅ Ya usa `AppTopNItem` (correcto)
- ✅ Ya usa `AppObraCard` (correcto)
- ❌ Reemplazar `IconButton` → `AppButton` con variante apropiada
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Criterios de aceptación:**
- [ ] No quedan `IconButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

### **FASE 5: Páginas de Creación/Edición** (4-6 días)

#### Tarea 5.1: `CreateRutaModal`
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 días  
**Archivo:** `urbanmuse/lib/presentation/widgets/modals/create_ruta_modal.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.create` (correcto)
- ✅ Ya usa `AppRouteStepIndicator` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ❌ Reemplazar `TextButton` en pasos → `AppButton.text`
- ❌ Reemplazar `RadioListTile` → Widget custom (si existe) o mantener si no hay alternativa
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Código de ejemplo:**
```dart
// ANTES
TextButton(
  onPressed: () => _previousStep(),
  child: Text('Atrás'),
)

// DESPUÉS
AppButton.text(
  label: 'Atrás',
  onPressed: () => _previousStep(),
)
```

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] El modal mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 5.2: `CreateEncuentroPage`
**Prioridad:** Media  
**Tiempo estimado:** 1-2 días  
**Archivo:** `urbanmuse/lib/presentation/pages/encuentro/create_encuentro_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.create` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ✅ Ya usa `RRuleSelector` (correcto)
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Reemplazar `CheckboxListTile` → `AppCheckboxListTile` (nuevo widget)
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Código de ejemplo:**
```dart
// ANTES
CheckboxListTile(
  title: Text('Recordatorio'),
  value: _hasReminder,
  onChanged: (value) => setState(() => _hasReminder = value!),
)

// DESPUÉS
AppCheckboxListTile(
  title: 'Recordatorio',
  value: _hasReminder,
  onChanged: (value) => setState(() => _hasReminder = value ?? false),
)
```

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] No quedan `CheckboxListTile` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

#### Tarea 5.3: `PublicarObraPage`
**Prioridad:** Media  
**Tiempo estimado:** 1-2 días  
**Archivo:** `urbanmuse/lib/presentation/pages/obra/publicar_obra_page.dart`

**Cambios requeridos:**
- ✅ Ya usa `AppTopBar.create` (correcto)
- ✅ Ya usa `FotoUploader` (correcto)
- ✅ Ya usa `InformacionForm` (correcto)
- ✅ Ya usa `UbicacionSelector` (correcto)
- ✅ Ya usa `AppButton` (correcto)
- ❌ Reemplazar `TextButton` → `AppButton.text`
- ❌ Revisar `Container` con gestos → `AppClickableContainer` si aplica

**Criterios de aceptación:**
- [ ] No quedan `TextButton` nativos
- [ ] Todos los gestos usan widgets custom
- [ ] La página mantiene funcionalidad actual
- [ ] Diseño coincide con Figma

---

### **FASE 6: Modales y Componentes Adicionales** (2-3 días)

#### Tarea 6.1: Revisar Modales Restantes
**Prioridad:** Media  
**Tiempo estimado:** 1 día

- Revisar `AppFilterModal` (ya usa widgets custom)
- Revisar otros modales que puedan existir
- Asegurar consistencia en todos los modales

#### Tarea 6.2: Revisar Widgets Compuestos
**Prioridad:** Media  
**Tiempo estimado:** 1 día

- Revisar widgets que contengan widgets nativos internamente
- Asegurar que todos los widgets compuestos usen solo widgets custom

#### Tarea 6.3: Limpieza Final
**Prioridad:** Baja  
**Tiempo estimado:** 1 día

- Eliminar imports no utilizados
- Revisar código muerto
- Optimizar imports

---

## 📝 Checklist de Verificación por Página

Para cada página, verificar:

- [ ] No hay `TextButton` nativos
- [ ] No hay `OutlinedButton` nativos
- [ ] No hay `IconButton` nativos (excepto donde sea necesario para estructura interna)
- [ ] No hay `InkWell` nativos
- [ ] No hay `CheckboxListTile` nativos
- [ ] No hay `Card` nativos (excepto donde sea necesario para estructura)
- [ ] No hay `Container` con gestos directos (usar `AppClickableContainer`)
- [ ] Todos los widgets custom siguen el diseño de Figma
- [ ] La funcionalidad se mantiene intacta
- [ ] No hay errores de linter
- [ ] La página se ve correcta en diferentes tamaños de pantalla

---

## 🧪 Estrategia de Testing

### Tests Unitarios
- Crear tests para widgets nuevos (`AppCheckboxListTile`, `AppClickableContainer`)
- Actualizar tests existentes si es necesario

### Tests de Integración
- Verificar que cada página mantiene su funcionalidad después de los cambios
- Verificar que la navegación sigue funcionando correctamente

### Tests Visuales
- Comparar cada página con el diseño de Figma
- Verificar en diferentes tamaños de pantalla
- Verificar en modo claro y oscuro (si aplica)

---

## 📅 Cronograma Estimado

| Fase | Tareas | Duración | Dependencias |
|------|--------|----------|--------------|
| **Fase 1** | Preparación y Widgets Faltantes | 3-5 días | - |
| **Fase 2** | Páginas de Navegación Principal | 4-6 días | Fase 1 |
| **Fase 3** | Páginas de Detalle | 5-7 días | Fase 1 |
| **Fase 4** | Páginas de Listado | 3-4 días | Fase 1 |
| **Fase 5** | Páginas de Creación/Edición | 4-6 días | Fase 1 |
| **Fase 6** | Modales y Componentes Adicionales | 2-3 días | Fases 2-5 |
| **TOTAL** | | **21-31 días** | |

---

## 🎯 Criterios de Éxito

1. **100% de páginas principales** usan exclusivamente widgets custom
2. **0 widgets nativos** de la lista de reemplazo en páginas principales
3. **Fidelidad 100%** con el diseño de Figma
4. **Funcionalidad intacta** en todas las páginas
5. **Sin errores de linter** en el código modificado
6. **Performance mantenida** o mejorada

---

## 📚 Referencias

- **Auditoría de Páginas:** `.docx/arquitectura/auditoria-paginas-rutas.md`
- **Mapa de Flujo:** `.docx/arquitectura/mapa-flujo-navegacion.md`
- **Widgets Custom:** `urbanmuse/lib/presentation/widgets/`
- **Diseño Figma:** [Enlace al prototipo]

---

## 🔄 Proceso de Revisión

1. **Cada tarea debe ser revisada** antes de pasar a la siguiente
2. **Cada fase debe ser aprobada** antes de comenzar la siguiente
3. **Tests deben pasar** antes de marcar una tarea como completa
4. **Comparación con Figma** debe realizarse para cada página modificada

---

## 📝 Notas Adicionales

- **Priorizar páginas de alta prioridad** primero
- **Mantener commits pequeños y descriptivos**
- **Documentar decisiones de diseño** si se desvía del plan
- **Comunicar bloqueadores** inmediatamente
- **Actualizar este documento** si se encuentran widgets nativos adicionales

---

**Última actualización:** [Fecha]  
**Responsable:** [Nombre del desarrollador]  
**Estado:** Pendiente de inicio
