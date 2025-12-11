# 📝 Roadmap de Implementación - Graffiti Trails MVP1

## 🎯 Objetivo

Implementar MVP1 de Graffiti Trails siguiendo Clean Architecture + BLoC, basándose estrictamente en los documentos del Architect.

---

## 📋 Fase 1: Setup y Configuración Base

### T1.1: Configuración Inicial del Proyecto
- [ ] Crear proyecto Flutter: `flutter create graffiti_trails`
- [ ] Configurar `pubspec.yaml` con todas las dependencias del tech-stack
- [ ] Configurar estructura de carpetas según architecture.md
- [ ] Configurar `analysis_options.yaml` con flutter_lints
- [ ] Configurar `.gitignore` apropiado
- [ ] Crear archivo `README.md` básico

**Estimación:** 1-2 horas  
**Dependencias:** Ninguna

---

### T1.2: Configuración de Inyección de Dependencias
- [ ] Crear `lib/core/injection/injection_container.dart`
- [ ] Configurar get_it con registro de dependencias base
- [ ] Crear función `init()` para inicialización
- [ ] Configurar en `main.dart`

**Estimación:** 1 hora  
**Dependencias:** T1.1

---

### T1.3: Configuración de Tema y Design Tokens
- [ ] Crear `lib/core/theme/app_theme.dart`
- [ ] Implementar colores según design-system.md
- [ ] Implementar tipografía según design-system.md
- [ ] Implementar espaciado (8px base)
- [ ] Crear `app_colors.dart`, `app_text_styles.dart`, `app_spacing.dart`
- [ ] Configurar tema en `main.dart`

**Estimación:** 2-3 horas  
**Dependencias:** T1.1

---

### T1.4: Configuración de Rutas
- [ ] Crear `lib/presentation/routes/app_router.dart`
- [ ] Configurar go_router con rutas básicas
- [ ] Definir rutas principales: `/`, `/feed`, `/obra/:id`, `/artista/:id`, etc.
- [ ] Configurar en `main.dart`

**Estimación:** 1-2 horas  
**Dependencias:** T1.1, T1.2

---

## 📋 Fase 2: Core y Utilidades

### T2.1: Manejo de Errores
- [ ] Crear `lib/core/errors/failures.dart` con clases de error
- [ ] Crear `lib/core/errors/exceptions.dart`
- [ ] Implementar ServerFailure, CacheFailure, NetworkFailure
- [ ] Crear mappers de Exception a Failure

**Estimación:** 1 hora  
**Dependencias:** T1.1

---

### T2.2: Configuración de Red
- [ ] Crear `lib/core/network/dio_client.dart`
- [ ] Configurar Dio con timeouts e interceptors
- [ ] Crear `lib/core/network/network_info.dart` (mock para MVP1)
- [ ] Crear `lib/core/network/api_endpoints.dart` con URLs

**Estimación:** 2 horas  
**Dependencias:** T1.1, T2.1

---

### T2.3: Utilidades Generales
- [ ] Crear `lib/core/utils/constants.dart` con constantes de la app
- [ ] Crear `lib/core/utils/validators.dart` para validaciones
- [ ] Crear `lib/core/utils/date_formatter.dart`
- [ ] Crear `lib/core/utils/distance_calculator.dart` (para rutas)

**Estimación:** 2 horas  
**Dependencias:** T1.1

---

## 📋 Fase 3: Domain Layer - Entidades

### T3.1: Entidad Obra
- [ ] Crear `lib/domain/entities/ubicacion.dart`
- [ ] Crear `lib/domain/entities/obra.dart`
- [ ] Implementar propiedades: id, titulo, artista, categoria, ubicacion, foto, fecha, likes
- [ ] Implementar equals y hashCode con equatable

**Estimación:** 1 hora  
**Dependencias:** T1.1

---

### T3.2: Entidad Artista
- [ ] Crear `lib/domain/entities/artista.dart`
- [ ] Implementar propiedades: id, nombre, bio, foto, instagram, obras
- [ ] Implementar equals y hashCode

**Estimación:** 1 hora  
**Dependencias:** T1.1, T3.1

---

### T3.3: Entidad Ruta
- [ ] Crear `lib/domain/entities/ruta.dart`
- [ ] Implementar propiedades: id, nombre, puntoA, puntoB, obras, distancia, tiempo, transporte
- [ ] Implementar equals y hashCode

**Estimación:** 1 hora  
**Dependencias:** T1.1, T3.1

---

