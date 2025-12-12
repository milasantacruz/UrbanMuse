import 'package:dartz/dartz.dart';
import '../entities/obra.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de Top 10
abstract class Top10Repository {
  /// Obtener Top 10 del usuario
  Future<Either<Failure, List<Obra>>> getTop10();
  
  /// Agregar obra al Top 10
  Future<Either<Failure, List<Obra>>> addToTop10(Obra obra);
  
  /// Remover obra del Top 10
  Future<Either<Failure, List<Obra>>> removeFromTop10(String obraId);
  
  /// Reordenar Top 10
  Future<Either<Failure, List<Obra>>> reorderTop10(List<String> obraIds);
}

