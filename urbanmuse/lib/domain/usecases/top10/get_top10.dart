import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/top10_repository.dart';

/// Use case para obtener Top 10
class GetTop10 {
  final Top10Repository repository;
  
  GetTop10(this.repository);
  
  Future<Either<Failure, List<Obra>>> call() async {
    return await repository.getTop10();
  }
}

