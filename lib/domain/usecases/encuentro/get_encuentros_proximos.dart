import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/encuentro.dart';
import '../../repositories/encuentro_repository.dart';

/// Use case para obtener encuentros próximos (fecha >= hoy)
class GetEncuentrosProximos {
  final EncuentroRepository repository;
  
  GetEncuentrosProximos(this.repository);
  
  Future<Either<Failure, List<Encuentro>>> call() async {
    return await repository.getEncuentrosProximos();
  }
}

