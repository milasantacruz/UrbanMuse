# 📝 TodoList de Implementación - Graffiti Trails MVP1

**Versión:** 2.0 - Actualizado con nuevos enfoques  
**Fecha:** Diciembre 2025  
**Alcance:** Buenos Aires (CABA), Rutas en Bici, Artistas/Visitantes, Top N de Rutas

## 🎯 Objetivo

Implementar MVP1 de Graffiti Trails siguiendo Clean Architecture + BLoC, con los nuevos enfoques:
- **Ubicación:** Buenos Aires (CABA) específicamente
- **Transporte:** Principalmente bici (también a pie)
- **Tipos de usuario:** Artista y Visitante
- **Top N:** Rutas favoritas (máximo 10), no obras
- **Rutas:** Privadas, públicas estáticas, públicas dinámicas (eventos repetitivos con rrule)
- **Nuevas funcionalidades:** Publicación de obras (Artistas), Encuentros de artistas

**Referencias:**
- `architecture.md` - Arquitectura técnica
- `requirements.md` - Requerimientos funcionales
- `CHANGELOG-enfoques.md` - Cambios y nuevos enfoques
- `roadmap-implementacion-incremental.md` - Roadmap por fases

---

## 📋 Fase 1: Setup y Configuración Base ✅ **COMPLETADA**

### T1.1: Configuración Inicial del Proyecto ✅
- [x] Crear proyecto Flutter: `flutter create graffiti_trails`
- [x] Configurar `pubspec.yaml` con todas las dependencias del tech-stack
  - [x] **NUEVO:** Agregar `rrule: ^0.2.17` para eventos repetitivos
  - [x] **NUEVO:** Agregar `intl: ^0.19.0` para manejo de fechas/horas
  - [x] Verificar dependencias existentes: `flutter_bloc`, `get_it`, `go_router`, `hive`, `dio`, etc.
- [x] Configurar estructura de carpetas según architecture.md
- [x] Configurar `analysis_options.yaml` con flutter_lints
- [x] Configurar `.gitignore` apropiado
- [x] Crear archivo `README.md` básico

**Estimación:** 1-2 horas  
**Dependencias:** Ninguna  
**Estado:** ✅ Completada

---

### T1.2: Configuración de Inyección de Dependencias ✅
- [x] Crear `lib/core/injection/injection_container.dart`
- [x] Configurar get_it con registro de dependencias base
- [x] Crear función `init()` para inicialización
- [x] Configurar en `main.dart`

**Estimación:** 1 hora  
**Dependencias:** T1.1  
**Estado:** ✅ Completada (ya existía)

---

### T1.3: Configuración de Tema y Design Tokens ✅
- [x] Crear `lib/core/theme/app_theme.dart`
- [x] Implementar colores según design-system.md
- [x] Implementar tipografía según design-system.md
- [x] Implementar espaciado (8px base)
- [x] Crear `app_colors.dart`, `app_text_styles.dart`, `app_spacing.dart`
- [x] Configurar tema en `main.dart`
- [x] **Actualizado:** Constantes agregadas en `app_constants.dart`:
  - [x] Top N de rutas (máximo 10)
  - [x] Tipos de usuario (visitante/artista)
  - [x] Tipos de ruta (privada/pública estática/pública dinámica)
  - [x] Límites geográficos de Buenos Aires (CABA)
  - [x] Modo de transporte (bici/a pie)
  - [x] Repeticiones (diario/semanal/mensual/anual)

**Estimación:** 2-3 horas  
**Dependencias:** T1.1  
**Estado:** ✅ Completada

---

### T1.4: Configuración de Rutas ✅
- [x] Crear `lib/presentation/routes/app_router.dart`
- [x] Configurar go_router con rutas básicas
- [x] Definir rutas principales:
  - [x] `/` (MapaPage)
  - [x] `/feed` (FeedPage)
  - [x] `/topn` (TopNPage - rutas favoritas) - **NUEVO**
  - [x] `/top10` (redirige a `/topn`) - **Compatibilidad**
  - [x] `/obra/:id` (ObraDetailPage)
  - [x] `/artista/:id` (ArtistaProfilePage)
  - [x] `/ruta/create` (CreateRutaPage - 6 pasos)
  - [x] `/ruta/:id` (RutaDetailPage)
  - [x] `/ruta/list` (RutaListPage)
  - [x] `/obra/publicar` (PublicarObraPage - 4 pasos, solo Artistas) - **TODO: Comentado**
  - [x] `/encuentro/create` (CrearEncuentroPage, solo Artistas) - **TODO: Comentado**
  - [x] `/encuentro/:id` (EncuentroDetailPage) - **TODO: Comentado**
- [x] Configurar en `main.dart`
- [x] **Nota:** El router ya existe, actualizado con nuevas rutas

**Estimación:** 1-2 horas  
**Dependencias:** T1.1, T1.2  
**Estado:** ✅ Completada

---

## 📋 Fase 2: Core y Utilidades ✅ **COMPLETADA**

### T2.1: Manejo de Errores ✅
- [x] Crear `lib/core/errors/failures.dart` con clases de error
- [x] Crear `lib/core/errors/exceptions.dart`
- [x] Implementar ServerFailure, CacheFailure, NetworkFailure, ValidationFailure, GenericFailure
- [x] Crear mappers de Exception a Failure - **NUEVO:** `exception_mapper.dart`

**Estimación:** 1 hora  
**Dependencias:** T1.1  
**Estado:** ✅ Completada

---

### T2.2: Configuración de Red ✅
- [x] Crear `lib/core/network/dio_client.dart`
- [x] Configurar Dio con timeouts e interceptors
- [x] Crear `lib/core/network/network_info.dart` (mock para MVP1)
- [x] Crear `lib/core/network/api_endpoints.dart` con URLs
- [x] **Actualizado:** ApiEndpoints con nuevos endpoints:
  - [x] Rutas (públicas, dinámicas, join/leave)
  - [x] Top N (rutas favoritas)
  - [x] Encuentros (crear, unirse, cancelar)
  - [x] Publicar Obra (solo artistas)
  - [x] Usuario (registro, login, update)

**Estimación:** 2 horas  
**Dependencias:** T1.1, T2.1  
**Estado:** ✅ Completada

---

### T2.3: Utilidades Generales ✅ (Completada en Fase 1)
- [x] Crear `lib/core/utils/constants.dart` con constantes de la app
  - [x] Constante `BUENOS_AIRES_BOUNDS` (límites geográficos de CABA) - **En app_constants.dart**
  - [x] Constante `MAX_TOP_N_RUTAS = 10` - **En app_constants.dart**
  - [x] Constante `TIPOS_USUARIO = ['visitante', 'artista']` - **En app_constants.dart**
- [x] Crear `lib/core/utils/validators.dart` para validaciones
  - [x] Validar ubicación dentro de CABA - **validarUbicacionCABA()**
  - [x] Validar tipo de usuario - **validarTipoUsuario()**
  - [x] Validar límite de Top N - **validarLimiteTopN()**
  - [x] Validar modo de transporte - **validarModoTranporte()**
  - [x] Validar tipo de ruta - **validarTipoRuta()**
  - [x] Validar fecha futura - **validarFechaFutura()**
  - [x] Validar rrule - **validarRRule()**
