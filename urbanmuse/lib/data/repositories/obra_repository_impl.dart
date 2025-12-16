import 'package:dartz/dartz.dart';
import '../../domain/entities/obra.dart';
import '../../domain/repositories/obra_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../../core/network/network_info.dart';
import '../datasources/local/obra_local_datasource.dart';
import '../datasources/remote/obra_remote_datasource.dart';

/// Implementación del repositorio de obras
/// 
/// Estrategia offline-first:
/// 1. Intentar obtener datos del remote
/// 2. Si falla, usar datos locales (caché)
/// 3. Cachear datos localmente después de obtener de remote
class ObraRepositoryImpl implements ObraRepository {
  final ObraRemoteDataSource remoteDataSource;
  final ObraLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  ObraRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Obra>>> getObras() async {
    // MVP1: Usar SOLO datos locales (mock) - NO intentar remote
    try {
      final obrasModel = await localDataSource.getObras();
      final obras = obrasModel.map((model) => model.toEntity()).toList();
      return Right(obras);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener obras: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Obra>> getObraById(String id) async {
    // MVP1: Usar SOLO datos locales (mock) - NO intentar remote
    try {
      final obraModel = await localDataSource.getObraById(id);
      return Right(obraModel.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener obra: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Obra>>> searchObras(String query) async {
    // MVP1: Buscar siempre en datos locales primero
    try {
      final todasObras = await localDataSource.getObras();
      final obrasFiltradas = todasObras.where((obra) {
        final queryLower = query.toLowerCase();
        return obra.titulo.toLowerCase().contains(queryLower) ||
            obra.artistaNombre.toLowerCase().contains(queryLower) ||
            obra.categoria.toLowerCase().contains(queryLower);
      }).toList();
      final obras = obrasFiltradas.map((model) => model.toEntity()).toList();
      return Right(obras);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al buscar obras: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Obra>>> filterObras({
    List<String>? categorias,
    List<String>? artistaIds,
  }) async {
    // MVP1: Filtrar siempre en datos locales
    try {
      final todasObras = await localDataSource.getObras();
      var obrasFiltradas = todasObras;
      
      if (categorias != null && categorias.isNotEmpty) {
        obrasFiltradas = obrasFiltradas
            .where((obra) => categorias.contains(obra.categoria))
            .toList();
      }
      
      if (artistaIds != null && artistaIds.isNotEmpty) {
        obrasFiltradas = obrasFiltradas
            .where((obra) => artistaIds.contains(obra.artistaId))
            .toList();
      }
      
      final obras = obrasFiltradas.map((model) => model.toEntity()).toList();
      return Right(obras);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al filtrar obras: ${e.toString()}'));
    }
  }
}

