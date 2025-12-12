import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/artista.dart';
import '../../repositories/artista_repository.dart';

/// Use case para obtener artista por ID
class GetArtistaById {
  final ArtistaRepository repository;
  
  GetArtistaById(this.repository);
  
  Future<Either<Failure, Artista>> call(String id) async {
    if (id.isEmpty) {
      return const Left(ValidationFailure('ID de artista no puede estar vacío'));
    }
    return await repository.getArtistaById(id);
  }
}