### T3.4: Entidad Salida Grupal
- [ ] Crear `lib/domain/entities/salida_grupal.dart`
- [ ] Implementar propiedades: id, ruta, fecha, horario, puntoEncuentro, descripcion, participantes
- [ ] Implementar equals y hashCode

**Estimación:** 1 hora  
**Dependencias:** T1.1, T3.3

---

## 📋 Fase 4: Domain Layer - Repositorios (Interfaces)

### T4.1: ObraRepository Interface
- [ ] Crear `lib/domain/repositories/obra_repository.dart`
- [ ] Definir métodos: getObras(), getObraById(), searchObras(), filterObras()
- [ ] Retornar Future<Either<Failure, T>>

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.1

---

### T4.2: ArtistaRepository Interface
- [ ] Crear `lib/domain/repositories/artista_repository.dart`
- [ ] Definir métodos: getArtistaById(), getObrasByArtista()
- [ ] Retornar Future<Either<Failure, T>>

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.2

---

### T4.3: RutaRepository Interface
- [ ] Crear `lib/domain/repositories/ruta_repository.dart`
- [ ] Definir métodos: createRuta(), getRutas(), getRutaById(), deleteRuta(), calculateRuta()
- [ ] Retornar Future<Either<Failure, T>>

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.3

---

### T4.4: Top10Repository Interface
- [ ] Crear `lib/domain/repositories/top10_repository.dart`
- [ ] Definir métodos: getTop10(), addToTop10(), removeFromTop10(), reorderTop10()
- [ ] Retornar Future<Either<Failure, T>>

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.1

---

### T4.5: SalidaRepository Interface
- [ ] Crear `lib/domain/repositories/salida_repository.dart`
- [ ] Definir métodos: createSalida(), getSalidas(), joinSalida()
- [ ] Retornar Future<Either<Failure, T>>

**Estimación:** 30 minutos  
**Dependencias:** T2.1, T3.4

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
- [ ] Crear `lib/domain/usecases/ruta/create_ruta.dart`
- [ ] Crear `lib/domain/usecases/ruta/get_rutas.dart`
- [ ] Crear `lib/domain/usecases/ruta/get_ruta_by_id.dart`
- [ ] Crear `lib/domain/usecases/ruta/delete_ruta.dart`
- [ ] Crear `lib/domain/usecases/ruta/calculate_ruta.dart` (cálculo básico)
- [ ] Implementar lógica de negocio

**Estimación:** 3-4 horas  
**Dependencias:** T4.3, T2.3

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

### T5.5: Use Cases de Salida
- [ ] Crear `lib/domain/usecases/salida/create_salida.dart`
- [ ] Crear `lib/domain/usecases/salida/get_salidas.dart`
- [ ] Crear `lib/domain/usecases/salida/join_salida.dart`
- [ ] Implementar validaciones (fecha futura, etc.)

**Estimación:** 2 horas  
**Dependencias:** T4.5

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

## 📋 Fase 7: Data Layer - Data Sources

### T7.1: Configuración de Hive
- [ ] Configurar Hive en `main.dart`
- [ ] Crear adapters para modelos (ObraModel, ArtistaModel, RutaModel, etc.)
- [ ] Registrar adapters
- [ ] Crear boxes para cada tipo de dato

**Estimación:** 2-3 horas  
**Dependencias:** T6.1, T6.2, T6.3, T6.4

---

### T7.2: ObraLocalDataSource
- [ ] Crear `lib/data/datasources/local/obra_local_datasource.dart`
- [ ] Implementar métodos: getObras(), getObraById(), cacheObras()
- [ ] Usar Hive para almacenamiento

**Estimación:** 2 horas  
**Dependencias:** T7.1

---

### T7.3: ObraRemoteDataSource
- [ ] Crear `lib/data/datasources/remote/obra_remote_datasource.dart`
- [ ] Implementar métodos: getObras(), getObraById()
- [ ] Usar Dio para requests HTTP
- [ ] Manejar parsing de JSON y errores

**Estimación:** 2-3 horas  
**Dependencias:** T2.2, T6.1

---

### T7.4: ArtistaLocalDataSource y RemoteDataSource
- [ ] Crear ambos data sources para Artista
- [ ] Implementar métodos similares a Obra
- [ ] Integrar con Hive y Dio

**Estimación:** 2 horas  
**Dependencias:** T7.1, T7.2, T7.3, T6.2

---

### T7.5: RutaLocalDataSource
- [ ] Crear `lib/data/datasources/local/ruta_local_datasource.dart`
- [ ] Implementar CRUD completo: create, read, update, delete
- [ ] Usar Hive para persistencia

