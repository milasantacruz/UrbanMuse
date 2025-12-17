import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// Tipos de badge según Material 3 y Figma
enum AppBadgeType {
  dot, // Punto simple (6x6px)
  circle, // Círculo con número (16x16px)
  rounded, // Badge redondeado con texto
}

/// Badge personalizado siguiendo Material 3 y Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-
class AppBadge extends StatelessWidget {
  final AppBadgeType type;
  final String? label;
  final Color? backgroundColor;
  final Color? foregroundColor;

  const AppBadge({
    super.key,
    this.type = AppBadgeType.circle,
    this.label,
    this.backgroundColor,
    this.foregroundColor,
  });

  /// Constructor para badge dot (simple punto)
  const AppBadge.dot({
    super.key,
    this.backgroundColor,
  })  : type = AppBadgeType.dot,
        label = null,
        foregroundColor = null;

  /// Constructor para badge circle (con número)
  const AppBadge.circle({
    super.key,
    required String this.label,
    this.backgroundColor,
    this.foregroundColor,
  }) : type = AppBadgeType.circle;

  /// Constructor para badge rounded (con texto largo)
  const AppBadge.rounded({
    super.key,
    required String this.label,
    this.backgroundColor,
    this.foregroundColor,
  }) : type = AppBadgeType.rounded;

  @override
  Widget build(BuildContext context) {
    final bgColor = backgroundColor ?? AppColors.primary;
    final fgColor = foregroundColor ?? AppColors.onPrimary;

    switch (type) {
      case AppBadgeType.dot:
        return _buildDot(bgColor);
      case AppBadgeType.circle:
        return _buildCircle(bgColor, fgColor);
      case AppBadgeType.rounded:
        return _buildRounded(bgColor, fgColor);
    }
  }

  /// Badge tipo dot - Punto simple 6x6px
  Widget _buildDot(Color bgColor) {
    return Container(
      width: 6,
      height: 6,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
    );
  }

  /// Badge tipo circle - Círculo 16x16px con número
  Widget _buildCircle(Color bgColor, Color fgColor) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(26), // Radio grande para círculo perfecto
      ),
      alignment: Alignment.center,
      child: Text(
        label ?? '0',
        style: GoogleFonts.roboto(
          fontSize: 11,
          fontWeight: FontWeight.w500, // Medium
          height: 16 / 11,
          letterSpacing: 0.055,
          color: fgColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  /// Badge tipo rounded - Badge redondeado con padding
  Widget _buildRounded(Color bgColor, Color fgColor) {
    return Container(
      height: 16,
      padding: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Text(
        label ?? '',
        style: GoogleFonts.roboto(
          fontSize: 11,
          fontWeight: FontWeight.w500, // Medium
          height: 16 / 11,
          letterSpacing: 0.055,
          color: fgColor,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

/// Badge específico para categorías con colores predefinidos
class CategoryBadge extends StatelessWidget {
  final String category;
  final AppBadgeType type;

  const CategoryBadge({
    super.key,
    required this.category,
    this.type = AppBadgeType.rounded,
  });

  /// Constructor para badge rounded de categoría
  const CategoryBadge.rounded({
    super.key,
    required this.category,
  }) : type = AppBadgeType.rounded;

  /// Constructor para badge circle de categoría
  const CategoryBadge.circle({
    super.key,
    required this.category,
  }) : type = AppBadgeType.circle;

  /// Constructor para badge dot de categoría
  const CategoryBadge.dot({
    super.key,
    required this.category,
  }) : type = AppBadgeType.dot;

  @override
  Widget build(BuildContext context) {
    // Obtener color según categoría
    final categoryColor = _getCategoryColor(category);

    return AppBadge(
      type: type,
      label: category,
      backgroundColor: categoryColor,
      foregroundColor: Colors.white,
    );
  }

  Color _getCategoryColor(String category) {
    final categoryLower = category.toLowerCase();
    if (categoryLower.contains('graffiti')) {
      return AppColors.categoryGraffiti;
    } else if (categoryLower.contains('mural')) {
      return AppColors.categoryMural;
    } else if (categoryLower.contains('escultura')) {
      return AppColors.categoryEscultura;
    } else if (categoryLower.contains('performance')) {
      return AppColors.categoryPerformance;
    }
    return AppColors.primary; // Default
  }
}

/// Badge con conteo de notificaciones
class NotificationBadge extends StatelessWidget {
  final int count;
  final AppBadgeType type;
  final Widget child;

  const NotificationBadge({
    super.key,
    required this.count,
    required this.child,
    this.type = AppBadgeType.circle,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        child,
        if (count > 0)
          Positioned(
            top: -4,
            right: -4,
            child: type == AppBadgeType.dot
                ? const AppBadge.dot()
                : AppBadge.circle(
                    label: count > 99 ? '99+' : count.toString(),
                  ),
          ),
      ],
    );
  }
}

