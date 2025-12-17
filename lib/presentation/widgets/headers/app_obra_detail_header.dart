import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../icons/category_icon.dart';

/// AppObraDetailHeader
/// 
/// Header hero para la página de detalle de obra de arte urbano.
/// Incluye imagen hero, gradiente overlay, botones flotantes y badge de categoría.
/// 
/// **Características:**
/// - Hero Image: Full width, aspect ratio configurable (16:9 o 4:3)
/// - Gradient Overlay: Negro 0% → 60% opacity (bottom)
/// - Back Button: Flotante top-left con fondo semi-transparente
/// - Action Buttons: Share y Favorite (top-right, flotantes)
/// - Category Badge: Top-right, debajo de botones
/// - Title Overlay: Bottom, sobre gradiente, texto blanco
/// 
/// **Figma Reference:**
/// Basado en Obra Detail Header del design system
class AppObraDetailHeader extends StatelessWidget {
  /// URL de la imagen hero
  final String imageUrl;
  
  /// Título de la obra
  final String titulo;
  
  /// Categoría de la obra ('graffiti', 'mural', 'escultura', 'performance')
  final String categoria;
  
  /// Aspect ratio de la imagen (default: 16/9)
  final double aspectRatio;
  
  /// Si la obra está marcada como favorita
  final bool isFavorite;
  
  /// Callback cuando se toca el botón back
  final VoidCallback? onBack;
  
  /// Callback cuando se toca el botón share
  final VoidCallback? onShare;
  
  /// Callback cuando se toca el botón favorite
  final VoidCallback? onFavoriteToggle;
  
  /// Callback cuando se toca la imagen (para fullscreen)
  final VoidCallback? onImageTap;
  
  /// Si mostrar el título overlay
  final bool showTitleOverlay;
  
  /// Altura máxima del header (opcional)
  final double? maxHeight;

  const AppObraDetailHeader({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.categoria,
    this.aspectRatio = 16 / 9,
    this.isFavorite = false,
    this.onBack,
    this.onShare,
    this.onFavoriteToggle,
    this.onImageTap,
    this.showTitleOverlay = true,
    this.maxHeight,
  });

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // Hero Image
          _buildHeroImage(),
          
          // Gradient Overlay (bottom)
          _buildGradientOverlay(),
          
          // Back Button (top-left)
          if (onBack != null) _buildBackButton(context),
          
          // Action Buttons (top-right)
          _buildActionButtons(context),
          
          // Category Badge (top-right, debajo de botones)
          _buildCategoryBadge(context),
          
          // Title Overlay (bottom)
          if (showTitleOverlay) _buildTitleOverlay(),
        ],
      ),
    );
  }

  Widget _buildHeroImage() {
    Widget image = Image.network(
      imageUrl,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: AppColors.neutral200,
          child: const Center(
            child: Icon(
              Icons.image_not_supported,
              size: 48,
              color: AppColors.neutral400,
            ),
          ),
        );
      },
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Container(
          color: AppColors.neutral200,
          child: Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
              color: AppColors.primary,
            ),
          ),
        );
      },
    );

    if (onImageTap != null) {
      image = GestureDetector(
        onTap: onImageTap,
        child: image,
      );
    }

    return image;
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.transparent,
              Colors.black.withValues(alpha: 0.6),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackButton(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 16,
      child: _FloatingActionButton(
        icon: Icons.arrow_back,
        onTap: onBack!,
        backgroundColor: Colors.black.withValues(alpha: 0.4),
        iconColor: Colors.white,
      ),
    );
  }

  Widget _buildActionButtons(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      right: 16,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Favorite Button
          if (onFavoriteToggle != null)
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: _FloatingActionButton(
                icon: isFavorite ? Icons.favorite : Icons.favorite_border,
                onTap: onFavoriteToggle!,
                backgroundColor: Colors.black.withValues(alpha: 0.4),
                iconColor: isFavorite ? AppColors.error : Colors.white,
              ),
            ),
          
          // Share Button
          if (onShare != null)
            _FloatingActionButton(
              icon: Icons.share,
              onTap: onShare!,
              backgroundColor: Colors.black.withValues(alpha: 0.4),
              iconColor: Colors.white,
            ),
        ],
      ),
    );
  }

  Widget _buildCategoryBadge(BuildContext context) {
    final categoryColor = AppColors.getCategoryColor(categoria);
    final categoryLabel = _getCategoryLabel(categoria);
    final artCategory = _getArtCategory(categoria);

    return Positioned(
      top: MediaQuery.of(context).padding.top + 64, // Debajo de los botones
      right: 16,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.2),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              _getCategoryIconData(artCategory),
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(width: 6),
            Text(
              categoryLabel,
              style: AppTextStyles.label.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  ArtCategory _getArtCategory(String categoria) {
    switch (categoria.toLowerCase()) {
      case 'graffiti':
        return ArtCategory.graffiti;
      case 'mural':
        return ArtCategory.mural;
      case 'escultura':
        return ArtCategory.escultura;
      case 'performance':
        return ArtCategory.performance;
      default:
        return ArtCategory.graffiti;
    }
  }

  IconData _getCategoryIconData(ArtCategory category) {
    switch (category) {
      case ArtCategory.graffiti:
        return Icons.format_paint;
      case ArtCategory.mural:
        return Icons.image;
      case ArtCategory.escultura:
        return Icons.architecture;
      case ArtCategory.performance:
        return Icons.theater_comedy;
    }
  }

  Widget _buildTitleOverlay() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          titulo,
          style: AppTextStyles.h1.copyWith(
            color: Colors.white,
            shadows: [
              Shadow(
                color: Colors.black.withValues(alpha: 0.5),
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }

  String _getCategoryLabel(String categoria) {
    switch (categoria.toLowerCase()) {
      case 'graffiti':
        return 'Graffiti';
      case 'mural':
        return 'Mural';
      case 'escultura':
        return 'Escultura';
      case 'performance':
        return 'Performance';
      default:
        return categoria;
    }
  }
}

/// Botón flotante pequeño para acciones en el header
class _FloatingActionButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color iconColor;
  static const double size = 40;

  const _FloatingActionButton({
    required this.icon,
    required this.onTap,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(size / 2),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: backgroundColor,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.2),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: iconColor,
            size: 24,
          ),
        ),
      ),
    );
  }
}
