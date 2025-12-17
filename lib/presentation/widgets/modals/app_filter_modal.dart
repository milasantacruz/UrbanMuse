import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../chips/chips.dart';
import '../search/search.dart';
import '../dividers/dividers.dart';
import '../buttons/buttons.dart';

/// AppFilterModal
/// 
/// Modal de filtros en formato Bottom Sheet.
/// Permite filtrar por categorías y artistas.
/// 
/// **Características:**
/// - Handle bar (top)
/// - Título "Filtros" + Close button
/// - Sección: Categorías (Filter Chip Group)
/// - Sección: Artistas (Search bar + Lista con checkboxes)
/// - Dividers entre secciones
/// - Footer: "Limpiar" (text) + "Aplicar filtros" (primary)
/// - Height: 60-70% de pantalla
/// 
/// **Figma Reference:**
/// Basado en Syncfusion UI Kit Bottom Sheet
class AppFilterModal extends StatefulWidget {
  final List<String> selectedCategories;
  final List<String> selectedArtists;
  final List<String> availableArtists;
  final ValueChanged<List<String>>? onCategoriesChanged;
  final ValueChanged<List<String>>? onArtistsChanged;
  final VoidCallback? onApply;
  final VoidCallback? onClear;
  final VoidCallback? onClose;

  const AppFilterModal({
    super.key,
    this.selectedCategories = const [],
    this.selectedArtists = const [],
    this.availableArtists = const [],
    this.onCategoriesChanged,
    this.onArtistsChanged,
    this.onApply,
    this.onClear,
    this.onClose,
  });

  /// Helper para mostrar el modal
  static Future<Map<String, dynamic>?> show(
    BuildContext context, {
    List<String> initialCategories = const [],
    List<String> initialArtists = const [],
    List<String> availableArtists = const [],
  }) {
    return showModalBottomSheet<Map<String, dynamic>>(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AppFilterModalContent(
        initialCategories: initialCategories,
        initialArtists: initialArtists,
        availableArtists: availableArtists,
      ),
    );
  }

  @override
  State<AppFilterModal> createState() => _AppFilterModalState();
}

