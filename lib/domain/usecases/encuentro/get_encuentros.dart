import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/encuentro.dart';
import '../../repositories/encuentro_repository.dart';

/// Use case para obtener todos los encuentros
class GetEncuentros {
  final EncuentroRepository repository;
  
  GetEncuentros(this.repository);
  
  Future<Either<Failure, List<Encuentro>>> call() async {
    return await repository.getEncuentros();
  }
}

