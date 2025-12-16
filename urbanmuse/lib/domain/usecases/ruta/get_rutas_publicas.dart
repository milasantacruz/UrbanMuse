import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para obtener rutas públicas estáticas
class GetRutasPublicas {
  final RutaRepository repository;
  
  GetRutasPublicas(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call() async {
    return await repository.getRutasPublicas();
  }
}