class _AppFilterModalState extends State<AppFilterModal> {
  late List<String> _selectedCategories;
  late List<String> _selectedArtists;
  late List<String> _filteredArtists;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategories = List.from(widget.selectedCategories);
    _selectedArtists = List.from(widget.selectedArtists);
    _filteredArtists = List.from(widget.availableArtists);
    _searchController.addListener(_filterArtists);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterArtists() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredArtists = List.from(widget.availableArtists);
      } else {
        _filteredArtists = widget.availableArtists
            .where((artist) => artist.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _onArtistToggle(String artist, bool selected) {
    setState(() {
      if (selected) {
        _selectedArtists.add(artist);
      } else {
        _selectedArtists.remove(artist);
      }
    });
    widget.onArtistsChanged?.call(_selectedArtists);
  }

  void _onClear() {
    setState(() {
      _selectedCategories.clear();
      _selectedArtists.clear();
      _searchController.clear();
    });
    widget.onClear?.call();
  }

  void _onApply() {
    widget.onApply?.call();
    Navigator.of(context).pop({
      'categories': _selectedCategories,
      'artists': _selectedArtists,
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final modalHeight = screenHeight * 0.7; // 70% de pantalla

    return Container(
      height: modalHeight,
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: AppSpacing.space2),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(AppSpacing.space4),
            child: Row(
              children: [
                Text(
                  'Filtros',
                  style: AppTextStyles.h2,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: widget.onClose ?? () => Navigator.of(context).pop(),
                  tooltip: 'Cerrar',
                ),
              ],
            ),
          ),

          // Content (scrollable)
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sección: Categorías
                  Text(
                    'Categorías',
                    style: AppTextStyles.titleMedium,
                  ),
                  SizedBox(height: AppSpacing.space3),
                  AppCategoryFilterChipGroup(
                    selectedCategories: _selectedCategories,
                    onSelectionChanged: (selected) {
                      setState(() {
                        _selectedCategories = selected;
                      });
                      widget.onCategoriesChanged?.call(_selectedCategories);
                    },
                    padding: EdgeInsets.zero,
                  ),

                  SizedBox(height: AppSpacing.space6),

                  // Divider
                  const AppDivider(),

                  SizedBox(height: AppSpacing.space6),

                  // Sección: Artistas
                  Text(
                    'Artistas',
                    style: AppTextStyles.titleMedium,
                  ),
                  SizedBox(height: AppSpacing.space3),

                  // Search bar
                  AppSearchBar(
                    hint: 'Buscar artista...',
                    controller: _searchController,
                  ),

                  SizedBox(height: AppSpacing.space4),

                  // Artist list con checkboxes
                  if (_filteredArtists.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.space4),
                      child: Center(
                        child: Text(
                          'No se encontraron artistas',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    )
                  else
                    ..._filteredArtists.map((artist) {
                      final isSelected = _selectedArtists.contains(artist);
                      return _buildArtistCheckbox(artist, isSelected);
                    }),
                ],
              ),
            ),
          ),

          // Footer
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Limpiar button (text)
                Expanded(
                  child: AppButton.text(
                    label: 'Limpiar',
                    onPressed: _onClear,
                  ),
                ),

                SizedBox(width: AppSpacing.space3),

                // Aplicar filtros button (primary)
                Expanded(
                  flex: 2,
                  child: AppButton.primary(
                    label: 'Aplicar filtros',
                    onPressed: _onApply,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtistCheckbox(String artist, bool isSelected) {
    return InkWell(
      onTap: () => _onArtistToggle(artist, !isSelected),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.space2),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.outlineVariant,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.onPrimary,
                    )
                  : null,
            ),

            SizedBox(width: AppSpacing.space3),

            // Artist name
            Expanded(
              child: Text(
                artist,
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// _AppFilterModalContent
/// 
/// Widget interno para usar con showModalBottomSheet
class _AppFilterModalContent extends StatefulWidget {
  final List<String> initialCategories;
  final List<String> initialArtists;
  final List<String> availableArtists;

  const _AppFilterModalContent({
    required this.initialCategories,
    required this.initialArtists,
    required this.availableArtists,
  });

  @override
  State<_AppFilterModalContent> createState() => _AppFilterModalContentState();
}

class _AppFilterModalContentState extends State<_AppFilterModalContent> {
  late List<String> _selectedCategories;
  late List<String> _selectedArtists;
  late List<String> _filteredArtists;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedCategories = List.from(widget.initialCategories);
    _selectedArtists = List.from(widget.initialArtists);
    _filteredArtists = List.from(widget.availableArtists);
    _searchController.addListener(_filterArtists);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _filterArtists() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredArtists = List.from(widget.availableArtists);
      } else {
        _filteredArtists = widget.availableArtists
            .where((artist) => artist.toLowerCase().contains(query))
            .toList();
      }
    });
  }

  void _onArtistToggle(String artist, bool selected) {
    setState(() {
      if (selected) {
        _selectedArtists.add(artist);
      } else {
        _selectedArtists.remove(artist);
      }
    });
  }

  void _onClear() {
    setState(() {
      _selectedCategories.clear();
      _selectedArtists.clear();
      _searchController.clear();
    });
  }

  void _onApply() {
    Navigator.of(context).pop({
      'categories': _selectedCategories,
      'artists': _selectedArtists,
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final modalHeight = screenHeight * 0.7; // 70% de pantalla

    return Container(
      height: modalHeight,
      decoration: BoxDecoration(
        color: AppColors.secondaryContainer,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(28),
          topRight: Radius.circular(28),
        ),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: EdgeInsets.only(top: AppSpacing.space2),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: AppColors.onSurfaceVariant.withOpacity(0.4),
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Header
          Padding(
            padding: EdgeInsets.all(AppSpacing.space4),
            child: Row(
              children: [
                Text(
                  'Filtros',
                  style: AppTextStyles.h2,
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.of(context).pop(),
                  tooltip: 'Cerrar',
                ),
              ],
            ),
          ),

          // Content (scrollable)
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Sección: Categorías
                  Text(
                    'Categorías',
                    style: AppTextStyles.titleMedium,
                  ),
                  SizedBox(height: AppSpacing.space3),
                  AppCategoryFilterChipGroup(
                    selectedCategories: _selectedCategories,
                    onSelectionChanged: (selected) {
                      setState(() {
                        _selectedCategories = selected;
                      });
                    },
                    padding: EdgeInsets.zero,
                  ),

                  SizedBox(height: AppSpacing.space6),

                  // Divider
                  const AppDivider(),

                  SizedBox(height: AppSpacing.space6),

                  // Sección: Artistas
                  Text(
                    'Artistas',
                    style: AppTextStyles.titleMedium,
                  ),
                  SizedBox(height: AppSpacing.space3),

                  // Search bar
                  AppSearchBar(
                    hint: 'Buscar artista...',
                    controller: _searchController,
                  ),

                  SizedBox(height: AppSpacing.space4),

                  // Artist list con checkboxes
                  if (_filteredArtists.isEmpty)
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: AppSpacing.space4),
                      child: Center(
                        child: Text(
                          'No se encontraron artistas',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    )
                  else
                    ..._filteredArtists.map((artist) {
                      final isSelected = _selectedArtists.contains(artist);
                      return _buildArtistCheckbox(artist, isSelected);
                    }),
                ],
              ),
            ),
          ),

          // Footer
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: AppColors.secondaryContainer,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Limpiar button (text)
                Expanded(
                  child: AppButton.text(
                    label: 'Limpiar',
                    onPressed: _onClear,
                  ),
                ),

                SizedBox(width: AppSpacing.space3),

                // Aplicar filtros button (primary)
                Expanded(
                  flex: 2,
                  child: AppButton.primary(
                    label: 'Aplicar filtros',
                    onPressed: _onApply,
                    isExpanded: true,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildArtistCheckbox(String artist, bool isSelected) {
    return InkWell(
      onTap: () => _onArtistToggle(artist, !isSelected),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: AppSpacing.space2),
        child: Row(
          children: [
            // Checkbox
            Container(
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSelected
                      ? AppColors.primary
                      : AppColors.outlineVariant,
                  width: 2,
                ),
                color: isSelected ? AppColors.primary : Colors.transparent,
              ),
              child: isSelected
                  ? Icon(
                      Icons.check,
                      size: 16,
                      color: AppColors.onPrimary,
                    )
                  : null,
            ),

            SizedBox(width: AppSpacing.space3),

            // Artist name
            Expanded(
              child: Text(
                artist,
                style: AppTextStyles.bodyMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

