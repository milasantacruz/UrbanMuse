import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/usuario.dart';
import '../../repositories/usuario_repository.dart';

/// Use case para actualizar un usuario
class UpdateUsuario {
  final UsuarioRepository repository;
  
  UpdateUsuario(this.repository);
  
  Future<Either<Failure, Usuario>> call(Usuario usuario) async {
    return await repository.updateUsuario(usuario);
  }
}

