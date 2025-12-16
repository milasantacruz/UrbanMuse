import 'package:dartz/dartz.dart';
import '../../domain/entities/ruta.dart';
import '../../domain/repositories/topn_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../datasources/local/topn_local_datasource.dart';
import '../datasources/local/ruta_local_datasource.dart';

/// Implementación del repositorio de Top N
/// 
/// Solo local (datos del usuario)
/// **Cambio importante:** Ahora maneja rutas (no obras)
class TopNRepositoryImpl implements TopNRepository {
  final TopNLocalDataSource localDataSource;
  final RutaLocalDataSource rutaLocalDataSource;

  TopNRepositoryImpl({
    required this.localDataSource,
    required this.rutaLocalDataSource,
  });

  @override
  Future<Either<Failure, List<Ruta>>> getTopN() async {
    try {
      // Obtener Top N del usuario actual (por ahora hardcodeado, luego se obtendrá del usuario)
      // TODO: Obtener userId del usuario actual
      const userId = 'current_user'; // Temporal para MVP1
      
      final topN = await localDataSource.getTopN(userId);
      if (topN == null) {
        return const Right([]);
      }
      
      // Obtener rutas completas
      final rutas = <Ruta>[];
      for (final rutaId in topN.rutaIds) {
        try {
          final rutaModel = await rutaLocalDataSource.getRutaById(rutaId);
          rutas.add(rutaModel.toEntity());
        } catch (e) {
          // Si la ruta no existe, continuar con las demás
          continue;
        }
      }
      
      return Right(rutas);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener Top N: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Ruta>>> addRutaToTopN(String rutaId) async {
    try {
      // Validar que la ruta existe
      await rutaLocalDataSource.getRutaById(rutaId);
      
      // TODO: Obtener userId del usuario actual
      const userId = 'current_user'; // Temporal para MVP1
      
      await localDataSource.addRutaToTopN(userId, rutaId);
      
      // Retornar Top N actualizado
      return getTopN();
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al agregar ruta al Top N: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Ruta>>> removeRutaFromTopN(String rutaId) async {
    try {
      // TODO: Obtener userId del usuario actual
      const userId = 'current_user'; // Temporal para MVP1
      
      await localDataSource.removeRutaFromTopN(userId, rutaId);
      
      // Retornar Top N actualizado
      return getTopN();
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al remover ruta del Top N: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Ruta>>> reorderTopN(List<String> rutaIds) async {
    try {
      // Validar que todas las rutas existen
      for (final rutaId in rutaIds) {
        await rutaLocalDataSource.getRutaById(rutaId);
      }
      
      // TODO: Obtener userId del usuario actual
      const userId = 'current_user'; // Temporal para MVP1
      
      await localDataSource.reorderTopN(userId, rutaIds);
      
      // Retornar Top N actualizado
      return getTopN();
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al reordenar Top N: ${e.toString()}'));
    }
  }
}

