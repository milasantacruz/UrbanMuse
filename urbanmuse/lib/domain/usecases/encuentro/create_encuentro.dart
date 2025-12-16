import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/validators.dart';
import '../../entities/encuentro.dart';
import '../../repositories/encuentro_repository.dart';

/// Use case para crear encuentro
/// 
/// Solo artistas pueden crear encuentros.
/// Valida fecha futura y ubicación en CABA.
class CreateEncuentro {
  final EncuentroRepository repository;
  
  CreateEncuentro(this.repository);
  
  Future<Either<Failure, Encuentro>> call(Encuentro encuentro) async {
    // Validar fecha futura
    final fechaCompleta = DateTime(
      encuentro.fecha.year,
      encuentro.fecha.month,
      encuentro.fecha.day,
      encuentro.hora.hour,
      encuentro.hora.minute,
    );
    
    if (!Validators.validarFechaFutura(fechaCompleta)) {
      return const Left(ValidationFailure('La fecha del encuentro debe ser futura'));
    }
    
    // Validar ubicación en CABA
    if (!Validators.validarUbicacionCABA(
      encuentro.ubicacion.lat,
      encuentro.ubicacion.lng,
    )) {
      return const Left(ValidationFailure('El encuentro debe estar dentro de CABA'));
    }
    
    // Validar descripción
    if (encuentro.descripcion.trim().isEmpty) {
      return const Left(ValidationFailure('La descripción es requerida'));
    }
    
    // Validar rrule si es repetitivo
    if (encuentro.esRepetitivo && encuentro.rrule != null) {
      if (!Validators.validarRRule(encuentro.rrule!)) {
        return const Left(ValidationFailure('La regla de repetición no es válida'));
      }
    }
    
    return await repository.createEncuentro(encuentro);
  }
}

