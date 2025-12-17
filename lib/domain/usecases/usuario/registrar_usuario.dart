import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/validators.dart';
import '../../entities/usuario.dart';
import '../../repositories/usuario_repository.dart';

/// Use case para registrar nuevo usuario
/// 
/// [tipoUsuario] debe ser 'visitante' o 'artista'
class RegistrarUsuario {
  final UsuarioRepository repository;
  
  RegistrarUsuario(this.repository);
  
  Future<Either<Failure, Usuario>> call({
    required String nombre,
    required String email,
    required String tipoUsuario, // 'visitante' o 'artista'
    String? foto,
  }) async {
    // Validar nombre
    if (nombre.trim().isEmpty) {
      return const Left(ValidationFailure('El nombre es requerido'));
    }
    
    // Validar email
    final emailError = Validators.email(email);
    if (emailError != null) {
      return Left(ValidationFailure(emailError));
    }
    
    // Validar tipo de usuario
    if (!Validators.validarTipoUsuario(tipoUsuario)) {
      return const Left(ValidationFailure('Tipo de usuario debe ser "visitante" o "artista"'));
    }
    
    return await repository.registrarUsuario(
      nombre: nombre,
      email: email,
      tipoUsuario: tipoUsuario,
      foto: foto,
    );
  }
}