**Estimación:** 2 horas  
**Dependencias:** T7.1, T6.3

---

### T7.6: Top10LocalDataSource
- [ ] Crear `lib/data/datasources/local/top10_local_datasource.dart`
- [ ] Implementar métodos: getTop10(), add(), remove(), reorder()
- [ ] Validar límite de 10 obras
- [ ] Usar Hive

**Estimación:** 2 horas  
**Dependencias:** T7.1

---

### T7.7: SalidaLocalDataSource
- [ ] Crear `lib/data/datasources/local/salida_local_datasource.dart`
- [ ] Implementar CRUD para salidas grupales
- [ ] Simular participantes localmente (para MVP1)
- [ ] Usar Hive

**Estimación:** 2 horas  
**Dependencias:** T7.1, T6.4

---

## 📋 Fase 8: Data Layer - Repositories (Implementación)

### T8.1: ObraRepositoryImpl
- [ ] Crear `lib/data/repositories/obra_repository_impl.dart`
- [ ] Implementar ObraRepository interface
- [ ] Lógica offline-first: intentar remote, fallback a local
- [ ] Cachear datos localmente después de obtener de remote
- [ ] Manejar errores y convertir a Failures

**Estimación:** 3 horas  
**Dependencias:** T4.1, T7.2, T7.3

---

### T8.2: ArtistaRepositoryImpl
- [ ] Crear `lib/data/repositories/artista_repository_impl.dart`
- [ ] Implementar ArtistaRepository interface
- [ ] Lógica offline-first similar a Obra

**Estimación:** 2 horas  
**Dependencias:** T4.2, T7.4

---

### T8.3: RutaRepositoryImpl
- [ ] Crear `lib/data/repositories/ruta_repository_impl.dart`
- [ ] Implementar RutaRepository interface
- [ ] Solo local (no hay API de rutas en MVP1)
- [ ] Implementar calculateRuta() con cálculo básico de distancia

**Estimación:** 3 horas  
**Dependencias:** T4.3, T7.5, T2.3

---

### T8.4: Top10RepositoryImpl
- [ ] Crear `lib/data/repositories/top10_repository_impl.dart`
- [ ] Implementar Top10Repository interface
- [ ] Solo local (datos del usuario)

**Estimación:** 2 horas  
**Dependencias:** T4.4, T7.6

---

### T8.5: SalidaRepositoryImpl
- [ ] Crear `lib/data/repositories/salida_repository_impl.dart`
- [ ] Implementar SalidaRepository interface
- [ ] Solo local (mock para MVP1)

**Estimación:** 2 horas  
**Dependencias:** T4.5, T7.7

---

## 📋 Fase 9: Presentation Layer - BLoCs

### T9.1: ObraBloc
- [ ] Crear `lib/presentation/bloc/obra/obra_event.dart`
- [ ] Crear `lib/presentation/bloc/obra/obra_state.dart`
- [ ] Crear `lib/presentation/bloc/obra/obra_bloc.dart`
- [ ] Implementar eventos: LoadObras, SearchObras, FilterObras, GetObraById
- [ ] Implementar estados: Initial, Loading, Loaded, Error
- [ ] Conectar con use cases

**Estimación:** 3-4 horas  
**Dependencias:** T5.1

---

### T9.2: ArtistaCubit
- [ ] Crear `lib/presentation/bloc/artista/artista_state.dart`
- [ ] Crear `lib/presentation/bloc/artista/artista_cubit.dart`
- [ ] Implementar métodos: loadArtista(), loadObras()
- [ ] Implementar estados

**Estimación:** 2 horas  
**Dependencias:** T5.2

---

### T9.3: RutaBloc
- [ ] Crear `lib/presentation/bloc/ruta/ruta_event.dart`
- [ ] Crear `lib/presentation/bloc/ruta/ruta_state.dart`
- [ ] Crear `lib/presentation/bloc/ruta/ruta_bloc.dart`
- [ ] Implementar eventos: CreateRuta, LoadRutas, DeleteRuta, CalculateRuta
- [ ] Implementar estados multi-step para creación de ruta

**Estimación:** 4-5 horas  
**Dependencias:** T5.3

---

### T9.4: Top10Cubit
- [ ] Crear `lib/presentation/bloc/top10/top10_state.dart`
- [ ] Crear `lib/presentation/bloc/top10/top10_cubit.dart`
- [ ] Implementar métodos: loadTop10(), addObra(), removeObra(), reorderObras()
- [ ] Validar límite de 10 obras

