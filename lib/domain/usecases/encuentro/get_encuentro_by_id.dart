import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/encuentro.dart';
import '../../repositories/encuentro_repository.dart';

/// Use case para obtener un encuentro por ID
class GetEncuentroById {
  final EncuentroRepository repository;
  
  GetEncuentroById(this.repository);
  
  Future<Either<Failure, Encuentro>> call(String id) async {
    return await repository.getEncuentroById(id);
  }
}

