import 'package:dartz/dartz.dart';
import '../entities/ruta.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de Top N (Rutas Favoritas)
/// 
/// **Cambio importante:** Ahora maneja rutas (no obras), máximo 10 rutas.
/// Reemplaza Top10Repository que manejaba obras.
abstract class TopNRepository {
  /// Obtener Top N de rutas del usuario (máximo 10)
  Future<Either<Failure, List<Ruta>>> getTopN();
  
  /// Agregar ruta al Top N
  /// Retorna error si ya hay 10 rutas y se intenta agregar otra
  Future<Either<Failure, List<Ruta>>> addRutaToTopN(String rutaId);
  
  /// Remover ruta del Top N
  Future<Either<Failure, List<Ruta>>> removeRutaFromTopN(String rutaId);
  
  /// Reordenar Top N de rutas
  /// [rutaIds] debe contener los IDs en el orden deseado (máximo 10)
  Future<Either<Failure, List<Ruta>>> reorderTopN(List<String> rutaIds);
}

