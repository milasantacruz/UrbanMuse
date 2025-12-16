import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/encuentro.dart';
import '../../repositories/encuentro_repository.dart';

/// Use case para cancelar encuentro
/// 
/// Solo el creador puede cancelar el encuentro.
class CancelEncuentro {
  final EncuentroRepository repository;
  
  CancelEncuentro(this.repository);
  
  Future<Either<Failure, Encuentro>> call({
    required String encuentroId,
    required String userId, // ID del usuario que intenta cancelar
  }) async {
    // Validar que el encuentro existe
    final encuentroResult = await repository.getEncuentroById(encuentroId);
    return encuentroResult.fold(
      (failure) => Left(failure),
      (encuentro) {
        // Validar que el usuario es el creador
        if (encuentro.creadorId != userId) {
          return const Left(ValidationFailure('Solo el creador puede cancelar el encuentro'));
        }
        
        // Validar que no esté ya cancelado
        if (encuentro.cancelado) {
          return const Left(ValidationFailure('Este encuentro ya está cancelado'));
        }
        
        return repository.cancelEncuentro(encuentroId);
      },
    );
  }
}

