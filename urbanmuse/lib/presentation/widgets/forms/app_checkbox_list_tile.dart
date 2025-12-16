import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/app_colors.dart';

/// CheckboxListTile personalizado siguiendo el diseño de Figma
/// Reemplazo para el widget nativo CheckboxListTile
class AppCheckboxListTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final bool value;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;
  final Widget? leading;
  final EdgeInsetsGeometry? contentPadding;
  final bool dense;
  final bool isThreeLine;

  const AppCheckboxListTile({
    super.key,
    required this.title,
    this.subtitle,
    required this.value,
    this.onChanged,
    this.enabled = true,
    this.leading,
    this.contentPadding,
    this.dense = false,
    this.isThreeLine = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDisabled = !enabled || onChanged == null;

    // Colores según estado
    final checkboxColor = isDisabled
        ? const Color(0x611C1B1F) // rgba(28,27,31,0.38) - disabled
        : (value
            ? AppColors.primary // #6BA034 cuando está checked
            : const Color(0xFF7A7E74)); // Color de borde cuando no está checked

    final titleColor = isDisabled
        ? const Color(0x611C1B1F) // rgba(28,27,31,0.38) - disabled
        : colorScheme.onSurface;

    final subtitleColor = isDisabled
        ? const Color(0x611C1B1F) // rgba(28,27,31,0.38) - disabled
        : colorScheme.onSurfaceVariant;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isDisabled ? null : () => onChanged?.call(!value),
        borderRadius: BorderRadius.circular(8),
        splashColor: AppColors.primary.withOpacity(0.12),
        highlightColor: AppColors.primary.withOpacity(0.08),
        child: Padding(
          padding: contentPadding ??
              EdgeInsets.symmetric(
                horizontal: 16,
                vertical: dense ? 8 : 12,
              ),
          child: Row(
            crossAxisAlignment: isThreeLine
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              // Leading widget (opcional)
              if (leading != null) ...[
                leading!,
                const SizedBox(width: 16),
              ],
              // Checkbox
              SizedBox(
                width: 40,
                height: 40,
                child: Center(
                  child: _buildCheckbox(checkboxColor, isDisabled),
                ),
              ),
              const SizedBox(width: 16),
              // Content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.exo2(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        height: 24 / 16,
                        letterSpacing: 0.15,
                        color: titleColor,
                      ),
                      maxLines: isThreeLine ? 3 : (subtitle != null ? 1 : 2),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (subtitle != null) ...[
                      const SizedBox(height: 4),
                      Text(
                        subtitle!,
                        style: GoogleFonts.exo2(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          height: 20 / 14,
                          letterSpacing: 0.25,
                          color: subtitleColor,
                        ),
                        maxLines: isThreeLine ? 2 : 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(Color color, bool isDisabled) {
    return Container(
      width: 20,
      height: 20,
      decoration: BoxDecoration(
        color: value && !isDisabled
            ? AppColors.primary
            : Colors.transparent,
        border: Border.all(
          color: color,
          width: 2,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: value && !isDisabled
          ? const Icon(
              Icons.check,
              size: 16,
              color: Colors.white,
            )
          : null,
    );
  }
}
