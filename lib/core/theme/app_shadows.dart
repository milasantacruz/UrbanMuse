import 'package:flutter/material.dart';

/// Design tokens de sombras (elevación) para Graffiti Trails
/// Material Design inspired
class AppShadows {
  AppShadows._();

  // ============================================
  // Elevación - Material Design inspired
  // ============================================
  
  /// Shadow Small
  /// 0 1px 2px rgba(0, 0, 0, 0.05)
  /// Botones elevados
  static const BoxShadow shadowSm = BoxShadow(
    color: Color(0x0D000000), // rgba(0, 0, 0, 0.05)
    offset: Offset(0, 1),
    blurRadius: 2,
    spreadRadius: 0,
  );

  /// Shadow Medium
  /// 0 4px 6px rgba(0, 0, 0, 0.1)
  /// Cards
  static const BoxShadow shadowMd = BoxShadow(
    color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
    offset: Offset(0, 4),
    blurRadius: 6,
    spreadRadius: 0,
  );

  /// Shadow Large
  /// 0 10px 15px rgba(0, 0, 0, 0.1)
  /// Bottom sheets
  static const BoxShadow shadowLg = BoxShadow(
    color: Color(0x1A000000), // rgba(0, 0, 0, 0.1)
    offset: Offset(0, 10),
    blurRadius: 15,
    spreadRadius: 0,
  );

  /// Shadow Extra Large
  /// 0 20px 25px rgba(0, 0, 0, 0.15)
  /// Modales
  static const BoxShadow shadowXl = BoxShadow(
    color: Color(0x26000000), // rgba(0, 0, 0, 0.15)
    offset: Offset(0, 20),
    blurRadius: 25,
    spreadRadius: 0,
  );

  // ============================================
  // Listas de sombras (para BoxDecoration)
  // ============================================
  
  /// Lista de sombras small
  static List<BoxShadow> get small => [shadowSm];
  
  /// Lista de sombras medium
  static List<BoxShadow> get medium => [shadowMd];
  
  /// Lista de sombras large
  static List<BoxShadow> get large => [shadowLg];
  
  /// Lista de sombras extra large
  static List<BoxShadow> get extraLarge => [shadowXl];

  // ============================================
  // Helpers para custom shadows
  // ============================================
  
  /// Crear sombra custom
  static BoxShadow custom({
    required Color color,
    required Offset offset,
    required double blurRadius,
    double spreadRadius = 0,
  }) {
    return BoxShadow(
      color: color,
      offset: offset,
      blurRadius: blurRadius,
      spreadRadius: spreadRadius,
    );
  }
}

