import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/encuentro.dart';
import '../../repositories/encuentro_repository.dart';

/// Use case para unirse a un encuentro
class JoinEncuentro {
  final EncuentroRepository repository;
  
  JoinEncuentro(this.repository);
  
  Future<Either<Failure, Encuentro>> call({
    required String encuentroId,
    required String userId,
  }) async {
    // Validar que el encuentro existe y no está cancelado
    final encuentroResult = await repository.getEncuentroById(encuentroId);
    return encuentroResult.fold(
      (failure) => Left(failure),
      (encuentro) {
        if (encuentro.cancelado) {
          return const Left(ValidationFailure('Este encuentro ha sido cancelado'));
        }
        if (encuentro.asistentesIds.contains(userId)) {
          return const Left(ValidationFailure('Ya estás unido a este encuentro'));
        }
        
        return repository.joinEncuentro(
          encuentroId: encuentroId,
          userId: userId,
        );
      },
    );
  }
}

