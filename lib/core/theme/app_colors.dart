import 'package:flutter/material.dart';

/// Design tokens de colores para Graffiti Trails
/// ✅ SINCRONIZADO con Syncfusion Flutter UI Kit - Material 3 Theme (Figma)
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-
class AppColors {
  AppColors._();

  // ============================================
  // Colores Primarios (desde Figma)
  // ============================================
  
  /// Verde principal - CTA principal (desde Figma: primary)
  static const Color primary = Color(0xFF6BA034);
  
  /// Primary Container (desde Figma: primaryContainer)
  static const Color primaryContainer = Color(0xFFECFFDD);
  
  /// On Primary (desde Figma: onPrimary)
  static const Color onPrimary = Color(0xFFFFFFFF);
  
  /// On Primary Container (desde Figma: onPrimaryContainer)
  static const Color onPrimaryContainer = Color(0xFF79F500);
  
  /// Primary Fixed Dim (desde Figma: primaryFixedDim)
  static const Color primaryFixedDim = Color(0xFFE8FFBC);
  
  // Alias para compatibilidad con código existente
  static const Color primary500 = primary;
  static const Color primary600 = Color(0xFF5A8A2A); // variante más oscura
  static const Color primary400 = Color(0xFF85B84D); // variante más clara

  // ============================================
  // Colores Secundarios (desde Figma)
  // ============================================
  
  /// Verde oscuro secundario (desde Figma: secondary)
  static const Color secondary = Color(0xFF66715B);
  
  /// On Secondary (desde Figma: onSecondary)
  static const Color onSecondary = Color(0xFFFFFFFF);
  
  /// Secondary Container (desde Figma: secondaryContainer)
  static const Color secondaryContainer = Color(0xFFE8F8DE);
  
  /// On Secondary Container (desde Figma: onSecondaryContainer)
  static const Color onSecondaryContainer = Color(0xFF1F2B19);
  
  // Alias para compatibilidad con código existente
  static const Color secondary500 = secondary;
  static const Color secondary600 = Color(0xFF4F5947); // variante más oscura
  static const Color secondary400 = Color(0xFF7F8A74); // variante más clara

  // ============================================
  // Colores Terciarios (desde Figma)
  // ============================================
  
  /// Terciario (desde Figma: tertiary)
  static const Color tertiary = Color(0xFF5D7D52);

  // ============================================
  // Colores Adicionales del Sistema (desde Figma)
  // ============================================
  
  /// Gray / Secondary Color (desde Figma: Gray (Secondary Color))
  static const Color graySecondary = Color(0xFF253341);
  
  /// Black color (desde Figma: Black-color)
  static const Color blackColor = Color(0xFF1D1617);
  
  /// Gray 1 (desde Figma: gray-1)
  static const Color gray1 = Color(0xFF7B6F72);
  
  /// Dark (desde Figma: Dark)
  static const Color dark = Color(0xFF15202B);
  
  /// White (desde Figma: White)
  static const Color white = Color(0xFFF5F8FA);

  // ============================================
  // Colores de Acento (Custom para categorías)
  // ============================================
  
  /// Links, información
  static const Color accentBlue = Color(0xFF4A90E2);
  
  /// Categorías especiales
  static const Color accentPurple = Color(0xFF9B59B6);
  
  /// Éxito, confirmación
  static const Color accentGreen = Color(0xFF27AE60);

  // ============================================
  // Colores de Categorías (Custom)
  // ============================================
  
  /// Rojo - Grafitis
  static const Color categoryGraffiti = Color(0xFFE74C3C);
  
  /// Azul - Murales
  static const Color categoryMural = Color(0xFF3498DB);
  
  /// Naranja - Esculturas
  static const Color categoryEscultura = Color(0xFFF39C12);
  
  /// Morado - Performances
  static const Color categoryPerformance = Color(0xFF9B59B6);
  
  /// Mapa de colores por categoría
  static const Map<String, Color> categoryColors = {
    'graffiti': categoryGraffiti,
    'mural': categoryMural,
    'escultura': categoryEscultura,
    'performance': categoryPerformance,
  };
  
  /// Obtener color por nombre de categoría
  static Color getCategoryColor(String category) {
    return categoryColors[category.toLowerCase()] ?? primary;
  }

  // ============================================
  // Colores Neutros
  // ============================================
  
  /// Fondo claro
  static const Color neutral50 = Color(0xFFFAFAFA);
  static const Color neutral100 = Color(0xFFF5F5F5);
  static const Color neutral200 = Color(0xFFEEEEEE);
  static const Color neutral300 = Color(0xFFE0E0E0);
  static const Color neutral400 = Color(0xFFBDBDBD);
  static const Color neutral500 = Color(0xFF9E9E9E);
  static const Color neutral600 = Color(0xFF757575);
  static const Color neutral700 = Color(0xFF616161);
  static const Color neutral800 = Color(0xFF424242);
  static const Color neutral900 = Color(0xFF212121);

  // ============================================
  // Estados
  // ============================================
  
  static const Color success = Color(0xFF27AE60);
  static const Color warning = Color(0xFFF39C12);
  static const Color error = Color(0xFFE74C3C);
  static const Color info = Color(0xFF3498DB);

  // ============================================
  // Fondos
  // ============================================
  
  /// Fondo principal (usando White de Figma)
  static const Color bgPrimary = white;
  
  /// Fondo secundario (usando Secondary Container)
  static const Color bgSecondary = secondaryContainer;
  
  /// Fondo oscuro (usando Dark de Figma)
  static const Color bgDark = dark;
  
  /// Overlay para modales (con opacidad)
  static const Color bgOverlay = Color(0x99000000); // rgba(0, 0, 0, 0.6)

  // ============================================
  // Bordes
  // ============================================
  
  /// Border color
  static const Color borderColor = Color(0xFFCAC4D0);
  
  /// Border color dark (usando gray1)
  static const Color borderColorDark = gray1;
  
  // ============================================
  // Surface variants (desde Figma variables anteriores)
  // ============================================
  
  /// Surface
  static const Color surface = Color(0xFFFEF7FF);
  
  /// Surface 1
  static const Color surface1 = Color(0xFFF7F2FB);
  
  /// Surface 2
  static const Color surface2 = Color(0xFFF3EDF7);
  
  /// Surface 5
  static const Color surface5 = Color(0xFFE4ECE0);
  
  /// On Surface (usando Black-color de Figma)
  static const Color onSurface = blackColor;
  
  /// On Surface Variant (desde Figma: onSurfaceVariant)
  static const Color onSurfaceVariant = Color(0xFF4A4F45);
  
  /// Outline Variant
  static const Color outlineVariant = Color(0xFFCAC4D0);
  
  /// Transparent
  static const Color transparent = Color(0x00000000);
}
