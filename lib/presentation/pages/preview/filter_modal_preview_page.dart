import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/modals/modals.dart';
import '../../widgets/buttons/buttons.dart';

/// FilterModalPreviewPage
/// 
/// Página de showcase para AppFilterModal
/// Muestra el modal de filtros con todas sus funcionalidades
class FilterModalPreviewPage extends StatefulWidget {
  const FilterModalPreviewPage({super.key});

  @override
  State<FilterModalPreviewPage> createState() => _FilterModalPreviewPageState();
}

class _FilterModalPreviewPageState extends State<FilterModalPreviewPage> {
  List<String> _selectedCategories = [];
  List<String> _selectedArtists = [];
  final List<String> _availableArtists = [
    'Diego Mural',
    'Ana Spray',
    'Carlos Arte',
    'María Street',
    'Pablo Urbano',
    'Laura Graffiti',
    'Roberto Mural',
    'Sofía Performance',
    'Miguel Escultura',
    'Elena Street Art',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter Modal Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Filter Modal',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Modal de filtros en formato Bottom Sheet',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Estado actual
          _buildSection(
            title: 'Estado Actual',
            description: 'Filtros seleccionados',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Categorías seleccionadas:', style: AppTextStyles.label),
                      SizedBox(height: AppSpacing.space2),
                      if (_selectedCategories.isEmpty)
                        Text(
                          'Ninguna',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        )
                      else
                        Wrap(
                          spacing: AppSpacing.space2,
                          runSpacing: AppSpacing.space2,
                          children: _selectedCategories.map((cat) {
                            return Chip(
                              label: Text(cat),
                              backgroundColor: AppColors.primaryContainer,
                            );
                          }).toList(),
                        ),
                      SizedBox(height: AppSpacing.space4),
                      Text('Artistas seleccionados:', style: AppTextStyles.label),
                      SizedBox(height: AppSpacing.space2),
                      if (_selectedArtists.isEmpty)
                        Text(
                          'Ninguno',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        )
                      else
                        Wrap(
                          spacing: AppSpacing.space2,
                          runSpacing: AppSpacing.space2,
                          children: _selectedArtists.map((artist) {
                            return Chip(
                              label: Text(artist),
                              backgroundColor: AppColors.primaryContainer,
                            );
                          }).toList(),
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

          // Abrir Modal
          _buildSection(
            title: 'Abrir Filter Modal',
            description: 'Usa el botón para abrir el modal de filtros',
            children: [
              AppButton.primary(
                label: 'Abrir Filtros',
                onPressed: () async {
                  final result = await AppFilterModal.show(
                    context,
                    initialCategories: _selectedCategories,
                    initialArtists: _selectedArtists,
                    availableArtists: _availableArtists,
                  );

                  if (result != null) {
                    setState(() {
                      _selectedCategories = List<String>.from(result['categories'] ?? []);
                      _selectedArtists = List<String>.from(result['artists'] ?? []);
                    });
                  }
                },
                isExpanded: true,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - FeedPage
          _buildSection(
            title: 'Ejemplo Práctico: FeedPage',
            description: 'Integración del Filter Modal en una página',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.explore, size: 20, color: AppColors.primary),
                          SizedBox(width: AppSpacing.space2),
                          Text('Explorar Obras', style: AppTextStyles.h3),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(Icons.filter_list),
                            onPressed: () async {
                              final result = await AppFilterModal.show(
                                context,
                                initialCategories: _selectedCategories,
                                initialArtists: _selectedArtists,
                                availableArtists: _availableArtists,
                              );

                              if (result != null) {
                                setState(() {
                                  _selectedCategories = List<String>.from(result['categories'] ?? []);
                                  _selectedArtists = List<String>.from(result['artists'] ?? []);
                                });
                              }
                            },
                            tooltip: 'Filtros',
                          ),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space4),

                      // Filtros activos
                      if (_selectedCategories.isNotEmpty || _selectedArtists.isNotEmpty) ...[
                        Text('Filtros activos:', style: AppTextStyles.label),
                        SizedBox(height: AppSpacing.space2),
                        Wrap(
                          spacing: AppSpacing.space2,
                          runSpacing: AppSpacing.space2,
                          children: [
                            ..._selectedCategories.map((cat) {
                              return Chip(
                                label: Text(cat),
                                backgroundColor: AppColors.primaryContainer,
                                onDeleted: () {
                                  setState(() {
                                    _selectedCategories.remove(cat);
                                  });
                                },
                              );
                            }),
                            ..._selectedArtists.map((artist) {
                              return Chip(
                                label: Text(artist),
                                backgroundColor: AppColors.primaryContainer,
                                onDeleted: () {
                                  setState(() {
                                    _selectedArtists.remove(artist);
                                  });
                                },
                              );
                            }),
                          ],
                        ),
                        SizedBox(height: AppSpacing.space4),
                      ],

                      // Grid simulado
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: AppColors.surface2,
                          borderRadius: AppBorderRadius.medium,
                        ),
                        child: Center(
                          child: Text(
                            'Grid de Obras\n(${_selectedCategories.length + _selectedArtists.length} filtros activos)',
                            style: AppTextStyles.bodyLarge.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
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
            description: 'Cómo usar el Filter Modal en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Abrir Filter Modal\n'
                  'final result = await AppFilterModal.show(\n'
                  '  context,\n'
                  '  initialCategories: _selectedCategories,\n'
                  '  initialArtists: _selectedArtists,\n'
                  '  availableArtists: _availableArtists,\n'
                  ');\n\n'
                  'if (result != null) {\n'
                  '  setState(() {\n'
                  '    _selectedCategories = result[\'categories\'];\n'
                  '    _selectedArtists = result[\'artists\'];\n'
                  '  });\n'
                  '}\n\n'
                  '// Usar AppFilterModal directamente\n'
                  'AppFilterModal(\n'
                  '  selectedCategories: _categories,\n'
                  '  selectedArtists: _artists,\n'
                  '  availableArtists: _allArtists,\n'
                  '  onCategoriesChanged: (categories) { },\n'
                  '  onArtistsChanged: (artists) { },\n'
                  '  onApply: () { },\n'
                  '  onClear: () { },\n'
                  '  onClose: () { },\n'
                  ')\n\n'
                  '// En un IconButton\n'
                  'IconButton(\n'
                  '  icon: Icon(Icons.filter_list),\n'
                  '  onPressed: () async {\n'
                  '    final result = await AppFilterModal.show(context);\n'
                  '    // Procesar resultado\n'
                  '  },\n'
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

