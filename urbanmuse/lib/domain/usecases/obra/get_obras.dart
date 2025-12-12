import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/obra_repository.dart';

/// Use case para obtener todas las obras
class GetObras {
  final ObraRepository repository;
  
  GetObras(this.repository);
  
  Future<Either<Failure, List<Obra>>> call() async {
    return await repository.getObras();
  }
}

