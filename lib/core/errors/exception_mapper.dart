import 'exceptions.dart';
import 'failures.dart';

/// Mapper para convertir Exceptions a Failures
/// Usado en los repositorios para manejo funcional de errores
class ExceptionMapper {
  ExceptionMapper._();

  /// Convertir cualquier Exception a Failure
  static Failure toFailure(Exception exception) {
    if (exception is ServerException) {
      return ServerFailure(exception.message);
    } else if (exception is CacheException) {
      return CacheFailure(exception.message);
    } else if (exception is NetworkException) {
      return NetworkFailure(exception.message);
    } else if (exception is FormatException) {
      return GenericFailure('Error de formato: ${exception.message}');
    } else {
      return GenericFailure('Error inesperado: ${exception.toString()}');
    }
  }

  /// Convertir ServerException a ServerFailure
  static ServerFailure serverFailure(ServerException exception) {
    return ServerFailure(exception.message);
  }

  /// Convertir CacheException a CacheFailure
  static CacheFailure cacheFailure(CacheException exception) {
    return CacheFailure(exception.message);
  }

  /// Convertir NetworkException a NetworkFailure
  static NetworkFailure networkFailure(NetworkException exception) {
    return NetworkFailure(exception.message);
  }

  /// Convertir FormatException a GenericFailure
  static GenericFailure formatFailure(FormatException exception) {
    return GenericFailure('Error de formato: ${exception.message}');
  }
}

