import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para crear ruta
class CreateRuta {
  final RutaRepository repository;
  
  CreateRuta(this.repository);
  
  Future<Either<Failure, Ruta>> call(Ruta ruta) async {
    // Validaciones
    if (ruta.obraIds.length < AppConstants.rutaMinObras) {
      return const Left(ValidationFailure('La ruta debe tener al menos 1 obra'));
    }
    if (ruta.obraIds.length > AppConstants.rutaMaxObras) {
      return Left(ValidationFailure(
        'La ruta no puede tener más de ${AppConstants.rutaMaxObras} obras',
      ));
    }
    if (ruta.nombre.trim().isEmpty) {
      return const Left(ValidationFailure('El nombre de la ruta es requerido'));
    }
    
    return await repository.createRuta(ruta);
  }
}

