import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/ruta.dart';
import '../../repositories/topn_repository.dart';

/// Use case para agregar ruta al Top N
/// 
/// Valida que no se exceda el límite de 10 rutas
class AddRutaToTopN {
  final TopNRepository repository;
  
  AddRutaToTopN(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call(String rutaId) async {
    // Obtener Top N actual
    final topNResult = await repository.getTopN();
    return topNResult.fold(
      (failure) => Left(failure),
      (rutas) async {
        // Validar límite
        if (rutas.length >= AppConstants.topNMaxRutas) {
          return Left(ValidationFailure(
            'Ya tienes ${AppConstants.topNMaxRutas} rutas en tu Top N. Elimina una antes de agregar otra.',
          ));
        }
        
        // Validar que no esté duplicada
        if (rutas.any((r) => r.id == rutaId)) {
          return const Left(ValidationFailure('Esta ruta ya está en tu Top N'));
        }
        
        return await repository.addRutaToTopN(rutaId);
      },
    );
  }
}

