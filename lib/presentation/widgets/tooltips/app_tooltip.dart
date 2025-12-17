import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// Tipos de tooltip según Figma
enum AppTooltipType {
  normal, // Tooltip simple
  withHeader, // Tooltip con header y close icon
}

/// Tooltip personalizado siguiendo Material 3 y Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3975-28867
class AppTooltip extends StatelessWidget {
  final AppTooltipType type;
  final String message;
  final String? header;
  final bool showCloseIcon;
  final VoidCallback? onClose;
  final double? width;

  const AppTooltip({
    super.key,
    this.type = AppTooltipType.normal,
    required this.message,
    this.header,
    this.showCloseIcon = false,
    this.onClose,
    this.width,
  });

  /// Constructor para tooltip normal (simple)
  const AppTooltip.normal({
    super.key,
    required this.message,
  })  : type = AppTooltipType.normal,
        header = null,
        showCloseIcon = false,
        onClose = null,
        width = null;

  /// Constructor para tooltip con header
  const AppTooltip.withHeader({
    super.key,
    required this.message,
    required String this.header,
    this.showCloseIcon = true,
    this.onClose,
    this.width = 181,
  }) : type = AppTooltipType.withHeader;

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case AppTooltipType.normal:
        return _buildNormalTooltip();
      case AppTooltipType.withHeader:
        return _buildHeaderTooltip();
    }
  }

  /// Tooltip tipo normal - Simple con texto
  /// Background: OnSurface (#1C1B1F)
  /// Text: OnInverseSurface (#F4EFF4)
  /// Border radius: 2px
  /// Padding: 3px vertical, 8px horizontal
  Widget _buildNormalTooltip() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.onSurface,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Text(
        message,
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: FontWeight.w400, // Regular
          height: 16 / 12,
          letterSpacing: 0.048,
          color: AppColors.white,
        ),
      ),
    );
  }

  /// Tooltip con header
  /// Background: OnSurface (#1C1B1F)
  /// Border radius: 4px
  /// Padding: 8px
  /// Width: 181px (default)
  Widget _buildHeaderTooltip() {
    return Container(
      width: width ?? 181,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.onSurface,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                header ?? '',
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Medium
                  height: 16 / 12,
                  letterSpacing: 0.06,
                  color: AppColors.white,
                ),
              ),
              if (showCloseIcon)
                GestureDetector(
                  onTap: onClose,
                  child: Icon(
                    Icons.close,
                    size: 12,
                    color: AppColors.white,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),
          // Body text
          Text(
            message,
            style: GoogleFonts.roboto(
              fontSize: 12,
              fontWeight: FontWeight.w400, // Regular
              height: 16 / 12,
              letterSpacing: 0.048,
              color: AppColors.white,
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget para mostrar tooltip al hacer hover/tap sobre un widget
class AppTooltipWrapper extends StatefulWidget {
  final Widget child;
  final String message;
  final String? header;
  final AppTooltipType type;
  final bool showOnTap;
  final bool showOnLongPress;

  const AppTooltipWrapper({
    super.key,
    required this.child,
    required this.message,
    this.header,
    this.type = AppTooltipType.normal,
    this.showOnTap = false,
    this.showOnLongPress = true,
  });

  @override
  State<AppTooltipWrapper> createState() => _AppTooltipWrapperState();
}

class _AppTooltipWrapperState extends State<AppTooltipWrapper> {
  OverlayEntry? _overlayEntry;

  void _showTooltip() {
    _hideTooltip();

    final renderBox = context.findRenderObject() as RenderBox;
    final position = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        left: position.dx,
        top: position.dy - 50,
        child: Material(
          color: Colors.transparent,
          child: widget.type == AppTooltipType.normal
              ? AppTooltip.normal(message: widget.message)
              : AppTooltip.withHeader(
                  message: widget.message,
                  header: widget.header ?? '',
                  showCloseIcon: true,
                  onClose: _hideTooltip,
                ),
        ),
      ),
    );

    Overlay.of(context).insert(_overlayEntry!);

    // Auto-hide para tooltip normal
    if (widget.type == AppTooltipType.normal) {
      Future.delayed(const Duration(seconds: 2), _hideTooltip);
    }
  }

  void _hideTooltip() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  void dispose() {
    _hideTooltip();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.showOnTap ? _showTooltip : null,
      onLongPress: widget.showOnLongPress ? _showTooltip : null,
      child: widget.child,
    );
  }
}
