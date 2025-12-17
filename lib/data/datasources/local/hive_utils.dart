/// Utilidades para trabajar con Hive y conversión de tipos
class HiveUtils {
  /// Convierte cualquier tipo de Map a Map<String, dynamic>
  /// 
  /// Hive puede devolver LinkedHashMap<dynamic, dynamic> en lugar de
  /// Map<String, dynamic>, por lo que necesitamos una conversión segura y recursiva.
  /// También convierte Maps anidados que pueden ser LinkedHashMap.
  static Map<String, dynamic> toMapStringDynamic(dynamic map) {
    if (map == null) {
      return {};
    }
    
    if (map is Map<String, dynamic>) {
      // Ya es el tipo correcto, pero necesitamos convertir valores anidados recursivamente
      return _convertMapRecursively(map);
    }
    
    if (map is Map) {
      // Convertir LinkedHashMap o cualquier otro tipo de Map
      final converted = <String, dynamic>{};
      map.forEach((key, value) {
        final stringKey = key.toString();
        converted[stringKey] = _convertValue(value);
      });
      return converted;
    }
    
    throw ArgumentError('El valor no es un Map: ${map.runtimeType}');
  }
  
  /// Convierte un Map recursivamente, convirtiendo valores anidados
  static Map<String, dynamic> _convertMapRecursively(Map map) {
    final converted = <String, dynamic>{};
    map.forEach((key, value) {
      final stringKey = key.toString();
      converted[stringKey] = _convertValue(value);
    });
    return converted;
  }
  
  /// Convierte un valor recursivamente, manejando Maps y Lists anidados
  static dynamic _convertValue(dynamic value) {
    if (value == null) {
      return null;
    }
    
    // Si es un Map, convertirlo recursivamente
    if (value is Map) {
      return toMapStringDynamic(value);
    }
    
    // Si es una List, convertir elementos recursivamente
    if (value is List) {
      return value.map((item) => _convertValue(item)).toList();
    }
    
    // Para otros tipos, devolver tal cual
    return value;
  }
}

