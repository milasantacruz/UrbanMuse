import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'app_colors.dart';
import 'app_text_styles.dart';
import 'app_border_radius.dart';

/// Tema principal de la aplicación Graffiti Trails
/// ✅ SINCRONIZADO con Syncfusion Flutter UI Kit - Material 3 Theme (Figma)
/// Integra flex_color_scheme con nuestros design tokens desde Figma
class AppTheme {
  AppTheme._();

  // ============================================
  // Configuración de FlexColorScheme
  // ============================================
  
  /// ColorScheme para Light Mode (✅ SINCRONIZADO con Figma variables)
  static const ColorScheme lightColorScheme = ColorScheme.light(
    // Primary colors (desde Figma)
    primary: AppColors.primary, // #6BA034
    onPrimary: AppColors.onPrimary, // #FFFFFF
    primaryContainer: AppColors.primaryContainer, // #ECFFDD
    onPrimaryContainer: AppColors.onPrimaryContainer, // #79F500
    
    // Secondary colors (desde Figma)
    secondary: AppColors.secondary, // #66715B
    onSecondary: AppColors.onSecondary, // #FFFFFF
    secondaryContainer: AppColors.secondaryContainer, // #E8F8DE
    onSecondaryContainer: AppColors.onSecondaryContainer, // #1F2B19
    
    // Tertiary (desde Figma)
    tertiary: AppColors.tertiary, // #5D7D52
    onTertiary: Colors.white,
    
    // Error
    error: AppColors.error,
    onError: Colors.white,
    errorContainer: const Color(0x1AE74C3C), // AppColors.error.withOpacity(0.1)
    onErrorContainer: AppColors.error,
    
    // Surface (desde Figma)
    surface: AppColors.surface,
    onSurface: AppColors.onSurface,
    surfaceContainerHighest: AppColors.surface2,
    surfaceContainerHigh: AppColors.surface1,
    surfaceContainer: AppColors.bgSecondary,
    surfaceContainerLow: AppColors.surface1,
    surfaceContainerLowest: AppColors.bgPrimary,
    onSurfaceVariant: AppColors.onSurfaceVariant,
    
    // Outline (desde Figma)
    outline: AppColors.borderColor,
    outlineVariant: AppColors.neutral300,
    
    // Inverse
    inverseSurface: AppColors.bgDark,
    onInverseSurface: Colors.white,
    
    // Shadow
    shadow: Colors.black,
    scrim: const Color(0x99000000), // rgba(0, 0, 0, 0.6) - AppColors.bgOverlay
  );

  /// ColorScheme para Dark Mode (basado en Figma variables)
  static const ColorScheme darkColorScheme = ColorScheme.dark(
    // Primary colors (variantes más claras para dark mode)
    primary: AppColors.primaryFixedDim, // #E8FFBC
    onPrimary: AppColors.primary, // #6BA034
    primaryContainer: AppColors.primary600, // más oscuro
    onPrimaryContainer: AppColors.primaryContainer, // #ECFFDD
    
    // Secondary colors (variantes para dark mode)
    secondary: AppColors.secondary400, // más claro
    onSecondary: AppColors.onSecondaryContainer, // #1F2B19
    secondaryContainer: AppColors.secondary600, // más oscuro
    onSecondaryContainer: AppColors.secondaryContainer, // #E8F8DE
    
    // Tertiary (desde Figma)
    tertiary: AppColors.tertiary, // #5D7D52
    onTertiary: Colors.white,
    
    // Error
    error: AppColors.error,
    onError: Colors.white,
    errorContainer: const Color(0x33E74C3C), // AppColors.error.withOpacity(0.2)
    onErrorContainer: AppColors.error,
    
    // Surface
    surface: AppColors.bgDark,
    onSurface: AppColors.neutral100,
    surfaceContainerHighest: AppColors.neutral800,
    surfaceContainerHigh: AppColors.neutral700,
    surfaceContainer: AppColors.secondary600,
    surfaceContainerLow: AppColors.neutral800,
    surfaceContainerLowest: AppColors.bgDark,
    onSurfaceVariant: AppColors.neutral300,
    
    // Outline
    outline: AppColors.borderColorDark,
    outlineVariant: AppColors.neutral600,
    
    // Inverse
    inverseSurface: AppColors.bgPrimary,
    onInverseSurface: AppColors.neutral900,
    
    // Shadow
    shadow: Colors.black,
    scrim: const Color(0x99000000), // rgba(0, 0, 0, 0.6) - AppColors.bgOverlay
  );

  // ============================================
  // ThemeData para Light Mode
  // ============================================
  
