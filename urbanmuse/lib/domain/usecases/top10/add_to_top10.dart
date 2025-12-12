import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../entities/obra.dart';
import '../../repositories/top10_repository.dart';

/// Use case para agregar obra al Top 10
class AddToTop10 {
  final Top10Repository repository;
  
  AddToTop10(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(Obra obra) async {
    // Obtener Top 10 actual para validar
    final currentTop10 = await repository.getTop10();
    
    return currentTop10.fold(
      (failure) => Left(failure),
      (currentList) async {
        // Validar límite
        if (currentList.length >= AppConstants.top10MaxObras) {
          return const Left(ValidationFailure(
            'El Top 10 está completo. Elimina una obra primero.',
          ));
        }
        
        // Validar duplicados
        if (currentList.any((o) => o.id == obra.id)) {
          return const Left(ValidationFailure('Esta obra ya está en tu Top 10'));
        }
        
        return await repository.addToTop10(obra);
      },
    );
  }
}

