import 'package:dartz/dartz.dart';
import '../../domain/entities/artista.dart';
import '../../domain/entities/obra.dart';
import '../../domain/repositories/artista_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../../core/network/network_info.dart';
import '../datasources/local/artista_local_datasource.dart';
import '../datasources/remote/artista_remote_datasource.dart';
import '../datasources/local/obra_local_datasource.dart';

/// Implementación del repositorio de artistas
/// 
/// Estrategia offline-first similar a ObraRepository
class ArtistaRepositoryImpl implements ArtistaRepository {
  final ArtistaRemoteDataSource remoteDataSource;
  final ArtistaLocalDataSource localDataSource;
  final ObraLocalDataSource obraLocalDataSource;
  final NetworkInfo networkInfo;

  ArtistaRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.obraLocalDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, Artista>> getArtistaById(String id) async {
    if (await networkInfo.isConnected) {
      try {
        final artistaModel = await remoteDataSource.getArtistaById(id);
        // Cachear localmente
        await localDataSource.cacheArtista(artistaModel);
        return Right(artistaModel.toEntity());
      } on ServerException catch (e) {
        return Left(ExceptionMapper.serverFailure(e));
      } catch (e) {
        return Left(ServerFailure('Error inesperado: ${e.toString()}'));
      }
    } else {
      // Sin conexión: usar caché local
      try {
        final artistaModel = await localDataSource.getArtistaById(id);
        return Right(artistaModel.toEntity());
      } on CacheException catch (e) {
        return Left(ExceptionMapper.cacheFailure(e));
      } catch (e) {
        return Left(CacheFailure('Error al obtener artista del caché: ${e.toString()}'));
      }
    }
  }

  @override
  Future<Either<Failure, List<Obra>>> getObrasByArtista(String artistaId) async {
    // Para MVP1, obtener obras del local data source (todas las obras están en el mismo box)
    try {
      final todasObras = await obraLocalDataSource.getObras();
      final obrasDelArtista = todasObras
          .where((obra) => obra.artistaId == artistaId)
          .toList();
      final obras = obrasDelArtista.map((model) => model.toEntity()).toList();
      return Right(obras);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener obras del artista: ${e.toString()}'));
    }
  }
}