**Estimación:** 2-3 horas  
**Dependencias:** T5.4

---

### T9.5: SalidaCubit
- [ ] Crear `lib/presentation/bloc/salida/salida_state.dart`
- [ ] Crear `lib/presentation/bloc/salida/salida_cubit.dart`
- [ ] Implementar métodos: createSalida(), loadSalidas(), joinSalida()
- [ ] Validar fecha futura

**Estimación:** 2-3 horas  
**Dependencias:** T5.5

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

### T10.6: Widgets de Top 10
- [ ] Crear `lib/presentation/widgets/top10/top10_grid_item.dart`
- [ ] Crear `lib/presentation/widgets/top10/top10_drag_handler.dart`
- [ ] Implementar drag & drop con flutter_reorderable_list
- [ ] Aplicar diseño tipo "mixtape"

**Estimación:** 4-5 horas  
**Dependencias:** T10.1

---

## 📋 Fase 11: Presentation Layer - Páginas

### T11.1: MapaPage (Home)
- [ ] Crear `lib/presentation/pages/home/mapa_page.dart`
- [ ] Integrar CustomMap widget
- [ ] Integrar ObraBloc y MapaCubit
- [ ] Implementar filtros (categoría y artista)
- [ ] Implementar bottom sheet al tocar pin
- [ ] Implementar botón "Crear Ruta"
- [ ] Implementar indicador de ubicación del usuario

**Estimación:** 6-8 horas  
**Dependencias:** T9.1, T9.6, T10.4, T10.2

---

### T11.2: FeedPage
- [ ] Crear `lib/presentation/pages/feed/feed_page.dart`
- [ ] Integrar ObraBloc
- [ ] Implementar grid/list de obras
- [ ] Implementar búsqueda
- [ ] Implementar filtros (categoría y artista)
- [ ] Implementar scroll infinito o paginación
- [ ] Navegar a detalle de obra

**Estimación:** 4-5 horas  
**Dependencias:** T9.1, T10.2

---

### T11.3: ObraDetailPage
- [ ] Crear `lib/presentation/pages/obra/obra_detail_page.dart`
- [ ] Mostrar imagen grande, información completa
- [ ] Botón "Agregar a Top 10"
- [ ] Link a perfil del artista
- [ ] Botón "Ver en mapa"
- [ ] Integrar con Top10Cubit

**Estimación:** 3-4 horas  
**Dependencias:** T9.1, T9.4, T10.1

---

### T11.4: ArtistaProfilePage
- [ ] Crear `lib/presentation/pages/artista/artista_profile_page.dart`
- [ ] Mostrar header con foto y bio
- [ ] Mostrar grid de obras del artista
- [ ] Link a Instagram
- [ ] Navegar a detalle de obra desde grid
- [ ] Integrar con ArtistaCubit

**Estimación:** 3-4 horas  
**Dependencias:** T9.2, T10.3

---

### T11.5: CreateRutaPage (Multi-step)
- [ ] Crear `lib/presentation/pages/ruta/create_ruta_page.dart`
- [ ] Implementar flujo de 6 pasos:
  - Paso 1: Seleccionar punto A
  - Paso 2: Seleccionar punto B
  - Paso 3: Mostrar obras en el camino
  - Paso 4: Seleccionar obras deseadas (con filtros)
  - Paso 5: Seleccionar transporte (a pie/bici)
  - Paso 6: Generar y guardar ruta
- [ ] Integrar con RutaBloc
- [ ] Validaciones en cada paso
- [ ] Vista previa de ruta en mapa

**Estimación:** 8-10 horas  
**Dependencias:** T9.3, T10.4, T10.5, geocoding

---

### T11.6: RutaListPage y RutaDetailPage
- [ ] Crear `lib/presentation/pages/ruta/ruta_list_page.dart`
- [ ] Crear `lib/presentation/pages/ruta/ruta_detail_page.dart`
- [ ] Mostrar lista de rutas guardadas
- [ ] Mostrar detalle con mapa y lista de obras
- [ ] Botón "Crear Salida Grupal"
- [ ] Editar y eliminar ruta

**Estimación:** 4-5 horas  
**Dependencias:** T9.3, T10.4, T10.5

---

### T11.7: Top10Page
- [ ] Crear `lib/presentation/pages/top10/top10_page.dart`
- [ ] Mostrar grid tipo galería
- [ ] Contador "X/10 obras"
- [ ] Botón "+ Agregar Obra"
- [ ] Drag & drop para reordenar
- [ ] Eliminar obra
- [ ] Integrar con Top10Cubit

