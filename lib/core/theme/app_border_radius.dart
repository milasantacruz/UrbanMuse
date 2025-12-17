import 'package:flutter/material.dart';

/// Design tokens de border radius para Graffiti Trails
class AppBorderRadius {
  AppBorderRadius._();

  // ============================================
  // Radio de Bordes
  // ============================================
  
  /// Small - 4px
  /// Inputs pequeños, badges
  static const double radiusSm = 4.0;
  
  /// Medium - 8px
  /// Botones, cards estándar
  static const double radiusMd = 8.0;
  
  /// Large - 12px
  /// Cards grandes, modales
  static const double radiusLg = 12.0;
  
  /// Extra Large - 16px
  /// Imágenes, hero sections
  static const double radiusXl = 16.0;
  
  /// Full - 9999px
  /// Pills, avatares
  static const double radiusFull = 9999.0;

  // ============================================
  // BorderRadius helpers
  // ============================================
  
  /// BorderRadius small
  static BorderRadius get small => BorderRadius.circular(radiusSm);
  
  /// BorderRadius medium
  static BorderRadius get medium => BorderRadius.circular(radiusMd);
  
  /// BorderRadius large
  static BorderRadius get large => BorderRadius.circular(radiusLg);
  
  /// BorderRadius extra large
  static BorderRadius get extraLarge => BorderRadius.circular(radiusXl);
  
  /// BorderRadius full (círculo)
  static BorderRadius get full => BorderRadius.circular(radiusFull);
  
  /// BorderRadius custom
  static BorderRadius custom(double radius) {
    return BorderRadius.circular(radius);
  }
  
  /// BorderRadius solo top
  static BorderRadius topOnly(double radius) {
    return BorderRadius.only(
      topLeft: Radius.circular(radius),
      topRight: Radius.circular(radius),
    );
  }
  
  /// BorderRadius solo bottom
  static BorderRadius bottomOnly(double radius) {
    return BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    );
  }
}

