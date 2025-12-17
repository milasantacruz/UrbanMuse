import 'package:dartz/dartz.dart';
import '../../domain/entities/obra.dart';
import '../../domain/repositories/publicar_obra_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../datasources/local/publicar_obra_local_datasource.dart';
import '../models/obra_model.dart';

/// Implementación del repositorio para publicar obras
/// 
/// Solo artistas pueden publicar obras.
/// Para MVP1, solo usa local data source
class PublicarObraRepositoryImpl implements PublicarObraRepository {
  final PublicarObraLocalDataSource localDataSource;

  PublicarObraRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Obra>> publicarObra(Obra obra) async {
    try {
      final obraModel = ObraModel.fromEntity(obra);
      final obraPublicada = await localDataSource.publicarObra(obraModel);
      return Right(obraPublicada.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al publicar obra: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Obra>>> getObrasPublicadasPorArtista(String artistaId) async {
    try {
      final obrasModel = await localDataSource.getObrasPublicadasPorArtista(artistaId);
      final obras = obrasModel.map((model) => model.toEntity()).toList();
      return Right(obras);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener obras publicadas: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Obra>> editarObra(Obra obra) async {
    try {
      final obraModel = ObraModel.fromEntity(obra);
      final obraEditada = await localDataSource.editarObra(obraModel);
      return Right(obraEditada.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al editar obra: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> eliminarObra(String obraId) async {
    try {
      await localDataSource.eliminarObra(obraId);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al eliminar obra: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> puedeEliminarObra({
    required String obraId,
    required String userId,
  }) async {
    try {
      final puedeEliminar = await localDataSource.puedeEliminarObra(obraId, userId);
      return Right(puedeEliminar);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al verificar permisos: ${e.toString()}'));
    }
  }
}

