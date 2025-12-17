import 'package:hive_flutter/hive_flutter.dart';
import '../../../core/errors/exceptions.dart';
import '../../models/usuario_model.dart';
import 'hive_service.dart';
import 'hive_utils.dart';

/// Data source local para usuario usando Hive
/// 
/// Solo guarda un usuario (el usuario actual)
abstract class UsuarioLocalDataSource {
  Future<UsuarioModel?> getUsuario();
  Future<UsuarioModel> saveUsuario(UsuarioModel usuario);
  Future<UsuarioModel> updateUsuario(UsuarioModel usuario);
  Future<void> clearUsuario();
}

class UsuarioLocalDataSourceImpl implements UsuarioLocalDataSource {
  final Box<Map> box;
  static const String _usuarioKey = 'current_user';

  UsuarioLocalDataSourceImpl({Box<Map>? box})
      : box = box ?? HiveService.usuarioBox;

  @override
  Future<UsuarioModel?> getUsuario() async {
    try {
      final usuarioJson = box.get(_usuarioKey);
      if (usuarioJson == null) {
        return null;
      }
      return UsuarioModel.fromJson(HiveUtils.toMapStringDynamic(usuarioJson));
    } catch (e) {
      throw CacheException('Error al obtener usuario del caché: ${e.toString()}');
    }
  }

  @override
  Future<UsuarioModel> saveUsuario(UsuarioModel usuario) async {
    try {
      await box.put(_usuarioKey, usuario.toJson());
      return usuario;
    } catch (e) {
      throw CacheException('Error al guardar usuario: ${e.toString()}');
    }
  }

  @override
  Future<UsuarioModel> updateUsuario(UsuarioModel usuario) async {
    try {
      await box.put(_usuarioKey, usuario.toJson());
      return usuario;
    } catch (e) {
      throw CacheException('Error al actualizar usuario: ${e.toString()}');
    }
  }

  @override
  Future<void> clearUsuario() async {
    try {
      await box.delete(_usuarioKey);
    } catch (e) {
      throw CacheException('Error al eliminar usuario: ${e.toString()}');
    }
  }
}

