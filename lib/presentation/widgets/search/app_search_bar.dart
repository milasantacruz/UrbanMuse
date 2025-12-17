import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// Modos/Estilos del search bar según Material 3
enum AppSearchBarMode {
  filled, // Fondo con color
  outlined, // Solo borde
  flat, // Sin fondo ni borde
}

/// AppSearchBar
/// 
/// Barra de búsqueda siguiendo Material 3 y sincronizada con AppTextField.
/// Usa la misma estructura y estilos que los inputs estándar.
/// 
/// **Características:**
/// - Misma altura que inputs: 56px normal, 40px compact
/// - Iconos: Search (izquierda) y Clear X (derecha cuando hay texto)
/// - Modos: Filled, Outlined, Flat
/// - Border radius completamente redondeado
/// 
/// **Referencia Figma:**
/// https://www.figma.com/design/.../node-id=2034-360
class AppSearchBar extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool enabled;
  final bool readOnly;
  final AppSearchBarMode mode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;
  final VoidCallback? onTap;
  final bool isCompact;
  final bool autofocus;

  const AppSearchBar({
    super.key,
    this.hint,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.mode = AppSearchBarMode.outlined,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  });

  /// Constructor para search bar con modo filled
  const AppSearchBar.filled({
    super.key,
    this.hint,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  }) : mode = AppSearchBarMode.filled;

  /// Constructor para search bar con modo outlined
  const AppSearchBar.outlined({
    super.key,
    this.hint,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  }) : mode = AppSearchBarMode.outlined;

  /// Constructor para search bar con modo flat
  const AppSearchBar.flat({
    super.key,
    this.hint,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  }) : mode = AppSearchBarMode.flat;

  /// Constructor con placeholder de obras
  const AppSearchBar.obras({
    super.key,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.mode = AppSearchBarMode.outlined,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  }) : hint = 'Buscar obras de arte urbano...';

  /// Constructor con placeholder de artistas
  const AppSearchBar.artistas({
    super.key,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.mode = AppSearchBarMode.outlined,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  }) : hint = 'Buscar artistas...';

  /// Constructor con placeholder de rutas
  const AppSearchBar.rutas({
    super.key,
    this.controller,
    this.enabled = true,
    this.readOnly = false,
    this.mode = AppSearchBarMode.outlined,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
    this.onTap,
    this.isCompact = false,
    this.autofocus = false,
  }) : hint = 'Buscar rutas...';

  @override
  State<AppSearchBar> createState() => _AppSearchBarState();
}

class _AppSearchBarState extends State<AppSearchBar> {
  late TextEditingController _controller;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChanged);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    } else {
      _controller.removeListener(_onTextChanged);
    }
    super.dispose();
  }

  void _onTextChanged() {
    final hasText = _controller.text.isNotEmpty;
    if (hasText != _hasText) {
      setState(() => _hasText = hasText);
    }
    widget.onChanged?.call(_controller.text);
  }

  void _clearText() {
    _controller.clear();
    widget.onClear?.call();
    if (widget.onChanged != null) {
      widget.onChanged!('');
    }
  }

  @override
  Widget build(BuildContext context) {
    // Altura igual que AppTextField: 56px normal, 40px compact
    final height = widget.isCompact ? 40.0 : 56.0;
    final borderRadius = height / 2; // Completamente redondeado

    // Colores según modo (igual que AppTextField)
    Color fillColor;
    Color borderColor;
    Color focusedBorderColor;

    switch (widget.mode) {
      case AppSearchBarMode.filled:
        fillColor = AppColors.surface1; // Fondo con color
        borderColor = Colors.transparent;
        focusedBorderColor = AppColors.primary;
        break;
      case AppSearchBarMode.outlined:
        fillColor = Colors.transparent;
        borderColor = AppColors.outlineVariant;
        focusedBorderColor = AppColors.primary;
        break;
      case AppSearchBarMode.flat:
        fillColor = Colors.transparent;
        borderColor = Colors.transparent;
        focusedBorderColor = Colors.transparent;
        break;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: height,
          decoration: BoxDecoration(
            color: fillColor,
            border: Border.all(
              color: borderColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          child: TextField(
            controller: _controller,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            autofocus: widget.autofocus,
            style: GoogleFonts.roboto(
              fontSize: widget.isCompact ? 14 : 16,
              fontWeight: FontWeight.w400,
              color: widget.enabled ? AppColors.onSurface : AppColors.onSurfaceVariant,
              height: 24 / 16,
              letterSpacing: 0.5,
            ),
            decoration: InputDecoration(
              hintText: widget.hint ?? 'Buscar...',
              hintStyle: GoogleFonts.roboto(
                fontSize: widget.isCompact ? 14 : 16,
                fontWeight: FontWeight.w400,
                color: AppColors.onSurfaceVariant,
                height: 24 / 16,
                letterSpacing: 0.5,
              ),
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(borderRadius),
                borderSide: BorderSide(
                  color: focusedBorderColor,
                  width: 2,
                ),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: widget.isCompact ? 8 : 16,
              ),
              // Icono de búsqueda a la izquierda
              prefixIcon: Padding(
                padding: const EdgeInsets.only(left: 16, right: 8),
                child: Icon(
                  Icons.search,
                  size: widget.isCompact ? 20 : 24,
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: widget.isCompact ? 42 : 48,
                minHeight: widget.isCompact ? 20 : 24,
              ),
              // Icono X para limpiar (solo cuando hay texto)
              suffixIcon: _hasText
                  ? IconButton(
                      icon: Icon(
                        Icons.close,
                        size: widget.isCompact ? 20 : 24,
                        color: AppColors.onSurfaceVariant,
                      ),
                      onPressed: widget.enabled ? _clearText : null,
                      padding: const EdgeInsets.only(right: 16, left: 8),
                    )
                  : null,
              suffixIconConstraints: BoxConstraints(
                minWidth: widget.isCompact ? 42 : 48,
                minHeight: widget.isCompact ? 20 : 24,
              ),
            ),
            onSubmitted: widget.onSubmitted,
            onTap: widget.onTap,
          ),
        ),
      ],
    );
  }
}

/// AppSearchBarCompact
/// 
/// Versión compacta del search bar (40px de altura)
class AppSearchBarCompact extends StatelessWidget {
  final String? hint;
  final TextEditingController? controller;
  final bool enabled;
  final AppSearchBarMode mode;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onClear;

  const AppSearchBarCompact({
    super.key,
    this.hint,
    this.controller,
    this.enabled = true,
    this.mode = AppSearchBarMode.outlined,
    this.onChanged,
    this.onSubmitted,
    this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return AppSearchBar(
      hint: hint,
      controller: controller,
      enabled: enabled,
      mode: mode,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      onClear: onClear,
      isCompact: true,
    );
  }
}
