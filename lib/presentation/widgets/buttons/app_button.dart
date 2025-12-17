import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Tipos de botón según Material 3 y Figma
enum AppButtonType {
  primary, // Filled button con primary color
  secondary, // Filled button con secondary color
}

/// Modos/Estilos de botón según Material 3 y Figma
enum AppButtonMode {
  filled, // Botón relleno (default)
  outlined, // Botón con borde
  text, // Botón de texto (flat)
}

/// Botón personalizado exacto de Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-
class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final AppButtonType type;
  final AppButtonMode mode;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final bool isLoading;
  final bool isExpanded;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.type = AppButtonType.primary,
    this.mode = AppButtonMode.filled,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    this.isExpanded = false,
  });

  /// Constructor para botón primario (filled)
  const AppButton.primary({
    super.key,
    required this.label,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    this.isExpanded = false,
  })  : type = AppButtonType.primary,
        mode = AppButtonMode.filled;

  /// Constructor para botón primario outlined
  const AppButton.primaryOutlined({
    super.key,
    required this.label,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    this.isExpanded = false,
  })  : type = AppButtonType.primary,
        mode = AppButtonMode.outlined;

  /// Constructor para botón de texto (flat)
  const AppButton.text({
    super.key,
    required this.label,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    this.isExpanded = false,
  })  : type = AppButtonType.primary,
        mode = AppButtonMode.text;

  /// Constructor para botón secundario
  const AppButton.secondary({
    super.key,
    required this.label,
    this.onPressed,
    this.leftIcon,
    this.rightIcon,
    this.isLoading = false,
    this.isExpanded = false,
  })  : type = AppButtonType.secondary,
        mode = AppButtonMode.filled;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDisabled = onPressed == null || isLoading;

    // Mostrar loading si está cargando
    final effectiveLeftIcon = isLoading
        ? const SizedBox(
            width: 18,
            height: 18,
            child: CircularProgressIndicator(
              strokeWidth: 2,
            ),
          )
        : leftIcon;

    // Build content with icons - Especificaciones exactas de Figma
    final List<Widget> contentChildren = [];
    
    if (effectiveLeftIcon != null) {
      contentChildren.add(effectiveLeftIcon);
      contentChildren.add(const SizedBox(width: 8));
    }
    
    // Label con padding de 8px horizontal (como en Figma)
    contentChildren.add(
      Flexible(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            label,
            style: GoogleFonts.exo2(
              fontSize: 14,
              fontWeight: FontWeight.w500, // Medium = 500
              height: 20 / 14, // line-height 20px
              letterSpacing: 0.1,
            ),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
    
    if (rightIcon != null) {
      contentChildren.add(const SizedBox(width: 8));
      contentChildren.add(rightIcon!);
    }

    final content = Row(
      mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: contentChildren,
    );

    // Construir según el modo
    switch (mode) {
      case AppButtonMode.filled:
        return _buildFilledButton(context, colorScheme, content, isDisabled);
      case AppButtonMode.outlined:
        return _buildOutlinedButton(context, colorScheme, content, isDisabled);
      case AppButtonMode.text:
        return _buildTextButton(context, colorScheme, content, isDisabled);
    }
  }

  Widget _buildFilledButton(
    BuildContext context,
    ColorScheme colorScheme,
    Widget content,
    bool isDisabled,
  ) {
    // Especificaciones exactas de Figma
    final backgroundColor = isDisabled
        ? const Color(0x1F1C1B1F) // rgba(28,27,31,0.12)
        : (type == AppButtonType.primary
            ? const Color(0xFF6BA034) // Primary from Figma
            : Colors.white); // Secondary from Figma

    final foregroundColor = isDisabled
        ? const Color(0x611C1B1F) // rgba(28,27,31,0.38)
        : (type == AppButtonType.primary
            ? Colors.white
            : const Color(0xFF1C1B1F));

    // Sombras exactas de Figma: ShadowDepth1
    final shadows = !isDisabled && type == AppButtonType.secondary
        ? [
            BoxShadow(
              color: const Color(0x4D000000), // rgba(0,0,0,0.3)
              offset: const Offset(0, 1),
              blurRadius: 2,
              spreadRadius: 0,
            ),
            BoxShadow(
              color: const Color(0x26000000), // rgba(0,0,0,0.15)
              offset: const Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 1,
            ),
          ]
        : null;

    return Container(
      width: isExpanded ? double.infinity : null,
      height: 40, // Altura exacta de Figma
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: backgroundColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40), // Border radius exacto de Figma
        boxShadow: shadows,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(40),
          splashColor: foregroundColor.withOpacity(0.12),
          highlightColor: foregroundColor.withOpacity(0.08),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16), // Padding exacto de Figma
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(color: foregroundColor),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildOutlinedButton(
    BuildContext context,
    ColorScheme colorScheme,
    Widget content,
    bool isDisabled,
  ) {
    // Especificaciones exactas de Figma
    final borderColor = isDisabled
        ? const Color(0x291C1B1F) // rgba(28,27,31,0.16)
        : const Color(0xFF7A7E74); // Border color from Figma

    final foregroundColor = isDisabled
        ? const Color(0x611C1B1F) // rgba(28,27,31,0.38)
        : const Color(0xFF6BA034); // Primary color from Figma

    final backgroundColor = isDisabled
        ? Colors.transparent
        : Colors.transparent;

    return Container(
      width: isExpanded ? double.infinity : null,
      height: 40, // Altura exacta de Figma
      decoration: BoxDecoration(
        color: backgroundColor,
        border: Border.all(
          color: borderColor,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(40),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(40),
          // Hover state from Figma: rgba(109,164,80,0.08)
          splashColor: const Color(0x146DA450),
          highlightColor: const Color(0x146DA450),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(color: foregroundColor),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextButton(
    BuildContext context,
    ColorScheme colorScheme,
    Widget content,
    bool isDisabled,
  ) {
    // Especificaciones exactas de Figma (Flat button)
    final foregroundColor = isDisabled
        ? const Color(0x611C1B1F) // rgba(28,27,31,0.38)
        : const Color(0xFF6BA034); // Primary color from Figma

    return Container(
      width: isExpanded ? double.infinity : null,
      height: 40, // Altura exacta de Figma
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: isDisabled ? null : onPressed,
          borderRadius: BorderRadius.circular(40),
          // Hover state from Figma: rgba(109,164,80,0.08)
          splashColor: const Color(0x146DA450),
          highlightColor: const Color(0x146DA450),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: DefaultTextStyle(
                style: TextStyle(color: foregroundColor),
                child: content,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
