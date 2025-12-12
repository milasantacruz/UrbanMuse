import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/obra.dart';
import '../../repositories/top10_repository.dart';

/// Use case para reordenar Top 10
class ReorderTop10 {
  final Top10Repository repository;
  
  ReorderTop10(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(List<String> obraIds) async {
    if (obraIds.length > AppConstants.top10MaxObras) {
      return const Left(ValidationFailure(
        'No puede haber más de ${AppConstants.top10MaxObras} obras',
      ));
    }
    
    // Validar que no haya duplicados
    if (obraIds.toSet().length != obraIds.length) {
      return const Left(ValidationFailure('No puede haber obras duplicadas'));
    }
    
    return await repository.reorderTop10(obraIds);
  }
}

