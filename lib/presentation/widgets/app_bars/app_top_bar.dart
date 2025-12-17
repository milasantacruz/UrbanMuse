import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// AppTopBar
/// 
/// App Bar superior personalizado siguiendo Material 3 y Figma.
/// Soporta múltiples variantes según el tipo de pantalla.
/// 
/// **Características:**
/// - Height: 56px (Material 3 standard)
/// - Background: Surface (#FEF7FF)
/// - Elevation: 0
/// - Padding horizontal: 16px
/// 
/// **Variantes:**
/// 1. Home - Título + acciones (search, filter)
/// 2. Detail - Back + Título + acciones (share, more)
/// 3. Create - Close + Título + Save/Next
/// 4. Map - Transparente para superposición en mapa
/// 
/// **Figma Reference:**
/// https://www.figma.com/design/.../node-id=2044-2028
class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final AppTopBarType type;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final bool centerTitle;
  final double elevation;
  final bool transparent;
  final VoidCallback? onBack;
  final VoidCallback? onClose;

  const AppTopBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.type = AppTopBarType.home,
    this.backgroundColor,
    this.foregroundColor,
    this.centerTitle = false,
    this.elevation = 0,
    this.transparent = false,
    this.onBack,
    this.onClose,
  });

  /// Constructor para Home (MapaPage, FeedPage)
  const AppTopBar.home({
    super.key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  })  : type = AppTopBarType.home,
        leading = null,
        centerTitle = false,
        elevation = 0,
        transparent = false,
        onBack = null,
        onClose = null;

  /// Constructor para páginas de detalle
  const AppTopBar.detail({
    super.key,
    required this.title,
    this.actions,
    this.onBack,
    this.backgroundColor,
    this.foregroundColor,
  })  : type = AppTopBarType.detail,
        leading = null,
        centerTitle = true,
        elevation = 0,
        transparent = false,
        onClose = null;

  /// Constructor para páginas de creación/edición
  const AppTopBar.create({
    super.key,
    required this.title,
    this.onClose,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  })  : type = AppTopBarType.create,
        leading = null,
        centerTitle = true,
        elevation = 0,
        transparent = false,
        onBack = null;

  /// Constructor para mapa (transparente)
  const AppTopBar.map({
    super.key,
    this.title,
    this.actions,
    this.backgroundColor,
    this.foregroundColor,
  })  : type = AppTopBarType.map,
        leading = null,
        centerTitle = false,
        elevation = 0,
        transparent = true,
        onBack = null,
        onClose = null;

  @override
  Size get preferredSize => const Size.fromHeight(56);

  @override
  Widget build(BuildContext context) {
    final effectiveBackgroundColor = transparent
        ? Colors.transparent
        : (backgroundColor ?? AppColors.surface);

    // Para map (transparente), usar blanco con sombra para buen contraste
    // Para el resto, usar onSurface
    final effectiveForegroundColor = transparent
        ? (foregroundColor ?? Colors.white)
        : (foregroundColor ?? AppColors.onSurface);

    return Theme(
      data: Theme.of(context).copyWith(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: effectiveForegroundColor,
          ),
        ),
      ),
      child: AppBar(
        title: title != null
            ? Text(
                title!,
                style: AppTextStyles.titleLarge.copyWith(
                  color: effectiveForegroundColor,
                  shadows: transparent
                      ? [
                          Shadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 4,
                          ),
                        ]
                      : null,
                ),
              )
            : null,
        leading: _buildLeading(context, effectiveForegroundColor),
        actions: _buildActions(context, effectiveForegroundColor),
        backgroundColor: effectiveBackgroundColor,
        foregroundColor: effectiveForegroundColor,
        elevation: elevation,
        centerTitle: centerTitle,
        surfaceTintColor: Colors.transparent,
        automaticallyImplyLeading: false,
        iconTheme: IconThemeData(
          color: effectiveForegroundColor,
          shadows: transparent
              ? [
                  Shadow(
                    color: Colors.black.withOpacity(0.5),
                    blurRadius: 4,
                  ),
                ]
              : null,
        ),
      ),
    );
  }

  Widget? _buildLeading(BuildContext context, Color foregroundColor) {
    if (leading != null) {
      return leading;
    }

    switch (type) {
      case AppTopBarType.detail:
        // Back button para páginas de detalle
        return IconButton(
          icon: const Icon(Icons.arrow_back),
          color: foregroundColor,
          onPressed: onBack ?? () => Navigator.of(context).pop(),
          tooltip: 'Volver',
        );

      case AppTopBarType.create:
        // Close button para páginas de creación
        return IconButton(
          icon: const Icon(Icons.close),
          color: foregroundColor,
          onPressed: onClose ?? () => Navigator.of(context).pop(),
          tooltip: 'Cerrar',
        );

      case AppTopBarType.home:
      case AppTopBarType.map:
        return null;
    }
  }

  List<Widget>? _buildActions(BuildContext context, Color foregroundColor) {
    if (actions != null) {
      return actions;
    }

    // Acciones por defecto según el tipo
    switch (type) {
      case AppTopBarType.home:
        // Home: Search + Filter
        return [
          IconButton(
            icon: const Icon(Icons.search),
            color: foregroundColor,
            onPressed: () {
              debugPrint('Search tapped');
            },
            tooltip: 'Buscar',
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            color: foregroundColor,
            onPressed: () {
              debugPrint('Filter tapped');
            },
            tooltip: 'Filtrar',
          ),
        ];

      case AppTopBarType.detail:
        // Detail: Share + More
        return [
          IconButton(
            icon: const Icon(Icons.share),
            color: foregroundColor,
            onPressed: () {
              debugPrint('Share tapped');
            },
            tooltip: 'Compartir',
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: foregroundColor,
            onPressed: () {
              debugPrint('More tapped');
            },
            tooltip: 'Más opciones',
          ),
        ];

      case AppTopBarType.create:
      case AppTopBarType.map:
        return null;
    }
  }
}

/// Tipos de App Bar según contexto
enum AppTopBarType {
  /// Home: Título + Search + Filter
  home,

  /// Detail: Back + Título centrado + Share + More
  detail,

  /// Create/Edit: Close + Título centrado + Save/Next
  create,

  /// Map: Transparente para superposición
  map,
}

