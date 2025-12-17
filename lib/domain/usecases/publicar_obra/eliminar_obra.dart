import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../repositories/publicar_obra_repository.dart';

/// Use case para eliminar una obra publicada
/// 
/// Solo el artista que la publicó puede eliminarla.
class EliminarObra {
  final PublicarObraRepository repository;
  
  EliminarObra(this.repository);
  
  Future<Either<Failure, void>> call({
    required String obraId,
    required String userId, // ID del usuario que intenta eliminar
  }) async {
    // Validar que el usuario puede eliminar la obra
    final puedeEliminarResult = await repository.puedeEliminarObra(
      obraId: obraId,
      userId: userId,
    );
    
    return puedeEliminarResult.fold(
      (failure) => Left(failure),
      (puedeEliminar) async {
        if (!puedeEliminar) {
          return const Left(ValidationFailure('Solo el artista que publicó la obra puede eliminarla'));
        }
        
        return await repository.eliminarObra(obraId);
      },
    );
  }
}

