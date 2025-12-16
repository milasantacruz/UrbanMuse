import 'package:flutter/material.dart';
import '../../../domain/entities/ruta.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_spacing.dart';
import '../../../core/theme/app_border_radius.dart';
import '../../../core/theme/app_shadows.dart';

/// AppTopNItem
/// 
/// Item del grid Top N para mostrar rutas en ranking.
/// Muestra preview de mapa, número de ranking, nombre de ruta, obras incluidas, distancia y modo de transporte.
/// 
/// **Cambio importante:** Ahora muestra rutas (no obras).
/// 
/// **Características:**
/// - Preview de mapa: Muestra la ruta con polyline
/// - Ranking number: Circle background (primary color), white number (1-10)
/// - Title overlay: Bottom con gradiente
/// - Gradient overlay: Negro desde abajo (0% → 60% opacity)
/// - Remove button: Top-right, pequeño
/// - Border radius: 12px
/// - Shadow: Elevation 2
/// 
/// **Grid:** 2 columnas
class AppTopNItem extends StatelessWidget {
  final Ruta ruta;
  final int ranking; // 1-10
  final VoidCallback? onTap;
  final VoidCallback? onRemove;
  final bool showRemoveButton;
  final double aspectRatio; // 0.8 para 4:5

  const AppTopNItem({
    super.key,
    required this.ruta,
    required this.ranking,
    this.onTap,
    this.onRemove,
    this.showRemoveButton = false,
    this.aspectRatio = 0.8,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.medium,
            color: colorScheme.surface,
            boxShadow: AppShadows.small,
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            fit: StackFit.expand,
            children: [
              // Preview de mapa (placeholder por ahora)
              Container(
                color: colorScheme.surfaceVariant,
                child: Center(
                  child: Icon(
                    Icons.map,
                    size: 48,
                    color: colorScheme.onSurfaceVariant.withOpacity(0.5),
                  ),
                ),
              ),
              
              // Gradient overlay
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withOpacity(0.6),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ),
              
              // Ranking number
              Positioned(
                top: AppSpacing.space2,
                left: AppSpacing.space2,
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: colorScheme.primary,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    '$ranking',
                    style: AppTextStyles.labelLarge.copyWith(
                      color: colorScheme.onPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              
              // Remove button
              if (showRemoveButton)
                Positioned(
                  top: AppSpacing.space2,
                  right: AppSpacing.space2,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: onRemove,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: colorScheme.errorContainer,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 18,
                          color: colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ),
                ),
              
              // Información de la ruta (bottom)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space2),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Nombre de la ruta
                      Text(
                        ruta.nombre,
                        style: AppTextStyles.titleSmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      // Stats: obras, distancia, transporte
                      Row(
                        children: [
                          Icon(
                            Icons.image,
                            size: 12,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            '${ruta.obraIds.length} obras',
                            style: AppTextStyles.labelSmall.copyWith(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Icon(
                            ruta.modoTransporte == ModoTransporte.bici
                                ? Icons.directions_bike
                                : Icons.directions_walk,
                            size: 12,
                            color: Colors.white.withOpacity(0.8),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            _formatDistance(ruta.distancia),
                            style: AppTextStyles.labelSmall.copyWith(
                              color: Colors.white.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  String _formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.toInt()}m';
    }
    return '${(distanceInMeters / 1000).toStringAsFixed(1)}km';
  }
}

