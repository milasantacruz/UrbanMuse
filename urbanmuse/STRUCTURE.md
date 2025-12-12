# 📁 Estructura del Proyecto - Graffiti Trails

Este documento describe la estructura completa del proyecto Flutter siguiendo Clean Architecture.

## 🏗️ Arquitectura General

El proyecto sigue **Clean Architecture** con separación en 3 capas principales:

```
lib/
├── core/           # Código compartido y utilidades
├── data/           # Data Layer (fuentes de datos)
├── domain/         # Domain Layer (lógica de negocio)
└── presentation/    # Presentation Layer (UI y estado)
```

---

## 📂 Core Layer (`lib/core/`)

Código compartido y utilidades base de la aplicación.

### `constants/`
- **app_constants.dart**: Constantes de la app (límites, categorías, etc.)

### `errors/`
- **failures.dart**: Clases de error (Failure) para manejo funcional
- **exceptions.dart**: Excepciones que se lanzan en Data Layer

### `network/`
- **dio_client.dart**: Cliente HTTP configurado con Dio
- **network_info.dart**: Verificación de conectividad
- **api_endpoints.dart**: Endpoints de la API

### `utils/`
- **validators.dart**: Validadores para formularios
- **date_formatter.dart**: Utilidades para formatear fechas
- **distance_calculator.dart**: Cálculo de distancias y tiempos

### `injection/`
- **injection_container.dart**: Configuración de GetIt (DI)

### `theme/`
- **app_colors.dart**: Design tokens de colores
- **app_text_styles.dart**: Design tokens de tipografía
- **app_spacing.dart**: Design tokens de espaciado
- **app_border_radius.dart**: Design tokens de border radius
- **app_shadows.dart**: Design tokens de sombras
- **app_theme.dart**: Tema principal (Light/Dark)
- **theme.dart**: Exportación centralizada

---

## 📂 Domain Layer (`lib/domain/`)

Lógica de negocio pura, independiente de frameworks.

### `entities/`
Entidades de negocio (modelos puros):
- **ubicacion.dart**: Ubicación geográfica
- **obra.dart**: Obra de arte callejero
- **artista.dart**: Artista
- **ruta.dart**: Ruta creada por el usuario
- **salida_grupal.dart**: Salida grupal

### `repositories/`
Interfaces (contratos) de repositorios:
- **obra_repository.dart**
- **artista_repository.dart**
- **ruta_repository.dart**
- **top10_repository.dart**
- **salida_repository.dart**

### `usecases/`
Casos de uso (lógica de negocio):
- **obra/**: GetObras, GetObraById, SearchObras, FilterObras
- **artista/**: GetArtistaById, GetObrasByArtista
- **ruta/**: CreateRuta, GetRutas, GetRutaById, DeleteRuta, CalculateRuta
- **top10/**: GetTop10, AddToTop10, RemoveFromTop10, ReorderTop10
- **salida/**: CreateSalida, GetSalidas, JoinSalida

---

## 📂 Data Layer (`lib/data/`)

Implementación de fuentes de datos y repositorios.

### `datasources/`
- **local/**: Data sources locales (Hive)
  - obra_local_datasource.dart
  - artista_local_datasource.dart
  - ruta_local_datasource.dart
  - top10_local_datasource.dart
  - salida_local_datasource.dart

- **remote/**: Data sources remotos (API)
  - obra_remote_datasource.dart
  - artista_remote_datasource.dart

### `models/`
Modelos de datos (JSON):
- obra_model.dart
- artista_model.dart
- ruta_model.dart
- salida_model.dart

### `repositories/`
Implementaciones de repositorios:
- obra_repository_impl.dart
- artista_repository_impl.dart
- ruta_repository_impl.dart
- top10_repository_impl.dart
- salida_repository_impl.dart

---

## 📂 Presentation Layer (`lib/presentation/`)

UI, gestión de estado y navegación.

### `bloc/`
BLoCs y Cubits para gestión de estado:
- **obra/**: ObraBloc (event, state, bloc)
- **artista/**: ArtistaCubit (state, cubit)
- **ruta/**: RutaBloc (event, state, bloc)
- **top10/**: Top10Cubit (state, cubit)
- **salida/**: SalidaCubit (state, cubit)
- **mapa/**: MapaCubit (state, cubit)

### `pages/`
Pantallas completas de la app:
- **home/**: MapaPage (pantalla principal)
- **feed/**: FeedPage (feed de obras)
- **obra/**: ObraDetailPage, ObraListPage
- **artista/**: ArtistaProfilePage
- **ruta/**: RutaListPage, RutaDetailPage, CreateRutaPage
- **top10/**: Top10Page
- **salida/**: SalidaListPage, SalidaDetailPage, CreateSalidaPage

### `widgets/`
Widgets reutilizables:
- **common/**: LoadingIndicator, ErrorDisplay, EmptyState
- **obra/**: ObraCard, ObraListItem, ObraBottomSheet
- **artista/**: ArtistaCard, ArtistaHeader
- **mapa/**: CustomMap, ObraMarker, RutaPolyline
- **ruta/**: RutaCard, RutaPreview
- **top10/**: Top10GridItem, Top10DragHandler

### `routes/`
- **app_router.dart**: Configuración de rutas con go_router

---

## 🔄 Flujo de Datos

### Ejemplo: Obtener Lista de Obras

```
1. UI (FeedPage)
   ↓
2. BLoC (ObraBloc) - dispatch LoadObras event
   ↓
3. UseCase (GetObras) - ejecuta lógica de negocio
   ↓
4. Repository Interface (ObraRepository) - contrato
   ↓
5. Repository Implementation (ObraRepositoryImpl)
   ↓
6. DataSource (ObraRemoteDataSource o ObraLocalDataSource)
   ↓
7. API/DB - obtiene datos
   ↓
8. Model (ObraModel) - parsea JSON
   ↓
9. Entity (Obra) - convierte a entidad de dominio
   ↓
10. Repository retorna Either<Failure, List<Obra>>
    ↓
11. UseCase retorna Either<Failure, List<Obra>>
    ↓
12. BLoC emite ObraLoadedState
    ↓
13. UI se actualiza con BlocBuilder
```

---

## 📦 Dependencias Principales

- **flutter_bloc**: Gestión de estado
- **get_it**: Inyección de dependencias
- **go_router**: Navegación declarativa
- **dartz**: Programación funcional (Either)
- **equatable**: Comparación de objetos
- **dio**: Cliente HTTP
- **hive**: Base de datos local
- **flex_color_scheme**: Sistema de temas
- **flutter_map**: Mapas offline-friendly
- **connectivity_plus**: Verificación de conectividad

---

## 🚀 Próximos Pasos

1. **Implementar Data Layer**:
   - Crear modelos con fromJson/toJson
   - Implementar data sources locales (Hive)
   - Implementar data sources remotos (API)
   - Implementar repositorios con estrategia offline-first

2. **Completar Presentation Layer**:
   - Implementar widgets de UI
   - Conectar BLoCs con páginas
   - Agregar navegación completa

3. **Testing**:
   - Unit tests para use cases
   - Widget tests para componentes
   - Integration tests para flujos principales

---

## 📝 Notas

- Todos los archivos están estructurados pero muchos aún no tienen implementación completa
- Los archivos tienen placeholders con "Por implementar" donde corresponde
- La estructura sigue las mejores prácticas de Clean Architecture y Flutter
- El proyecto está listo para comenzar la implementación incremental

