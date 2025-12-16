import 'package:dartz/dartz.dart';
import '../entities/obra.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio para publicar obras
/// 
/// Solo artistas pueden publicar obras.
/// Permite crear, editar y eliminar obras propias.
abstract class PublicarObraRepository {
  /// Publicar una nueva obra
  /// Solo artistas pueden publicar
  /// Valida que la ubicación esté en CABA
  Future<Either<Failure, Obra>> publicarObra(Obra obra);
  
  /// Obtener obras publicadas por un artista
  Future<Either<Failure, List<Obra>>> getObrasPublicadasPorArtista(String artistaId);
  
  /// Editar una obra publicada
  /// Solo el artista que la publicó puede editarla
  Future<Either<Failure, Obra>> editarObra(Obra obra);
  
  /// Eliminar una obra publicada
  /// Solo el artista que la publicó puede eliminarla
  Future<Either<Failure, void>> eliminarObra(String obraId);
  
  /// Verificar si el usuario puede eliminar una obra
  /// Retorna true si el usuario es artista y es el creador de la obra
  Future<Either<Failure, bool>> puedeEliminarObra({
    required String obraId,
    required String userId,
  });
}

