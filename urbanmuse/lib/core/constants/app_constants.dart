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
  
  /// Máximo de rutas en Top N (reemplaza Top 10 de obras)
  static const int topNMaxRutas = 10;
  
  /// Máximo de obras en una ruta
  static const int rutaMaxObras = 15;
  
  /// Mínimo de obras en una ruta
  static const int rutaMinObras = 1;
  
  /// Radio de búsqueda de obras en el camino (metros)
  static const double rutaSearchRadius = 200.0;
  
  // ============================================
  // Tipos de Usuario
  // ============================================
  
  static const String tipoUsuarioVisitante = 'visitante';
  static const String tipoUsuarioArtista = 'artista';
  
  static const List<String> tiposUsuario = [
    tipoUsuarioVisitante,
    tipoUsuarioArtista,
  ];
  
  // ============================================
  // Tipos de Ruta
  // ============================================
  
  static const String tipoRutaPrivada = 'privada';
  static const String tipoRutaPublicaEstatica = 'publica_estatica';
  static const String tipoRutaPublicaDinamica = 'publica_dinamica';
  
  static const List<String> tiposRuta = [
    tipoRutaPrivada,
    tipoRutaPublicaEstatica,
    tipoRutaPublicaDinamica,
  ];
  
  // ============================================
  // Buenos Aires (CABA) - Límites Geográficos
  // ============================================
  
  /// Latitud mínima de CABA
  static const double buenosAiresLatMin = -34.7050;
  
  /// Latitud máxima de CABA
  static const double buenosAiresLatMax = -34.5200;
  
  /// Longitud mínima de CABA
  static const double buenosAiresLngMin = -58.5300;
  
  /// Longitud máxima de CABA
  static const double buenosAiresLngMax = -58.3500;
  
  /// Centro de Buenos Aires (CABA) - Plaza de Mayo
  static const double buenosAiresCenterLat = -34.6037;
  static const double buenosAiresCenterLng = -58.3816;

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
  
  /// Transporte principal/recomendado
  static const String transportePrincipal = transporteBici;
  
  static const List<String> transportes = [
    transporteBici,  // Principal
    transporteAPie,   // Secundario
  ];
  
  // ============================================
  // Repetición de Eventos (rrule)
  // ============================================
  
  static const String repeticionDiario = 'diario';
  static const String repeticionSemanal = 'semanal';
  static const String repeticionMensual = 'mensual';
  static const String repeticionAnual = 'anual';
  
  static const List<String> repeticiones = [
    repeticionDiario,
    repeticionSemanal,
    repeticionMensual,
    repeticionAnual,
  ];
  
  // ============================================
  // Tipo de Lista de Asistentes
  // ============================================
  
  static const String listaAsistentesLibre = 'libre';
  static const String listaAsistentesExclusiva = 'exclusiva';
  
  static const List<String> tiposListaAsistentes = [
    listaAsistentesLibre,
    listaAsistentesExclusiva,
  ];
}

