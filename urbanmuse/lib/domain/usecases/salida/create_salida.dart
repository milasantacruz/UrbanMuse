import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/salida_grupal.dart';
import '../../repositories/salida_repository.dart';

/// Use case para crear salida grupal
class CreateSalida {
  final SalidaRepository repository;
  
  CreateSalida(this.repository);
  
  Future<Either<Failure, SalidaGrupal>> call(SalidaGrupal salida) async {
    // Validar fecha futura
    final now = DateTime.now();
    final fechaSalida = DateTime(
      salida.fecha.year,
      salida.fecha.month,
      salida.fecha.day,
      salida.horario.hour,
      salida.horario.minute,
    );
    
    if (fechaSalida.isBefore(now)) {
      return const Left(ValidationFailure('La fecha de salida debe ser futura'));
    }
    
    if (salida.descripcion.trim().isEmpty) {
      return const Left(ValidationFailure('La descripción es requerida'));
    }
    
    return await repository.createSalida(salida);
  }
}

