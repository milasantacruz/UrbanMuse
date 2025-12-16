import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/ruta_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para rutas usando Hive
abstract class RutaLocalDataSource {
  Future<List<RutaModel>> getRutas();
  Future<List<RutaModel>> getRutasPublicas();
  Future<List<RutaModel>> getRutasPublicasDinamicas();
  Future<RutaModel> getRutaById(String id);
  Future<RutaModel> createRuta(RutaModel ruta);
  Future<RutaModel> updateRuta(RutaModel ruta);
  Future<void> deleteRuta(String id);
}

class RutaLocalDataSourceImpl implements RutaLocalDataSource {
  final Box<Map> box;

  RutaLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.rutasBox;

  @override
  Future<List<RutaModel>> getRutas() async {
    try {
      final rutasMap = box.toMap();
      final rutas = rutasMap.values
          .map((json) => RutaModel.fromJson(HiveUtils.toMapStringDynamic(json)))
          .toList();
      return rutas;
    } catch (e) {
      throw CacheException('Error al obtener rutas del caché: ${e.toString()}');
    }
  }

  @override
  Future<List<RutaModel>> getRutasPublicas() async {
    try {
      final rutas = await getRutas();
      return rutas.where((ruta) => ruta.esPublica && !ruta.esDinamica).toList();
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener rutas públicas: ${e.toString()}');
    }
  }

  @override
  Future<List<RutaModel>> getRutasPublicasDinamicas() async {
    try {
      final rutas = await getRutas();
      return rutas.where((ruta) => ruta.esDinamica).toList();
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener rutas públicas dinámicas: ${e.toString()}');
    }
  }

  @override
  Future<RutaModel> getRutaById(String id) async {
    try {
      final rutaJson = box.get(id);
      if (rutaJson == null) {
        throw CacheException('Ruta con ID $id no encontrada en caché');
      }
      return RutaModel.fromJson(HiveUtils.toMapStringDynamic(rutaJson));
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener ruta del caché: ${e.toString()}');
    }
  }

  @override
  Future<RutaModel> createRuta(RutaModel ruta) async {
    try {
      await box.put(ruta.id, ruta.toJson());
      return ruta;
    } catch (e) {
      throw CacheException('Error al crear ruta: ${e.toString()}');
    }
  }

  @override
  Future<RutaModel> updateRuta(RutaModel ruta) async {
    try {
      await box.put(ruta.id, ruta.toJson());
      return ruta;
    } catch (e) {
      throw CacheException('Error al actualizar ruta: ${e.toString()}');
    }
  }

  @override
  Future<void> deleteRuta(String id) async {
    try {
      await box.delete(id);
    } catch (e) {
      throw CacheException('Error al eliminar ruta: ${e.toString()}');
    }
  }
}

