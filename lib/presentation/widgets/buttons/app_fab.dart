import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Floating Action Button personalizado siguiendo Material 3 y Figma
class AppFAB extends StatelessWidget {
  final VoidCallback? onPressed;
  final Widget icon;
  final String? label;
  final bool isExtended;
  final bool isLarge;

  const AppFAB({
    super.key,
    required this.onPressed,
    required this.icon,
    this.label,
    this.isExtended = false,
    this.isLarge = false,
  });

  /// Constructor para FAB normal (solo icono)
  const AppFAB.regular({
    super.key,
    required this.onPressed,
    required this.icon,
  })  : label = null,
        isExtended = false,
        isLarge = false;

  /// Constructor para FAB extendido (icono + texto)
  const AppFAB.extended({
    super.key,
    required this.onPressed,
    required this.icon,
    required String this.label,
  })  : isExtended = true,
        isLarge = false;

  /// Constructor para FAB grande
  const AppFAB.large({
    super.key,
    required this.onPressed,
    required this.icon,
  })  : label = null,
        isExtended = false,
        isLarge = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Colores según Figma: primaryContainer
    final backgroundColor = colorScheme.primaryContainer;
    final foregroundColor = colorScheme.onPrimaryContainer;

    if (isExtended && label != null) {
      return FloatingActionButton.extended(
        onPressed: onPressed,
        icon: icon,
        label: Text(
          label!,
          style: GoogleFonts.exo2(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            height: 20 / 14,
            letterSpacing: 0.1,
          ),
        ),
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16), // Material 3 standard
        ),
      );
    }

    if (isLarge) {
      return FloatingActionButton.large(
        onPressed: onPressed,
        backgroundColor: backgroundColor,
        foregroundColor: foregroundColor,
        elevation: 6,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(28), // Material 3 large FAB
        ),
        child: icon,
      );
    }

    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: backgroundColor,
      foregroundColor: foregroundColor,
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16), // Material 3 standard
      ),
      child: icon,
    );
  }
}

