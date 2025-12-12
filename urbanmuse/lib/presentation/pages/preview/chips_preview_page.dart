import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/chips/chips.dart';

/// ChipsPreviewPage
/// 
/// Página de showcase para AppFilterChip y AppFilterChipGroup
/// Muestra todas las variantes basadas en las especificaciones de Figma
class ChipsPreviewPage extends StatefulWidget {
  const ChipsPreviewPage({super.key});

  @override
  State<ChipsPreviewPage> createState() => _ChipsPreviewPageState();
}

class _ChipsPreviewPageState extends State<ChipsPreviewPage> {
  final List<String> _selectedOptions = [];
  final List<String> _selectedCategories = [];
  final List<String> _selectedTags = ['Flutter'];
  String? _selectedTransport;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Chips Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Filter Chips',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Chips de filtro siguiendo Material 3 y Figma',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Chips Básicos
          _buildSection(
            title: 'Chips Básicos',
            description: 'Estados fundamentales del chip',
            children: [
              Wrap(
                spacing: AppSpacing.space2,
                runSpacing: AppSpacing.space2,
                children: [
                  AppFilterChip(
                    label: 'Normal',
                    isSelected: false,
                    onSelected: (selected) {},
                  ),
                  AppFilterChip(
                    label: 'Selected',
                    isSelected: true,
                    onSelected: (selected) {},
                  ),
                  const AppFilterChip(
                    label: 'Disabled',
                    isSelected: false,
                    enabled: false,
                  ),
                  const AppFilterChip(
                    label: 'Selected Disabled',
                    isSelected: true,
                    enabled: false,
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Con Iconos
          _buildSection(
            title: 'Con Iconos',
            description: 'Chips con iconos y close button',
            children: [
              Wrap(
                spacing: AppSpacing.space2,
                runSpacing: AppSpacing.space2,
                children: [
                  AppFilterChip(
                    label: 'Con Avatar',
                    isSelected: false,
                    avatar: const Icon(Icons.person, size: 18),
                    onSelected: (selected) {},
                  ),
                  AppFilterChip(
                    label: 'Con Check',
                    isSelected: true,
                    showCheckmark: true,
                    onSelected: (selected) {},
                  ),
                  AppFilterChip(
                    label: 'Con Delete',
                    isSelected: true,
                    onSelected: (selected) {},
                    onDeleted: () {
                      debugPrint('Chip deleted');
                    },
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Colores Personalizados
          _buildSection(
            title: 'Colores Personalizados',
            description: 'Chips con colores específicos',
            children: [
              Wrap(
                spacing: AppSpacing.space2,
                runSpacing: AppSpacing.space2,
                children: [
                  AppFilterChip(
                    label: 'Primary',
                    isSelected: true,
                    selectedColor: AppColors.primaryContainer,
                    onSelected: (selected) {},
                  ),
                  AppFilterChip(
                    label: 'Graffiti',
                    isSelected: true,
                    selectedColor: AppColors.categoryGraffiti.withOpacity(0.2),
                    textColor: AppColors.categoryGraffiti,
                    onSelected: (selected) {},
                  ),
                  AppFilterChip(
                    label: 'Mural',
                    isSelected: true,
                    selectedColor: AppColors.categoryMural.withOpacity(0.2),
                    textColor: AppColors.categoryMural,
                    onSelected: (selected) {},
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Filter Chip Group - Multi Select
          _buildSection(
            title: 'Chip Group - Multi Select',
            description: 'Seleccionar múltiples opciones',
            children: [
              AppFilterChipGroup(
                labels: const ['Graffiti', 'Mural', 'Escultura', 'Performance', 'Street Art'],
                selectedLabels: _selectedOptions,
                onSelectionChanged: (selected) {
                  setState(() {
                    _selectedOptions.clear();
                    _selectedOptions.addAll(selected);
                  });
                },
                multiSelect: true,
              ),
              SizedBox(height: AppSpacing.space3),
              if (_selectedOptions.isNotEmpty)
                Text(
                  'Seleccionados: ${_selectedOptions.join(', ')}',
                  style: AppTextStyles.caption,
                ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Filter Chip Group - Single Select
          _buildSection(
            title: 'Chip Group - Single Select',
            description: 'Seleccionar una sola opción',
            children: [
              AppFilterChipGroup(
                labels: const ['A pie', 'En bici', 'En auto'],
                selectedLabels: _selectedTransport != null ? [_selectedTransport!] : [],
                onSelectionChanged: (selected) {
                  setState(() {
                    _selectedTransport = selected.isNotEmpty ? selected.first : null;
                  });
                },
                multiSelect: false,
              ),
              SizedBox(height: AppSpacing.space3),
              Text(
                _selectedTransport != null 
                    ? 'Transporte: $_selectedTransport'
                    : 'Selecciona un medio de transporte',
                style: AppTextStyles.caption,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Category Filter Chip Group
          _buildSection(
            title: 'Category Chip Group',
            description: 'Chips de categorías con iconos de color',
            children: [
              AppCategoryFilterChipGroup(
                selectedCategories: _selectedCategories,
                onSelectionChanged: (selected) {
                  setState(() {
                    _selectedCategories.clear();
                    _selectedCategories.addAll(selected);
                  });
                },
              ),
              SizedBox(height: AppSpacing.space3),
              if (_selectedCategories.isNotEmpty)
                Text(
                  'Categorías: ${_selectedCategories.join(', ')}',
                  style: AppTextStyles.caption,
                ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - Filtros de Feed
          _buildSection(
            title: 'Ejemplo Práctico: Filtros de Feed',
            description: 'Uso de chips en un contexto real',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.filter_list, size: 20, color: AppColors.primary),
                          SizedBox(width: AppSpacing.space2),
                          Text('Filtrar Obras', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space3),
                      
                      Text('Categorías:', style: AppTextStyles.label),
                      SizedBox(height: AppSpacing.space2),
                      AppCategoryFilterChipGroup(
                        selectedCategories: _selectedCategories,
                        onSelectionChanged: (selected) {
                          setState(() {
                            _selectedCategories.clear();
                            _selectedCategories.addAll(selected);
                          });
                        },
                        padding: EdgeInsets.zero,
                      ),
                      
                      SizedBox(height: AppSpacing.space4),
                      
                      Text('Tags:', style: AppTextStyles.label),
                      SizedBox(height: AppSpacing.space2),
                      AppFilterChipGroup(
                        labels: const ['Popular', 'Reciente', 'Cerca', 'Favoritos'],
                        selectedLabels: _selectedTags,
                        onSelectionChanged: (selected) {
                          setState(() {
                            _selectedTags.clear();
                            _selectedTags.addAll(selected);
                          });
                        },
                        padding: EdgeInsets.zero,
                      ),
                      
                      SizedBox(height: AppSpacing.space4),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${_selectedCategories.length + _selectedTags.length} filtros activos',
                            style: AppTextStyles.caption,
                          ),
                          TextButton(
                            onPressed: () {
                              setState(() {
                                _selectedCategories.clear();
                                _selectedTags.clear();
                              });
                            },
                            child: const Text('Limpiar todo'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - Búsqueda con Chips
          _buildSection(
            title: 'Ejemplo Práctico: Búsqueda con Chips',
            description: 'Chips mostrando búsquedas recientes',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Búsquedas recientes:', style: AppTextStyles.label),
                      SizedBox(height: AppSpacing.space3),
                      Wrap(
                        spacing: AppSpacing.space2,
                        runSpacing: AppSpacing.space2,
                        children: [
                          AppFilterChip(
                            label: 'Diego Mural',
                            avatar: const Icon(Icons.history, size: 18),
                            isSelected: false,
                            onSelected: (selected) {
                              debugPrint('Búsqueda: Diego Mural');
                            },
                            onDeleted: () {
                              debugPrint('Borrar: Diego Mural');
                            },
                          ),
                          AppFilterChip(
                            label: 'Graffiti Centro',
                            avatar: const Icon(Icons.history, size: 18),
                            isSelected: false,
                            onSelected: (selected) {
                              debugPrint('Búsqueda: Graffiti Centro');
                            },
                            onDeleted: () {
                              debugPrint('Borrar: Graffiti Centro');
                            },
                          ),
                          AppFilterChip(
                            label: 'Murales Reforma',
                            avatar: const Icon(Icons.history, size: 18),
                            isSelected: false,
                            onSelected: (selected) {
                              debugPrint('Búsqueda: Murales Reforma');
                            },
                            onDeleted: () {
                              debugPrint('Borrar: Murales Reforma');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Code Examples
          _buildSection(
            title: 'Ejemplos de Código',
            description: 'Cómo usar los chips en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Chip básico\n'
                  'AppFilterChip(\n'
                  '  label: \'Graffiti\',\n'
                  '  isSelected: true,\n'
                  '  onSelected: (selected) { },\n'
                  ')\n\n'
                  '// Chip con avatar\n'
                  'AppFilterChip(\n'
                  '  label: \'Popular\',\n'
                  '  avatar: Icon(Icons.star, size: 18),\n'
                  '  onSelected: (selected) { },\n'
                  ')\n\n'
                  '// Chip Group - Multi Select\n'
                  'AppFilterChipGroup(\n'
                  '  labels: [\'Graffiti\', \'Mural\'],\n'
                  '  selectedLabels: _selected,\n'
                  '  onSelectionChanged: (selected) {\n'
                  '    setState(() => _selected = selected);\n'
                  '  },\n'
                  '  multiSelect: true,\n'
                  ')\n\n'
                  '// Category Chips con colores\n'
                  'AppCategoryFilterChipGroup(\n'
                  '  selectedCategories: _categories,\n'
                  '  onSelectionChanged: (selected) { },\n'
                  ')',
                  style: AppTextStyles.caption,
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.h2),
        SizedBox(height: AppSpacing.space2),
        Text(description, style: AppTextStyles.bodySmall),
        SizedBox(height: AppSpacing.space4),
        ...children,
      ],
    );
  }
}

