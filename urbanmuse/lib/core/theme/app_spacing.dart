import 'package:flutter/material.dart';

/// Design tokens de espaciado para Graffiti Trails
/// Sistema de 8px base
class AppSpacing {
  AppSpacing._();

  // ============================================
  // Sistema de Espaciado (8px base)
  // ============================================
  
  /// 0.5x - 4px
  static const double space1 = 4.0;
  
  /// 1x - Base - 8px
  static const double space2 = 8.0;
  
  /// 1.5x - 12px
  static const double space3 = 12.0;
  
  /// 2x - 16px
  static const double space4 = 16.0;
  
  /// 3x - 24px
  static const double space5 = 24.0;
  
  /// 4x - 32px
  static const double space6 = 32.0;
  
  /// 5x - 40px
  static const double space7 = 40.0;
  
  /// 6x - 48px
  static const double space8 = 48.0;
  
  /// 8x - 64px
  static const double space9 = 64.0;
  
  /// 10x - 80px
  static const double space10 = 80.0;

  // ============================================
  // Helpers para EdgeInsets
  // ============================================
  
  /// Padding uniforme
  static EdgeInsets padding(double spacing) {
    return EdgeInsets.all(spacing);
  }

  /// Padding horizontal
  static EdgeInsets paddingHorizontal(double spacing) {
    return EdgeInsets.symmetric(horizontal: spacing);
  }

  /// Padding vertical
  static EdgeInsets paddingVertical(double spacing) {
    return EdgeInsets.symmetric(vertical: spacing);
  }

  /// Padding simétrico
  static EdgeInsets paddingSymmetric({
    required double horizontal,
    required double vertical,
  }) {
    return EdgeInsets.symmetric(
      horizontal: horizontal,
      vertical: vertical,
    );
  }

  /// Padding solo (top, right, bottom, left)
  static EdgeInsets paddingOnly({
    double top = 0,
    double right = 0,
    double bottom = 0,
    double left = 0,
  }) {
    return EdgeInsets.only(
      top: top,
      right: right,
      bottom: bottom,
      left: left,
    );
  }

  /// Margen uniforme
  static EdgeInsets margin(double spacing) {
    return EdgeInsets.all(spacing);
  }

  /// Margen horizontal
  static EdgeInsets marginHorizontal(double spacing) {
    return EdgeInsets.symmetric(horizontal: spacing);
  }

  /// Margen vertical
  static EdgeInsets marginVertical(double spacing) {
    return EdgeInsets.symmetric(vertical: spacing);
  }

  // ============================================
  // Espaciado común para componentes
  // ============================================
  
  /// Padding de componentes estándar
  static EdgeInsets get componentPadding => padding(space4);
  
  /// Padding de componentes pequeños
  static EdgeInsets get componentPaddingSmall => padding(space2);
  
  /// Padding de componentes grandes
  static EdgeInsets get componentPaddingLarge => padding(space5);
  
  /// Márgenes entre elementos
  static EdgeInsets get elementMargin => margin(space3);
  
  /// Márgenes de sección
  static EdgeInsets get sectionMargin => margin(space6);
}

