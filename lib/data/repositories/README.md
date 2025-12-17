# Repository Implementations

Este directorio contiene las implementaciones de los repositorios definidos en el Domain Layer.

## Estructura

Cada repositorio implementa la interfaz correspondiente del Domain Layer y:
- Decide si usar fuente local o remota según conectividad
- Convierte Models a Entities
- Maneja errores y los convierte a Failures
- Implementa estrategia offline-first

## Ejemplo de estructura

```dart
class ObraRepositoryImpl implements ObraRepository {
  final ObraRemoteDataSource remoteDataSource;
  final ObraLocalDataSource localDataSource;
  final NetworkInfo networkInfo;
  
  // Implementar métodos del contrato
  @override
  Future<Either<Failure, List<Obra>>> getObras() async {
    // Lógica de offline-first
  }
}
```

