/// Excepciones que se lanzan en la Data Layer
/// Se convierten a Failures en los repositorios

/// Excepción del servidor
class ServerException implements Exception {
  final String message;
  
  ServerException(this.message);
  
  @override
  String toString() => 'ServerException: $message';
}

/// Excepción de caché
class CacheException implements Exception {
  final String message;
  
  CacheException(this.message);
  
  @override
  String toString() => 'CacheException: $message';
}

/// Excepción de red
class NetworkException implements Exception {
  final String message;
  
  NetworkException(this.message);
  
  @override
  String toString() => 'NetworkException: $message';
}

/// Excepción de formato (parsing JSON)
class FormatException implements Exception {
  final String message;
  
  FormatException(this.message);
  
  @override
  String toString() => 'FormatException: $message';
}