- [x] Crear `lib/core/utils/date_formatter.dart` - **Ya existe**
- [x] Crear `lib/core/utils/distance_calculator.dart` (para rutas) - **Ya existe**
  - [x] Calcular distancia entre puntos
  - [x] Calcular tiempo estimado según modo transporte (bici/a pie)
- [x] Crear `lib/core/utils/rrule_helper.dart` (wrapper para librería rrule)
  - [x] Helper para crear reglas de repetición (diario/semanal/mensual/anual) - **crearReglaRepeticion()**
  - [x] Helper para calcular próximas fechas de eventos - **calcularProximasFechas()**
  - [x] Helper para validar reglas - **validarRegla()**
  - [x] Helper para formatear a texto - **formatearReglaATexto()**
  - [x] Helper para obtener tipo de repetición - **obtenerTipoRepeticion()**

**Estimación:** 2 horas  
**Dependencias:** T1.1  
**Estado:** ✅ Completada

---

## 📋 Fase 3: Domain Layer - Entidades ✅ **COMPLETADA**

### T3.1: Entidad Obra ✅
- [x] `lib/domain/entities/ubicacion.dart` ya existía, actualizado:
  - [x] Propiedades: lat, lng, direccion, barrio (CABA)
  - [x] Validar que esté dentro de límites de Buenos Aires - **NUEVO:** `estaEnCABA` getter
  - [x] Agregado `copyWith()` para consistencia
- [x] `lib/domain/entities/obra.dart` actualizado:
  - [x] Propiedades existentes: id, titulo, artistaId, artistaNombre, categoria, ubicacion, foto, fecha, likes
  - [x] **NUEVO:** fechaPublicacion (DateTime?)
  - [x] **NUEVO:** puedeEliminar (bool)
  - [x] Agregado `copyWith()` para inmutabilidad
  - [x] Equals y hashCode con equatable ✅

**Estimación:** 1 hora  
**Dependencias:** T1.1  
**Estado:** ✅ Completada

---

### T3.2: Entidad Artista ✅
- [x] `lib/domain/entities/artista.dart` ya existía, actualizado:
  - [x] Propiedades: id, nombre, bio, foto, instagram, obrasCount
  - [x] Agregado `copyWith()` para consistencia
  - [x] Equals y hashCode con equatable ✅

**Estimación:** 1 hora  
**Dependencias:** T1.1, T3.1  
**Estado:** ✅ Completada

---

### T3.3: Entidad Ruta ✅
- [x] `lib/domain/entities/ruta.dart` actualizado:
  - [x] **Básicas:** id, nombre, puntoA, puntoB, obraIds, ordenVisita
  - [x] **Cálculos:** distancia, tiempoEstimado
  - [x] **NUEVO:** modoTransporte (enum ModoTransporte: bici, aPie)
  - [x] **NUEVO:** tipo (enum TipoRuta: privada, publicaEstatica, publicaDinamica)
  - [x] **NUEVO (si es dinámica):** rrule (String?), fechaInicial (DateTime?), hora (TimeOfDay?)
  - [x] **NUEVO:** creadorId (String)
  - [x] **NUEVO (si es pública y dinámica):** asistentesIds (List<String>)
  - [x] fechaCreacion (DateTime)
  - [x] Agregado `copyWith()` para inmutabilidad
  - [x] Equals y hashCode con equatable ✅
  - [x] Helpers: esPublica, esDinamica, esPrivada ✅

**Estimación:** 2 horas  
**Dependencias:** T1.1, T3.1  
**Estado:** ✅ Completada

---

### T3.4: Entidad Encuentro ✅
- [x] Crear `lib/domain/entities/encuentro.dart` - **NUEVO**
- [x] Implementar propiedades:
  - [x] id, artistaId, artistaNombre, ubicacion, fecha, hora, descripcion
  - [x] creadorId (String)
  - [x] rrule (String?) - si es repetitivo
  - [x] asistentesIds (List<String>)
  - [x] fechaCreacion (DateTime)
  - [x] cancelado (bool)
- [x] Agregado `copyWith()` para inmutabilidad
- [x] Equals y hashCode con equatable ✅
- [x] Helpers: esRepetitivo, esUnico ✅

**Estimación:** 1 hora  
**Dependencias:** T1.1, T3.1  
**Estado:** ✅ Completada  
**Nota:** Reemplaza SalidaGrupal. Solo artistas pueden crear encuentros.

---

### T3.5: Entidad Usuario ✅
- [x] Crear `lib/domain/entities/usuario.dart` - **NUEVO**
- [x] Implementar propiedades:
  - [x] **Básicas:** id, nombre, email, foto, fechaRegistro
  - [x] **NUEVO:** tipoUsuario (enum TipoUsuario: visitante, artista)
  - [x] artistaId (String?) - Solo si es artista, coincide con el id del perfil de Artista
- [x] Agregado `copyWith()` para inmutabilidad
- [x] Equals y hashCode con equatable ✅
- [x] Helpers: esArtista, esVisitante ✅

**Estimación:** 1 hora  
**Dependencias:** T1.1  
**Estado:** ✅ Completada  
**Nota:** tipoUsuario: 'visitante' o 'artista' (no cambiable en MVP). Los IDs de rutas, encuentros y obras se manejan en repositorios separados.

---

## 📋 Fase 4: Domain Layer - Repositorios (Interfaces) ✅ **COMPLETADA**

### T4.1: ObraRepository Interface ✅
- [x] `lib/domain/repositories/obra_repository.dart` ya existía y está completo:
  - [x] getObras() ✅
  - [x] getObraById() ✅
  - [x] searchObras() ✅
  - [x] filterObras() ✅
  - [x] Retornan Future<Either<Failure, T>> ✅

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.1  
**Estado:** ✅ Completada (ya existía)

---

### T4.2: ArtistaRepository Interface ✅
- [x] `lib/domain/repositories/artista_repository.dart` ya existía y está completo:
  - [x] getArtistaById() ✅
  - [x] getObrasByArtista() ✅
  - [x] Retornan Future<Either<Failure, T>> ✅

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.2  
**Estado:** ✅ Completada (ya existía)

---

### T4.3: RutaRepository Interface ✅
- [x] `lib/domain/repositories/ruta_repository.dart` actualizado:
  - [x] createRuta() ✅
  - [x] getRutas() ✅
  - [x] **NUEVO:** getRutasPublicas() ✅
  - [x] **NUEVO:** getRutasPublicasDinamicas() ✅
  - [x] getRutaById() ✅
  - [x] deleteRuta() ✅
  - [x] calculateRuta() (actualizado con modoTransporte) ✅
  - [x] **NUEVO:** convertirADinamica() ✅
  - [x] **NUEVO:** joinRutaDinamica() ✅
  - [x] **NUEVO:** leaveRutaDinamica() ✅
  - [x] Retornan Future<Either<Failure, T>> ✅

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.3  
**Estado:** ✅ Completada

---

### T4.4: TopNRepository Interface ✅
- [x] Crear `lib/domain/repositories/topn_repository.dart` - **NUEVO**
- [x] Definir métodos:
  - [x] getTopN() - Obtener Top N de rutas (máximo 10) ✅
  - [x] addRutaToTopN() - Agregar ruta al Top N ✅
  - [x] removeRutaFromTopN() - Remover ruta del Top N ✅
  - [x] reorderTopN() - Reordenar Top N ✅
- [x] Retornan Future<Either<Failure, List<Ruta>>> ✅
- [x] **Nota:** Reemplaza Top10Repository que manejaba obras. Ahora maneja rutas.

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.3  
**Estado:** ✅ Completada

