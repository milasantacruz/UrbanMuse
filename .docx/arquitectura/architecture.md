# 🏗️ Arquitectura - Graffiti Trails

## 📐 Principios Arquitectónicos

### Clean Architecture

La aplicación sigue los principios de **Clean Architecture** con separación clara de responsabilidades en capas:

1. **Presentation Layer:** UI, widgets, BLoCs
2. **Domain Layer:** Entidades, casos de uso, interfaces
3. **Data Layer:** Repositorios, fuentes de datos, modelos

### BLoC Pattern

Gestión de estado mediante **BLoC (Business Logic Component)** pattern:
- **Cubit** para estados simples
- **BLoC** para estados complejos con eventos
- Separación de lógica de negocio de la UI

### Dependency Injection

Uso de **get_it** para inyección de dependencias:
- Registro centralizado de dependencias
- Fácil testing con mocks
- Inversión de dependencias

---

## 📁 Estructura de Carpetas

```
lib/
├── core/                          # Código compartido
│   ├── constants/                  # Constantes de la app
│   ├── errors/                     # Excepciones y fallos
│   ├── network/                    # Configuración de red
│   ├── utils/                      # Utilidades generales
│   └── theme/                      # Tema y design tokens
│
├── data/                           # Data Layer
│   ├── datasources/                # Fuentes de datos
│   │   ├── local/                  # Almacenamiento local
│   │   │   ├── obra_local_datasource.dart
│   │   │   ├── artista_local_datasource.dart
│   │   │   ├── ruta_local_datasource.dart
│   │   │   ├── top10_local_datasource.dart
│   │   │   └── salida_local_datasource.dart
│   │   └── remote/                 # APIs externas
│   │       ├── obra_remote_datasource.dart
│   │       └── artista_remote_datasource.dart
│   │
│   ├── models/                     # Modelos de datos (JSON)
│   │   ├── obra_model.dart
│   │   ├── artista_model.dart
│   │   ├── ruta_model.dart
│   │   └── salida_model.dart
│   │
│   └── repositories/              # Implementación de repositorios
│       ├── obra_repository_impl.dart
│       ├── artista_repository_impl.dart
│       ├── ruta_repository_impl.dart
│       └── salida_repository_impl.dart
│
├── domain/                         # Domain Layer
│   ├── entities/                   # Entidades de negocio
│   │   ├── obra.dart
│   │   ├── artista.dart
│   │   ├── ruta.dart
│   │   ├── ubicacion.dart
│   │   └── salida_grupal.dart
│   │
│   ├── repositories/               # Interfaces de repositorios
│   │   ├── obra_repository.dart
│   │   ├── artista_repository.dart
│   │   ├── ruta_repository.dart
│   │   └── salida_repository.dart
│   │
│   └── usecases/                   # Casos de uso
│       ├── obra/
│       │   ├── get_obras.dart
│       │   ├── get_obra_by_id.dart
│       │   ├── search_obras.dart
│       │   └── filter_obras.dart
│       ├── artista/
│       │   ├── get_artista_by_id.dart
│       │   └── get_obras_by_artista.dart
│       ├── ruta/
│       │   ├── create_ruta.dart
│       │   ├── get_rutas.dart
│       │   ├── get_ruta_by_id.dart
│       │   ├── delete_ruta.dart
│       │   └── calculate_ruta.dart
│       ├── top10/
│       │   ├── add_to_top10.dart
│       │   ├── remove_from_top10.dart
│       │   ├── get_top10.dart
│       │   └── reorder_top10.dart
│       └── salida/
│           ├── create_salida.dart
│           ├── get_salidas.dart
│           └── join_salida.dart
│
└── presentation/                    # Presentation Layer
    ├── bloc/                        # BLoCs y Cubits
    │   ├── obra/
    │   │   ├── obra_bloc.dart
    │   │   ├── obra_event.dart
    │   │   └── obra_state.dart
    │   ├── artista/
    │   │   ├── artista_cubit.dart
    │   │   └── artista_state.dart
    │   ├── ruta/
    │   │   ├── ruta_bloc.dart
    │   │   ├── ruta_event.dart
    │   │   └── ruta_state.dart
    │   ├── top10/
    │   │   ├── top10_cubit.dart
    │   │   └── top10_state.dart
    │   ├── salida/
    │   │   ├── salida_cubit.dart
    │   │   └── salida_state.dart
    │   └── mapa/
    │       ├── mapa_cubit.dart
    │       └── mapa_state.dart
    │
    ├── pages/                       # Pantallas completas
    │   ├── home/
    │   │   └── mapa_page.dart
    │   ├── feed/
    │   │   └── feed_page.dart
    │   ├── obra/
    │   │   ├── obra_detail_page.dart
    │   │   └── obra_list_page.dart
    │   ├── artista/
    │   │   └── artista_profile_page.dart
    │   ├── ruta/
    │   │   ├── ruta_list_page.dart
    │   │   ├── ruta_detail_page.dart
    │   │   └── create_ruta_page.dart
    │   ├── top10/
    │   │   └── top10_page.dart
    │   └── salida/
    │       ├── salida_list_page.dart
    │       ├── salida_detail_page.dart
    │       └── create_salida_page.dart
    │
    ├── widgets/                     # Widgets reutilizables
    │   ├── common/                  # Widgets comunes
    │   │   ├── custom_button.dart
    │   │   ├── custom_text_field.dart
    │   │   ├── loading_indicator.dart
    │   │   └── error_widget.dart
    │   ├── obra/                    # Widgets de obra
    │   │   ├── obra_card.dart
    │   │   ├── obra_list_item.dart
    │   │   └── obra_bottom_sheet.dart
    │   ├── artista/                 # Widgets de artista
    │   │   ├── artista_card.dart
    │   │   └── artista_header.dart
    │   ├── mapa/                    # Widgets de mapa
    │   │   ├── custom_map.dart
    │   │   ├── obra_marker.dart
    │   │   └── ruta_polyline.dart
    │   ├── ruta/                    # Widgets de ruta
    │   │   ├── ruta_card.dart
    │   │   └── ruta_preview.dart
    │   └── top10/                   # Widgets de Top 10
    │       ├── top10_grid_item.dart
    │       └── top10_drag_handler.dart
    │
    └── routes/                      # Configuración de rutas
        └── app_router.dart
```

