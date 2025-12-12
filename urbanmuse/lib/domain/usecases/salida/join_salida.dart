import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/salida_grupal.dart';
import '../../repositories/salida_repository.dart';

/// Use case para unirse a una salida
class JoinSalida {
  final SalidaRepository repository;
  
  JoinSalida(this.repository);
  
  Future<Either<Failure, SalidaGrupal>> call(String salidaId, String userId) async {
    if (salidaId.isEmpty) {
      return const Left(ValidationFailure('ID de salida no puede estar vacío'));
    }
    if (userId.isEmpty) {
      return const Left(ValidationFailure('ID de usuario no puede estar vacío'));
    }
    
    return await repository.joinSalida(salidaId, userId);
  }
}

