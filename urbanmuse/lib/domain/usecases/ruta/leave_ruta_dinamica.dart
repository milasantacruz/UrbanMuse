import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para salir de una ruta dinámica
class LeaveRutaDinamica {
  final RutaRepository repository;
  
  LeaveRutaDinamica(this.repository);
  
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
          return const Left(ValidationFailure('Solo puedes salir de rutas dinámicas'));
        }
        if (!ruta.asistentesIds.contains(userId)) {
          return const Left(ValidationFailure('No estás unido a esta ruta'));
        }
        
        return repository.leaveRutaDinamica(
          rutaId: rutaId,
          userId: userId,
        );
      },
    );
  }
}