---

## 🔄 Flujo de Datos

### Ejemplo: Obtener Lista de Obras

```
1. UI (FeedPage)
   ↓
2. BLoC (ObraBloc) - dispatch GetObrasEvent
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
10. Repository retorna List<Obra>
    ↓
11. UseCase retorna Either<Failure, List<Obra>>
    ↓
12. BLoC emite ObraLoadedState
    ↓
13. UI se actualiza con BlocBuilder
```

---

## 🧩 Capas en Detalle

### 1. Presentation Layer

**Responsabilidades:**
- Renderizar UI
- Capturar eventos del usuario
- Mostrar estados (loading, error, success)
- Navegación entre pantallas

**Componentes:**
- **Pages:** Pantallas completas de la app
- **Widgets:** Componentes reutilizables
- **BLoCs/Cubits:** Gestión de estado
- **Routes:** Configuración de navegación

**Reglas:**
- No debe conocer detalles de implementación de Data Layer
- Solo usa entidades del Domain Layer
- Los BLoCs escuchan eventos y emiten estados
- Los widgets son stateless cuando es posible

---

### 2. Domain Layer

**Responsabilidades:**
- Contiene lógica de negocio pura
- Define entidades de negocio
- Define contratos (interfaces) de repositorios
- Implementa casos de uso

**Componentes:**
- **Entities:** Objetos de negocio inmutables
- **Repositories (Interfaces):** Contratos sin implementación
- **UseCases:** Lógica de negocio específica

**Reglas:**
- No depende de otras capas
- No tiene imports de Flutter
- Entidades son clases simples (no modelos JSON)
- UseCases retornan Either<Failure, T> o Future<Either<Failure, T>>

---

### 3. Data Layer

**Responsabilidades:**
- Implementa fuentes de datos (local y remota)
- Convierte modelos JSON a entidades
- Maneja caché y sincronización
- Implementa repositorios concretos

**Componentes:**
- **DataSources:** Acceso directo a datos (API, DB, etc.)
- **Models:** Modelos JSON con métodos toJson/fromJson
- **Repositories (Implementation):** Implementación concreta de interfaces

**Reglas:**
- Implementa interfaces del Domain Layer
- Convierte Models a Entities
- Maneja errores de red y parsing
- Gestiona caché local

---

## 🔌 Inyección de Dependencias

### Configuración con get_it

```dart
// injection_container.dart

final getIt = GetIt.instance;

Future<void> init() async {
  // DataSources
  getIt.registerLazySingleton<ObraRemoteDataSource>(
    () => ObraRemoteDataSourceImpl(client: getIt()),
  );
  
  getIt.registerLazySingleton<ObraLocalDataSource>(
    () => ObraLocalDataSourceImpl(db: getIt()),
  );
  
  // Repositories
  getIt.registerLazySingleton<ObraRepository>(
    () => ObraRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
    ),
  );
  
  // UseCases
  getIt.registerLazySingleton(() => GetObras(getIt()));
  getIt.registerLazySingleton(() => GetObraById(getIt()));
  
  // BLoCs
  getIt.registerFactory(() => ObraBloc(getObras: getIt()));
}
```

---

## 📊 Gestión de Estado (BLoC)

