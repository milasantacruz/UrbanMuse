import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/usuario.dart';
import '../../repositories/usuario_repository.dart';

/// Use case para obtener usuario por ID
class GetUsuarioById {
  final UsuarioRepository repository;
  
  GetUsuarioById(this.repository);
  
  Future<Either<Failure, Usuario>> call(String id) async {
    if (id.isEmpty) {
      return const Left(ValidationFailure('ID de usuario no puede estar vacío'));
    }
    
    return await repository.getUsuarioById(id);
  }
}

