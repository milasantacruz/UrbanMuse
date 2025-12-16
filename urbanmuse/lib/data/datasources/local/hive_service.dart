import 'package:hive_flutter/hive_flutter.dart';

/// Servicio para configurar y gestionar Hive
/// 
/// Inicializa Hive, registra adapters y proporciona acceso a los boxes
class HiveService {
  static const String _obrasBoxName = 'obras_box';
  static const String _artistasBoxName = 'artistas_box';
  static const String _rutasBoxName = 'rutas_box';
  static const String _topnBoxName = 'topn_box';
  static const String _encuentrosBoxName = 'encuentros_box';
  static const String _usuarioBoxName = 'usuario_box';

  /// Inicializar Hive
  /// 
  /// Debe llamarse antes de usar cualquier box
  static Future<void> init() async {
    await Hive.initFlutter();
    
    // Registrar adapters
    // Nota: Para MVP1, usamos TypeAdapters manuales en lugar de hive_generator
    // ya que los modelos extienden de entidades y pueden tener problemas con la generación
    
    // Abrir boxes
    await Hive.openBox<Map>(_obrasBoxName);
    await Hive.openBox<Map>(_artistasBoxName);
    await Hive.openBox<Map>(_rutasBoxName);
    await Hive.openBox<Map>(_topnBoxName);
    await Hive.openBox<Map>(_encuentrosBoxName);
    await Hive.openBox<Map>(_usuarioBoxName);
  }

  /// Obtener box de obras
  static Box<Map> get obrasBox => Hive.box<Map>(_obrasBoxName);

  /// Obtener box de artistas
  static Box<Map> get artistasBox => Hive.box<Map>(_artistasBoxName);

  /// Obtener box de rutas
  static Box<Map> get rutasBox => Hive.box<Map>(_rutasBoxName);

  /// Obtener box de Top N
  static Box<Map> get topnBox => Hive.box<Map>(_topnBoxName);

  /// Obtener box de encuentros
  static Box<Map> get encuentrosBox => Hive.box<Map>(_encuentrosBoxName);

  /// Obtener box de usuario
  static Box<Map> get usuarioBox => Hive.box<Map>(_usuarioBoxName);

  /// Cerrar todos los boxes
  static Future<void> closeAll() async {
    await Hive.close();
  }
}

