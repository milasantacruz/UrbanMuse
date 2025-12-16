import 'package:dartz/dartz.dart';
import '../entities/usuario.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de usuarios
abstract class UsuarioRepository {
  /// Obtener usuario por ID
  Future<Either<Failure, Usuario>> getUsuarioById(String id);
  
  /// Obtener usuario actual (sesión activa)
  Future<Either<Failure, Usuario?>> getUsuarioActual();
  
  /// Registrar nuevo usuario
  /// [tipoUsuario] debe ser 'visitante' o 'artista'
  Future<Either<Failure, Usuario>> registrarUsuario({
    required String nombre,
    required String email,
    required String tipoUsuario, // 'visitante' o 'artista'
    String? foto,
  });
  
  /// Actualizar información del usuario
  Future<Either<Failure, Usuario>> updateUsuario(Usuario usuario);
  
  /// Verificar si el usuario es artista
  Future<Either<Failure, bool>> esArtista(String userId);
  
  /// Verificar si el usuario es visitante
  Future<Either<Failure, bool>> esVisitante(String userId);
}

