import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/obra_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para obras usando Hive
abstract class ObraLocalDataSource {
  Future<List<ObraModel>> getObras();
  Future<ObraModel> getObraById(String id);
  Future<void> cacheObras(List<ObraModel> obras);
  Future<void> cacheObra(ObraModel obra);
}

class ObraLocalDataSourceImpl implements ObraLocalDataSource {
  final Box<Map> box;

  ObraLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.obrasBox;

  @override
  Future<List<ObraModel>> getObras() async {
    try {
      final obrasMap = box.toMap();
      final obras = obrasMap.values
          .map((json) => ObraModel.fromJson(HiveUtils.toMapStringDynamic(json)))
          .toList();
      return obras;
    } catch (e) {
      throw CacheException('Error al obtener obras del caché: ${e.toString()}');
    }
  }

  @override
  Future<ObraModel> getObraById(String id) async {
    try {
      final obraJson = box.get(id);
      if (obraJson == null) {
        throw CacheException('Obra con ID $id no encontrada en caché');
      }
      return ObraModel.fromJson(HiveUtils.toMapStringDynamic(obraJson));
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener obra del caché: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheObras(List<ObraModel> obras) async {
    try {
      final Map<String, Map> obrasMap = {};
      for (final obra in obras) {
        obrasMap[obra.id] = obra.toJson();
      }
      await box.putAll(obrasMap);
    } catch (e) {
      throw CacheException('Error al guardar obras en caché: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheObra(ObraModel obra) async {
    try {
      await box.put(obra.id, obra.toJson());
    } catch (e) {
      throw CacheException('Error al guardar obra en caché: ${e.toString()}');
    }
  }
}

