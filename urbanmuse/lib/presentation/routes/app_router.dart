import 'package:go_router/go_router.dart';
import '../pages/home/mapa_page.dart';
import '../pages/feed/feed_page.dart';
import '../pages/obra/obra_detail_page.dart';
import '../pages/artista/artista_profile_page.dart';
import '../pages/ruta/ruta_list_page.dart';
import '../pages/ruta/ruta_detail_page.dart';
import '../pages/ruta/create_ruta_page.dart';
import '../pages/top10/top10_page.dart';
import '../pages/salida/salida_list_page.dart';
import '../pages/salida/salida_detail_page.dart';
import '../pages/salida/create_salida_page.dart';
import '../pages/preview/preview_home_page.dart';
import '../pages/preview/buttons_preview_page.dart';

/// Configuración de rutas de la aplicación
final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    // ============================================
    // Preview Routes (para desarrollo/testing)
    // ============================================
    GoRoute(
      path: '/preview',
      name: 'preview-home',
      builder: (context, state) => const PreviewHomePage(),
    ),
    GoRoute(
      path: '/preview/buttons',
      name: 'preview-buttons',
      builder: (context, state) => const ButtonsPreviewPage(),
    ),

    // ============================================
    // Main App Routes
    // ============================================
    GoRoute(
      path: '/',
      name: 'mapa',
      builder: (context, state) => const MapaPage(),
    ),
    GoRoute(
      path: '/feed',
      name: 'feed',
      builder: (context, state) => const FeedPage(),
    ),
    GoRoute(
      path: '/obra/:id',
      name: 'obra-detail',
      builder: (context, state) {
        final obraId = state.pathParameters['id']!;
        return ObraDetailPage(obraId: obraId);
      },
    ),
    GoRoute(
      path: '/artista/:id',
      name: 'artista-profile',
      builder: (context, state) {
        final artistaId = state.pathParameters['id']!;
        return ArtistaProfilePage(artistaId: artistaId);
      },
    ),
    GoRoute(
      path: '/rutas',
      name: 'rutas',
      builder: (context, state) => const RutaListPage(),
    ),
    GoRoute(
      path: '/ruta/:id',
      name: 'ruta-detail',
      builder: (context, state) {
        final rutaId = state.pathParameters['id']!;
        return RutaDetailPage(rutaId: rutaId);
      },
    ),
    GoRoute(
      path: '/ruta/create',
      name: 'create-ruta',
      builder: (context, state) => const CreateRutaPage(),
    ),
    GoRoute(
      path: '/top10',
      name: 'top10',
      builder: (context, state) => const Top10Page(),
    ),
    GoRoute(
      path: '/salidas',
      name: 'salidas',
      builder: (context, state) => const SalidaListPage(),
    ),
    GoRoute(
      path: '/salida/:id',
      name: 'salida-detail',
      builder: (context, state) {
        final salidaId = state.pathParameters['id']!;
        return SalidaDetailPage(salidaId: salidaId);
      },
    ),
    GoRoute(
      path: '/salida/create',
      name: 'create-salida',
      builder: (context, state) {
        final rutaId = state.uri.queryParameters['rutaId'];
        return CreateSalidaPage(rutaId: rutaId);
      },
    ),
  ],
);

