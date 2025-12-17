import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// Dialog Box personalizado siguiendo Material 3 y Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=2134-781
class AppDialogBox extends StatelessWidget {
  final String? title;
  final Widget? content;
  final bool showHeader;
  final bool showFooter;
  final bool showCloseIcon;
  final String? cancelText;
  final String? confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final VoidCallback? onClose;
  final double? width;
  final double? height;

  const AppDialogBox({
    super.key,
    this.title,
    this.content,
    this.showHeader = true,
    this.showFooter = true,
    this.showCloseIcon = true,
    this.cancelText = 'Cancel',
    this.confirmText = 'OK',
    this.onCancel,
    this.onConfirm,
    this.onClose,
    this.width = 417,
    this.height,
  });

  /// Constructor para dialog simple (solo contenido)
  const AppDialogBox.simple({
    super.key,
    required Widget this.content,
    this.width = 417,
    this.height,
  })  : title = null,
        showHeader = false,
        showFooter = false,
        showCloseIcon = false,
        cancelText = null,
        confirmText = null,
        onCancel = null,
        onConfirm = null,
        onClose = null;

  /// Constructor para dialog de confirmación
  const AppDialogBox.confirm({
    super.key,
    required String this.title,
    required Widget this.content,
    this.cancelText = 'Cancel',
    this.confirmText = 'OK',
    this.onCancel,
    this.onConfirm,
    this.onClose,
    this.width = 417,
    this.height,
  })  : showHeader = true,
        showFooter = true,
        showCloseIcon = true;

  /// Constructor para dialog de alerta (solo botón OK)
  const AppDialogBox.alert({
    super.key,
    required String this.title,
    required Widget this.content,
    this.confirmText = 'OK',
    this.onConfirm,
    this.onClose,
    this.width = 417,
    this.height,
  })  : showHeader = true,
        showFooter = true,
        showCloseIcon = true,
        cancelText = null,
        onCancel = null;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: BorderRadius.circular(36), // 7xl
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showHeader) _buildHeader(),
          Flexible(child: _buildContent()),
          if (showFooter) _buildFooter(),
        ],
      ),
    );
  }

  /// Header Section
  /// Title: Roboto Regular 24px
  /// Close icon: 24px
  /// Background: Surface3 (#EEF4E8)
  /// Padding: 24px horizontal, 24px top, 16px bottom
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 16),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(36),
          topRight: Radius.circular(36),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              title ?? 'Dialog title',
              style: GoogleFonts.roboto(
                fontSize: 24,
                fontWeight: FontWeight.w400, // Regular
                height: 32 / 24,
                color: AppColors.onSurface,
              ),
            ),
          ),
          if (showCloseIcon)
            GestureDetector(
              onTap: onClose,
              child: Container(
                width: 32,
                height: 32,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                ),
                child: Icon(
                  Icons.close,
                  size: 24,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
        ],
      ),
    );
  }

  /// Content Area
  /// Área flexible para contenido personalizado
  Widget _buildContent() {
    return Container(
      width: double.infinity,
      color: AppColors.secondaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: content ?? const SizedBox.shrink(),
    );
  }

  /// Footer Section
  /// Botones: Cancel (outline) + OK (primary)
  /// Gap entre botones: 12px
  /// Padding: 24px
  /// Height: 88px
  Widget _buildFooter() {
    return Container(
      height: 88,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(36),
          bottomRight: Radius.circular(36),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (cancelText != null) ...[
            // Cancel button (outline/text)
            TextButton(
              onPressed: onCancel,
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                minimumSize: const Size(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: Text(
                cancelText!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500, // Medium
                  height: 20 / 14,
                  letterSpacing: 0.014,
                  color: AppColors.primary,
                ),
              ),
            ),
            const SizedBox(width: 12),
          ],
          // OK/Confirm button (primary)
          if (confirmText != null)
            ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                minimumSize: const Size(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                elevation: 0,
              ),
              child: Text(
                confirmText!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w500, // Medium
                  height: 20 / 14,
                  letterSpacing: 0.014,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Función helper para mostrar el dialog
Future<T?> showAppDialog<T>({
  required BuildContext context,
  required String title,
  required Widget content,
  bool showCloseIcon = true,
  String? cancelText = 'Cancel',
  String? confirmText = 'OK',
  VoidCallback? onCancel,
  VoidCallback? onConfirm,
  bool barrierDismissible = true,
}) {
  return showDialog<T>(
    context: context,
    barrierDismissible: barrierDismissible,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: AppDialogBox(
        title: title,
        content: content,
        showCloseIcon: showCloseIcon,
        cancelText: cancelText,
        confirmText: confirmText,
        onCancel: onCancel ?? () => Navigator.of(context).pop(),
        onConfirm: onConfirm ?? () => Navigator.of(context).pop(true),
        onClose: () => Navigator.of(context).pop(),
      ),
    ),
  );
}

/// Función helper para mostrar alert dialog
Future<void> showAppAlert({
  required BuildContext context,
  required String title,
  required String message,
  String confirmText = 'OK',
  VoidCallback? onConfirm,
}) {
  return showDialog(
    context: context,
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent,
      child: AppDialogBox.alert(
        title: title,
        content: Text(
          message,
          style: GoogleFonts.roboto(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            height: 20 / 14,
            color: AppColors.onSurface,
          ),
        ),
        confirmText: confirmText,
        onConfirm: onConfirm ?? () => Navigator.of(context).pop(),
        onClose: () => Navigator.of(context).pop(),
      ),
    ),
  );
}
