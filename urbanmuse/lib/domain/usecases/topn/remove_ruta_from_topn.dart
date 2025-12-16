import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/ruta.dart';
import '../../repositories/topn_repository.dart';

/// Use case para remover ruta del Top N
class RemoveRutaFromTopN {
  final TopNRepository repository;
  
  RemoveRutaFromTopN(this.repository);
  
  Future<Either<Failure, List<Ruta>>> call(String rutaId) async {
    return await repository.removeRutaFromTopN(rutaId);
  }
}

