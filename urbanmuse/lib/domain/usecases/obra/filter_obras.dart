import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/obra_repository.dart';

/// Use case para filtrar obras
class FilterObras {
  final ObraRepository repository;
  
  FilterObras(this.repository);
  
  Future<Either<Failure, List<Obra>>> call({
    List<String>? categorias,
    List<String>? artistaIds,
  }) async {
    return await repository.filterObras(
      categorias: categorias,
      artistaIds: artistaIds,
    );
  }
}