---

### T4.5: EncuentroRepository Interface ✅
- [x] Crear `lib/domain/repositories/encuentro_repository.dart` - **NUEVO**
- [x] Definir métodos:
  - [x] createEncuentro() - Solo artistas ✅
  - [x] getEncuentros() ✅
  - [x] getEncuentrosProximos() ✅
  - [x] getEncuentroById() ✅
  - [x] joinEncuentro() ✅
  - [x] cancelEncuentro() - Solo el creador ✅
  - [x] getEncuentrosByArtista() ✅
- [x] Retornan Future<Either<Failure, T>> ✅
- [x] **Nota:** Reemplaza SalidaRepository. Solo artistas pueden crear encuentros.

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.4  
**Estado:** ✅ Completada

---

### T4.6: PublicarObraRepository Interface ✅
- [x] Crear `lib/domain/repositories/publicar_obra_repository.dart` - **NUEVO**
- [x] Definir métodos:
  - [x] publicarObra() - Solo artistas, valida CABA ✅
  - [x] getObrasPublicadasPorArtista() ✅
  - [x] editarObra() - Solo el creador ✅
  - [x] eliminarObra() - Solo el creador ✅
  - [x] puedeEliminarObra() - Verificar permisos ✅
- [x] Retornan Future<Either<Failure, T>> ✅
- [x] **Nota:** Solo artistas pueden publicar obras.

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.1  
**Estado:** ✅ Completada

---

### T4.7: UsuarioRepository Interface ✅
- [x] Crear `lib/domain/repositories/usuario_repository.dart` - **NUEVO**
- [x] Definir métodos:
  - [x] getUsuarioById() ✅
  - [x] getUsuarioActual() ✅
  - [x] registrarUsuario() - Con tipoUsuario (visitante/artista) ✅
  - [x] updateUsuario() ✅
  - [x] esArtista() ✅
  - [x] esVisitante() ✅
- [x] Retornan Future<Either<Failure, T>> ✅

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.5  
**Estado:** ✅ Completada

---

## 📋 Fase 5: Domain Layer - Use Cases

### T5.1: Use Cases de Obra
- [ ] Crear `lib/domain/usecases/obra/get_obras.dart`
- [ ] Crear `lib/domain/usecases/obra/get_obra_by_id.dart`
- [ ] Crear `lib/domain/usecases/obra/search_obras.dart`
- [ ] Crear `lib/domain/usecases/obra/filter_obras.dart`
- [ ] Implementar lógica de negocio y retornar Either<Failure, T>

**Estimación:** 2-3 horas  
**Dependencias:** T4.1

---

### T5.2: Use Cases de Artista
- [ ] Crear `lib/domain/usecases/artista/get_artista_by_id.dart`
- [ ] Crear `lib/domain/usecases/artista/get_obras_by_artista.dart`
- [ ] Implementar lógica de negocio

**Estimación:** 1-2 horas  
**Dependencias:** T4.2

---

### T5.3: Use Cases de Ruta
- [ ] Crear `lib/domain/usecases/ruta/create_ruta.dart` (con soporte para privada/pública estática/pública dinámica)
- [ ] Crear `lib/domain/usecases/ruta/get_rutas.dart`
- [ ] Crear `lib/domain/usecases/ruta/get_rutas_publicas.dart`
- [ ] Crear `lib/domain/usecases/ruta/get_ruta_by_id.dart`
- [ ] Crear `lib/domain/usecases/ruta/delete_ruta.dart`
- [ ] Crear `lib/domain/usecases/ruta/convertir_a_dinamica.dart`
- [ ] Crear `lib/domain/usecases/ruta/join_ruta_dinamica.dart`
- [ ] Crear `lib/domain/usecases/ruta/calculate_ruta.dart` (cálculo básico con modo transporte)
- [ ] Implementar lógica de negocio (validar rrule, calcular eventos futuros, etc.)

**Estimación:** 5-6 horas  
**Dependencias:** T4.3, T2.3  
**Nota:** Incluye soporte para rutas dinámicas con rrule y eventos repetitivos

---

### T5.4: Use Cases de Top 10
- [ ] Crear `lib/domain/usecases/top10/get_top10.dart`
- [ ] Crear `lib/domain/usecases/top10/add_to_top10.dart`
- [ ] Crear `lib/domain/usecases/top10/remove_from_top10.dart`
- [ ] Crear `lib/domain/usecases/top10/reorder_top10.dart`
- [ ] Implementar validaciones (máximo 10, no duplicados)

**Estimación:** 2-3 horas  
**Dependencias:** T4.4

---

### T5.5: Use Cases de Encuentro
- [ ] Crear `lib/domain/usecases/encuentro/create_encuentro.dart`
- [ ] Crear `lib/domain/usecases/encuentro/get_encuentros.dart`
- [ ] Crear `lib/domain/usecases/encuentro/get_encuentros_proximos.dart`
- [ ] Crear `lib/domain/usecases/encuentro/join_encuentro.dart`
- [ ] Crear `lib/domain/usecases/encuentro/cancel_encuentro.dart`
- [ ] Implementar validaciones (fecha futura, solo artistas pueden crear, etc.)

**Estimación:** 3 horas  
**Dependencias:** T4.5  
**Nota:** Reemplaza Use Cases de Salida. Solo artistas pueden crear encuentros.

---

### T5.6: Use Cases de Publicar Obra
- [ ] Crear `lib/domain/usecases/publicar_obra/publicar_obra.dart`
- [ ] Crear `lib/domain/usecases/publicar_obra/get_obras_publicadas.dart`
- [ ] Crear `lib/domain/usecases/publicar_obra/editar_obra.dart`
- [ ] Crear `lib/domain/usecases/publicar_obra/eliminar_obra.dart`
- [ ] Implementar validaciones (solo artistas, ubicación en CABA, etc.)

**Estimación:** 2-3 horas  
**Dependencias:** T4.6

---

## 📋 Fase 6: Data Layer - Models

### T6.1: Model Obra
- [ ] Crear `lib/data/models/obra_model.dart`
- [ ] Extender de Obra entity
- [ ] Implementar `fromJson` y `toJson`
- [ ] Agregar anotaciones json_serializable
- [ ] Ejecutar build_runner

**Estimación:** 1-2 horas  
**Dependencias:** T3.1

---

### T6.2: Model Artista
- [ ] Crear `lib/data/models/artista_model.dart`
- [ ] Extender de Artista entity
- [ ] Implementar serialización JSON
- [ ] Ejecutar build_runner

**Estimación:** 1 hora  
**Dependencias:** T3.2, T6.1

---

### T6.3: Model Ruta
- [ ] Crear `lib/data/models/ruta_model.dart`
- [ ] Extender de Ruta entity
- [ ] Implementar serialización JSON
- [ ] Ejecutar build_runner

**Estimación:** 1 hora  
**Dependencias:** T3.3, T6.1

---

### T6.4: Model Salida
- [ ] Crear `lib/data/models/salida_model.dart`
- [ ] Extender de SalidaGrupal entity
- [ ] Implementar serialización JSON
- [ ] Ejecutar build_runner

**Estimación:** 1 hora  
**Dependencias:** T3.4, T6.3

---

## 📋 Fase 7: Data Layer - Data Sources ✅ **COMPLETADA**

