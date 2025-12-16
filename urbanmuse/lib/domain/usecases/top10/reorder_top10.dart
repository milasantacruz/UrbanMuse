import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/obra.dart';
import '../../repositories/top10_repository.dart';

/// Use case para reordenar Top 10
/// 
/// ⚠️ **OBSOLETO:** Este use case está obsoleto. El Top 10 de obras fue reemplazado
/// por Top N de rutas. Este código se mantiene temporalmente por compatibilidad.
/// 
/// TODO: Reemplazar con ReorderTopN cuando se implemente la Fase 2.
@Deprecated('Usar ReorderTopN en su lugar. Top N ahora maneja rutas, no obras.')
class ReorderTop10 {
  final Top10Repository repository;
  
  ReorderTop10(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(List<String> obraIds) async {
    if (obraIds.length > AppConstants.topNMaxRutas) {
      return Left(ValidationFailure(
        'No puede haber más de ${AppConstants.topNMaxRutas} obras',
      ));
    }
    
    // Validar que no haya duplicados
    if (obraIds.toSet().length != obraIds.length) {
      return const Left(ValidationFailure('No puede haber obras duplicadas'));
    }
    
    return await repository.reorderTop10(obraIds);
  }
}

