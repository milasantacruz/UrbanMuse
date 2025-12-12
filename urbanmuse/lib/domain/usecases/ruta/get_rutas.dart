import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para obtener todas las rutas
class GetRutas {
  final RutaRepository repository;
  
  GetRutas(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call() async {
    return await repository.getRutas();
  }
}

