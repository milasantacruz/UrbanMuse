import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/search/search.dart';
import '../../widgets/buttons/buttons.dart';

/// SearchBarPreviewPage
/// 
/// Página de showcase para el componente AppSearchBar
/// Muestra todas las variantes basadas en la estructura de AppTextField
class SearchBarPreviewPage extends StatefulWidget {
  const SearchBarPreviewPage({super.key});

  @override
  State<SearchBarPreviewPage> createState() => _SearchBarPreviewPageState();
}

class _SearchBarPreviewPageState extends State<SearchBarPreviewPage> {
  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  final TextEditingController _controller3 = TextEditingController();
  
  String _searchQuery = '';
  List<String> _searchResults = [];
  bool _isSearching = false;

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  void _performSearch(String query) {
    setState(() {
      _searchQuery = query;
      _isSearching = true;
    });

    // Simular búsqueda con delay
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isSearching = false;
          if (query.isEmpty) {
            _searchResults = [];
          } else {
            _searchResults = [
              'Mural en Av. Reforma - Diego Mural',
              'Graffiti en Centro Histórico - Laura Art',
              'Escultura Urbana en Chapultepec - Max Graf',
              'Street Art en Condesa - Ana Silva',
              'Mural Colaborativo - Pedro Torres',
            ].where((item) => 
              item.toLowerCase().contains(query.toLowerCase())
            ).toList();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Bar Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Search Bar',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Barra de búsqueda basada en la estructura de AppTextField',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Modos de Search Bar
          _buildSection(
            title: 'Modos de Search Bar',
            description: 'Diferentes estilos siguiendo Material 3 (igual que inputs)',
            children: [
              Text('Outlined (Default)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar.outlined(
                hint: 'Buscar obras...',
              ),
              SizedBox(height: AppSpacing.space4),
              
              Text('Filled', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar.filled(
                hint: 'Buscar obras...',
              ),
              SizedBox(height: AppSpacing.space4),
              
              Text('Flat (sin borde ni fondo)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar.flat(
                hint: 'Buscar obras...',
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Tamaños
          _buildSection(
            title: 'Tamaños',
            description: 'Normal (56px) y Compact (40px) - igual que inputs',
            children: [
              Text('Normal (56px)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar(
                hint: 'Buscar obras...',
              ),
              SizedBox(height: AppSpacing.space4),
              
              Text('Compact (40px)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBarCompact(
                hint: 'Buscar obras...',
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Placeholders Específicos
          _buildSection(
            title: 'Placeholders Específicos',
            description: 'Search bars con contexto específico',
            children: [
              Text('Obras', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar.obras(),
              SizedBox(height: AppSpacing.space4),
              
              Text('Artistas', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar.artistas(),
              SizedBox(height: AppSpacing.space4),
              
              Text('Rutas', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar.rutas(),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Con Controller
          _buildSection(
            title: 'Con Controller',
            description: 'Search bar con control programático del texto',
            children: [
              AppSearchBar(
                controller: _controller1,
                hint: 'Buscar obras...',
                onChanged: (value) {
                  debugPrint('Text changed: $value');
                },
                onSubmitted: (value) {
                  debugPrint('Submitted: $value');
                },
              ),
              SizedBox(height: AppSpacing.space3),
              Row(
                children: [
                  Expanded(
                    child: AppButton.secondary(
                      label: 'Set "Mural"',
                      onPressed: () {
                        _controller1.text = 'Mural';
                      },
                    ),
                  ),
                  SizedBox(width: AppSpacing.space2),
                  Expanded(
                    child: AppButton.secondary(
                      label: 'Clear',
                      onPressed: () {
                        _controller1.clear();
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Estados
          _buildSection(
            title: 'Estados',
            description: 'Diferentes estados del search bar',
            children: [
              Text('Enabled (Default)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar(
                hint: 'Buscar obras...',
              ),
              SizedBox(height: AppSpacing.space4),
              
              Text('Disabled', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBar(
                hint: 'Búsqueda deshabilitada...',
                enabled: false,
              ),
              SizedBox(height: AppSpacing.space4),
              
              Text('Read Only', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              AppSearchBar(
                hint: 'Solo lectura...',
                controller: TextEditingController(text: 'Texto fijo'),
                readOnly: true,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Búsqueda Interactiva
          _buildSection(
            title: 'Búsqueda Interactiva',
            description: 'Ejemplo funcional con resultados simulados',
            children: [
              AppSearchBar.obras(
                controller: _controller2,
                onChanged: _performSearch,
                onSubmitted: _performSearch,
                onClear: () => _performSearch(''),
              ),
              SizedBox(height: AppSpacing.space4),
              
              if (_isSearching)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: CircularProgressIndicator(),
                  ),
                )
              else if (_searchResults.isEmpty && _searchQuery.isNotEmpty)
                Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    children: [
                      Icon(
                        Icons.search_off,
                        size: 48,
                        color: AppColors.onSurfaceVariant,
                      ),
                      SizedBox(height: AppSpacing.space2),
                      Text(
                        'No se encontraron resultados para "$_searchQuery"',
                        style: AppTextStyles.body,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              else if (_searchResults.isNotEmpty)
                Card(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(AppSpacing.space3),
                        child: Row(
                          children: [
                            Icon(Icons.art_track, size: 20, color: AppColors.primary),
                            SizedBox(width: AppSpacing.space2),
                            Text(
                              '${_searchResults.length} resultados',
                              style: AppTextStyles.label,
                            ),
                          ],
                        ),
                      ),
                      ...List.generate(
                        _searchResults.length,
                        (index) => ListTile(
                          leading: const Icon(Icons.image),
                          title: Text(
                            _searchResults[index],
                            style: AppTextStyles.body,
                          ),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text('Seleccionado: ${_searchResults[index]}'),
                                duration: const Duration(seconds: 1),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Combinación con otros modos
          _buildSection(
            title: 'Combinaciones',
            description: 'Search bar en diferentes contextos',
            children: [
              Text('Filled + Compact', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              const AppSearchBarCompact(
                hint: 'Buscar...',
                mode: AppSearchBarMode.filled,
              ),
              SizedBox(height: AppSpacing.space4),
              
              Text('Flat + Normal (para App Bar)', style: AppTextStyles.label),
              SizedBox(height: AppSpacing.space2),
              Container(
                padding: EdgeInsets.all(AppSpacing.space3),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: AppBorderRadius.medium,
                ),
                child: const AppSearchBar.flat(
                  hint: 'Buscar obras...',
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
            description: 'Cómo usar el search bar en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                 // color: AppColors.surface,
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Básico (outlined por defecto)\n'
                  'AppSearchBar(\n'
                  '  hint: \'Buscar...\',\n'
                  ')\n\n'
                  '// Con modo específico\n'
                  'AppSearchBar.filled(\n'
                  '  hint: \'Buscar obras...\',\n'
                  ')\n\n'
                  '// Con placeholder específico\n'
                  'AppSearchBar.obras()\n'
                  'AppSearchBar.artistas()\n'
                  'AppSearchBar.rutas()\n\n'
                  '// Con controller y callbacks\n'
                  'AppSearchBar(\n'
                  '  controller: _searchController,\n'
                  '  hint: \'Buscar...\',\n'
                  '  onChanged: (value) {\n'
                  '    // Búsqueda en tiempo real\n'
                  '  },\n'
                  '  onSubmitted: (value) {\n'
                  '    // Búsqueda al presionar enter\n'
                  '  },\n'
                  '  onClear: () {\n'
                  '    // Acción al limpiar\n'
                  '  },\n'
                  ')\n\n'
                  '// Compact\n'
                  'AppSearchBarCompact(\n'
                  '  hint: \'Buscar...\',\n'
                  '  mode: AppSearchBarMode.filled,\n'
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
