import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/validators.dart';
import '../../entities/obra.dart';
import '../../repositories/publicar_obra_repository.dart';

/// Use case para editar una obra publicada
/// 
/// Solo el artista que la publicó puede editarla.
/// Valida ubicación en CABA y datos requeridos.
class EditarObra {
  final PublicarObraRepository repository;
  
  EditarObra(this.repository);
  
  Future<Either<Failure, Obra>> call({
    required Obra obra,
    required String userId, // ID del usuario que intenta editar
  }) async {
    // Validar que el usuario puede editar la obra
    final puedeEliminarResult = await repository.puedeEliminarObra(
      obraId: obra.id,
      userId: userId,
    );
    
    return puedeEliminarResult.fold(
      (failure) => Left(failure),
      (puedeEliminar) async {
        if (!puedeEliminar) {
          return const Left(ValidationFailure('Solo el artista que publicó la obra puede editarla'));
        }
        
        // Validar ubicación en CABA
        if (!Validators.validarUbicacionCABA(
          obra.ubicacion.lat,
          obra.ubicacion.lng,
        )) {
          return const Left(ValidationFailure('La obra debe estar dentro de CABA'));
        }
        
        // Validar título
        if (obra.titulo.trim().isEmpty) {
          return const Left(ValidationFailure('El título es requerido'));
        }
        
        return await repository.editarObra(obra);
      },
    );
  }
}

