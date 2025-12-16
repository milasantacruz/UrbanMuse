import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/publicar_obra_repository.dart';

/// Use case para obtener obras publicadas por un artista
class GetObrasPublicadas {
  final PublicarObraRepository repository;
  
  GetObrasPublicadas(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(String artistaId) async {
    if (artistaId.isEmpty) {
      return const Left(ValidationFailure('ID de artista no puede estar vacío'));
    }
    
    return await repository.getObrasPublicadasPorArtista(artistaId);
  }
}