### T7.1: Configuración de Hive ✅
- [x] Configurar Hive en `injection_container.dart` usando `HiveService`
- [x] Crear `HiveService` para gestionar boxes
- [x] Crear boxes: obras_box, artistas_box, rutas_box, topn_box, encuentros_box, usuario_box
- [x] **Nota:** Para MVP1, usamos Box<Map> en lugar de adapters específicos (más flexible)

**Estimación:** 2-3 horas  
**Dependencias:** T6.1, T6.2, T6.3, T6.4, T6.5  
**Estado:** ✅ Completada  
**Nota:** topn_box reemplaza top10_box (ahora guarda rutas, no obras)

---

### T7.2: ObraLocalDataSource ✅
- [x] Crear `lib/data/datasources/local/obra_local_datasource.dart`
- [x] Implementar métodos: getObras(), getObraById(), cacheObras(), cacheObra()
- [x] Usar Hive para almacenamiento
- [x] Manejo de errores con CacheException

**Estimación:** 2 horas  
**Dependencias:** T7.1  
**Estado:** ✅ Completada

---

### T7.3: ObraRemoteDataSource ✅
- [x] Crear `lib/data/datasources/remote/obra_remote_datasource.dart`
- [x] Implementar métodos: getObras(), getObraById(), searchObras(), filterObras()
- [x] Usar Dio para requests HTTP
- [x] Manejar parsing de JSON y errores con ServerException

**Estimación:** 2-3 horas  
**Dependencias:** T2.2, T6.1  
**Estado:** ✅ Completada

---

### T7.4: ArtistaLocalDataSource y RemoteDataSource ✅
- [x] Crear `artista_local_datasource.dart` y `artista_remote_datasource.dart`
- [x] Implementar métodos similares a Obra
- [x] Integrar con Hive y Dio
- [x] Manejo de errores apropiado

**Estimación:** 2 horas  
**Dependencias:** T7.1, T7.2, T7.3, T6.2  
**Estado:** ✅ Completada

---

### T7.5: RutaLocalDataSource ✅
- [x] Crear `lib/data/datasources/local/ruta_local_datasource.dart`
- [x] Implementar CRUD completo: create, read, update, delete
- [x] **NUEVO:** getRutasPublicas() - Obtener rutas públicas estáticas
- [x] **NUEVO:** getRutasPublicasDinamicas() - Obtener rutas públicas dinámicas
- [x] Usar Hive para persistencia

**Estimación:** 2 horas  
**Dependencias:** T7.1, T6.3  
**Estado:** ✅ Completada

---

### T7.6: TopNLocalDataSource ✅
- [x] Crear `lib/data/datasources/local/topn_local_datasource.dart`
- [x] Implementar métodos: getTopN(), addRutaToTopN(), removeRutaFromTopN(), reorderTopN()
- [x] Validar límite de 10 rutas
- [x] Validar duplicados
- [x] Usar Hive (topn_box)

**Estimación:** 2 horas  
**Dependencias:** T7.1  
**Estado:** ✅ Completada  
**Nota:** Cambio: ahora maneja rutas (no obras)

---

### T7.7: EncuentroLocalDataSource ✅
- [x] Crear `lib/data/datasources/local/encuentro_local_datasource.dart`
- [x] Implementar CRUD para encuentros
- [x] getEncuentrosProximos() - Filtrar por fecha futura
- [x] getEncuentrosByArtista() - Obtener encuentros de un artista
- [x] joinEncuentro() - Unirse a encuentro (validar cancelado, duplicados)
- [x] cancelEncuentro() - Cancelar encuentro
- [x] Usar Hive (encuentros_box)

**Estimación:** 3 horas  
**Dependencias:** T7.1, T6.4  
**Estado:** ✅ Completada  
**Nota:** Reemplaza SalidaLocalDataSource. El cálculo de eventos futuros según rrule se hará en el repositorio.

---

### T7.8: UsuarioLocalDataSource ✅
- [x] Crear `lib/data/datasources/local/usuario_local_datasource.dart`
- [x] Implementar métodos: getUsuario(), saveUsuario(), updateUsuario(), clearUsuario()
- [x] Usar Hive (usuario_box, solo 1 registro con key 'current_user')

**Estimación:** 1 hora  
**Dependencias:** T7.1, T6.5  
**Estado:** ✅ Completada

---

## 📋 Fase 8: Data Layer - Repositories (Implementación) ✅ **COMPLETADA**

### T8.1: ObraRepositoryImpl ✅
- [x] Crear `lib/data/repositories/obra_repository_impl.dart`
- [x] Implementar ObraRepository interface
- [x] Lógica offline-first: intentar remote, fallback a local
- [x] Cachear datos localmente después de obtener de remote
- [x] Manejar errores y convertir a Failures con ExceptionMapper

**Estimación:** 3 horas  
**Dependencias:** T4.1, T7.2, T7.3  
**Estado:** ✅ Completada

---

### T8.2: ArtistaRepositoryImpl ✅
- [x] Crear `lib/data/repositories/artista_repository_impl.dart`
- [x] Implementar ArtistaRepository interface
- [x] Lógica offline-first similar a Obra
- [x] getObrasByArtista() - Obtener obras desde local data source

**Estimación:** 2 horas  
**Dependencias:** T4.2, T7.4  
**Estado:** ✅ Completada

---

### T8.3: RutaRepositoryImpl ✅
- [x] Crear `lib/data/repositories/ruta_repository_impl.dart`
- [x] Implementar RutaRepository interface
- [x] Solo local (no hay API de rutas en MVP1)
- [x] calculateRuta() - Cálculo básico de distancia y tiempo estimado
- [x] convertirADinamica() - Convertir ruta pública a dinámica
- [x] joinRutaDinamica() / leaveRutaDinamica() - Gestionar asistentes

**Estimación:** 3 horas  
**Dependencias:** T4.3, T7.5, T2.3  
**Estado:** ✅ Completada

---

### T8.4: TopNRepositoryImpl ✅
- [x] Crear `lib/data/repositories/topn_repository_impl.dart`
- [x] Implementar TopNRepository interface
- [x] Solo local (datos del usuario)
- [x] Validar que se agreguen rutas (no obras)
- [x] Obtener rutas completas desde RutaLocalDataSource

**Estimación:** 2 horas  
**Dependencias:** T4.4, T7.6  
**Estado:** ✅ Completada  
**Nota:** Cambio: ahora maneja rutas (no obras)

---

### T8.5: EncuentroRepositoryImpl ✅
- [x] Crear `lib/data/repositories/encuentro_repository_impl.dart`
- [x] Implementar EncuentroRepository interface
- [x] Solo local (mock para MVP1)
- [x] getEncuentrosProximos() - Calcular eventos futuros según rrule
- [x] Expandir encuentros repetitivos en múltiples instancias

**Estimación:** 3 horas  
**Dependencias:** T4.5, T7.7  
**Estado:** ✅ Completada  
**Nota:** Reemplaza SalidaRepositoryImpl. Usa RRuleHelper para calcular fechas futuras.

---

### T8.6: PublicarObraRepositoryImpl ✅
- [x] Crear `lib/data/repositories/publicar_obra_repository_impl.dart`
- [x] Implementar PublicarObraRepository interface
- [x] publicarObra() - Agrega fechaPublicacion automáticamente
- [x] puedeEliminarObra() - Validar permisos (solo artista creador)
- [x] Solo local (para MVP1)

