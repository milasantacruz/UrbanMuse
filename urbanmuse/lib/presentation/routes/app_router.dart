import 'package:go_router/go_router.dart';
import '../pages/home/mapa_page.dart';
import '../pages/feed/feed_page.dart';
import '../pages/obra/obra_detail_page.dart';
import '../pages/artista/artista_profile_page.dart';
import '../pages/ruta/ruta_list_page.dart';
import '../pages/ruta/ruta_detail_page.dart';
import '../pages/ruta/create_ruta_page.dart';
import '../../../domain/entities/ubicacion.dart';
import '../pages/topn/topn_page.dart';
import '../pages/perfil/perfil_page.dart';
import '../pages/encuentro/encuentro_list_page.dart';
import '../pages/encuentro/encuentro_detail_page.dart';
import '../pages/encuentro/create_encuentro_page.dart';
import '../pages/publicar_obra/publicar_obra_page.dart';
import '../pages/preview/preview_home_page.dart';
import '../pages/preview/buttons_preview_page.dart';
import '../pages/preview/icons_preview_page.dart';
import '../pages/preview/text_styles_preview_page.dart';
import '../pages/preview/inputs_preview_page.dart';
import '../pages/preview/badges_preview_page.dart';
import '../pages/preview/avatars_preview_page.dart';
import '../pages/preview/dividers_preview_page.dart';
import '../pages/preview/loading_preview_page.dart';
import '../pages/preview/search_bar_preview_page.dart';
import '../pages/preview/chips_preview_page.dart';
import '../pages/preview/map_pins_preview_page.dart';
import '../pages/preview/tooltips_preview_page.dart';
import '../pages/preview/dialogs_preview_page.dart';
import '../pages/preview/obra_card_preview_page.dart';
import '../pages/preview/artist_card_preview_page.dart';
import '../pages/preview/app_bars_preview_page.dart';
import '../pages/preview/ruta_card_preview_page.dart';
import '../pages/preview/top10_item_preview_page.dart';
import '../pages/preview/filter_modal_preview_page.dart';
import '../pages/preview/obra_preview_bottom_sheet_preview_page.dart';
import '../pages/preview/route_step_indicator_preview_page.dart';
import '../pages/preview/obra_detail_header_preview_page.dart';

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
    GoRoute(
      path: '/preview/icons',
      name: 'preview-icons',
      builder: (context, state) => const IconsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/text-styles',
      name: 'preview-text-styles',
      builder: (context, state) => const TextStylesPreviewPage(),
    ),
    GoRoute(
      path: '/preview/inputs',
      name: 'preview-inputs',
      builder: (context, state) => const InputsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/badges',
      name: 'preview-badges',
      builder: (context, state) => const BadgesPreviewPage(),
    ),
    GoRoute(
      path: '/preview/avatars',
      name: 'preview-avatars',
      builder: (context, state) => const AvatarsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/dividers',
      name: 'preview-dividers',
      builder: (context, state) => const DividersPreviewPage(),
    ),
    GoRoute(
      path: '/preview/loading',
      name: 'preview-loading',
      builder: (context, state) => const LoadingPreviewPage(),
    ),
    GoRoute(
      path: '/preview/search-bar',
      name: 'preview-search-bar',
      builder: (context, state) => const SearchBarPreviewPage(),
    ),
    GoRoute(
      path: '/preview/chips',
      name: 'preview-chips',
      builder: (context, state) => const ChipsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/map-pins',
      name: 'preview-map-pins',
      builder: (context, state) => const MapPinsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/tooltips',
      name: 'preview-tooltips',
      builder: (context, state) => const TooltipsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/dialogs',
      name: 'preview-dialogs',
      builder: (context, state) => const DialogsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/obra-card',
      name: 'preview-obra-card',
      builder: (context, state) => const ObraCardPreviewPage(),
    ),
    GoRoute(
      path: '/preview/artist-card',
      name: 'preview-artist-card',
      builder: (context, state) => const ArtistCardPreviewPage(),
    ),
    GoRoute(
      path: '/preview/app-bars',
      name: 'preview-app-bars',
      builder: (context, state) => const AppBarsPreviewPage(),
    ),
    GoRoute(
      path: '/preview/ruta-card',
      name: 'preview-ruta-card',
      builder: (context, state) => const RutaCardPreviewPage(),
    ),
    GoRoute(
      path: '/preview/top10-item',
      name: 'preview-top10-item',
      builder: (context, state) => const Top10ItemPreviewPage(),
    ),
    GoRoute(
      path: '/preview/filter-modal',
      name: 'preview-filter-modal',
      builder: (context, state) => const FilterModalPreviewPage(),
    ),
    GoRoute(
      path: '/preview/obra-preview-bottom-sheet',
      name: 'preview-obra-preview-bottom-sheet',
      builder: (context, state) => const ObraPreviewBottomSheetPreviewPage(),
    ),
    GoRoute(
      path: '/preview/route-step-indicator',
      name: 'preview-route-step-indicator',
      builder: (context, state) => const RouteStepIndicatorPreviewPage(),
    ),
    GoRoute(
      path: '/preview/obra-detail-header',
      name: 'preview-obra-detail-header',
      builder: (context, state) => const ObraDetailHeaderPreviewPage(),
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
    // IMPORTANTE: La ruta específica '/ruta/create' debe ir ANTES de '/ruta/:id'
    // para evitar que "create" sea interpretado como un ID
    GoRoute(
      path: '/ruta/create',
      name: 'create-ruta',
      builder: (context, state) {
        // Leer puntos A y B del extra si están disponibles
        final extra = state.extra as Map<String, dynamic>?;
        final puntoA = extra?['puntoA'] as Ubicacion?;
        final puntoB = extra?['puntoB'] as Ubicacion?;
        return CreateRutaPage(
          puntoA: puntoA,
          puntoB: puntoB,
        );
      },
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
      path: '/perfil',
      name: 'perfil',
      builder: (context, state) => const PerfilPage(),
    ),
    GoRoute(
      path: '/topn',
      name: 'topn',
      builder: (context, state) => const TopNPage(),
    ),
    // Mantener /top10 por compatibilidad (redirigir a /topn)
    GoRoute(
      path: '/top10',
      name: 'top10',
      redirect: (context, state) => '/topn',
    ),
    GoRoute(
      path: '/encuentros',
      name: 'encuentros',
      builder: (context, state) => const EncuentroListPage(),
    ),
    GoRoute(
      path: '/encuentro/:id',
      name: 'encuentro-detail',
      builder: (context, state) {
        final encuentroId = state.pathParameters['id']!;
        return EncuentroDetailPage(encuentroId: encuentroId);
      },
    ),
    GoRoute(
      path: '/encuentro/create',
      name: 'create-encuentro',
      builder: (context, state) => const CreateEncuentroPage(),
    ),
    // Mantener /salidas por compatibilidad (redirigir a /encuentros)
    GoRoute(
      path: '/salidas',
      name: 'salidas',
      redirect: (context, state) => '/encuentros',
    ),
    GoRoute(
      path: '/salida/:id',
      name: 'salida-detail',
      redirect: (context, state) {
        final salidaId = state.pathParameters['id']!;
        return '/encuentro/$salidaId';
      },
    ),
    GoRoute(
      path: '/salida/create',
      name: 'create-salida',
      redirect: (context, state) => '/encuentro/create',
    ),
    
    // ============================================
    // Nuevas Rutas (v2.0)
    // ============================================
    GoRoute(
      path: '/obra/publicar',
      name: 'publicar-obra',
      builder: (context, state) => const PublicarObraPage(),
    ),
  ],
);

