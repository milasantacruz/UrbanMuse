import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import 'app_icon.dart';

/// Categorías de obras de arte urbano
enum ArtCategory {
  graffiti,
  mural,
  escultura,
  performance,
}

/// Widget de icono de categoría con color específico
/// Siguiendo las especificaciones de colores del design system
class CategoryIcon extends StatelessWidget {
  final ArtCategory category;
  final AppIconSize size;
  final bool filled;

  const CategoryIcon({
    super.key,
    required this.category,
    this.size = AppIconSize.medium,
    this.filled = false,
  });

  @override
  Widget build(BuildContext context) {
    return AppIcon(
      icon: _getIconData(),
      size: size,
      color: _getCategoryColor(),
      semanticLabel: _getCategoryLabel(),
    );
  }

  IconData _getIconData() {
    switch (category) {
      case ArtCategory.graffiti:
        return AppIcons.graffiti;
      case ArtCategory.mural:
        return AppIcons.mural;
      case ArtCategory.escultura:
        return AppIcons.sculpture;
      case ArtCategory.performance:
        return AppIcons.performance;
    }
  }

  Color _getCategoryColor() {
    switch (category) {
      case ArtCategory.graffiti:
        return AppColors.categoryGraffiti; // #E74C3C (rojo)
      case ArtCategory.mural:
        return AppColors.categoryMural; // #3498DB (azul)
      case ArtCategory.escultura:
        return AppColors.categoryEscultura; // #F39C12 (naranja)
      case ArtCategory.performance:
        return AppColors.categoryPerformance; // #9B59B6 (morado)
    }
  }

  String _getCategoryLabel() {
    switch (category) {
      case ArtCategory.graffiti:
        return 'Graffiti';
      case ArtCategory.mural:
        return 'Mural';
      case ArtCategory.escultura:
        return 'Escultura';
      case ArtCategory.performance:
        return 'Performance';
    }
  }
}

/// Helper para obtener el icono de categoría por nombre
CategoryIcon getCategoryIcon(String categoryName, {AppIconSize? size}) {
  final category = ArtCategory.values.firstWhere(
    (c) => c.name.toLowerCase() == categoryName.toLowerCase(),
    orElse: () => ArtCategory.graffiti,
  );

  return CategoryIcon(
    category: category,
    size: size ?? AppIconSize.medium,
  );
}

