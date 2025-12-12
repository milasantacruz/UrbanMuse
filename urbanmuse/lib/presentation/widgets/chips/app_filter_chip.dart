import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// AppFilterChip
/// 
/// Chip de filtro siguiendo Material 3 y sincronizado con Figma.
/// Usado para seleccionar múltiples opciones de un grupo.
/// 
/// **Características:**
/// - Altura: 32px
/// - Border radius: 8px
/// - Font: Roboto Medium 14px
/// - Estados: Normal, Selected, Disabled
/// - Iconos opcionales: prefix y suffix (close al seleccionar)
/// 
/// **Referencia Figma:**
/// https://www.figma.com/design/.../node-id=2064-501
class AppFilterChip extends StatelessWidget {
  final String label;
  final bool isSelected;
  final ValueChanged<bool>? onSelected;
  final Widget? avatar;
  final bool showCheckmark;
  final bool enabled;
  final Color? selectedColor;
  final Color? backgroundColor;
  final Color? textColor;
  final VoidCallback? onDeleted;

  const AppFilterChip({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
    this.avatar,
    this.showCheckmark = false,
    this.enabled = true,
    this.selectedColor,
    this.backgroundColor,
    this.textColor,
    this.onDeleted,
  });

  /// Constructor para chip de categoría
  const AppFilterChip.category({
    super.key,
    required this.label,
    this.isSelected = false,
    this.onSelected,
    this.avatar,
    this.showCheckmark = false,
    this.enabled = true,
    this.onDeleted,
  })  : selectedColor = null,
        backgroundColor = null,
        textColor = null;

  @override
  Widget build(BuildContext context) {
    // Colores según estado (desde Figma)
    final Color chipBackgroundColor;
    final Color chipBorderColor;
    final Color chipTextColor;

    if (!enabled) {
      // Disabled state
      chipBackgroundColor = backgroundColor ?? 
        const Color(0x1F49454F); // rgba(73,69,79,0.12)
      chipBorderColor = const Color(0x1F49454F);
      chipTextColor = const Color(0x611D1B20); // rgba(29,27,32,0.38)
    } else if (isSelected) {
      // Checked/Selected state
      chipBackgroundColor = selectedColor ?? 
        AppColors.primaryContainer; // #ECFFDD para mejor contraste sobre secondaryContainer
      chipBorderColor = selectedColor ?? 
        AppColors.primaryContainer;
      chipTextColor = textColor ?? AppColors.onSurface; // #1d1b20
    } else {
      // Normal state
      chipBackgroundColor = backgroundColor ?? 
        AppColors.surface1; // #f7f2fb desde Figma
      chipBorderColor = AppColors.onSurfaceVariant; // #79747e desde Figma
      chipTextColor = textColor ?? 
        const Color(0xFF49454F); // Chip inactive foreground
    }

    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: enabled ? onSelected : null,
      avatar: avatar,
      showCheckmark: showCheckmark,
      deleteIcon: onDeleted != null && isSelected
          ? Icon(
              Icons.close,
              size: 14, // 14px según Figma para right icon
              color: chipTextColor,
            )
          : null,
      onDeleted: enabled && onDeleted != null && isSelected ? onDeleted : null,
      labelStyle: GoogleFonts.roboto(
        fontSize: 14,
        fontWeight: FontWeight.w500, // Medium
        height: 20 / 14, // line-height 20px
        letterSpacing: 0.014,
        color: chipTextColor,
      ),
      backgroundColor: chipBackgroundColor,
      selectedColor: chipBackgroundColor,
      disabledColor: chipBackgroundColor,
      side: BorderSide(
        color: chipBorderColor,
        width: 1,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8), // 8px según Figma
      ),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      labelPadding: const EdgeInsets.symmetric(horizontal: 5, vertical: 0),
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      visualDensity: const VisualDensity(horizontal: 0, vertical: -2),
    );
  }
}

