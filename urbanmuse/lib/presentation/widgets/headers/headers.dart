/// Headers - Componentes de encabezados para páginas de detalle
/// 
/// Incluye:
/// - [AppObraDetailHeader] - Header hero para página de detalle de obra
/// 
/// Uso:
/// ```dart
/// import 'package:urbanmuse/presentation/widgets/headers/headers.dart';
/// 
/// AppObraDetailHeader(
///   imageUrl: 'https://...',
///   titulo: 'Colores de la Ciudad',
///   categoria: 'mural',
///   onBack: () => Navigator.pop(context),
///   onShare: () => _shareObra(),
///   onFavoriteToggle: () => _toggleFavorite(),
/// )
/// ```
library;

export 'app_obra_detail_header.dart';