### Patrón BLoC

**Para estados complejos con múltiples eventos:**

```dart
// obra_bloc.dart
class ObraBloc extends Bloc<ObraEvent, ObraState> {
  final GetObras getObras;
  
  ObraBloc({required this.getObras}) : super(ObraInitial()) {
    on<LoadObras>(_onLoadObras);
    on<SearchObras>(_onSearchObras);
    on<FilterObras>(_onFilterObras);
  }
  
  Future<void> _onLoadObras(
    LoadObras event,
    Emitter<ObraState> emit,
  ) async {
    emit(ObraLoading());
    final result = await getObras();
    result.fold(
      (failure) => emit(ObraError(failure.message)),
      (obras) => emit(ObraLoaded(obras)),
    );
  }
}
```

### Patrón Cubit

**Para estados simples sin eventos:**

```dart
// top10_cubit.dart
class Top10Cubit extends Cubit<Top10State> {
  final AddToTop10 addToTop10;
  
  Top10Cubit({required this.addToTop10}) : super(Top10Initial());
  
  Future<void> addObra(Obra obra) async {
    final result = await addToTop10(obra);
    result.fold(
      (failure) => emit(Top10Error(failure.message)),
      (top10) => emit(Top10Loaded(top10)),
    );
  }
}
```

---

## 🗄️ Almacenamiento Local

### Estrategia

**Para datos estructurados (obras, rutas, Top 10):**
- **Hive** o **SQLite (drift)**: Base de datos local
- Modelos con anotaciones para serialización
- Cache automático de datos

**Para preferencias simples:**
- **SharedPreferences**: Configuraciones, filtros guardados

**Para imágenes:**
- **CachedNetworkImage**: Cache automático de imágenes
- **Path Provider**: Almacenamiento de archivos

**Para tiles de mapa:**
- **flutter_map** con cache de tiles offline

---

## 🌐 Manejo de Red

### Configuración

```dart
// network_info.dart
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

// dio_client.dart
class DioClient {
  final Dio dio;
  
  DioClient(this.dio) {
    dio.options.baseUrl = 'https://api.example.com';
    dio.options.connectTimeout = Duration(seconds: 5);
    dio.options.receiveTimeout = Duration(seconds: 3);
    dio.interceptors.add(LogInterceptor());
  }
}
```

### Estrategia Offline-First

1. Intentar obtener datos de API
2. Si falla, usar datos locales (caché)
3. Sincronizar cuando haya conexión
4. Mostrar indicador de estado offline

---

## 🧪 Testing Strategy

### Unit Tests
- **UseCases:** Lógica de negocio
- **Repositories:** Lógica de transformación
- **BLoCs/Cubits:** Gestión de estado

### Widget Tests
- **Widgets críticos:** Cards, botones, inputs
- **Páginas principales:** Flujos de usuario

### Integration Tests (Opcional MVP1)
- **Flujos completos:** Crear ruta, agregar a Top 10

---

## 🔐 Manejo de Erros

### Estructura de Erros

```dart
// failures.dart
abstract class Failure {
  final String message;
  Failure(this.message);
}

class ServerFailure extends Failure {
  ServerFailure([String message = 'Error del servidor']) : super(message);
}

class CacheFailure extends Failure {
  CacheFailure([String message = 'Error de caché']) : super(message);
}

class NetworkFailure extends Failure {
  NetworkFailure([String message = 'Sin conexión']) : super(message);
}
```

### Either Pattern

```dart
// usecase base
abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

// ejemplo
class GetObras implements UseCase<List<Obra>, NoParams> {
  final ObraRepository repository;
  
  GetObras(this.repository);
  
  @override
  Future<Either<Failure, List<Obra>>> call(NoParams params) async {
    try {
      final obras = await repository.getObras();
      return Right(obras);
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message));
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    }
  }
}
```

---

## 📱 Navegación

### go_router o Navigator 2.0

```dart
// app_router.dart
final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => MapaPage(),
    ),
    GoRoute(
      path: '/feed',
      builder: (context, state) => FeedPage(),
    ),
    GoRoute(
      path: '/obra/:id',
      builder: (context, state) => ObraDetailPage(
        obraId: state.pathParameters['id']!,
      ),
    ),
  ],
);
```

---

## ✅ Principios de Diseño Aplicados

1. **Single Responsibility:** Cada clase tiene una responsabilidad
2. **Dependency Inversion:** Dependencias de abstracciones, no implementaciones
3. **Open/Closed:** Abierto para extensión, cerrado para modificación
4. **Interface Segregation:** Interfaces específicas, no genéricas
5. **DRY (Don't Repeat Yourself):** Reutilización de código
6. **SOLID:** Todos los principios aplicados

---

*Documento generado por: Architect*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

