import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para unirse a una ruta dinámica
class JoinRutaDinamica {
  final RutaRepository repository;
  
  JoinRutaDinamica(this.repository);
  
  Future<Either<Failure, Ruta>> call({
    required String rutaId,
    required String userId,
  }) async {
    // Validar que la ruta existe y es dinámica
    final rutaResult = await repository.getRutaById(rutaId);
    return rutaResult.fold(
      (failure) => Left(failure),
      (ruta) {
        if (!ruta.esDinamica) {
          return const Left(ValidationFailure('Solo puedes unirte a rutas dinámicas'));
        }
        if (ruta.asistentesIds.contains(userId)) {
          return const Left(ValidationFailure('Ya estás unido a esta ruta'));
        }
        
        return repository.joinRutaDinamica(
          rutaId: rutaId,
          userId: userId,
        );
      },
    );
  }
}

