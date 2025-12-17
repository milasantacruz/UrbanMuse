import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import '../badges/app_badge.dart';

/// AppObraCard
/// 
/// Tarjeta para mostrar una obra de arte urbano.
/// Soporta dos variantes: Grid (vertical) y List (horizontal).
/// 
/// **Características Grid Version:**
/// - Image: Aspect ratio 4:3 o 16:9
/// - Category Badge: Top-right overlay
/// - Title: H3, max 2 líneas
/// - Artist name: Body small
/// - Location: Body small con icono
/// - Favorite icon: Top-right
/// - Shadow: Elevation 2
/// - Border radius: 12px
/// 
/// **Características List Version:**
/// - Horizontal layout
/// - Image: Square 80px
/// - Content: Title + Artist + Location
/// - Category badge
/// - Chevron icon (right)
/// 
/// **Figma Reference:**
/// https://www.figma.com/design/.../node-id=2040-13
class AppObraCard extends StatelessWidget {
  final String imageUrl;
  final String titulo;
  final String artista;
  final String categoria; // 'graffiti', 'mural', 'escultura', 'performance'
  final String? ubicacion;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteToggle;
  final bool isGridView;
  final double? aspectRatio;
  final int? likes;
  final bool showChevron; // Para ocultar el chevron en list view

  const AppObraCard({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.artista,
    required this.categoria,
    this.ubicacion,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
    this.isGridView = true,
    this.aspectRatio,
    this.likes,
    this.showChevron = true,
  });

  /// Constructor para Grid View (Feed/Galería)
  const AppObraCard.grid({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.artista,
    required this.categoria,
    this.ubicacion,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
    this.aspectRatio = 4 / 3,
    this.likes,
    this.showChevron = true,
  }) : isGridView = true;

  /// Constructor para List View (Búsqueda/Lista)
  const AppObraCard.list({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.artista,
    required this.categoria,
    this.ubicacion,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteToggle,
    this.likes,
    this.showChevron = true,
  })  : isGridView = false,
        aspectRatio = null;

  @override
  Widget build(BuildContext context) {
    return isGridView ? _buildGridCard(context) : _buildListCard(context);
  }

