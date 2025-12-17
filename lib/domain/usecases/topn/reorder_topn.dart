import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/ruta.dart';
import '../../repositories/topn_repository.dart';

/// Use case para reordenar Top N de rutas
/// 
/// Valida que no se exceda el límite de 10 rutas
class ReorderTopN {
  final TopNRepository repository;
  
  ReorderTopN(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call(List<String> rutaIds) async {
    // Validar límite
    if (rutaIds.length > AppConstants.topNMaxRutas) {
      return Left(ValidationFailure(
        'No puedes tener más de ${AppConstants.topNMaxRutas} rutas en tu Top N',
      ));
    }
    
    // Validar que no haya duplicados
    if (rutaIds.length != rutaIds.toSet().length) {
      return const Left(ValidationFailure('No puedes tener rutas duplicadas en tu Top N'));
    }
    
    return await repository.reorderTopN(rutaIds);
  }
}

