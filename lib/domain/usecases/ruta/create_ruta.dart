import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/validators.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para crear ruta
/// 
/// Soporta tres tipos de ruta:
/// - Privada: Solo visible para el creador
/// - Pública Estática: Visible para todos, sin fecha/hora
/// - Pública Dinámica: Evento repetitivo con rrule (requiere rrule, fechaInicial, hora)
class CreateRuta {
  final RutaRepository repository;
  
  CreateRuta(this.repository);
  
  Future<Either<Failure, Ruta>> call(Ruta ruta) async {
    // Validaciones básicas
    if (ruta.obraIds.length < AppConstants.rutaMinObras) {
      return const Left(ValidationFailure('La ruta debe tener al menos 1 obra'));
    }
    if (ruta.obraIds.length > AppConstants.rutaMaxObras) {
      return Left(ValidationFailure(
        'La ruta no puede tener más de ${AppConstants.rutaMaxObras} obras',
      ));
    }
    if (ruta.nombre.trim().isEmpty) {
      return const Left(ValidationFailure('El nombre de la ruta es requerido'));
    }
    
    // Validar modo de transporte
    final modoTransporteStr = ruta.modoTransporte == ModoTransporte.bici ? 'bici' : 'a_pie';
    if (!Validators.validarModoTranporte(modoTransporteStr)) {
      return const Left(ValidationFailure('Modo de transporte inválido'));
    }
    
    // Validar tipo de ruta
    final tipoRutaStr = ruta.tipo == TipoRuta.privada 
        ? 'privada' 
        : ruta.tipo == TipoRuta.publicaEstatica 
            ? 'publica_estatica' 
            : 'publica_dinamica';
    if (!Validators.validarTipoRuta(tipoRutaStr)) {
      return const Left(ValidationFailure('Tipo de ruta inválido'));
    }
    
    // Si es dinámica, validar campos requeridos
    if (ruta.esDinamica) {
      if (ruta.rrule == null || ruta.rrule!.isEmpty) {
        return const Left(ValidationFailure('Las rutas dinámicas requieren una regla de repetición (rrule)'));
      }
      if (ruta.fechaInicial == null) {
        return const Left(ValidationFailure('Las rutas dinámicas requieren una fecha inicial'));
      }
      if (ruta.hora == null) {
        return const Left(ValidationFailure('Las rutas dinámicas requieren una hora'));
      }
      
      // Validar rrule
      if (!Validators.validarRRule(ruta.rrule!)) {
        return const Left(ValidationFailure('La regla de repetición no es válida'));
      }
      
      // Validar fecha futura
      if (!Validators.validarFechaFutura(ruta.fechaInicial!)) {
        return const Left(ValidationFailure('La fecha inicial debe ser futura'));
      }
    }
    
    return await repository.createRuta(ruta);
  }
}

