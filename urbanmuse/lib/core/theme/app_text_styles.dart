import 'package:flutter/material.dart';

/// Design tokens de tipografía para Graffiti Trails
/// Basado en design-system.md
class AppTextStyles {
  AppTextStyles._();

  // ============================================
  // Familias de Fuente
  // ============================================
  
  /// Fuente Principal - Moderna y legible
  /// Inter, SF Pro Display, o sistema por defecto
  static const String fontPrimary = 'Inter';
  
  /// Fuente Display - Para títulos grandes
  static const String fontDisplay = 'Poppins';
  
  /// Fuente Mono - Para datos técnicos (opcional)
  static const String fontMono = 'SF Mono';

  // ============================================
  // Escala Tipográfica
  // ============================================
  
  /// Display - Títulos hero
  /// 32px / 40px, Bold 700
  static const TextStyle display = TextStyle(
    fontSize: 32,
    height: 1.25, // 40/32
    fontWeight: FontWeight.w700,
    fontFamily: fontDisplay,
  );

  /// H1 - Títulos principales
  /// 28px / 36px, Bold 700
  static const TextStyle h1 = TextStyle(
    fontSize: 28,
    height: 1.286, // 36/28
    fontWeight: FontWeight.w700,
    fontFamily: fontPrimary,
  );

  /// H2 - Subtítulos
  /// 24px / 32px, SemiBold 600
  static const TextStyle h2 = TextStyle(
    fontSize: 24,
    height: 1.333, // 32/24
    fontWeight: FontWeight.w600,
    fontFamily: fontPrimary,
  );

  /// H3 - Secciones
  /// 20px / 28px, SemiBold 600
  static const TextStyle h3 = TextStyle(
    fontSize: 20,
    height: 1.4, // 28/20
    fontWeight: FontWeight.w600,
    fontFamily: fontPrimary,
  );

  /// Body Large - Texto destacado
  /// 18px / 26px, Regular 400
  static const TextStyle bodyLarge = TextStyle(
    fontSize: 18,
    height: 1.444, // 26/18
    fontWeight: FontWeight.w400,
    fontFamily: fontPrimary,
  );

  /// Body - Texto estándar
  /// 16px / 24px, Regular 400
  static const TextStyle body = TextStyle(
    fontSize: 16,
    height: 1.5, // 24/16
    fontWeight: FontWeight.w400,
    fontFamily: fontPrimary,
  );

  /// Body Small - Texto secundario
  /// 14px / 20px, Regular 400
  static const TextStyle bodySmall = TextStyle(
    fontSize: 14,
    height: 1.429, // 20/14
    fontWeight: FontWeight.w400,
    fontFamily: fontPrimary,
  );

  /// Caption - Texto pequeño
  /// 12px / 16px, Regular 400
  static const TextStyle caption = TextStyle(
    fontSize: 12,
    height: 1.333, // 16/12
    fontWeight: FontWeight.w400,
    fontFamily: fontPrimary,
  );

  /// Label - Etiquetas, botones
  /// 14px / 20px, SemiBold 600
  static const TextStyle label = TextStyle(
    fontSize: 14,
    height: 1.429, // 20/14
    fontWeight: FontWeight.w600,
    fontFamily: fontPrimary,
  );

  /// Button - Texto en botones
  /// 16px / 24px, SemiBold 600
  static const TextStyle button = TextStyle(
    fontSize: 16,
    height: 1.5, // 24/16
    fontWeight: FontWeight.w600,
    fontFamily: fontPrimary,
  );

  // ============================================
  // Helpers para variantes de color
  // ============================================
  
  /// Aplicar color a un estilo de texto
  static TextStyle withColor(TextStyle style, Color color) {
    return style.copyWith(color: color);
  }

  /// Aplicar opacidad a un estilo de texto
  static TextStyle withOpacity(TextStyle style, double opacity) {
    return style.copyWith(
      color: style.color?.withOpacity(opacity),
    );
  }
}

