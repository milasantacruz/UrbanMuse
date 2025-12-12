import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/obra_repository.dart';

/// Use case para obtener obra por ID
class GetObraById {
  final ObraRepository repository;
  
  GetObraById(this.repository);
  
  Future<Either<Failure, Obra>> call(String id) async {
    if (id.isEmpty) {
      return const Left(ValidationFailure('ID de obra no puede estar vacío'));
    }
    return await repository.getObraById(id);
  }
}

