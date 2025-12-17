import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/obra.dart';
import '../../repositories/top10_repository.dart';

/// Use case para agregar obra al Top 10
/// 
/// ⚠️ **OBSOLETO:** Este use case está obsoleto. El Top 10 de obras fue reemplazado
/// por Top N de rutas. Este código se mantiene temporalmente por compatibilidad.
/// 
/// TODO: Reemplazar con AddRutaToTopN cuando se implemente la Fase 2.
@Deprecated('Usar AddRutaToTopN en su lugar. Top N ahora maneja rutas, no obras.')
class AddToTop10 {
  final Top10Repository repository;
  
  AddToTop10(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(Obra obra) async {
    // Obtener Top 10 actual para validar
    final currentTop10 = await repository.getTop10();
    
    return currentTop10.fold(
      (failure) => Left(failure),
      (currentList) async {
        // Validar límite (usando topNMaxRutas como referencia temporal)
        if (currentList.length >= AppConstants.topNMaxRutas) {
          return const Left(ValidationFailure(
            'El Top N está completo. Elimina una obra primero.',
          ));
        }
        
        // Validar duplicados
        if (currentList.any((o) => o.id == obra.id)) {
          return const Left(ValidationFailure('Esta obra ya está en tu Top N'));
        }
        
        return await repository.addToTop10(obra);
      },
    );
  }
}

