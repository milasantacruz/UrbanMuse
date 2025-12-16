import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/artista_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para artistas usando Hive
abstract class ArtistaLocalDataSource {
  Future<List<ArtistaModel>> getArtistas();
  Future<ArtistaModel> getArtistaById(String id);
  Future<void> cacheArtistas(List<ArtistaModel> artistas);
  Future<void> cacheArtista(ArtistaModel artista);
}

class ArtistaLocalDataSourceImpl implements ArtistaLocalDataSource {
  final Box<Map> box;

  ArtistaLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.artistasBox;

  @override
  Future<List<ArtistaModel>> getArtistas() async {
    try {
      final artistasMap = box.toMap();
      final artistas = artistasMap.values
          .map((json) => ArtistaModel.fromJson(HiveUtils.toMapStringDynamic(json)))
          .toList();
      return artistas;
    } catch (e) {
      throw CacheException('Error al obtener artistas del caché: ${e.toString()}');
    }
  }

  @override
  Future<ArtistaModel> getArtistaById(String id) async {
    try {
      final artistaJson = box.get(id);
      if (artistaJson == null) {
        throw CacheException('Artista con ID $id no encontrado en caché');
      }
      return ArtistaModel.fromJson(HiveUtils.toMapStringDynamic(artistaJson));
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al obtener artista del caché: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheArtistas(List<ArtistaModel> artistas) async {
    try {
      final Map<String, Map> artistasMap = {};
      for (final artista in artistas) {
        artistasMap[artista.id] = artista.toJson();
      }
      await box.putAll(artistasMap);
    } catch (e) {
      throw CacheException('Error al guardar artistas en caché: ${e.toString()}');
    }
  }

  @override
  Future<void> cacheArtista(ArtistaModel artista) async {
    try {
      await box.put(artista.id, artista.toJson());
    } catch (e) {
      throw CacheException('Error al guardar artista en caché: ${e.toString()}');
    }
  }
}

