import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens de tipografía para Graffiti Trails
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Fonts: Expletus Sans (Display/Headline/Title), Exo 2 (Label/Body)
class AppTextStyles {
  AppTextStyles._();

  // ============================================
  // Display Styles (Expletus Sans)
  // ============================================
  
  /// Display Large - Títulos hero extra grandes
  /// 57px / 64px, Bold 700, Letter spacing -0.25
  static TextStyle displayLarge = GoogleFonts.expletusSans(
    fontSize: 57,
    height: 64 / 57,
    fontWeight: FontWeight.w700,
    letterSpacing: -0.25,
  );

  /// Display Medium - Títulos hero grandes
  /// 45px / 52px, Bold 700
  static TextStyle displayMedium = GoogleFonts.expletusSans(
    fontSize: 45,
    height: 52 / 45,
    fontWeight: FontWeight.w700,
  );

  /// Display Small - Títulos hero
  /// 36px / 44px, Bold 700
  static TextStyle displaySmall = GoogleFonts.expletusSans(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w700,
  );

  /// Display - Alias para Display Small (compatibilidad)
  /// 36px / 44px, Bold 700
  static TextStyle display = GoogleFonts.expletusSans(
    fontSize: 36,
    height: 44 / 36,
    fontWeight: FontWeight.w700,
  );

  // ============================================
  // Headline Styles (Expletus Sans)
  // ============================================

  /// Headline Large
  /// 32px / 40px, SemiBold 600
  static TextStyle headlineLarge = GoogleFonts.expletusSans(
    fontSize: 32,
    height: 40 / 32,
    fontWeight: FontWeight.w600,
  );

  /// Headline Medium
  /// 28px / 36px, SemiBold 600
  static TextStyle headlineMedium = GoogleFonts.expletusSans(
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w600,
  );

  /// Headline Small
  /// 24px / 32px, SemiBold 600
  static TextStyle headlineSmall = GoogleFonts.expletusSans(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600,
  );

  /// H1 - Alias para Headline Medium (compatibilidad)
  /// 28px / 36px, SemiBold 600
  static TextStyle h1 = GoogleFonts.expletusSans(
    fontSize: 28,
    height: 36 / 28,
    fontWeight: FontWeight.w600,
  );

  /// H2 - Alias para Headline Small (compatibilidad)
  /// 24px / 32px, SemiBold 600
  static TextStyle h2 = GoogleFonts.expletusSans(
    fontSize: 24,
    height: 32 / 24,
    fontWeight: FontWeight.w600,
  );

  /// H3 - Basado en Title Large
  /// 22px / 28px, Bold 700
  static TextStyle h3 = GoogleFonts.expletusSans(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w700,
  );

  // ============================================
  // Title Styles (Expletus Sans)
  // ============================================

  /// Title Large
  /// 22px / 28px, Bold 700
  static TextStyle titleLarge = GoogleFonts.expletusSans(
    fontSize: 22,
    height: 28 / 22,
    fontWeight: FontWeight.w700,
  );

  /// Title Medium
  /// 16px / 24px, Medium 500, Letter spacing 0.15
  static TextStyle titleMedium = GoogleFonts.expletusSans(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.15,
  );

  /// Title Small
  /// 14px / 20px, Medium 500, Letter spacing 0.1
  static TextStyle titleSmall = GoogleFonts.expletusSans(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
  );

  // ============================================
  // Label Styles (Exo 2)
  // ============================================

  /// Label Large
  /// 14px / 20px, SemiBold 600, Letter spacing 0.1
  static TextStyle labelLarge = GoogleFonts.exo2(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  /// Label Medium
  /// 12px / 16px, SemiBold 600, Letter spacing 0.5
  static TextStyle labelMedium = GoogleFonts.exo2(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
  );

  /// Label Small
  /// 11px / 16px, Medium 500, Letter spacing 0.5
  static TextStyle labelSmall = GoogleFonts.exo2(
    fontSize: 11,
    height: 16 / 11,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.5,
  );

  /// Label - Alias para Label Large (compatibilidad)
  /// 14px / 20px, SemiBold 600
  static TextStyle label = GoogleFonts.exo2(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.1,
  );

  // ============================================
  // Body Styles (Exo 2)
  // ============================================

  /// Body Large
  /// 16px / 24px, Regular 400, Letter spacing 0.5
  static TextStyle bodyLarge = GoogleFonts.exo2(
    fontSize: 16,
    height: 24 / 16,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.5,
  );

  /// Body Medium
  /// 14px / 20px, Regular 400, Letter spacing 0.25
  static TextStyle bodyMedium = GoogleFonts.exo2(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  /// Body Small
  /// 12px / 16px, Regular 400
  static TextStyle bodySmall = GoogleFonts.exo2(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );

  /// Body - Alias para Body Medium (compatibilidad)
  /// 14px / 20px, Regular 400
  static TextStyle body = GoogleFonts.exo2(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w400,
    letterSpacing: 0.25,
  );

  /// Caption - Alias para Body Small (compatibilidad)
  /// 12px / 16px, Regular 400
  static TextStyle caption = GoogleFonts.exo2(
    fontSize: 12,
    height: 16 / 12,
    fontWeight: FontWeight.w400,
  );

  /// Button - Basado en Label Large
  /// 14px / 20px, Medium 500, Letter spacing 0.1
  static TextStyle button = GoogleFonts.exo2(
    fontSize: 14,
    height: 20 / 14,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.1,
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

