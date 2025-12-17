import 'package:dartz/dartz.dart';
import '../entities/artista.dart';
import '../entities/obra.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de artistas
abstract class ArtistaRepository {
  /// Obtener artista por ID
  Future<Either<Failure, Artista>> getArtistaById(String id);
  
  /// Obtener obras de un artista
  Future<Either<Failure, List<Obra>>> getObrasByArtista(String artistaId);
}

