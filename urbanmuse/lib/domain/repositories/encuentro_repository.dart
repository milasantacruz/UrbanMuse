import 'package:dartz/dartz.dart';
import '../entities/encuentro.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de encuentros
/// 
/// **Cambio importante:** Reemplaza SalidaRepository.
/// Solo artistas pueden crear encuentros.
/// Un encuentro es un evento donde un artista anuncia que va a pintar en vivo.
abstract class EncuentroRepository {
  /// Crear nuevo encuentro
  /// Solo artistas pueden crear encuentros
  Future<Either<Failure, Encuentro>> createEncuentro(Encuentro encuentro);
  
  /// Obtener todos los encuentros
  Future<Either<Failure, List<Encuentro>>> getEncuentros();
  
  /// Obtener encuentros próximos (fecha >= hoy)
  Future<Either<Failure, List<Encuentro>>> getEncuentrosProximos();
  
  /// Obtener encuentro por ID
  Future<Either<Failure, Encuentro>> getEncuentroById(String id);
  
  /// Unirse a un encuentro
  Future<Either<Failure, Encuentro>> joinEncuentro({
    required String encuentroId,
    required String userId,
  });
  
  /// Cancelar encuentro (solo el creador puede cancelar)
  Future<Either<Failure, Encuentro>> cancelEncuentro(String encuentroId);
  
  /// Obtener encuentros de un artista específico
  Future<Either<Failure, List<Encuentro>>> getEncuentrosByArtista(String artistaId);
}