**Estimación:** 2-3 horas  
**Dependencias:** T4.6, T7.2  
**Estado:** ✅ Completada

---

## 📋 Fase 9: Presentation Layer - BLoCs ✅ **COMPLETADA**

### T9.1: ObraBloc ✅
- [x] Crear `lib/presentation/bloc/obra/obra_event.dart`
- [x] Crear `lib/presentation/bloc/obra/obra_state.dart`
- [x] Crear `lib/presentation/bloc/obra/obra_bloc.dart`
- [x] Implementar eventos: LoadObras, SearchObras, FilterObras, GetObraById
- [x] Implementar estados: Initial, Loading, Loaded, Error
- [x] Conectar con use cases

**Estimación:** 3-4 horas  
**Dependencias:** T5.1  
**Estado:** ✅ Completada (ya existía, verificado)

---

### T9.2: ArtistaCubit ✅
- [x] Crear `lib/presentation/bloc/artista/artista_state.dart`
- [x] Crear `lib/presentation/bloc/artista/artista_cubit.dart`
- [x] Implementar métodos: loadArtista(), loadObras()
- [x] Implementar estados

**Estimación:** 2 horas  
**Dependencias:** T5.2  
**Estado:** ✅ Completada (ya existía, verificado)

---

### T9.3: RutaBloc ✅
- [x] Crear `lib/presentation/bloc/ruta/ruta_event.dart`
  - [x] Eventos básicos: CreateRuta, LoadRutas, DeleteRuta, CalculateRuta
  - [x] **NUEVO:** LoadRutasPublicas, LoadRutasPublicasDinamicas
  - [x] **NUEVO:** ConvertirADinamica (desde ruta estática)
  - [x] **NUEVO:** JoinRutaDinamica, LeaveRutaDinamica
- [x] Crear `lib/presentation/bloc/ruta/ruta_state.dart`
  - [x] Estados: Initial, Loading, Loaded, Error, Created, DetailLoaded
- [x] Crear `lib/presentation/bloc/ruta/ruta_bloc.dart`
- [x] Implementar eventos nuevos con use cases correspondientes
- [x] Integrar con GetRutasPublicas, GetRutasPublicasDinamicas, ConvertirADinamica, etc.

**Estimación:** 4-5 horas  
**Dependencias:** T5.3  
**Estado:** ✅ Completada

---

### T9.4: TopNCubit ✅
- [x] Crear `lib/presentation/bloc/topn/topn_state.dart`
- [x] Crear `lib/presentation/bloc/topn/topn_cubit.dart`
- [x] Implementar métodos: loadTopN(), addRuta(), removeRuta(), reorderRutas()
- [x] Validar límite de 10 rutas (en use cases)
- [x] **NUEVO:** Maneja rutas (no obras)

**Estimación:** 2-3 horas  
**Dependencias:** T5.4  
**Estado:** ✅ Completada  
**Nota:** Cambio: ahora maneja rutas (no obras). Reemplaza Top10Cubit.

---

### T9.5: EncuentroCubit ✅
- [x] Crear `lib/presentation/bloc/encuentro/encuentro_state.dart`
- [x] Crear `lib/presentation/bloc/encuentro/encuentro_cubit.dart`
- [x] Implementar métodos: create(), loadEncuentros(), loadEncuentrosProximos(), loadEncuentroById(), join(), cancel()
- [x] Validar fecha futura y permisos (en use cases)
- [x] **NUEVO:** Reemplaza SalidaCubit

**Estimación:** 3-4 horas  
**Dependencias:** T5.5  
**Estado:** ✅ Completada  
**Nota:** Reemplaza SalidaCubit. Validación de permisos en use cases.

---

### T9.6: PublicarObraCubit ✅
- [x] Crear `lib/presentation/bloc/publicar_obra/publicar_obra_state.dart`
- [x] Crear `lib/presentation/bloc/publicar_obra/publicar_obra_cubit.dart`
- [x] Implementar flujo multi-step (4 pasos: Foto, Información, Ubicación, Revisar)
- [x] Implementar métodos: startPublicacion(), saveFoto(), saveInformacion(), saveUbicacion(), publicar(), editar(), eliminar()
- [x] Validar permisos (en use cases)
- [x] Estados: StepState con currentStep (1-4)

**Estimación:** 4-5 horas  
**Dependencias:** T5.6  
**Estado:** ✅ Completada

---

### T9.6: MapaCubit
- [ ] Crear `lib/presentation/bloc/mapa/mapa_state.dart`
- [ ] Crear `lib/presentation/bloc/mapa/mapa_cubit.dart`
- [ ] Implementar gestión de estado del mapa (zoom, center, filtros)
- [ ] Integrar con ObraBloc para obras visibles

**Estimación:** 2 horas  
**Dependencias:** T9.1

---

## 📋 Fase 10: Presentation Layer - Widgets Comunes

### T10.1: Widgets Base
- [ ] Crear `lib/presentation/widgets/common/custom_button.dart`
- [ ] Crear `lib/presentation/widgets/common/custom_text_field.dart`
- [ ] Crear `lib/presentation/widgets/common/loading_indicator.dart`
- [ ] Crear `lib/presentation/widgets/common/error_widget.dart`
- [ ] Aplicar design tokens

**Estimación:** 3-4 horas  
**Dependencias:** T1.3

---

### T10.2: Widgets de Obra
- [ ] Crear `lib/presentation/widgets/obra/obra_card.dart` (para feed)
- [ ] Crear `lib/presentation/widgets/obra/obra_list_item.dart`
- [ ] Crear `lib/presentation/widgets/obra/obra_bottom_sheet.dart` (preview)
- [ ] Aplicar diseño según design-system.md

**Estimación:** 4-5 horas  
**Dependencias:** T10.1

---

### T10.3: Widgets de Artista
- [ ] Crear `lib/presentation/widgets/artista/artista_card.dart`
- [ ] Crear `lib/presentation/widgets/artista/artista_header.dart`
- [ ] Aplicar diseño según design-system.md

**Estimación:** 2-3 horas  
**Dependencias:** T10.1

---

### T10.4: Widgets de Mapa
- [ ] Crear `lib/presentation/widgets/mapa/custom_map.dart` (wrapper de flutter_map)
- [ ] Crear `lib/presentation/widgets/mapa/obra_marker.dart` (custom markers)
- [ ] Crear `lib/presentation/widgets/mapa/ruta_polyline.dart` (dibujar rutas)
- [ ] Implementar clustering básico
- [ ] Implementar cache de tiles offline

**Estimación:** 6-8 horas  
**Dependencias:** T10.1

---

### T10.5: Widgets de Ruta
- [ ] Crear `lib/presentation/widgets/ruta/ruta_card.dart`
- [ ] Crear `lib/presentation/widgets/ruta/ruta_preview.dart`
- [ ] Aplicar diseño según design-system.md

**Estimación:** 2-3 horas  
**Dependencias:** T10.1

---

### T10.6: Widgets de Top N
- [ ] Crear `lib/presentation/widgets/topn/topn_grid_item.dart` (muestra rutas, no obras)
- [ ] Crear `lib/presentation/widgets/topn/topn_drag_handler.dart`
- [ ] Implementar drag & drop con flutter_reorderable_list
- [ ] Cada item muestra: preview de mapa, nombre de ruta, obras incluidas, distancia, modo de transporte

