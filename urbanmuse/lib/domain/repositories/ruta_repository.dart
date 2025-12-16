import 'package:dartz/dartz.dart';
import '../entities/ruta.dart';
import '../entities/ubicacion.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de rutas
abstract class RutaRepository {
  /// Crear nueva ruta (privada, pública estática o pública dinámica)
  Future<Either<Failure, Ruta>> createRuta(Ruta ruta);
  
  /// Obtener todas las rutas del usuario
  Future<Either<Failure, List<Ruta>>> getRutas();
  
  /// Obtener rutas públicas estáticas
  Future<Either<Failure, List<Ruta>>> getRutasPublicas();
  
  /// Obtener rutas públicas dinámicas (eventos repetitivos)
  Future<Either<Failure, List<Ruta>>> getRutasPublicasDinamicas();
  
  /// Obtener ruta por ID
  Future<Either<Failure, Ruta>> getRutaById(String id);
  
  /// Eliminar ruta
  Future<Either<Failure, void>> deleteRuta(String id);
  
  /// Calcular ruta entre dos puntos con obras en el camino
  Future<Either<Failure, Ruta>> calculateRuta({
    required Ubicacion puntoA,
    required Ubicacion puntoB,
    required List<String> obraIds,
    required String modoTransporte, // 'bici' o 'a_pie'
  });
  
  /// Convertir ruta pública estática a dinámica (agregar rrule)
  Future<Either<Failure, Ruta>> convertirADinamica({
    required String rutaId,
    required String rrule,
    required DateTime fechaInicial,
    required String hora, // TimeOfDay como String
  });
  
  /// Unirse a una ruta dinámica
  Future<Either<Failure, Ruta>> joinRutaDinamica({
    required String rutaId,
    required String userId,
  });
  
  /// Salir de una ruta dinámica
  Future<Either<Failure, Ruta>> leaveRutaDinamica({
    required String rutaId,
    required String userId,
  });
}

