import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// Modos/Estilos de input según Material 3 y Figma
enum AppTextFieldMode {
  filled, // Fondo con color
  outlined, // Solo borde
  flat, // Sin fondo ni borde
}

/// Estado de validación del input
enum AppTextFieldValidation {
  none, // Sin validación
  success, // Validación exitosa (verde)
  error, // Error de validación (rojo)
}

/// Text Field personalizado siguiendo Material 3 y Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-
class AppTextField extends StatefulWidget {
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final bool obscureText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final AppTextFieldMode mode;
  final AppTextFieldValidation validation;
  final TextInputType keyboardType;
  final int? maxLines;
  final int? minLines;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onTap;
  final bool isRequired;
  final bool isCompact;

  const AppTextField({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.mode = AppTextFieldMode.filled,
    this.validation = AppTextFieldValidation.none,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.isRequired = false,
    this.isCompact = false,
  });

  /// Constructor para filled input
  const AppTextField.filled({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validation = AppTextFieldValidation.none,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.isRequired = false,
    this.isCompact = false,
  }) : mode = AppTextFieldMode.filled;

  /// Constructor para outlined input
  const AppTextField.outlined({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validation = AppTextFieldValidation.none,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.isRequired = false,
    this.isCompact = false,
  }) : mode = AppTextFieldMode.outlined;

  /// Constructor para flat input (sin fondo ni borde visible)
  const AppTextField.flat({
    super.key,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validation = AppTextFieldValidation.none,
    this.keyboardType = TextInputType.text,
    this.maxLines = 1,
    this.minLines,
    this.onChanged,
    this.onTap,
    this.isRequired = false,
    this.isCompact = false,
  }) : mode = AppTextFieldMode.flat;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _onFocusChange() {
    setState(() {
      _isFocused = _focusNode.hasFocus;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Determinar el estado efectivo
    final hasError = widget.errorText != null || widget.validation == AppTextFieldValidation.error;
    final isSuccess = widget.validation == AppTextFieldValidation.success;

    // Altura según tamaño
    final height = widget.isCompact ? 40.0 : 56.0;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Label superior opcional
        if (widget.label != null) ...[
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.label!,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20 / 14,
                  letterSpacing: 0.035,
                  color: widget.enabled
                      ? AppColors.onSurfaceVariant
                      : AppColors.onSurfaceVariant.withOpacity(0.38),
                ),
              ),
              if (widget.isRequired)
                Text(
                  '*',
                  style: GoogleFonts.roboto(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    height: 20 / 14,
                    letterSpacing: 0.035,
                    color: AppColors.error,
                  ),
                ),
            ],
          ),
          SizedBox(height: AppSpacing.space1),
        ],

        // Input Field
        Container(
          height: height,
          decoration: _buildDecoration(colorScheme, hasError, isSuccess),
          child: TextField(
            controller: widget.controller,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.obscureText,
            focusNode: _focusNode,
            keyboardType: widget.keyboardType,
            maxLines: widget.maxLines,
            minLines: widget.minLines,
            onChanged: widget.onChanged,
            onTap: widget.onTap,
            style: GoogleFonts.roboto(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              height: 24 / 16,
              letterSpacing: 0.024,
              color: widget.enabled
                  ? AppColors.onSurface
                  : AppColors.onSurfaceVariant.withOpacity(0.38),
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.roboto(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                height: 24 / 16,
                letterSpacing: 0.024,
                color: AppColors.onSurfaceVariant,
              ),
              prefixIcon: widget.prefixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(left: 16, right: 8),
                      child: widget.prefixIcon,
                    )
                  : null,
              prefixIconConstraints: widget.prefixIcon != null
                  ? const BoxConstraints(minWidth: 42, minHeight: 18)
                  : null,
              suffixIcon: widget.suffixIcon != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 16, left: 8),
                      child: widget.suffixIcon,
                    )
                  : null,
              suffixIconConstraints: widget.suffixIcon != null
                  ? const BoxConstraints(minWidth: 42, minHeight: 18)
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: widget.prefixIcon == null && widget.suffixIcon == null
                    ? 16
                    : 0,
                vertical: widget.isCompact ? 8 : 16,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              focusedErrorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
            ),
          ),
        ),

        // Helper Text o Error Text
        if (widget.helperText != null || widget.errorText != null) ...[
          SizedBox(height: AppSpacing.space1),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                if (hasError || isSuccess)
                  Padding(
                    padding: const EdgeInsets.only(right: 4),
                    child: Icon(
                      hasError ? Icons.error_outline : Icons.check_circle_outline,
                      size: 14,
                      color: hasError ? AppColors.error : AppColors.success,
                    ),
                  ),
                Expanded(
                  child: Text(
                    widget.errorText ?? widget.helperText ?? '',
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      height: 16 / 12,
                      letterSpacing: 0.048,
                      color: hasError
                          ? AppColors.error
                          : isSuccess
                              ? AppColors.success
                              : AppColors.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  BoxDecoration _buildDecoration(
    ColorScheme colorScheme,
    bool hasError,
    bool isSuccess,
  ) {
    // Determinar color de borde según el estado
    Color borderColor;
    if (!widget.enabled) {
      borderColor = AppColors.onSurfaceVariant.withOpacity(0.12);
    } else if (hasError) {
      borderColor = AppColors.error;
    } else if (isSuccess) {
      borderColor = AppColors.success;
    } else if (_isFocused) {
      borderColor = AppColors.primary;
    } else {
      borderColor = AppColors.borderColor;
    }

    // Configuración según el modo
    switch (widget.mode) {
      case AppTextFieldMode.filled:
        return BoxDecoration(
          color: widget.enabled
              ? const Color(0xFFE7E0EC) // surfaceVariant
              : const Color(0xFFF2F2F2), // Disabled background
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: _isFocused ? 2 : 1,
            ),
          ),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(4),
          ),
        );

      case AppTextFieldMode.outlined:
        return BoxDecoration(
          color: Colors.transparent,
          border: Border.all(
            color: borderColor,
            width: _isFocused ? 2 : 1,
          ),
          borderRadius: BorderRadius.circular(4),
        );

      case AppTextFieldMode.flat:
        return BoxDecoration(
          color: Colors.transparent,
          border: Border(
            bottom: BorderSide(
              color: borderColor,
              width: _isFocused ? 2 : 1,
            ),
          ),
        );
    }
  }
}

