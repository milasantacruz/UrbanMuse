import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../../core/constants/app_constants.dart';
import '../../models/topn_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para Top N (Rutas Favoritas) usando Hive
/// 
/// **Cambio importante:** Ahora maneja rutas (no obras), máximo 10 rutas.
abstract class TopNLocalDataSource {
  Future<TopNModel?> getTopN(String userId);
  Future<TopNModel> addRutaToTopN(String userId, String rutaId);
  Future<TopNModel> removeRutaFromTopN(String userId, String rutaId);
  Future<TopNModel> reorderTopN(String userId, List<String> rutaIds);
}

class TopNLocalDataSourceImpl implements TopNLocalDataSource {
  final Box<Map> box;

  TopNLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.topnBox;

  @override
  Future<TopNModel?> getTopN(String userId) async {
    try {
      final topNJson = box.get(userId);
      if (topNJson == null) {
        return null;
      }
      return TopNModel.fromJson(HiveUtils.toMapStringDynamic(topNJson));
    } catch (e) {
      throw CacheException('Error al obtener Top N del caché: ${e.toString()}');
    }
  }

  @override
  Future<TopNModel> addRutaToTopN(String userId, String rutaId) async {
    try {
      final topN = await getTopN(userId);
      final rutaIds = topN?.rutaIds ?? [];
      
      // Validar límite
      if (rutaIds.length >= AppConstants.topNMaxRutas) {
        throw CacheException(
          'Ya tienes ${AppConstants.topNMaxRutas} rutas en tu Top N. Elimina una antes de agregar otra.',
        );
      }
      
      // Validar duplicados
      if (rutaIds.contains(rutaId)) {
        throw CacheException('Esta ruta ya está en tu Top N');
      }
      
      final newRutaIds = [...rutaIds, rutaId];
      final newTopN = TopNModel(userId: userId, rutaIds: newRutaIds);
      await box.put(userId, newTopN.toJson());
      return newTopN;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al agregar ruta al Top N: ${e.toString()}');
    }
  }

  @override
  Future<TopNModel> removeRutaFromTopN(String userId, String rutaId) async {
    try {
      final topN = await getTopN(userId);
      if (topN == null) {
        throw CacheException('Top N no encontrado');
      }
      
      final rutaIds = topN.rutaIds.where((id) => id != rutaId).toList();
      final newTopN = TopNModel(userId: userId, rutaIds: rutaIds);
      await box.put(userId, newTopN.toJson());
      return newTopN;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al remover ruta del Top N: ${e.toString()}');
    }
  }

  @override
  Future<TopNModel> reorderTopN(String userId, List<String> rutaIds) async {
    try {
      // Validar límite
      if (rutaIds.length > AppConstants.topNMaxRutas) {
        throw CacheException(
          'No puedes tener más de ${AppConstants.topNMaxRutas} rutas en tu Top N',
        );
      }
      
      // Validar duplicados
      if (rutaIds.length != rutaIds.toSet().length) {
        throw CacheException('No puedes tener rutas duplicadas en tu Top N');
      }
      
      final newTopN = TopNModel(userId: userId, rutaIds: rutaIds);
      await box.put(userId, newTopN.toJson());
      return newTopN;
    } catch (e) {
      if (e is CacheException) rethrow;
      throw CacheException('Error al reordenar Top N: ${e.toString()}');
    }
  }
}

