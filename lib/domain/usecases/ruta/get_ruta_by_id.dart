import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para obtener ruta por ID
class GetRutaById {
  final RutaRepository repository;
  
  GetRutaById(this.repository);
  
  Future<Either<Failure, Ruta>> call(String id) async {
    if (id.isEmpty) {
      return const Left(ValidationFailure('ID de ruta no puede estar vacío'));
    }
    return await repository.getRutaById(id);
  }
}

