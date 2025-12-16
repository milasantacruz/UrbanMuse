import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/encuentro_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para encuentros usando Hive
/// 
/// Reemplaza SalidaLocalDataSource
abstract class EncuentroLocalDataSource {
  Future<List<EncuentroModel>> getEncuentros();
  Future<List<EncuentroModel>> getEncuentrosProximos();
  Future<EncuentroModel> getEncuentroById(String id);
  Future<List<EncuentroModel>> getEncuentrosByArtista(String artistaId);
  Future<EncuentroModel> createEncuentro(EncuentroModel encuentro);
  Future<EncuentroModel> updateEncuentro(EncuentroModel encuentro);
  Future<EncuentroModel> joinEncuentro(String encuentroId, String userId);
  Future<EncuentroModel> cancelEncuentro(String encuentroId);
}

class EncuentroLocalDataSourceImpl implements EncuentroLocalDataSource {
  final Box<Map> box;

  EncuentroLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.encuentrosBox;

  @override
  Future<List<EncuentroModel>> getEncuentros() async {
    try {
      final encuentrosMap = box.toMap();
      final encuentros = encuentrosMap.values
          .map((json) => EncuentroModel.fromJson(HiveUtils.toMapStringDynamic(json)))
          .toList();
      return encuentros;
    } catch (e) {
      throw CacheException('Error al obtener encuentros del caché: ${e.toString()}');
    }
  }

  @override
  Future<List<EncuentroModel>> getEncuentrosProximos() async {
    try {
      final encuentros = await getEncuentros();
      final ahora = DateTime.now();
      return encuentros.where((encuentro) {
        final fechaCompleta = DateTime(
          encuentro.fecha.year,
          encuentro.fecha.month,
          encuentro.fecha.day,
          encuentro.hora.hour,
          encuentro.hora.minute,
        );
        return !encuentro.cancelado && fechaCompleta.isAfter(ahora);
      }).toList();
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener encuentros próximos: ${e.toString()}');
    }
  }

  @override
  Future<EncuentroModel> getEncuentroById(String id) async {
    try {
      final encuentroJson = box.get(id);
      if (encuentroJson == null) {
        throw CacheException('Encuentro con ID $id no encontrado en caché');
      }
      return EncuentroModel.fromJson(HiveUtils.toMapStringDynamic(encuentroJson));
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener encuentro del caché: ${e.toString()}');
    }
  }

  @override
  Future<List<EncuentroModel>> getEncuentrosByArtista(String artistaId) async {
    try {
      final encuentros = await getEncuentros();
      return encuentros.where((e) => e.artistaId == artistaId).toList();
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener encuentros del artista: ${e.toString()}');
    }
  }

  @override
  Future<EncuentroModel> createEncuentro(EncuentroModel encuentro) async {
    try {
      await box.put(encuentro.id, encuentro.toJson());
      return encuentro;
    } catch (e) {
      throw CacheException('Error al crear encuentro: ${e.toString()}');
    }
  }

  @override
  Future<EncuentroModel> updateEncuentro(EncuentroModel encuentro) async {
    try {
      await box.put(encuentro.id, encuentro.toJson());
      return encuentro;
    } catch (e) {
      throw CacheException('Error al actualizar encuentro: ${e.toString()}');
    }
  }

  @override
  Future<EncuentroModel> joinEncuentro(String encuentroId, String userId) async {
    try {
      final encuentro = await getEncuentroById(encuentroId);
      if (encuentro.cancelado) {
        throw CacheException('Este encuentro ha sido cancelado');
      }
      if (encuentro.asistentesIds.contains(userId)) {
        throw CacheException('Ya estás unido a este encuentro');
      }
      
      final newAsistentesIds = [...encuentro.asistentesIds, userId];
      final updatedEncuentro = encuentro.copyWith(asistentesIds: newAsistentesIds);
      final updatedModel = EncuentroModel.fromEntity(updatedEncuentro);
      await box.put(encuentroId, updatedModel.toJson());
      return updatedModel;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al unirse al encuentro: ${e.toString()}');
    }
  }

  @override
  Future<EncuentroModel> cancelEncuentro(String encuentroId) async {
    try {
      final encuentro = await getEncuentroById(encuentroId);
      if (encuentro.cancelado) {
        throw CacheException('Este encuentro ya está cancelado');
      }
      
      final updatedEncuentro = encuentro.copyWith(cancelado: true);
      final updatedModel = EncuentroModel.fromEntity(updatedEncuentro);
      await box.put(encuentroId, updatedModel.toJson());
      return updatedModel;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al cancelar encuentro: ${e.toString()}');
    }
  }
}

