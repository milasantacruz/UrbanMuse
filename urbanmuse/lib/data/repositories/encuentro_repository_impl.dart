import 'package:dartz/dartz.dart';
import '../../domain/entities/encuentro.dart';
import '../../domain/repositories/encuentro_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../../core/utils/rrule_helper.dart';
import '../datasources/local/encuentro_local_datasource.dart';
import '../models/encuentro_model.dart';

/// Implementación del repositorio de encuentros
/// 
/// Solo local (mock para MVP1)
/// Reemplaza SalidaRepositoryImpl
class EncuentroRepositoryImpl implements EncuentroRepository {
  final EncuentroLocalDataSource localDataSource;

  EncuentroRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Encuentro>> createEncuentro(Encuentro encuentro) async {
    try {
      final encuentroModel = EncuentroModel.fromEntity(encuentro);
      final createdEncuentro = await localDataSource.createEncuentro(encuentroModel);
      return Right(createdEncuentro.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al crear encuentro: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Encuentro>>> getEncuentros() async {
    try {
      final encuentrosModel = await localDataSource.getEncuentros();
      final encuentros = encuentrosModel.map((model) => model.toEntity()).toList();
      return Right(encuentros);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener encuentros: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Encuentro>>> getEncuentrosProximos() async {
    try {
      final encuentrosModel = await localDataSource.getEncuentrosProximos();
      
      // Si hay encuentros repetitivos, calcular próximas fechas
      final encuentrosExpandidos = <Encuentro>[];
      for (final encuentroModel in encuentrosModel) {
        if (encuentroModel.esRepetitivo && encuentroModel.rrule != null) {
          // Calcular próximas fechas según rrule
          final proximasFechas = RRuleHelper.calcularProximasFechas(
            rruleString: encuentroModel.rrule!,
            desdeFecha: encuentroModel.fecha,
            cantidad: 5, // Próximos 5 eventos
          );
          
          // Crear un encuentro por cada fecha futura
          for (final fecha in proximasFechas) {
            final encuentroEntity = encuentroModel.toEntity();
            final encuentroExpandido = encuentroEntity.copyWith(fecha: fecha);
            encuentrosExpandidos.add(encuentroExpandido);
          }
        } else {
          encuentrosExpandidos.add(encuentroModel.toEntity());
        }
      }
      
      return Right(encuentrosExpandidos);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener encuentros próximos: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Encuentro>> getEncuentroById(String id) async {
    try {
      final encuentroModel = await localDataSource.getEncuentroById(id);
      return Right(encuentroModel.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener encuentro: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Encuentro>> joinEncuentro({
    required String encuentroId,
    required String userId,
  }) async {
    try {
      final encuentroModel = await localDataSource.joinEncuentro(encuentroId, userId);
      return Right(encuentroModel.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al unirse al encuentro: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Encuentro>> cancelEncuentro(String encuentroId) async {
    try {
      final encuentroModel = await localDataSource.cancelEncuentro(encuentroId);
      return Right(encuentroModel.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al cancelar encuentro: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Encuentro>>> getEncuentrosByArtista(String artistaId) async {
    try {
      final encuentrosModel = await localDataSource.getEncuentrosByArtista(artistaId);
      final encuentros = encuentrosModel.map((model) => model.toEntity()).toList();
      return Right(encuentros);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener encuentros del artista: ${e.toString()}'));
    }
  }
}

