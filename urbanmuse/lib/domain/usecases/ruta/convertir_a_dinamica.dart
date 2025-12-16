import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/utils/validators.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para convertir una ruta pública estática a dinámica
/// 
/// Agrega rrule, fechaInicial y hora para crear un evento repetitivo
class ConvertirADinamica {
  final RutaRepository repository;
  
  ConvertirADinamica(this.repository);
  
  Future<Either<Failure, Ruta>> call({
    required String rutaId,
    required String rrule,
    required DateTime fechaInicial,
    required String hora, // TimeOfDay como String "HH:mm"
  }) async {
    // Validar que la ruta existe y es pública estática
    final rutaResult = await repository.getRutaById(rutaId);
    return rutaResult.fold(
      (failure) => Left(failure),
      (ruta) {
        if (!ruta.esPublica) {
          return const Left(ValidationFailure('Solo las rutas públicas pueden convertirse a dinámicas'));
        }
        if (ruta.esDinamica) {
          return const Left(ValidationFailure('La ruta ya es dinámica'));
        }
        
        // Validar rrule
        if (!Validators.validarRRule(rrule)) {
          return const Left(ValidationFailure('La regla de repetición no es válida'));
        }
        
        // Validar fecha futura
        if (!Validators.validarFechaFutura(fechaInicial)) {
          return const Left(ValidationFailure('La fecha inicial debe ser futura'));
        }
        
        return repository.convertirADinamica(
          rutaId: rutaId,
          rrule: rrule,
          fechaInicial: fechaInicial,
          hora: hora,
        );
      },
    );
  }
}

