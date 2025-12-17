import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/salida_grupal.dart';
import '../../repositories/salida_repository.dart';

/// Use case para obtener todas las salidas
class GetSalidas {
  final SalidaRepository repository;
  
  GetSalidas(this.repository);
  
  Future<Either<Failure, List<SalidaGrupal>>> call() async {
    return await repository.getSalidas();
  }
}

