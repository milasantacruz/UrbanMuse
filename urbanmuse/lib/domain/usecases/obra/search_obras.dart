import 'package:dartz/dartz.dart';
import '../../../core/errors/failures.dart';
import '../../entities/obra.dart';
import '../../repositories/obra_repository.dart';

/// Use case para buscar obras
class SearchObras {
  final ObraRepository repository;
  
  SearchObras(this.repository);
  
  Future<Either<Failure, List<Obra>>> call(String query) async {
    if (query.trim().isEmpty) {
      return const Right([]);
    }
    return await repository.searchObras(query);
  }
}