/// AppFilterChipGroup
/// 
/// Grupo de chips de filtro con scroll horizontal.
/// Útil para mostrar múltiples opciones de filtrado.
class AppFilterChipGroup extends StatefulWidget {
  final List<String> labels;
  final List<String> selectedLabels;
  final ValueChanged<List<String>>? onSelectionChanged;
  final bool multiSelect;
  final EdgeInsets? padding;
  final double spacing;
  final Color? selectedColor;
  final Widget? Function(String label)? avatarBuilder;

  const AppFilterChipGroup({
    super.key,
    required this.labels,
    this.selectedLabels = const [],
    this.onSelectionChanged,
    this.multiSelect = true,
    this.padding,
    this.spacing = 8,
    this.selectedColor,
    this.avatarBuilder,
  });

  /// Constructor para chips de categorías de obras
  const AppFilterChipGroup.categories({
    super.key,
    this.selectedLabels = const [],
    this.onSelectionChanged,
    this.multiSelect = true,
    this.padding,
    this.spacing = 8,
    this.selectedColor,
  })  : labels = const ['Graffiti', 'Mural', 'Escultura', 'Performance'],
        avatarBuilder = null;

  @override
  State<AppFilterChipGroup> createState() => _AppFilterChipGroupState();
}

class _AppFilterChipGroupState extends State<AppFilterChipGroup> {
  late List<String> _selectedLabels;

  @override
  void initState() {
    super.initState();
    _selectedLabels = List.from(widget.selectedLabels);
  }

  @override
  void didUpdateWidget(AppFilterChipGroup oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedLabels != oldWidget.selectedLabels) {
      _selectedLabels = List.from(widget.selectedLabels);
    }
  }

  void _onChipSelected(String label, bool selected) {
    setState(() {
      if (widget.multiSelect) {
        if (selected) {
          _selectedLabels.add(label);
        } else {
          _selectedLabels.remove(label);
        }
      } else {
        // Single select mode
        _selectedLabels = selected ? [label] : [];
      }
    });

    widget.onSelectionChanged?.call(_selectedLabels);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: widget.padding ?? EdgeInsets.symmetric(horizontal: AppSpacing.space4),
      child: Wrap(
        spacing: widget.spacing,
        runSpacing: widget.spacing,
        children: widget.labels.map((label) {
          final isSelected = _selectedLabels.contains(label);
          return AppFilterChip(
            label: label,
            isSelected: isSelected,
            onSelected: (selected) => _onChipSelected(label, selected),
            selectedColor: widget.selectedColor,
            avatar: widget.avatarBuilder?.call(label),
          );
        }).toList(),
      ),
    );
  }
}

/// AppCategoryFilterChipGroup
/// 
/// Grupo especializado de chips para filtrar por categorías de obras.
/// Incluye iconos de categoría con colores específicos.
class AppCategoryFilterChipGroup extends StatelessWidget {
  final List<String> selectedCategories;
  final ValueChanged<List<String>>? onSelectionChanged;
  final EdgeInsets? padding;

  const AppCategoryFilterChipGroup({
    super.key,
    this.selectedCategories = const [],
    this.onSelectionChanged,
    this.padding,
  });

  Widget? _buildCategoryAvatar(String category) {
    Color? categoryColor;
    
    switch (category.toLowerCase()) {
      case 'graffiti':
        categoryColor = AppColors.categoryGraffiti;
        break;
      case 'mural':
        categoryColor = AppColors.categoryMural;
        break;
      case 'escultura':
        categoryColor = AppColors.categoryEscultura;
        break;
      case 'performance':
        categoryColor = AppColors.categoryPerformance;
        break;
    }

    if (categoryColor != null) {
      return Container(
        width: 8,
        height: 8,
        margin: const EdgeInsets.only(left: 6),
        decoration: BoxDecoration(
          color: categoryColor,
          shape: BoxShape.circle,
        ),
      );
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return AppFilterChipGroup(
      labels: const ['Graffiti', 'Mural', 'Escultura', 'Performance'],
      selectedLabels: selectedCategories,
      onSelectionChanged: onSelectionChanged,
      multiSelect: true,
      padding: padding,
      avatarBuilder: _buildCategoryAvatar,
    );
  }
}

