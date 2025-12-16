import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../entities/ubicacion.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para calcular ruta
class CalculateRuta {
  final RutaRepository repository;
  
  CalculateRuta(this.repository);
  
  Future<Either<Failure, Ruta>> call({
    required Ubicacion puntoA,
    required Ubicacion puntoB,
    required List<String> obraIds,
    required String modoTransporte, // 'bici' o 'a_pie'
  }) async {
    if (obraIds.isEmpty) {
      return const Left(ValidationFailure('Debe seleccionar al menos una obra'));
    }
    
    // Validar modo de transporte
    if (modoTransporte != 'bici' && modoTransporte != 'a_pie') {
      return const Left(ValidationFailure('Modo de transporte debe ser "bici" o "a_pie"'));
    }
    
    return await repository.calculateRuta(
      puntoA: puntoA,
      puntoB: puntoB,
      obraIds: obraIds,
      modoTransporte: modoTransporte,
    );
  }
}
