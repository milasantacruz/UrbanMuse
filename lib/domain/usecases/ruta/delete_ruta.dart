import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para eliminar ruta
class DeleteRuta {
  final RutaRepository repository;
  
  DeleteRuta(this.repository);
  
  Future<Either<Failure, void>> call(String id) async {
    if (id.isEmpty) {
      return const Left(ValidationFailure('ID de ruta no puede estar vacío'));
    }
    return await repository.deleteRuta(id);
  }
}

