import 'package:dartz/dartz.dart';
import '../entities/salida_grupal.dart';
import '../../core/errors/failures.dart';

/// Interfaz del repositorio de salidas grupales
abstract class SalidaRepository {
  /// Crear salida grupal
  Future<Either<Failure, SalidaGrupal>> createSalida(SalidaGrupal salida);
  
  /// Obtener todas las salidas
  Future<Either<Failure, List<SalidaGrupal>>> getSalidas();
  
  /// Unirse a una salida
  Future<Either<Failure, SalidaGrupal>> joinSalida(String salidaId, String userId);
}

