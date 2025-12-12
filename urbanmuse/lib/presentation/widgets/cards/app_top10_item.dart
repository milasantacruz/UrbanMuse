import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// AppTop10Item
/// 
/// Item del grid Top 10 para mostrar obras en ranking.
/// Muestra imagen, número de ranking, título y botón de eliminar.
/// 
/// **Características:**
/// - Large image: Square o 4:5 aspect ratio
/// - Ranking number: Circle background (primary color), white number (1-10)
/// - Title overlay: Bottom con gradiente
/// - Gradient overlay: Negro desde abajo (0% → 60% opacity)
/// - Remove button: Top-right, pequeño
/// - Border radius: 12px
/// - Shadow: Elevation 2
/// 
/// **Grid:** 2 columnas
/// 
/// **Figma Reference:**
/// Basado en especificaciones del sistema
class AppTop10Item extends StatelessWidget {
  final String imageUrl;
  final String titulo;
  final int ranking; // 1-10
  final VoidCallback? onTap;
  final VoidCallback? onRemove;
  final bool showRemoveButton;
  final double aspectRatio; // 1.0 para square, 0.8 para 4:5

  const AppTop10Item({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.ranking,
    this.onTap,
    this.onRemove,
    this.showRemoveButton = true,
    this.aspectRatio = 1.0, // Square por defecto
  });

  /// Constructor para aspect ratio 4:5
  const AppTop10Item.portrait({
    super.key,
    required this.imageUrl,
    required this.titulo,
    required this.ranking,
    this.onTap,
    this.onRemove,
    this.showRemoveButton = true,
  }) : aspectRatio = 0.8; // 4:5

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            boxShadow: AppShadows.small, // Elevation 2
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: AspectRatio(
              aspectRatio: aspectRatio,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  // Imagen
                  Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: AppColors.surface2,
                        child: Icon(
                          Icons.image_not_supported,
                          color: AppColors.onSurfaceVariant,
                          size: 48,
                        ),
                      );
                    },
                  ),

                  // Gradient overlay (bottom)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12),
                        ),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.6), // 60% opacity
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Ranking number (top-left)
                  Positioned(
                    top: AppSpacing.space2, // 8px
                    left: AppSpacing.space2, // 8px
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: AppColors.primary, // Primary color
                        shape: BoxShape.circle,
                        boxShadow: AppShadows.small,
                      ),
                      child: Center(
                        child: Text(
                          '$ranking',
                          style: AppTextStyles.titleLarge.copyWith(
                            color: AppColors.onPrimary, // White
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Remove button (top-right)
                  if (showRemoveButton && onRemove != null)
                    Positioned(
                      top: AppSpacing.space2, // 8px
                      right: AppSpacing.space2, // 8px
                      child: GestureDetector(
                        onTap: onRemove,
                        child: Container(
                          width: 32,
                          height: 32,
                          decoration: BoxDecoration(
                            color: AppColors.error,
                            shape: BoxShape.circle,
                            boxShadow: AppShadows.small,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                        ),
                      ),
                    ),

                  // Title overlay (bottom)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.space3), // 12px
                      child: Text(
                        titulo,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// AppTop10Grid
/// 
/// Grid de 2 columnas para mostrar el Top 10.
/// Soporta drag & drop para reordenar (opcional).
class AppTop10Grid extends StatelessWidget {
  final List<Top10ItemData> items;
  final ValueChanged<int>? onItemTap;
  final ValueChanged<int>? onItemRemove;
  final double spacing;
  final double aspectRatio;
  final bool showRemoveButtons;

  const AppTop10Grid({
    super.key,
    required this.items,
    this.onItemTap,
    this.onItemRemove,
    this.spacing = 12.0,
    this.aspectRatio = 1.0,
    this.showRemoveButtons = true,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: spacing,
        mainAxisSpacing: spacing,
        childAspectRatio: aspectRatio,
      ),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return AppTop10Item(
          imageUrl: item.imageUrl,
          titulo: item.titulo,
          ranking: item.ranking,
          aspectRatio: aspectRatio,
          showRemoveButton: showRemoveButtons,
          onTap: onItemTap != null ? () => onItemTap!(index) : null,
          onRemove: onItemRemove != null ? () => onItemRemove!(index) : null,
        );
      },
    );
  }
}

/// Top10ItemData
/// 
/// Modelo de datos para un item del Top 10.
class Top10ItemData {
  final String imageUrl;
  final String titulo;
  final int ranking; // 1-10

  const Top10ItemData({
    required this.imageUrl,
    required this.titulo,
    required this.ranking,
  });
}

/// AppTop10EmptySlot
/// 
/// Slot vacío para el grid Top 10 cuando hay menos de 10 obras.
/// Muestra un placeholder con icono y texto.
class AppTop10EmptySlot extends StatelessWidget {
  final VoidCallback? onTap;
  final double aspectRatio;

  const AppTop10EmptySlot({
    super.key,
    this.onTap,
    this.aspectRatio = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.surface2,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColors.outlineVariant,
            width: 2,
            style: BorderStyle.solid,
          ),
          boxShadow: AppShadows.small,
        ),
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.add_circle_outline,
                size: 48,
                color: AppColors.onSurfaceVariant,
              ),
              SizedBox(height: AppSpacing.space2),
              Text(
                'Agregar obra',
                style: AppTextStyles.bodyMedium.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

