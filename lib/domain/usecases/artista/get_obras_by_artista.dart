import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/artista_repository.dart';

/// Use case para obtener obras de un artista
class GetObrasByArtista {
  final ArtistaRepository repository;
  
  GetObrasByArtista(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(String artistaId) async {
    if (artistaId.isEmpty) {
      return const Left(ValidationFailure('ID de artista no puede estar vacío'));
    }
    return await repository.getObrasByArtista(artistaId);
  }
}

