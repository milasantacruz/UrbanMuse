/// Clases de error (Failures) para manejo funcional de errores
/// Usando Either pattern de dartz

/// Clase base abstracta para todos los failures
abstract class Failure {
  final String message;
  
  const Failure(this.message);
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is Failure && other.message == message;
  }
  
  @override
  int get hashCode => message.hashCode;
}

/// Error del servidor
class ServerFailure extends Failure {
  const ServerFailure([String message = 'Error del servidor']) : super(message);
}

/// Error de caché
class CacheFailure extends Failure {
  const CacheFailure([String message = 'Error de caché']) : super(message);
}

/// Error de red (sin conexión)
class NetworkFailure extends Failure {
  const NetworkFailure([String message = 'Sin conexión a internet']) : super(message);
}

/// Error de validación
class ValidationFailure extends Failure {
  const ValidationFailure([String message = 'Error de validación']) : super(message);
}

/// Error genérico
class GenericFailure extends Failure {
  const GenericFailure([String message = 'Ha ocurrido un error']) : super(message);
}

