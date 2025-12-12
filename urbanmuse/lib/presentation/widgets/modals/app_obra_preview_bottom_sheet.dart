import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../badges/badges.dart';
import '../buttons/buttons.dart';

/// AppObraPreviewBottomSheet
/// 
/// Bottom Sheet para mostrar preview de una obra de arte urbano.
/// Se muestra desde el mapa o feed cuando el usuario toca un pin o card.
/// 
/// **Características:**
/// - Handle bar (top)
/// - Small image (80px height, full width)
/// - Title (H3)
/// - Artist name
/// - Category badge
/// - Distance from user
/// - "Ver detalles" button (primary)
/// - Swipe up para expandir a full detail (futuro)
/// - Height inicial: 25% de pantalla
/// 
/// **Figma Reference:**
/// Basado en Material 3 Bottom Sheet
class AppObraPreviewBottomSheet extends StatelessWidget {
  final String imageUrl;
  final String titulo;
  final String artista;
  final String categoria; // 'graffiti', 'mural', 'escultura', 'performance'
  final String? distancia; // Ej: "1.2 km", "500 m"
  final VoidCallback? onVerDetalles;
  final VoidCallback? onClose;
  final double? initialHeight; // Porcentaje de pantalla (0.0 - 1.0)

  const AppObraPreviewBottomSheet({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.artista,
    required this.categoria,
    this.distancia,
    this.onVerDetalles,
    this.onClose,
    this.initialHeight = 0.25, // 25% por defecto
  });

  /// Helper para mostrar el bottom sheet
  static Future<void> show(
    BuildContext context, {
    required String imageUrl,
    required String titulo,
    required String artista,
    required String categoria,
    String? distancia,
    VoidCallback? onVerDetalles,
  }) {
    return showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AppObraPreviewBottomSheet(
        imageUrl: imageUrl,
        titulo: titulo,
        artista: artista,
        categoria: categoria,
        distancia: distancia,
        onVerDetalles: () {
          Navigator.of(context).pop(); // Cerrar bottom sheet
          onVerDetalles?.call();
        },
        onClose: () => Navigator.of(context).pop(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final modalHeight = screenHeight * (initialHeight ?? 0.25);

    return Container(
      height: modalHeight,
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: AppSpacing.space2),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image (80px height, full width)
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(28),
                      topRight: Radius.circular(28),
                    ),
                    child: Container(
                      width: double.infinity,
                      height: 80,
                      color: AppColors.surface2,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: AppColors.surface2,
                            child: Icon(
                              Icons.image_not_supported,
                              color: AppColors.onSurfaceVariant,
                              size: 32,
                            ),
                          );
                        },
                      ),
                    ),
                  ),

                  // Content padding
                  Padding(
                    padding: EdgeInsets.all(AppSpacing.space4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title (H3)
                        Text(
                          titulo,
                          style: AppTextStyles.h3,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),

                        SizedBox(height: AppSpacing.space2),

                        // Artist name
                        Text(
                          artista,
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),

                        SizedBox(height: AppSpacing.space3),

                        // Category badge + Distance (row)
                        Row(
                          children: [
                            // Category badge
                            CategoryBadge.rounded(
                              category: categoria,
                            ),

                            // Distance (if provided)
                            if (distancia != null) ...[
                              SizedBox(width: AppSpacing.space3),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.location_on,
                                    size: 16,
                                    color: AppColors.onSurfaceVariant,
                                  ),
                                  SizedBox(width: AppSpacing.space1),
                                  Text(
                                    distancia!,
                                    style: AppTextStyles.bodySmall.copyWith(
                                      color: AppColors.onSurfaceVariant,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ],
                        ),

                        SizedBox(height: AppSpacing.space4),

                        // "Ver detalles" button (primary)
                        AppButton.primary(
                          label: 'Ver detalles',
                          onPressed: onVerDetalles,
                          isExpanded: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

