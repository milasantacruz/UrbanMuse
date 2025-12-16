import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/topn_repository.dart';

/// Use case para obtener Top N de rutas (máximo 10)
/// 
/// **Cambio importante:** Ahora maneja rutas (no obras)
class GetTopN {
  final TopNRepository repository;
  
  GetTopN(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call() async {
    return await repository.getTopN();
  }
}