**Estimación:** 4-5 horas  
**Dependencias:** T9.4, T10.6

---

### T11.8: SalidaPages
- [ ] Crear `lib/presentation/pages/salida/salida_list_page.dart`
- [ ] Crear `lib/presentation/pages/salida/salida_detail_page.dart`
- [ ] Crear `lib/presentation/pages/salida/create_salida_page.dart`
- [ ] Formulario de creación desde ruta
- [ ] Mostrar lista de salidas próximas
- [ ] Compartir salida (link/código)
- [ ] Lista de participantes (mock)
- [ ] Integrar con SalidaCubit

**Estimación:** 5-6 horas  
**Dependencias:** T9.5, T11.6

---

## 📋 Fase 12: Integración y Datos Mock

### T12.1: Datos Mock
- [ ] Crear archivo JSON con datos de obras de ejemplo
- [ ] Crear archivo JSON con datos de artistas de ejemplo
- [ ] Implementar carga de datos mock si API no disponible
- [ ] Datos suficientes para testing (mínimo 20-30 obras)

**Estimación:** 2-3 horas  
**Dependencias:** T6.1, T6.2

---

### T12.2: Integración Completa
- [ ] Conectar todas las capas
- [ ] Verificar flujo completo: UI → BLoC → UseCase → Repository → DataSource
- [ ] Probar offline-first
- [ ] Probar caché de datos

**Estimación:** 3-4 horas  
**Dependencias:** Todas las fases anteriores

---

### T12.3: Permisos
- [ ] Implementar solicitud de permisos de ubicación
- [ ] Manejar casos de permiso denegado
- [ ] Funcionar sin permisos (modo degradado)

**Estimación:** 1-2 horas  
**Dependencias:** T11.1

---

## 📋 Fase 13: Testing Básico

### T13.1: Unit Tests
- [ ] Tests para use cases críticos (GetObras, CreateRuta, AddToTop10)
- [ ] Tests para repositorios (mocks de data sources)
- [ ] Tests para BLoCs (bloc_test)

**Estimación:** 4-6 horas  
**Dependencias:** Todas las fases anteriores

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
| Fase 1: Setup | 4 tareas | 5-7 horas |
| Fase 2: Core | 3 tareas | 5 horas |
| Fase 3: Domain Entities | 4 tareas | 4 horas |
| Fase 4: Domain Repos (Interfaces) | 5 tareas | 2.5 horas |
| Fase 5: Domain Use Cases | 5 tareas | 10-14 horas |
| Fase 6: Data Models | 4 tareas | 4-5 horas |
| Fase 7: Data Sources | 7 tareas | 14-16 horas |
| Fase 8: Data Repos (Impl) | 5 tareas | 12 horas |
| Fase 9: BLoCs | 6 tareas | 15-19 horas |
| Fase 10: Widgets | 6 tareas | 21-28 horas |
| Fase 11: Páginas | 8 tareas | 37-47 horas |
| Fase 12: Integración | 3 tareas | 6-9 horas |
| Fase 13: Testing | 2 tareas | 7-10 horas |
| Fase 14: Polish | 4 tareas | 9-12 horas |
| **TOTAL** | **66 tareas** | **162-198 horas** |

**Estimación total:** ~20-25 días de trabajo (8 horas/día) o ~4-5 semanas (40 horas/semana)

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
- T11.7: Top10Page
- T10.4: Widgets de mapa completos
- T14.1: Estados vacíos y errores

### Nice to Have (Opcional MVP1):
- T11.8: Salidas grupales (puede ser básico)
- T13.1-T13.2: Testing completo
- T14.2: Animaciones avanzadas
- T14.3: Optimizaciones avanzadas

---

## ✅ Checklist de Validación

Antes de considerar MVP1 completo, verificar:

- [ ] Todas las funcionalidades core funcionan
- [ ] Modo offline funciona para datos cacheados
- [ ] Mapa carga en menos de 2 segundos
- [ ] Crear ruta funciona en 6 pasos
- [ ] Top 10 funciona con drag & drop
- [ ] Filtros funcionan en Feed y Mapa
- [ ] Navegación entre pantallas es fluida
- [ ] No hay crashes críticos
- [ ] UI sigue design system
- [ ] Datos mock cargan correctamente

---

*Documento generado por: Architect*  
*Fecha: Inicio del proyecto*  
*Estado: Listo para implementación por Coder*

