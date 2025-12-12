import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// Tipos de divider según Figma
enum DividerType {
  /// Full-width: Divider ocupa todo el ancho
  fullWidth,

  /// Inset: Divider con padding izquierdo de 16px
  inset,

  /// Middle-inset: Divider con padding horizontal de 16px
  middleInset,

  /// With Subhead: Divider con texto de subencabezado
  withSubhead,
}

/// Orientación del divider
enum DividerOrientation {
  /// Horizontal: Línea horizontal (default)
  horizontal,

  /// Vertical: Línea vertical
  vertical,
}

/// AppDivider
/// 
/// Componente de separador siguiendo las especificaciones de Material 3
/// y sincronizado pixel a pixel con Figma.
/// 
/// **Características:**
/// - Orientación: Horizontal o Vertical
/// - Tipos: Full-width, Inset, Middle-inset, With Subhead
/// - Grosor: 1px
/// - Color: onSurfaceVariant (rgba(50, 50, 50, 1))
/// 
/// **Referencia Figma:**
/// https://www.figma.com/design/.../node-id=2031-165
class AppDivider extends StatelessWidget {
  final DividerType type;
  final DividerOrientation orientation;
  final String? subheadText;
  final Color? color;
  final double? thickness;
  final double? height; // Para dividers verticales

  const AppDivider({
    super.key,
    this.type = DividerType.fullWidth,
    this.orientation = DividerOrientation.horizontal,
    this.subheadText,
    this.color,
    this.thickness,
    this.height,
  });

  /// Constructor para divider horizontal full-width
  const AppDivider.fullWidth({
    super.key,
    this.color,
    this.thickness,
  })  : type = DividerType.fullWidth,
        orientation = DividerOrientation.horizontal,
        subheadText = null,
        height = null;

  /// Constructor para divider horizontal con inset izquierdo
  const AppDivider.inset({
    super.key,
    this.color,
    this.thickness,
  })  : type = DividerType.inset,
        orientation = DividerOrientation.horizontal,
        subheadText = null,
        height = null;

  /// Constructor para divider horizontal con inset en ambos lados
  const AppDivider.middleInset({
    super.key,
    this.color,
    this.thickness,
  })  : type = DividerType.middleInset,
        orientation = DividerOrientation.horizontal,
        subheadText = null,
        height = null;

  /// Constructor para divider con subencabezado
  const AppDivider.withSubhead({
    super.key,
    required this.subheadText,
    this.color,
    this.thickness,
  })  : type = DividerType.withSubhead,
        orientation = DividerOrientation.horizontal,
        height = null;

  /// Constructor para divider vertical full-width
  const AppDivider.verticalFullWidth({
    super.key,
    this.height = 120.0,
    this.color,
    this.thickness,
  })  : type = DividerType.fullWidth,
        orientation = DividerOrientation.vertical,
        subheadText = null;

  /// Constructor para divider vertical con inset superior
  const AppDivider.verticalInset({
    super.key,
    this.height,
    this.color,
    this.thickness,
  })  : type = DividerType.inset,
        orientation = DividerOrientation.vertical,
        subheadText = null;

  /// Constructor para divider vertical con inset en ambos lados
  const AppDivider.verticalMiddleInset({
    super.key,
    this.height,
    this.color,
    this.thickness,
  })  : type = DividerType.middleInset,
        orientation = DividerOrientation.vertical,
        subheadText = null;

  @override
  Widget build(BuildContext context) {
    final dividerColor = color ?? AppColors.onSurfaceVariant;
    final dividerThickness = thickness ?? 1.0;

    // Divider con subencabezado
    if (type == DividerType.withSubhead && orientation == DividerOrientation.horizontal) {
      return Padding(
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(
              color: dividerColor,
              thickness: dividerThickness,
              height: dividerThickness,
            ),
            SizedBox(height: AppSpacing.space1), // 4px gap
            Text(
              subheadText ?? 'Subheader',
              style: AppTextStyles.titleSmall.copyWith(
                color: AppColors.onSurface,
              ),
            ),
          ],
        ),
      );
    }

    // Dividers horizontales
    if (orientation == DividerOrientation.horizontal) {
      switch (type) {
        case DividerType.fullWidth:
          return Divider(
            color: dividerColor,
            thickness: dividerThickness,
            height: dividerThickness,
          );

        case DividerType.inset:
          return Padding(
            padding: EdgeInsets.only(left: AppSpacing.space4), // 16px
            child: Divider(
              color: dividerColor,
              thickness: dividerThickness,
              height: dividerThickness,
            ),
          );

        case DividerType.middleInset:
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4), // 16px
            child: Divider(
              color: dividerColor,
              thickness: dividerThickness,
              height: dividerThickness,
            ),
          );

        default:
          return Divider(
            color: dividerColor,
            thickness: dividerThickness,
            height: dividerThickness,
          );
      }
    }

    // Dividers verticales
    else {
      return RotatedBox(
        quarterTurns: 1,
        child: SizedBox(
          height: height ?? 120.0,
          child: _buildVerticalDivider(dividerColor, dividerThickness),
        ),
      );
    }
  }

  Widget _buildVerticalDivider(Color dividerColor, double dividerThickness) {
    switch (type) {
      case DividerType.fullWidth:
        return Divider(
          color: dividerColor,
          thickness: dividerThickness,
          height: dividerThickness,
        );

      case DividerType.inset:
        return Padding(
          padding: EdgeInsets.only(left: AppSpacing.space4), // 16px top cuando rota
          child: Divider(
            color: dividerColor,
            thickness: dividerThickness,
            height: dividerThickness,
          ),
        );

      case DividerType.middleInset:
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4), // 16px ambos lados
          child: Divider(
            color: dividerColor,
            thickness: dividerThickness,
            height: dividerThickness,
          ),
        );

      default:
        return Divider(
          color: dividerColor,
          thickness: dividerThickness,
          height: dividerThickness,
        );
    }
  }
}

