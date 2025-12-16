import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/validators.dart';
import '../../entities/obra.dart';
import '../../repositories/publicar_obra_repository.dart';

/// Use case para publicar una obra
/// 
/// Solo artistas pueden publicar obras.
/// Valida ubicación en CABA y datos requeridos.
class PublicarObra {
  final PublicarObraRepository repository;
  
  PublicarObra(this.repository);
  
  Future<Either<Failure, Obra>> call(Obra obra) async {
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
    
    // Validar categoría
    if (obra.categoria.trim().isEmpty) {
      return const Left(ValidationFailure('La categoría es requerida'));
    }
    
    // Validar foto
    if (obra.foto.trim().isEmpty) {
      return const Left(ValidationFailure('La foto es requerida'));
    }
    
    return await repository.publicarObra(obra);
  }
}

