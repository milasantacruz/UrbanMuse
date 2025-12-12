/// Constantes de la aplicación Graffiti Trails
class AppConstants {
  AppConstants._();

  // ============================================
  // Configuración de la App
  // ============================================
  
  static const String appName = 'Graffiti Trails';
  static const String appVersion = '1.0.0';

  // ============================================
  // Límites y Validaciones
  // ============================================
  
  /// Máximo de obras en Top 10
  static const int top10MaxObras = 10;
  
  /// Máximo de obras en una ruta
  static const int rutaMaxObras = 15;
  
  /// Mínimo de obras en una ruta
  static const int rutaMinObras = 1;
  
  /// Radio de búsqueda de obras en el camino (metros)
  static const double rutaSearchRadius = 200.0;

  // ============================================
  // Timeouts y Configuración de Red
  // ============================================
  
  /// Timeout de conexión (segundos)
  static const int connectionTimeout = 5;
  
  /// Timeout de recepción (segundos)
  static const int receiveTimeout = 3;

  // ============================================
  // Categorías de Obras
  // ============================================
  
  static const String categoriaGraffiti = 'graffiti';
  static const String categoriaMural = 'mural';
  static const String categoriaEscultura = 'escultura';
  static const String categoriaPerformance = 'performance';
  
  static const List<String> categorias = [
    categoriaGraffiti,
    categoriaMural,
    categoriaEscultura,
    categoriaPerformance,
  ];

  // ============================================
  // Medios de Transporte
  // ============================================
  
  static const String transporteAPie = 'a_pie';
  static const String transporteBici = 'bici';
  
  static const List<String> transportes = [
    transporteAPie,
    transporteBici,
  ];
}

