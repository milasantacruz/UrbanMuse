import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// Tamaños predefinidos para el loader
enum LoaderSize {
  /// Pequeño - 24px
  small(24.0, 2.0),

  /// Mediano - 40px (default de Figma)
  medium(40.0, 4.0),

  /// Grande - 56px
  large(56.0, 6.0),

  /// Extra Grande - 72px
  xLarge(72.0, 8.0);

  const LoaderSize(this.size, this.strokeWidth);

  /// Tamaño del loader en píxeles
  final double size;

  /// Grosor del anillo
  final double strokeWidth;
}

/// AppLoader
/// 
/// Componente de carga circular (Circular Progress Indicator)
/// siguiendo las especificaciones de Material 3 y sincronizado
/// pixel a pixel con Figma.
/// 
/// **Características:**
/// - Tamaños: Small (24px), Medium (40px), Large (56px), XLarge (72px)
/// - Grosor: 2px, 4px, 6px, 8px
/// - Colores: Primary (verde), Secondary, Custom
/// - Estados: Indeterminate (animado), Determinate (con progreso)
/// 
/// **Referencia Figma:**
/// - [Progress Gradient Ring](https://www.figma.com/design/.../node-id=2033-201)
/// - [Progress Gradient](https://www.figma.com/design/.../node-id=2033-204)
class AppLoader extends StatelessWidget {
  final LoaderSize loaderSize;
  final Color? color;
  final double? strokeWidth;
  final double? value; // null = indeterminate, 0.0-1.0 = determinate
  final Color? backgroundColor;

  const AppLoader({
    super.key,
    this.loaderSize = LoaderSize.medium,
    this.color,
    this.strokeWidth,
    this.value,
    this.backgroundColor,
  });

  /// Constructor para loader pequeño
  const AppLoader.small({
    super.key,
    this.color,
    this.value,
    this.backgroundColor,
  })  : loaderSize = LoaderSize.small,
        strokeWidth = null;

  /// Constructor para loader mediano (default)
  const AppLoader.medium({
    super.key,
    this.color,
    this.value,
    this.backgroundColor,
  })  : loaderSize = LoaderSize.medium,
        strokeWidth = null;

  /// Constructor para loader grande
  const AppLoader.large({
    super.key,
    this.color,
    this.value,
    this.backgroundColor,
  })  : loaderSize = LoaderSize.large,
        strokeWidth = null;

  /// Constructor para loader extra grande
  const AppLoader.xLarge({
    super.key,
    this.color,
    this.value,
    this.backgroundColor,
  })  : loaderSize = LoaderSize.xLarge,
        strokeWidth = null;

  /// Constructor para loader con color primario (verde)
  const AppLoader.primary({
    super.key,
    this.loaderSize = LoaderSize.medium,
    this.strokeWidth,
    this.value,
    this.backgroundColor,
  }) : color = null; // Usará AppColors.primary en build

  /// Constructor para loader con color secundario
  const AppLoader.secondary({
    super.key,
    this.loaderSize = LoaderSize.medium,
    this.strokeWidth,
    this.value,
    this.backgroundColor,
  }) : color = null; // Usará AppColors.secondary en build

  @override
  Widget build(BuildContext context) {
    final effectiveColor = color ?? AppColors.primary;
    final effectiveStrokeWidth = strokeWidth ?? loaderSize.strokeWidth;

    return SizedBox(
      width: loaderSize.size,
      height: loaderSize.size,
      child: CircularProgressIndicator(
        value: value,
        strokeWidth: effectiveStrokeWidth,
        valueColor: AlwaysStoppedAnimation<Color>(effectiveColor),
        backgroundColor: backgroundColor,
      ),
    );
  }
}

/// AppLoaderOverlay
/// 
/// Loader con overlay de fondo, útil para pantallas de carga
/// completa o diálogos de carga.
class AppLoaderOverlay extends StatelessWidget {
  final LoaderSize loaderSize;
  final Color? loaderColor;
  final String? message;
  final Color overlayColor;
  final double overlayOpacity;

  const AppLoaderOverlay({
    super.key,
    this.loaderSize = LoaderSize.large,
    this.loaderColor,
    this.message,
    this.overlayColor = Colors.black,
    this.overlayOpacity = 0.5,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: overlayColor.withOpacity(overlayOpacity),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.all(AppSpacing.space6),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: AppBorderRadius.large,
                boxShadow: AppShadows.large,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppLoader(
                    loaderSize: loaderSize,
                    color: loaderColor ?? AppColors.primary,
                  ),
                  if (message != null) ...[
                    SizedBox(height: AppSpacing.space4),
                    Text(
                      message!,
                      style: AppTextStyles.body,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// AppLoaderButton
/// 
/// Loader pequeño para usar dentro de botones
class AppLoaderButton extends StatelessWidget {
  final Color? color;

  const AppLoaderButton({
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: CircularProgressIndicator(
        strokeWidth: 2.0,
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? Colors.white,
        ),
      ),
    );
  }
}

/// AppLinearLoader
/// 
/// Loader lineal para barras de progreso
class AppLinearLoader extends StatelessWidget {
  final double? value; // null = indeterminate, 0.0-1.0 = determinate
  final Color? color;
  final Color? backgroundColor;
  final double? height;

  const AppLinearLoader({
    super.key,
    this.value,
    this.color,
    this.backgroundColor,
    this.height,
  });

  /// Constructor para barra de progreso indeterminada
  const AppLinearLoader.indeterminate({
    super.key,
    this.color,
    this.backgroundColor,
    this.height,
  }) : value = null;

  /// Constructor para barra de progreso determinada
  const AppLinearLoader.determinate({
    super.key,
    required double progress,
    this.color,
    this.backgroundColor,
    this.height,
  }) : value = progress;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 4.0,
      child: LinearProgressIndicator(
        value: value,
        backgroundColor: backgroundColor ?? AppColors.onSurfaceVariant.withOpacity(0.2),
        valueColor: AlwaysStoppedAnimation<Color>(
          color ?? AppColors.primary,
        ),
      ),
    );
  }
}