  Widget _buildGridCard(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary, // Verde claro #E8F8DE
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.small, // Elevation 2
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Solo ocupa espacio necesario
          children: [
            // Imagen con badges superpuestos
            _buildImage(context),
            
            // Contenido
            Padding(
              padding: EdgeInsets.fromLTRB(
                AppSpacing.space2, // 8px left
                AppSpacing.space2, // 8px top
                AppSpacing.space2, // 8px right
                AppSpacing.space2, // 8px bottom
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título (H3, max 2 líneas)
                  Text(
                    titulo,
                    style: AppTextStyles.titleMedium,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  SizedBox(height: AppSpacing.space1 / 2), // 2px
                  
                  // Artista
                  Text(
                    artista,
                    style: AppTextStyles.titleSmall.copyWith(
                     // color: AppColors.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  // Ubicación (si existe)
                  if (ubicacion != null) ...[
                    SizedBox(height: AppSpacing.space1 / 2), // 2px
                    Row(
                      children: [
                        Icon(
                          Icons.place,
                          size: 14,
                         // color: AppColors.onSurfaceVariant,
                        ),
                        SizedBox(width: AppSpacing.space1),
                        Expanded(
                          child: Text(
                            ubicacion!,
                            style: AppTextStyles.caption.copyWith(
                             // color: AppColors.onSurfaceVariant,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ],
                  
                  // Likes (si existe)
                  if (likes != null) ...[
                    SizedBox(height: AppSpacing.space1 / 2), // 2px
                    Row(
                      children: [
                        Icon(
                          isFavorite ? Icons.favorite : Icons.favorite_border,
                          size: 14,
                          color: isFavorite ? AppColors.error : AppColors.onSurfaceVariant,
                        ),
                        SizedBox(width: AppSpacing.space1),
                        Text(
                          '$likes',
                          style: AppTextStyles.caption.copyWith(
                           // color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListCard(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary, // Verde claro #E8F8DE
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.small,
        ),
        child: Row(
          children: [
            // Imagen cuadrada 80px con padding
            Padding(
              padding: EdgeInsets.all(AppSpacing.space2), // 8px padding
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 80,
                      height: 80,
                      color: AppColors.surface2,
                      child: Icon(
                        Icons.image_not_supported,
                        //color: AppColors.onSurfaceVariant,
                        size: 32,
                      ),
                    );
                  },
                ),
              ),
            ),
            
            // Contenido
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSpacing.space2, // 8px
                  vertical: AppSpacing.space2, // 8px
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Category badge
                    CategoryBadge(
                      category: categoria,
                      type: AppBadgeType.rounded,
                    ),
                    
                    SizedBox(height: AppSpacing.space1), // 4px
                    
                    // Título
                    Text(
                      titulo,
                      style: AppTextStyles.titleMedium,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    SizedBox(height: AppSpacing.space1 / 2), // 2px
                    
                    // Artista
                    Text(
                      artista,
                      style: AppTextStyles.bodySmall.copyWith(
                       // color: AppColors.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    
                    // Ubicación
                    if (ubicacion != null) ...[
                      SizedBox(height: AppSpacing.space1 / 2), // 2px
                      Row(
                        children: [
                          Icon(
                            Icons.place,
                            size: 12,
                           // color: AppColors.onSurfaceVariant,
                          ),
                          SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              ubicacion!,
                              style: AppTextStyles.caption.copyWith(
                               // color: AppColors.onSurfaceVariant,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            
            // Chevron icon (solo si showChevron es true)
            if (showChevron)
              Padding(
                padding: EdgeInsets.only(right: AppSpacing.space2), // 8px
                child: Icon(
                  Icons.chevron_right,
                  color: AppColors.onSurfaceVariant,
                  size: 24,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage(BuildContext context) {
    return Stack(
      children: [
        // Imagen principal
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: AspectRatio(
            aspectRatio: aspectRatio ?? 4 / 3,
            child: Image.network(
              imageUrl,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: AppColors.surface2,
                  child: Center(
                    child: Icon(
                      Icons.image_not_supported,
                      color: AppColors.onSurfaceVariant,
                      size: 48,
                    ),
                  ),
                );
              },
            ),
          ),
        ),
        
        // Category Badge (top-right overlay)
        Positioned(
          top: AppSpacing.space2,
          right: AppSpacing.space2,
          child: CategoryBadge(
            category: categoria,
            type: AppBadgeType.rounded,
          ),
        ),
        
        // Favorite icon (top-left overlay)
        if (onFavoriteToggle != null)
          Positioned(
            top: AppSpacing.space2,
            left: AppSpacing.space2,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: onFavoriteToggle,
                customBorder: const CircleBorder(),
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: isFavorite ? AppColors.error : Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

/// AppObraCardCompact
/// 
/// Versión compacta de la obra card para listas pequeñas,
/// como "obras relacionadas" o "mini previews".
class AppObraCardCompact extends StatelessWidget {
  final String imageUrl;
  final String titulo;
  final String artista;
  final String categoria;
  final VoidCallback? onTap;

  const AppObraCardCompact({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.artista,
    required this.categoria,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        width: 120,
        decoration: BoxDecoration(
          color: AppColors.secondaryContainer, // Verde claro #E8F8DE
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppShadows.small,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min, // Solo ocupa espacio necesario
          children: [
            // Imagen
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: AppColors.surface2,
                          child: Icon(
                            Icons.image_not_supported,
                            color: AppColors.onSurfaceVariant,
                            size: 24,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                
                // Category Badge (mini)
                Positioned(
                  top: 4,
                  right: 4,
                  child: Container(
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: AppColors.getCategoryColor(categoria),
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            
            // Contenido
            Padding(
              padding: EdgeInsets.all(AppSpacing.space2), // 8px
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: GoogleFonts.expletusSans(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      height: 1.2,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: AppSpacing.space1 / 2), // 2px
                  Text(
                    artista,
                    style: GoogleFonts.exo2(
                      fontSize: 10,
                      color: AppColors.onSurfaceVariant,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

