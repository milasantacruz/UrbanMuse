import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/top10_repository.dart';

/// Use case para remover obra del Top 10
class RemoveFromTop10 {
  final Top10Repository repository;
  
  RemoveFromTop10(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(String obraId) async {
    if (obraId.isEmpty) {
      return const Left(ValidationFailure('ID de obra no puede estar vacío'));
    }
    return await repository.removeFromTop10(obraId);
  }
}