**Estimación:** 4-5 horas  
**Dependencias:** T10.1  
**Nota:** Cambio: ahora muestra rutas (no obras)

---

### T10.7: Widgets de Encuentro
- [ ] Crear `lib/presentation/widgets/encuentro/encuentro_card.dart`
- [ ] Crear `lib/presentation/widgets/encuentro/encuentro_marker.dart` (pin especial en mapa)
- [ ] Crear `lib/presentation/widgets/encuentro/rrule_selector.dart` (selector de repetición)
- [ ] Aplicar diseño según design-system.md

**Estimación:** 3-4 horas  
**Dependencias:** T10.1

---

### T10.8: Widgets de Publicar Obra
- [ ] Crear `lib/presentation/widgets/publicar_obra/step_indicator.dart` (4 pasos)
- [ ] Crear `lib/presentation/widgets/publicar_obra/foto_uploader.dart`
- [ ] Crear `lib/presentation/widgets/publicar_obra/informacion_form.dart`
- [ ] Crear `lib/presentation/widgets/publicar_obra/ubicacion_selector.dart`
- [ ] Aplicar diseño según design-system.md

**Estimación:** 4-5 horas  
**Dependencias:** T10.1

---

## 📋 Fase 11: Presentation Layer - Páginas ✅ **COMPLETADA**

### T11.1: MapaPage (Home) ✅
- [x] Crear `lib/presentation/pages/home/mapa_page.dart`
- [x] Integrar CustomMap widget
- [x] Integrar ObraBloc y MapaCubit
- [x] Implementar filtros (categoría y artista)
- [x] Implementar bottom sheet al tocar pin
- [x] Implementar botón "Crear Ruta"
- [x] Implementar indicador de ubicación del usuario

**Estimación:** 6-8 horas  
**Dependencias:** T9.1, T9.6, T10.4, T10.2  
**Estado:** ✅ Completada

---

### T11.2: FeedPage ✅
- [x] Crear `lib/presentation/pages/feed/feed_page.dart`
- [x] Integrar ObraBloc
- [x] Implementar grid/list de obras
- [x] Implementar búsqueda
- [x] Implementar filtros (categoría y artista)
- [x] Implementar scroll infinito o paginación
- [x] Navegar a detalle de obra

**Estimación:** 4-5 horas  
**Dependencias:** T9.1, T10.2  
**Estado:** ✅ Completada

---

### T11.3: ObraDetailPage ✅
- [x] Crear `lib/presentation/pages/obra/obra_detail_page.dart`
- [x] Mostrar imagen grande, información completa
- [x] Botón "Ver en Mapa" (removido: "Agregar a Top 10", ahora se agregan rutas al Top N)
- [x] Link a perfil del artista
- [x] Botón "Ver en mapa"
- [x] Integrar con ObraBloc (removido: Top10Cubit, ya no se agregan obras al Top N)

**Estimación:** 3-4 horas  
**Dependencias:** T9.1, T10.1  
**Nota:** Removido botón "Agregar a Top 10", ahora se agregan rutas al Top N  
**Estado:** ✅ Completada

---

### T11.4: ArtistaProfilePage ✅
- [x] Crear `lib/presentation/pages/artista/artista_profile_page.dart`
- [x] Mostrar header con foto y bio
- [x] Mostrar grid de obras del artista
- [x] Link a Instagram
- [x] Navegar a detalle de obra desde grid
- [x] Integrar con ArtistaCubit

**Estimación:** 3-4 horas  
**Dependencias:** T9.2, T10.3  
**Estado:** ✅ Completada

---

### T11.5: CreateRutaPage (Multi-step) ✅
- [x] Crear `lib/presentation/pages/ruta/create_ruta_page.dart`
- [x] Implementar flujo de 6 pasos:
  - Paso 1: Seleccionar punto A
  - Paso 2: Seleccionar punto B
  - Paso 3: Mostrar obras en el camino
  - Paso 4: Seleccionar obras deseadas (con filtros)
  - Paso 5: Seleccionar transporte (**bici principal**, a pie secundario)
  - Paso 6: Generar y guardar ruta (con opciones: privada/pública estática/pública dinámica)
- [x] Si pública dinámica: Configurar rrule (diario/semanal/mensual/anual), fecha inicial, hora, punto de encuentro, tipo de lista
- [x] Integrar con RutaBloc
- [x] Validaciones en cada paso
- [x] Vista previa de ruta en mapa
- [x] Integrar librería rrule para eventos repetitivos

**Estimación:** 10-12 horas  
**Dependencias:** T9.3, T10.4, T10.5, geocoding, librería rrule  
**Nota:** Incluye soporte para rutas dinámicas con eventos repetitivos  
**Estado:** ✅ Completada

---

### T11.6: RutaListPage y RutaDetailPage ✅
- [x] Crear `lib/presentation/pages/ruta/ruta_list_page.dart`
- [x] Crear `lib/presentation/pages/ruta/ruta_detail_page.dart`
- [x] Mostrar lista de rutas guardadas (privadas y públicas)
- [x] Mostrar detalle con mapa y lista de obras
- [x] Si es pública estática: Botón "Convertir a Dinámica"
- [x] Si es pública dinámica: Ver próximos eventos, lista de asistentes, convertir a estática
- [x] Editar y eliminar ruta

**Estimación:** 5-6 horas  
**Dependencias:** T9.3, T10.4, T10.5  
**Nota:** Removido "Crear Salida Grupal" (ahora es parte de rutas dinámicas)  
**Estado:** ✅ Completada

---

### T11.7: TopNPage (Top N de Rutas) ✅
- [x] Crear `lib/presentation/pages/topn/topn_page.dart`
- [x] Mostrar grid tipo galería de **rutas** (no obras)
- [x] Contador "X/10 rutas"
- [x] Cada item muestra: preview de mapa, nombre de ruta, obras incluidas, distancia, modo de transporte
- [x] Botón "+ Agregar Ruta"
- [x] Drag & drop para reordenar
- [x] Eliminar ruta
- [x] Integrar con TopNCubit

**Estimación:** 4-5 horas  
**Dependencias:** T9.4, T10.6  
**Nota:** Cambio: ahora muestra rutas (no obras)  
**Estado:** ✅ Completada

---

### T11.8: EncuentroPages ✅
- [x] Crear `lib/presentation/pages/encuentro/encuentro_list_page.dart`
- [x] Crear `lib/presentation/pages/encuentro/encuentro_detail_page.dart`
- [x] Crear `lib/presentation/pages/encuentro/create_encuentro_page.dart` (solo artistas)
- [x] Formulario de creación: ubicación, fecha, hora, descripción, repetición (rrule)
- [x] Mostrar lista de encuentros próximos
- [x] Mostrar próximos eventos si es repetitivo
- [x] Compartir encuentro (link/código)
- [x] Lista de asistentes
- [x] Validar que solo artistas pueden crear

**Estimación:** 6-8 horas  
**Dependencias:** T9.5, T10.7  
**Nota:** Reemplaza SalidaPages. Solo artistas pueden crear encuentros.  
**Estado:** ✅ Completada

---

### T11.9: PublicarObraPage (Multi-step, solo artistas) ✅
- [x] Crear `lib/presentation/pages/publicar_obra/publicar_obra_page.dart`
- [x] Implementar flujo de 4 pasos:
  - Paso 1: Subir foto
  - Paso 2: Información (título, descripción, técnica, tags, categoría)
  - Paso 3: Ubicación (mapa, debe estar en Buenos Aires, CABA)
  - Paso 4: Revisar y confirmar