  static ThemeData get lightTheme {
    return FlexThemeData.light(
      scheme: FlexScheme.custom,
      colorScheme: lightColorScheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 7,
      subThemesData: const FlexSubThemesData(
        // AppBar
        appBarBackgroundSchemeColor: SchemeColor.surface,
        
        // Card
        cardElevation: 2,
        cardRadius: AppBorderRadius.radiusLg,
        
        // Button
        elevatedButtonRadius: AppBorderRadius.radiusMd,
        elevatedButtonElevation: 1,
        filledButtonRadius: AppBorderRadius.radiusMd,
        outlinedButtonRadius: AppBorderRadius.radiusMd,
        textButtonRadius: AppBorderRadius.radiusMd,
        
        // Input
        inputDecoratorRadius: AppBorderRadius.radiusMd,
        inputDecoratorBorderWidth: 1,
        inputDecoratorFocusedBorderWidth: 2,
        
        // Chip
        chipRadius: AppBorderRadius.radiusFull,
        
        // Bottom Sheet
        bottomSheetRadius: AppBorderRadius.radiusLg,
        bottomSheetElevation: 8,
        
        // Dialog
        dialogRadius: AppBorderRadius.radiusLg,
        dialogElevation: 8,
        
        // Navigation
        bottomNavigationBarElevation: 0,
        navigationBarElevation: 0,
        navigationRailElevation: 0,
      ),
      useMaterial3: true,
      // Aplicar nuestros text styles
      textTheme: _buildTextTheme(lightColorScheme),
    );
  }

  // ============================================
  // ThemeData para Dark Mode
  // ============================================
  
  static ThemeData get darkTheme {
    return FlexThemeData.dark(
      scheme: FlexScheme.custom,
      colorScheme: darkColorScheme,
      surfaceMode: FlexSurfaceMode.levelSurfacesLowScaffold,
      blendLevel: 13,
      subThemesData: const FlexSubThemesData(
        // AppBar
        appBarBackgroundSchemeColor: SchemeColor.surface,
        
        // Card
        cardElevation: 2,
        cardRadius: AppBorderRadius.radiusLg,
        
        // Button
        elevatedButtonRadius: AppBorderRadius.radiusMd,
        elevatedButtonElevation: 1,
        filledButtonRadius: AppBorderRadius.radiusMd,
        outlinedButtonRadius: AppBorderRadius.radiusMd,
        textButtonRadius: AppBorderRadius.radiusMd,
        
        // Input
        inputDecoratorRadius: AppBorderRadius.radiusMd,
        inputDecoratorBorderWidth: 1,
        inputDecoratorFocusedBorderWidth: 2,
        
        // Chip
        chipRadius: AppBorderRadius.radiusFull,
        
        // Bottom Sheet
        bottomSheetRadius: AppBorderRadius.radiusLg,
        bottomSheetElevation: 8,
        
        // Dialog
        dialogRadius: AppBorderRadius.radiusLg,
        dialogElevation: 8,
        
        // Navigation
        bottomNavigationBarElevation: 0,
        navigationBarElevation: 0,
        navigationRailElevation: 0,
      ),
      useMaterial3: true,
      // Aplicar nuestros text styles
      textTheme: _buildTextTheme(darkColorScheme),
    );
  }

  // ============================================
  // Construcción de TextTheme personalizado
  // ============================================
  
  static TextTheme _buildTextTheme(ColorScheme colorScheme) {
    return TextTheme(
      // Display
      displayLarge: AppTextStyles.display.copyWith(
        color: colorScheme.onSurface,
      ),
      displayMedium: AppTextStyles.h1.copyWith(
        color: colorScheme.onSurface,
      ),
      displaySmall: AppTextStyles.h2.copyWith(
        color: colorScheme.onSurface,
      ),
      
      // Headline
      headlineLarge: AppTextStyles.h1.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineMedium: AppTextStyles.h2.copyWith(
        color: colorScheme.onSurface,
      ),
      headlineSmall: AppTextStyles.h3.copyWith(
        color: colorScheme.onSurface,
      ),
      
      // Title
      titleLarge: AppTextStyles.h3.copyWith(
        color: colorScheme.onSurface,
      ),
      titleMedium: AppTextStyles.bodyLarge.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      titleSmall: AppTextStyles.body.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
      
      // Body
      bodyLarge: AppTextStyles.bodyLarge.copyWith(
        color: colorScheme.onSurface,
      ),
      bodyMedium: AppTextStyles.body.copyWith(
        color: colorScheme.onSurface,
      ),
      bodySmall: AppTextStyles.bodySmall.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
      
      // Label
      labelLarge: AppTextStyles.label.copyWith(
        color: colorScheme.onSurface,
      ),
      labelMedium: AppTextStyles.caption.copyWith(
        color: colorScheme.onSurfaceVariant,
        fontWeight: FontWeight.w500,
      ),
      labelSmall: AppTextStyles.caption.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    );
  }
}

