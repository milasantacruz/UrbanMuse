import 'package:dartz/dartz.dart';
import '../entities/obra.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de obras
abstract class ObraRepository {
  /// Obtener todas las obras
  Future<Either<Failure, List<Obra>>> getObras();
  
  /// Obtener obra por ID
  Future<Either<Failure, Obra>> getObraById(String id);
  
  /// Buscar obras por texto
  Future<Either<Failure, List<Obra>>> searchObras(String query);
  
  /// Filtrar obras por categoría y/o artista
  Future<Either<Failure, List<Obra>>> filterObras({
    List<String>? categorias,
    List<String>? artistaIds,
  });
}