- [x] Validar que solo artistas pueden acceder
- [x] Integrar con PublicarObraCubit
- [x] Validaciones en cada paso

**Estimación:** 6-8 horas  
**Dependencias:** T9.6, T10.8  
**Nota:** Solo artistas pueden publicar obras.  
**Estado:** ✅ Completada
- [ ] Lista de participantes (mock)
- [ ] Integrar con SalidaCubit

**Estimación:** 5-6 horas  
**Dependencias:** T9.5, T11.6

---

## 📋 Fase 12: Integración y Datos Mock ✅ **COMPLETADA**

### T12.1: Datos Mock ✅
- [x] Crear archivo JSON con datos de obras de ejemplo
- [x] Crear archivo JSON con datos de artistas de ejemplo
- [x] Implementar carga de datos mock si API no disponible
- [x] Datos suficientes para testing (mínimo 20-30 obras)

**Estimación:** 2-3 horas  
**Dependencias:** T6.1, T6.2  
**Estado:** ✅ Completada

---

### T12.2: Integración Completa ✅
- [x] Conectar todas las capas
- [x] Verificar flujo completo: UI → BLoC → UseCase → Repository → DataSource
- [x] Probar offline-first
- [x] Probar caché de datos

**Estimación:** 3-4 horas  
**Dependencias:** Todas las fases anteriores  
**Estado:** ✅ Completada

---

### T12.3: Permisos ✅
- [x] Implementar solicitud de permisos de ubicación
- [x] Manejar casos de permiso denegado
- [x] Funcionar sin permisos (modo degradado)

**Estimación:** 1-2 horas  
**Dependencias:** T11.1  
**Estado:** ✅ Completada

---

## 📋 Fase 13: Testing Básico

### T13.1: Unit Tests
- [ ] Tests para use cases críticos (GetObras, CreateRuta, AddRutaToTopN, CreateEncuentro, PublicarObra)
- [ ] Tests para repositorios (mocks de data sources)
- [ ] Tests para BLoCs (bloc_test)
- [ ] Tests para validación de tipos de usuario (visitante/artista)

**Estimación:** 5-7 horas  
**Dependencias:** Todas las fases anteriores  
**Nota:** Incluye tests para nuevas funcionalidades (Top N, Encuentros, Publicar Obra)

---

### T13.2: Widget Tests
- [ ] Tests para widgets críticos (CustomButton, ObraCard)
- [ ] Tests para páginas principales (MapaPage, FeedPage)

**Estimación:** 3-4 horas  
**Dependencias:** Todas las fases anteriores

---

## 📋 Fase 14: Polish y Optimizaciones

### T14.1: Estados Vacíos y Errores
- [ ] Implementar widgets de estados vacíos
- [ ] Implementar manejo de errores en UI
- [ ] Mensajes de error claros y útiles

**Estimación:** 2-3 horas  
**Dependencias:** T11.1-T11.8

---

### T14.2: Animaciones
- [ ] Agregar animaciones sutiles (transiciones, fades)
- [ ] Animación de bottom sheet
- [ ] Feedback visual en acciones

**Estimación:** 2-3 horas  
**Dependencias:** Todas las páginas

---

### T14.3: Performance
- [ ] Optimizar carga de imágenes (lazy loading)
- [ ] Optimizar clustering en mapa
- [ ] Verificar scroll fluido (60 FPS)
- [ ] Optimizar uso de memoria

**Estimación:** 3-4 horas  
**Dependencias:** Todas las fases anteriores

---

### T14.4: Accesibilidad
- [ ] Verificar contraste de colores (WCAG AA)
- [ ] Verificar tamaños de toque (44x44px mínimo)
- [ ] Agregar labels semánticos
- [ ] Verificar estados de foco

**Estimación:** 2 horas  
**Dependencias:** Todas las páginas

---

## 📊 Resumen de Estimaciones

| Fase | Tareas | Estimación Total |
|------|--------|------------------|
| Fase 1: Setup | 4 tareas | 5-7 horas | ✅ **COMPLETADA** |
| Fase 2: Core | 3 tareas | 5 horas | ✅ **COMPLETADA** |
| Fase 3: Domain Entities | 5 tareas | 5-7 horas | ✅ **COMPLETADA** |
| Fase 4: Domain Repos | 7 tareas | 3-4 horas | ✅ **COMPLETADA** |
| Fase 5: Domain Use Cases | 7 tareas | 15-20 horas | ✅ **COMPLETADA** |
| Fase 6: Data Models | 7 tareas | 5-7 horas | ✅ **COMPLETADA** |
| Fase 7: Data Sources | 9 tareas | 15-20 horas | ✅ **COMPLETADA** |
| Fase 8: Data Repos (Impl) | 7 tareas | 15-20 horas | ✅ **COMPLETADA** |
| Fase 9: BLoCs | 7 tareas | 20-26 horas | ✅ **COMPLETADA** |
| Fase 3: Domain Entities | 5 tareas | 5 horas |
| Fase 4: Domain Repos (Interfaces) | 6 tareas | 3 horas |
| Fase 5: Domain Use Cases | 6 tareas | 15-20 horas |
| Fase 6: Data Models | 5 tareas | 5-6 horas |
| Fase 7: Data Sources | 8 tareas | 17-20 horas |
| Fase 8: Data Repos (Impl) | 6 tareas | 14-16 horas |
| Fase 9: BLoCs | 7 tareas | 20-26 horas |
| Fase 10: Widgets | 8 tareas | 28-36 horas |
| Fase 11: Páginas | 9 tareas | 50-62 horas |
| Fase 12: Integración | 3 tareas | 6-9 horas |
| Fase 13: Testing | 2 tareas | 7-10 horas |
| Fase 14: Polish | 4 tareas | 9-12 horas |
| **TOTAL** | **77 tareas** | **195-242 horas** |

**Estimación total:** ~24-30 días de trabajo (8 horas/día) o ~5-6 semanas (40 horas/semana)  
**Nota:** Aumento debido a nuevas funcionalidades (Encuentros, Publicar Obra, Rutas Dinámicas, Tipos de Usuario)

---

## 🎯 Priorización para MVP1

### Must Have (Crítico):
- Fases 1-9: Infraestructura completa
- T11.1: MapaPage (core)
- T11.5: CreateRutaPage (core)
- T11.2: FeedPage
- T11.3: ObraDetailPage
- T11.4: ArtistaProfilePage
- T12.1: Datos mock
- T12.2: Integración completa

### Should Have (Importante):
- T11.6: RutaListPage y Detail
- T11.7: TopNPage (rutas favoritas)
- T11.8: EncuentroPages (solo artistas)
- T11.9: PublicarObraPage (solo artistas)
- T10.4: Widgets de mapa completos
- T14.1: Estados vacíos y errores

### Nice to Have (Opcional MVP1):
- T13.1-T13.2: Testing completo
- T14.2: Animaciones avanzadas
- T14.3: Optimizaciones avanzadas

---

## ✅ Checklist de Validación

Antes de considerar MVP1 completo, verificar:

- [ ] Todas las funcionalidades core funcionan
- [ ] Modo offline funciona para datos cacheados
- [ ] Mapa carga en menos de 2 segundos
- [ ] Crear ruta funciona en 6 pasos (con opciones privada/pública estática/pública dinámica)
- [ ] Top N de rutas funciona con drag & drop
- [ ] Rutas dinámicas se repiten correctamente según rrule
- [ ] Artistas pueden publicar obras (4 pasos)
- [ ] Artistas pueden crear encuentros
- [ ] Tipos de usuario funcionan correctamente (visitante/artista)
- [ ] Filtros funcionan en Feed y Mapa
- [ ] Navegación entre pantallas es fluida
- [ ] No hay crashes críticos
- [ ] UI sigue design system
- [ ] Datos mock cargan correctamente

---

---

## 📝 Notas de Actualización

**Última actualización:** 12 de Diciembre, 2025

**Cambios principales:**
- ✅ T3.4: SalidaGrupal → Encuentro (solo artistas)
- ✅ T3.5: Nueva entidad Usuario con tipoUsuario
- ✅ T4.4: Top10Repository → TopNRepository (ahora maneja rutas, no obras)
- ✅ T4.5: SalidaRepository → EncuentroRepository
- ✅ T4.6: Nuevo PublicarObraRepository (solo artistas)
- ✅ T5.4: Use Cases de Top 10 → Top N (rutas)
- ✅ T5.5: Use Cases de Salida → Encuentro
- ✅ T5.6: Nuevos Use Cases de Publicar Obra
- ✅ T5.3: Use Cases de Ruta ampliados (rutas dinámicas con rrule)
- ✅ T6.4: SalidaModel → EncuentroModel
- ✅ T6.5: Nuevo UsuarioModel
- ✅ T7.6: Top10LocalDataSource → TopNLocalDataSource
- ✅ T7.7: SalidaLocalDataSource → EncuentroLocalDataSource
- ✅ T7.8: Nuevo UsuarioLocalDataSource
- ✅ T8.4: Top10RepositoryImpl → TopNRepositoryImpl
- ✅ T8.5: SalidaRepositoryImpl → EncuentroRepositoryImpl
- ✅ T8.6: Nuevo PublicarObraRepositoryImpl
- ✅ T9.4: Top10Cubit → TopNCubit
- ✅ T9.5: SalidaCubit → EncuentroCubit
- ✅ T9.6: Nuevo PublicarObraCubit
- ✅ T10.6: Widgets de Top 10 → Top N (rutas)
- ✅ T10.7: Nuevos Widgets de Encuentro
- ✅ T10.8: Nuevos Widgets de Publicar Obra
## 🔄 Cambios Importantes en Esta Versión

### Cambios Fundamentales:
- ✅ **Top 10 de Obras → Top N de Rutas:** Cambio completo de funcionalidad
- ✅ **CreateSalidaPage OBSOLETO:** Reemplazado por Rutas Públicas Dinámicas en CreateRutaPage
- ✅ **Nuevos Tipos de Usuario:** Artista y Visitante (no cambiable en MVP)
- ✅ **Modo de Transporte:** Principalmente bici (también a pie)
- ✅ **Rutas Dinámicas:** Eventos repetitivos con rrule (diario/semanal/mensual/anual)

### Nuevas Funcionalidades:
- ✅ **PublicarObraPage:** 4 pasos, solo Artistas, sin validación en MVP
- ✅ **CrearEncuentroPage:** Solo Artistas, pueden ser repetitivos
- ✅ **EncuentroDetailPage:** Detalle de encuentro, Visitantes pueden unirse
- ✅ **Rutas Públicas:** Estáticas (sin fecha) y Dinámicas (eventos repetitivos)

### Actualizaciones de Tareas:
- ✅ T1.1: Agregada dependencia `rrule` y `intl`
- ✅ T2.3: Nuevos helpers (rrule_helper, validadores de CABA)
- ✅ T3.1: Obra con artistaId, fechaPublicacion, puedeEliminar
- ✅ T3.3: Ruta con modoTransporte, tipo, rrule, campos de dinámica
- ✅ T3.4: Nueva entidad Encuentro (reemplaza SalidaGrupal)
- ✅ T3.5: Usuario con tipoUsuario, topNRutasIds (no obras)
- ✅ T5.4: Top10 → TopN (rutas, no obras)
- ✅ T9.3: RutaBloc con eventos para rutas dinámicas
- ✅ T11.5: CreateRutaPage actualizado (rutas dinámicas con rrule, bici principal)
- ✅ T11.7: Top10Page → TopNPage (rutas)
- ✅ T11.8: SalidaPages → EncuentroPages
- ✅ T11.9: Nueva PublicarObraPage (4 pasos, solo artistas)
- ✅ T11.3: Removido "Agregar a Top 10" de ObraDetailPage

### Notas Importantes:
- 📍 **Ubicación:** Todos los mapas y ubicaciones deben ser de Buenos Aires (CABA)
- 🚲 **Transporte:** Bici es principal, pero también soportar a pie
- 👤 **Tipos de usuario:** No se puede cambiar de tipo en MVP
- ⭐ **Top N:** Máximo 10 rutas (no obras)
- 🔁 **rrule:** Usar para eventos repetitivos
- ✏️ **Sin validación:** Artistas pueden publicar sin aprobación en MVP
- ✅ Total: 66 → 77 tareas (+11 nuevas tareas)

**Nuevas dependencias:**
- Librería `rrule` para eventos repetitivos (rutas dinámicas y encuentros)

---

---

## 📊 Estado de Implementación

### Fases Completadas:
- ✅ **Fase 1: Setup y Configuración Base** - Completada el 12 de Diciembre, 2025
  - T1.1: Configuración inicial ✅
  - T1.2: Inyección de dependencias ✅
  - T1.3: Tema y Design Tokens ✅
  - T1.4: Configuración de rutas ✅
  - T2.3: Utilidades generales ✅

- ✅ **Fase 2: Core y Utilidades** - Completada el 12 de Diciembre, 2025
  - T2.1: Manejo de errores ✅
  - T2.2: Configuración de red ✅
  - T2.3: Utilidades generales ✅

- ✅ **Fase 3: Domain Layer - Entidades** - Completada el 12 de Diciembre, 2025
  - T3.1: Entidad Obra ✅
  - T3.2: Entidad Artista ✅
  - T3.3: Entidad Ruta ✅
  - T3.4: Entidad Encuentro ✅
  - T3.5: Entidad Usuario ✅

- ✅ **Fase 4: Domain Layer - Repositorios** - Completada el 12 de Diciembre, 2025
  - T4.1: ObraRepository ✅
  - T4.2: ArtistaRepository ✅
  - T4.3: RutaRepository ✅
  - T4.4: TopNRepository ✅
  - T4.5: EncuentroRepository ✅
  - T4.6: PublicarObraRepository ✅
  - T4.7: UsuarioRepository ✅

### Fase Actual:
- 🔄 **Fase 5: Domain Layer - Use Cases** - Próxima

### Próximas Fases:
- ⏳ Fase 4: Domain Layer - Repositorios (Interfaces)
- ⏳ Fase 5: Domain Layer - Use Cases

---

*Documento generado por: Architect*  
*Basado en: architecture.md, tech-stack.md, requirements.md, CHANGELOG-enfoques.md*  
*Fecha: Inicio del proyecto*  
*Última actualización: 12 de Diciembre, 2025 - Fase 1 completada*  
*Estado: Fase 1 completada - Continuando con Fase 2*

