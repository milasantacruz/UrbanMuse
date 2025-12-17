import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/ruta_repository.dart';

/// Use case para obtener rutas públicas dinámicas (eventos repetitivos)
class GetRutasPublicasDinamicas {
  final RutaRepository repository;
  
  GetRutasPublicasDinamicas(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call() async {
    return await repository.getRutasPublicasDinamicas();
  }
}

