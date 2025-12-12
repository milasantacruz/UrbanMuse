import 'package:dartz/dartz.dart';
import '../entities/ruta.dart';
import '../entities/ubicacion.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de rutas
abstract class RutaRepository {
  /// Crear nueva ruta
  Future<Either<Failure, Ruta>> createRuta(Ruta ruta);
  
  /// Obtener todas las rutas del usuario
  Future<Either<Failure, List<Ruta>>> getRutas();
  
  /// Obtener ruta por ID
  Future<Either<Failure, Ruta>> getRutaById(String id);
  
  /// Eliminar ruta
  Future<Either<Failure, void>> deleteRuta(String id);
  
  /// Calcular ruta entre dos puntos con obras en el camino
  Future<Either<Failure, Ruta>> calculateRuta({
    required Ubicacion puntoA,
    required Ubicacion puntoB,
    required List<String> obraIds,
    required String transporte,
  });
}

