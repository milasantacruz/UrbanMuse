import 'package:dartz/dartz.dart';
import '../../domain/entities/ruta.dart';
import '../../domain/entities/ubicacion.dart';
import '../../domain/repositories/ruta_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../../core/utils/distance_calculator.dart';
import '../datasources/local/ruta_local_datasource.dart';
import '../datasources/local/obra_local_datasource.dart';
import '../models/ruta_model.dart';
import 'package:flutter/material.dart';

/// Implementación del repositorio de rutas
/// 
/// Para MVP1, solo usa local data source (no hay API de rutas)
class RutaRepositoryImpl implements RutaRepository {
  final RutaLocalDataSource localDataSource;
  final ObraLocalDataSource obraLocalDataSource;

  RutaRepositoryImpl({
    required this.localDataSource,
    required this.obraLocalDataSource,
  });

  @override
  Future<Either<Failure, Ruta>> createRuta(Ruta ruta) async {
    try {
      final rutaModel = RutaModel.fromEntity(ruta);
      final createdRuta = await localDataSource.createRuta(rutaModel);
      return Right(createdRuta.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al crear ruta: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Ruta>>> getRutas() async {
    try {
      final rutasModel = await localDataSource.getRutas();
      final rutas = rutasModel.map((model) => model.toEntity()).toList();
      return Right(rutas);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener rutas: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Ruta>>> getRutasPublicas() async {
    try {
      final rutasModel = await localDataSource.getRutasPublicas();
      final rutas = rutasModel.map((model) => model.toEntity()).toList();
      return Right(rutas);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener rutas públicas: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, List<Ruta>>> getRutasPublicasDinamicas() async {
    try {
      final rutasModel = await localDataSource.getRutasPublicasDinamicas();
      final rutas = rutasModel.map((model) => model.toEntity()).toList();
      return Right(rutas);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener rutas públicas dinámicas: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Ruta>> getRutaById(String id) async {
    try {
      final rutaModel = await localDataSource.getRutaById(id);
      return Right(rutaModel.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener ruta: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteRuta(String id) async {
    try {
      await localDataSource.deleteRuta(id);
      return const Right(null);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al eliminar ruta: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Ruta>> calculateRuta({
    required Ubicacion puntoA,
    required Ubicacion puntoB,
    required List<String> obraIds,
    required String modoTransporte,
  }) async {
    try {
      // Obtener obras para calcular distancias
      final obras = await obraLocalDataSource.getObras();
      final obrasEnRuta = obras.where((obra) => obraIds.contains(obra.id)).toList();
      
      if (obrasEnRuta.length != obraIds.length) {
        return const Left(ValidationFailure('Algunas obras no fueron encontradas'));
      }
      
      // Calcular distancia total
      double distanciaTotal = 0;
      Ubicacion? ubicacionAnterior = puntoA;
      
      for (final obra in obrasEnRuta) {
        if (ubicacionAnterior != null) {
          distanciaTotal += DistanceCalculator.calculateDistance(
            ubicacionAnterior.lat,
            ubicacionAnterior.lng,
            obra.ubicacion.lat,
            obra.ubicacion.lng,
          );
        }
        ubicacionAnterior = obra.ubicacion;
      }
      
      // Calcular distancia final al punto B
      if (ubicacionAnterior != null) {
        distanciaTotal += DistanceCalculator.calculateDistance(
          ubicacionAnterior.lat,
          ubicacionAnterior.lng,
          puntoB.lat,
          puntoB.lng,
        );
      }
      
      // Calcular tiempo estimado según modo de transporte
      final tiempoEstimado = DistanceCalculator.calculateTimeByTransport(
        distanceInMeters: distanciaTotal,
        modoTransporte: modoTransporte,
      );
      
      // Crear orden de visita (índices de las obras en el orden proporcionado)
      final ordenVisita = obraIds.asMap().entries.map((e) => e.key).toList();
      
      // Crear ruta temporal (sin guardar)
      final ruta = Ruta(
        id: '', // Se asignará al guardar
        nombre: '', // Se asignará al guardar
        puntoA: puntoA,
        puntoB: puntoB,
        obraIds: obraIds,
        ordenVisita: ordenVisita,
        distancia: distanciaTotal,
        tiempoEstimado: tiempoEstimado,
        modoTransporte: modoTransporte == 'bici' ? ModoTransporte.bici : ModoTransporte.aPie,
        tipo: TipoRuta.privada, // Por defecto privada, se puede cambiar al guardar
        creadorId: '', // Se asignará al guardar
        fechaCreacion: DateTime.now(),
      );
      
      return Right(ruta);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al calcular ruta: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Ruta>> convertirADinamica({
    required String rutaId,
    required String rrule,
    required DateTime fechaInicial,
    required String hora,
  }) async {
    try {
      final rutaModel = await localDataSource.getRutaById(rutaId);
      
      if (!rutaModel.esPublica) {
        return const Left(ValidationFailure('Solo las rutas públicas pueden convertirse a dinámicas'));
      }
      if (rutaModel.esDinamica) {
        return const Left(ValidationFailure('La ruta ya es dinámica'));
      }
      
      // Parsear hora
      final horaParts = hora.split(':');
      final horaTimeOfDay = TimeOfDay(
        hour: int.parse(horaParts[0]),
        minute: int.parse(horaParts[1]),
      );
      
      final rutaEntity = rutaModel.toEntity();
      final rutaActualizadaEntity = rutaEntity.copyWith(
        tipo: TipoRuta.publicaDinamica,
        rrule: rrule,
        fechaInicial: fechaInicial,
        hora: horaTimeOfDay,
      );
      final rutaActualizada = RutaModel.fromEntity(rutaActualizadaEntity);
      
      final updatedRuta = await localDataSource.updateRuta(rutaActualizada);
      return Right(updatedRuta.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al convertir ruta a dinámica: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Ruta>> joinRutaDinamica({
    required String rutaId,
    required String userId,
  }) async {
    try {
      final rutaModel = await localDataSource.getRutaById(rutaId);
      
      if (!rutaModel.esDinamica) {
        return const Left(ValidationFailure('Solo puedes unirte a rutas dinámicas'));
      }
      if (rutaModel.asistentesIds.contains(userId)) {
        return const Left(ValidationFailure('Ya estás unido a esta ruta'));
      }
      
      final nuevosAsistentes = [...rutaModel.asistentesIds, userId];
      final rutaEntity = rutaModel.toEntity();
      final rutaActualizadaEntity = rutaEntity.copyWith(asistentesIds: nuevosAsistentes);
      final rutaActualizada = RutaModel.fromEntity(rutaActualizadaEntity);
      
      final updatedRuta = await localDataSource.updateRuta(rutaActualizada);
      return Right(updatedRuta.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al unirse a ruta: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Ruta>> leaveRutaDinamica({
    required String rutaId,
    required String userId,
  }) async {
    try {
      final rutaModel = await localDataSource.getRutaById(rutaId);
      
      if (!rutaModel.esDinamica) {
        return const Left(ValidationFailure('Solo puedes salir de rutas dinámicas'));
      }
      if (!rutaModel.asistentesIds.contains(userId)) {
        return const Left(ValidationFailure('No estás unido a esta ruta'));
      }
      
      final nuevosAsistentes = rutaModel.asistentesIds.where((id) => id != userId).toList();
      final rutaEntity = rutaModel.toEntity();
      final rutaActualizadaEntity = rutaEntity.copyWith(asistentesIds: nuevosAsistentes);
      final rutaActualizada = RutaModel.fromEntity(rutaActualizadaEntity);
      
      final updatedRuta = await localDataSource.updateRuta(rutaActualizada);
      return Right(updatedRuta.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al salir de ruta: ${e.toString()}'));
    }
  }
}

