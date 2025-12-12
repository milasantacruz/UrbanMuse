/// Endpoints de la API
class ApiEndpoints {
  ApiEndpoints._();

  // Base URL - Configurar según API disponible
  static const String baseUrl = 'https://api.example.com'; // TODO: Configurar URL real
  
  // ============================================
  // Endpoints de Obras
  // ============================================
  
  static const String obras = '/obras';
  static String obraById(String id) => '/obras/$id';
  static const String searchObras = '/obras/search';
  
  // ============================================
  // Endpoints de Artistas
  // ============================================
  
  static const String artistas = '/artistas';
  static String artistaById(String id) => '/artistas/$id';
  static String obrasByArtista(String artistaId) => '/artistas/$artistaId/obras';
}

