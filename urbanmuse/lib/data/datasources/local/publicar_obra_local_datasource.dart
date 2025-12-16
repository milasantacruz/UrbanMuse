import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/obra_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para publicar obras usando Hive
/// 
/// Solo artistas pueden publicar obras.
/// Usa el mismo box de obras pero con lógica específica para obras publicadas.
abstract class PublicarObraLocalDataSource {
  Future<List<ObraModel>> getObrasPublicadasPorArtista(String artistaId);
  Future<ObraModel> publicarObra(ObraModel obra);
  Future<ObraModel> editarObra(ObraModel obra);
  Future<void> eliminarObra(String obraId);
  Future<bool> puedeEliminarObra(String obraId, String userId);
}

class PublicarObraLocalDataSourceImpl implements PublicarObraLocalDataSource {
  final Box<Map> box;

  PublicarObraLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.obrasBox;

  @override
  Future<List<ObraModel>> getObrasPublicadasPorArtista(String artistaId) async {
    try {
      final obrasMap = box.toMap();
      final obras = obrasMap.values
          .map((json) => ObraModel.fromJson(HiveUtils.toMapStringDynamic(json)))
          .where((obra) => obra.artistaId == artistaId)
          .toList();
      return obras;
    } catch (e) {
      throw CacheException('Error al obtener obras publicadas: ${e.toString()}');
    }
  }

  @override
  Future<ObraModel> publicarObra(ObraModel obra) async {
    try {
      // Agregar fecha de publicación si no existe
      final obraConFecha = obra.fechaPublicacion == null
          ? ObraModel(
              id: obra.id,
              titulo: obra.titulo,
              artistaId: obra.artistaId,
              artistaNombre: obra.artistaNombre,
              categoria: obra.categoria,
              ubicacion: obra.ubicacion,
              foto: obra.foto,
              fecha: obra.fecha,
              likes: obra.likes,
              fechaPublicacion: DateTime.now(),
              puedeEliminar: true,
            )
          : obra;
      
      await box.put(obraConFecha.id, obraConFecha.toJson());
      return obraConFecha;
    } catch (e) {
      throw CacheException('Error al publicar obra: ${e.toString()}');
    }
  }

  @override
  Future<ObraModel> editarObra(ObraModel obra) async {
    try {
      await box.put(obra.id, obra.toJson());
      return obra;
    } catch (e) {
      throw CacheException('Error al editar obra: ${e.toString()}');
    }
  }

  @override
  Future<void> eliminarObra(String obraId) async {
    try {
      await box.delete(obraId);
    } catch (e) {
      throw CacheException('Error al eliminar obra: ${e.toString()}');
    }
  }

  @override
  Future<bool> puedeEliminarObra(String obraId, String userId) async {
    try {
      final obraJson = box.get(obraId);
      if (obraJson == null) {
        return false;
      }
      final obra = ObraModel.fromJson(HiveUtils.toMapStringDynamic(obraJson));
      // Solo el artista que publicó la obra puede eliminarla
      return obra.artistaId == userId;
    } catch (e) {
      throw CacheException('Error al verificar permisos: ${e.toString()}');
    }
  }
}

