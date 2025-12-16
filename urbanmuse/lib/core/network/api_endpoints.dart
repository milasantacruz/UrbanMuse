/// Endpoints de la API
/// 
/// Nota: Para MVP1, la mayoría de endpoints son locales (Hive).
/// Estos endpoints están preparados para futura integración con backend.
class ApiEndpoints {
  ApiEndpoints._();

  // Base URL - Configurar según API disponible
  // Para MVP1: No hay backend, todo es local
  static const String baseUrl = 'https://api.urbanmuse.com'; // TODO: Configurar URL real cuando haya backend
  
  // ============================================
  // Endpoints de Obras
  // ============================================
  
  static const String obras = '/obras';
  static String obraById(String id) => '/obras/$id';
  static const String searchObras = '/obras/search';
  static const String filterObras = '/obras/filter';
  
  // ============================================
  // Endpoints de Artistas
  // ============================================
  
  static const String artistas = '/artistas';
  static String artistaById(String id) => '/artistas/$id';
  static String obrasByArtista(String artistaId) => '/artistas/$artistaId/obras';
  
  // ============================================
  // Endpoints de Rutas
  // ============================================
  // Nota: En MVP1, las rutas son solo locales (no hay API)
  
  static const String rutas = '/rutas';
  static String rutaById(String id) => '/rutas/$id';
  static const String rutasPublicas = '/rutas/publicas';
  static const String rutasPublicasDinamicas = '/rutas/publicas/dinamicas';
  static String joinRuta(String rutaId) => '/rutas/$rutaId/join';
  static String leaveRuta(String rutaId) => '/rutas/$rutaId/leave';
  static String convertirADinamica(String rutaId) => '/rutas/$rutaId/convertir-dinamica';
  
  // ============================================
  // Endpoints de Top N (Rutas)
  // ============================================
  // Nota: En MVP1, Top N es solo local (no hay API)
  
  static const String topN = '/topn';
  static String addRutaToTopN(String rutaId) => '/topn/rutas/$rutaId';
  static String removeRutaFromTopN(String rutaId) => '/topn/rutas/$rutaId';
  static const String reorderTopN = '/topn/reorder';
  
  // ============================================
  // Endpoints de Encuentros
  // ============================================
  // Nota: En MVP1, los encuentros son solo locales (no hay API)
  
  static const String encuentros = '/encuentros';
  static String encuentroById(String id) => '/encuentros/$id';
  static const String encuentrosProximos = '/encuentros/proximos';
  static String joinEncuentro(String encuentroId) => '/encuentros/$encuentroId/join';
  static String cancelEncuentro(String encuentroId) => '/encuentros/$encuentroId/cancel';
  
  // ============================================
  // Endpoints de Publicar Obra (Solo Artistas)
  // ============================================
  
  static const String publicarObra = '/obras/publicar';
  static String obraPublicadaById(String id) => '/obras/publicadas/$id';
  static String editarObra(String id) => '/obras/publicadas/$id';
  static String eliminarObra(String id) => '/obras/publicadas/$id';
  static String obrasPublicadasPorArtista(String artistaId) => '/artistas/$artistaId/obras-publicadas';
  
  // ============================================
  // Endpoints de Usuario
  // ============================================
  
  static const String usuarios = '/usuarios';
  static String usuarioById(String id) => '/usuarios/$id';
  static const String registro = '/usuarios/registro';
  static const String login = '/usuarios/login';
  static String updateUsuario(String id) => '/usuarios/$id';
}

