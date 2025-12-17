import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Container clickable personalizado siguiendo el diseño de Figma
/// Reemplazo para Container con InkWell o GestureDetector
class AppClickableContainer extends StatelessWidget {
  final Widget child;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Color? splashColor;
  final Color? highlightColor;
  final double? elevation;
  final BorderRadius? borderRadius;
  final Border? border;
  final List<BoxShadow>? boxShadow;
  final double? width;
  final double? height;
  final AlignmentGeometry? alignment;
  final BoxConstraints? constraints;

  const AppClickableContainer({
    super.key,
    required this.child,
    this.onTap,
    this.onLongPress,
    this.padding,
    this.margin,
    this.color,
    this.splashColor,
    this.highlightColor,
    this.elevation,
    this.borderRadius,
    this.border,
    this.boxShadow,
    this.width,
    this.height,
    this.alignment,
    this.constraints,
  });

  @override
  Widget build(BuildContext context) {
    // Colores por defecto
    final effectiveColor = color ?? Colors.transparent;
    final effectiveSplashColor = splashColor ?? 
        AppColors.primary.withOpacity(0.12);
    final effectiveHighlightColor = highlightColor ?? 
        AppColors.primary.withOpacity(0.08);
    
    // Border radius por defecto
    final effectiveBorderRadius = borderRadius ?? BorderRadius.circular(8);
    
    // Sombras si hay elevation
    final effectiveBoxShadow = boxShadow ??
        (elevation != null && elevation! > 0
            ? [
                BoxShadow(
                  color: const Color(0x4D000000), // rgba(0,0,0,0.3)
                  offset: Offset(0, elevation! / 2),
                  blurRadius: elevation!,
                  spreadRadius: 0,
                ),
              ]
            : null);

    // Si no hay callbacks, retornar un Container simple
    if (onTap == null && onLongPress == null) {
      return Container(
        width: width,
        height: height,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
          color: effectiveColor,
          borderRadius: effectiveBorderRadius,
          border: border,
          boxShadow: effectiveBoxShadow,
        ),
        alignment: alignment,
        constraints: constraints,
        child: child,
      );
    }

    // Container con gestos
    return Container(
      width: width,
      height: height,
      margin: margin,
      constraints: constraints,
      decoration: BoxDecoration(
        color: effectiveColor,
        borderRadius: effectiveBorderRadius,
        border: border,
        boxShadow: effectiveBoxShadow,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          borderRadius: effectiveBorderRadius,
          splashColor: effectiveSplashColor,
          highlightColor: effectiveHighlightColor,
          child: Container(
            padding: padding,
            alignment: alignment,
            child: child,
          ),
        ),
      ),
    );
  }
}
