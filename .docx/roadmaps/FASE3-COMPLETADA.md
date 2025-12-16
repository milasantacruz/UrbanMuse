# ✅ Fase 3: Domain Layer - Entidades - COMPLETADA

**Fecha de finalización:** 12 de Diciembre, 2025  
**Tiempo estimado:** 5-7 horas  
**Tiempo real:** ~4 horas

---

## 📋 Tareas Completadas

### ✅ T3.1: Entidad Obra
- [x] `lib/domain/entities/obra.dart` actualizado:
  - [x] Propiedades existentes mantenidas: id, titulo, artistaId, artistaNombre, categoria, ubicacion, foto, fecha, likes
  - [x] **NUEVO:** `fechaPublicacion` (DateTime?) - Fecha en que el artista publicó la obra
  - [x] **NUEVO:** `puedeEliminar` (bool) - Indica si el usuario actual puede eliminar esta obra
  - [x] Agregado `copyWith()` para inmutabilidad
  - [x] Equals y hashCode con equatable ✅

### ✅ T3.2: Entidad Artista
- [x] `lib/domain/entities/artista.dart` actualizado:
  - [x] Propiedades: id, nombre, bio, foto, instagram, obrasCount
  - [x] Agregado `copyWith()` para consistencia
  - [x] Equals y hashCode con equatable ✅

### ✅ T3.3: Entidad Ruta
- [x] `lib/domain/entities/ruta.dart` completamente actualizado:
  - [x] Propiedades básicas: id, nombre, puntoA, puntoB, obraIds, ordenVisita
  - [x] Cálculos: distancia, tiempoEstimado
  - [x] **NUEVO:** `modoTransporte` (enum ModoTransporte: bici, aPie)
  - [x] **NUEVO:** `tipo` (enum TipoRuta: privada, publicaEstatica, publicaDinamica)
  - [x] **NUEVO:** `creadorId` (String) - ID del usuario que creó la ruta
  - [x] **NUEVO (si es dinámica):** rrule (String?), fechaInicial (DateTime?), hora (TimeOfDay?)
  - [x] **NUEVO (si es pública y dinámica):** asistentesIds (List<String>)
  - [x] Agregado `copyWith()` para inmutabilidad
  - [x] Equals y hashCode con equatable ✅
  - [x] Helpers: `esPublica`, `esDinamica`, `esPrivada` ✅

### ✅ T3.4: Entidad Encuentro
- [x] **NUEVO:** `lib/domain/entities/encuentro.dart` creado:
  - [x] Propiedades: id, artistaId, artistaNombre, ubicacion, fecha, hora, descripcion
  - [x] creadorId (String) - ID del artista que creó el encuentro
  - [x] rrule (String?) - Regla de repetición si es repetitivo
  - [x] asistentesIds (List<String>) - IDs de usuarios que se unieron
  - [x] fechaCreacion (DateTime)
  - [x] cancelado (bool) - Indica si el encuentro está cancelado
  - [x] Agregado `copyWith()` para inmutabilidad
  - [x] Equals y hashCode con equatable ✅
  - [x] Helpers: `esRepetitivo`, `esUnico` ✅

### ✅ T3.5: Entidad Usuario
- [x] **NUEVO:** `lib/domain/entities/usuario.dart` creado:
  - [x] Propiedades: id, nombre, email, foto
  - [x] **NUEVO:** `tipoUsuario` (enum TipoUsuario: visitante, artista)
  - [x] fechaRegistro (DateTime)
  - [x] artistaId (String?) - Solo si es artista, coincide con el id del perfil de Artista
  - [x] Agregado `copyWith()` para inmutabilidad
  - [x] Equals y hashCode con equatable ✅
  - [x] Helpers: `esArtista`, `esVisitante` ✅

### ✅ T3.6: Entidad Ubicacion (Mejora)
- [x] `lib/domain/entities/ubicacion.dart` actualizado:
  - [x] Propiedades: lat, lng, direccion, barrio
  - [x] **NUEVO:** `estaEnCABA` getter - Valida que la ubicación esté dentro de los límites de CABA
  - [x] Agregado `copyWith()` para consistencia
  - [x] Equals y hashCode con equatable ✅

---

## 🔧 Mejoras Realizadas

### Enums Creados:
- **TipoRuta:** privada, publicaEstatica, publicaDinamica
- **ModoTransporte:** bici, aPie
- **TipoUsuario:** visitante, artista

### Métodos copyWith():
- Todas las entidades ahora tienen `copyWith()` para facilitar la inmutabilidad y actualizaciones

### Helpers Agregados:
- **Ruta:** `esPublica`, `esDinamica`, `esPrivada`
- **Encuentro:** `esRepetitivo`, `esUnico`
- **Usuario:** `esArtista`, `esVisitante`
- **Ubicacion:** `estaEnCABA`

### Validaciones:
- **Ubicacion:** Validación de límites de CABA usando `AppConstants`

---

## 📊 Estado del Proyecto

### ✅ Entidades Implementadas:
- ✅ Obra (actualizada)
- ✅ Artista (actualizada)
- ✅ Ruta (completamente actualizada)
- ✅ Encuentro (nueva)
- ✅ Usuario (nueva)
- ✅ Ubicacion (mejorada)

### 📁 Archivos Creados/Modificados:
- `lib/domain/entities/obra.dart` - Actualizado
- `lib/domain/entities/artista.dart` - Actualizado
- `lib/domain/entities/ruta.dart` - Actualizado
- `lib/domain/entities/encuentro.dart` - **NUEVO**
- `lib/domain/entities/usuario.dart` - **NUEVO**
- `lib/domain/entities/ubicacion.dart` - Actualizado

### ⚠️ Notas:
- `salida_grupal.dart` existe pero será reemplazado por `encuentro.dart` en futuras fases
- Todas las entidades usan `equatable` para comparaciones
- Todas las entidades son inmutables con `copyWith()`

---

## 🎯 Próximos Pasos

**Fase 4: Domain Layer - Repositorios**
- T4.1: Actualizar interfaces de repositorios
- T4.2: TopNRepository (reemplaza Top10Repository)
- T4.3: EncuentroRepository (reemplaza SalidaRepository)
- T4.4: PublicarObraRepository (nuevo)
- T4.5: UsuarioRepository (nuevo)

---

*Fase completada exitosamente* ✅

