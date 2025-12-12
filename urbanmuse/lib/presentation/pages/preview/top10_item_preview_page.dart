import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/cards/cards.dart';

/// Top10ItemPreviewPage
/// 
/// Página de showcase para AppTop10Item
/// Muestra todas las variantes del componente Top 10 Grid Item
class Top10ItemPreviewPage extends StatefulWidget {
  const Top10ItemPreviewPage({super.key});

  @override
  State<Top10ItemPreviewPage> createState() => _Top10ItemPreviewPageState();
}

class _Top10ItemPreviewPageState extends State<Top10ItemPreviewPage> {
  late List<Top10ItemData> _top10Items;

  @override
  void initState() {
    super.initState();
    _top10Items = List.generate(10, (index) {
      return Top10ItemData(
        imageUrl: 'https://picsum.photos/seed/top10${index + 1}/400/400',
        titulo: _getTitulo(index),
        ranking: index + 1,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top 10 Grid Item Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Top 10 Grid Item',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Items del grid Top 10 con ranking y overlay',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Top 10 Grid - Square
          _buildSection(
            title: 'Top 10 Grid - Square (1:1)',
            description: 'Grid de 2 columnas con aspect ratio cuadrado',
            children: [
              AppTop10Grid(
                items: _top10Items,
                aspectRatio: 1.0,
                spacing: AppSpacing.space3,
                onItemTap: (index) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tap en: ${_top10Items[index].titulo}')),
                  );
                },
                onItemRemove: (index) {
                  setState(() {
                    _top10Items.removeAt(index);
                    // Reordenar rankings
                    for (int i = 0; i < _top10Items.length; i++) {
                      _top10Items[i] = Top10ItemData(
                        imageUrl: _top10Items[i].imageUrl,
                        titulo: _top10Items[i].titulo,
                        ranking: i + 1,
                      );
                    }
                  });
                },
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Top 10 Grid - Portrait (4:5)
          _buildSection(
            title: 'Top 10 Grid - Portrait (4:5)',
            description: 'Grid con aspect ratio vertical',
            children: [
              AppTop10Grid(
                items: _top10Items.take(6).toList(),
                aspectRatio: 0.8, // 4:5
                spacing: AppSpacing.space3,
                onItemTap: (index) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Tap en: ${_top10Items[index].titulo}')),
                  );
                },
                onItemRemove: (index) {
                  debugPrint('Remove item at index: $index');
                },
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Individual Items
          _buildSection(
            title: 'Individual Items',
            description: 'Items individuales con diferentes rankings',
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTop10Item(
                      imageUrl: 'https://picsum.photos/seed/item1/400/400',
                      titulo: 'Mural de la Libertad',
                      ranking: 1,
                      onTap: () {},
                      onRemove: () {
                        debugPrint('Remove #1');
                      },
                    ),
                  ),
                  SizedBox(width: AppSpacing.space3),
                  Expanded(
                    child: AppTop10Item(
                      imageUrl: 'https://picsum.photos/seed/item2/400/400',
                      titulo: 'Graffiti Urbano',
                      ranking: 2,
                      onTap: () {},
                      onRemove: () {
                        debugPrint('Remove #2');
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

          // Sin Remove Button
          _buildSection(
            title: 'Sin Remove Button',
            description: 'Versión sin botón de eliminar',
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppTop10Item(
                      imageUrl: 'https://picsum.photos/seed/item3/400/400',
                      titulo: 'Escultura Moderna',
                      ranking: 3,
                      showRemoveButton: false,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: AppSpacing.space3),
                  Expanded(
                    child: AppTop10Item(
                      imageUrl: 'https://picsum.photos/seed/item4/400/400',
                      titulo: 'Performance Art',
                      ranking: 4,
                      showRemoveButton: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Empty Slots
          _buildSection(
            title: 'Empty Slots',
            description: 'Slots vacíos cuando hay menos de 10 obras',
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.space3,
                  mainAxisSpacing: AppSpacing.space3,
                  childAspectRatio: 1.0,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  if (index < 2) {
                    // Items existentes
                    return AppTop10Item(
                      imageUrl: 'https://picsum.photos/seed/slot${index}/400/400',
                      titulo: _getTitulo(index),
                      ranking: index + 1,
                      onTap: () {},
                      onRemove: () {},
                    );
                  } else {
                    // Empty slots
                    return AppTop10EmptySlot(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Agregar obra al Top 10')),
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - Top10Page
          _buildSection(
            title: 'Ejemplo Práctico: Top10Page',
            description: 'Grid completo con 10 items y empty slots',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, size: 20, color: AppColors.primary),
                          SizedBox(width: AppSpacing.space2),
                          Text('Mi Top 10', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space1),
                      Text(
                        '${_top10Items.length}/10 obras',
                        style: AppTextStyles.caption,
                      ),
                      SizedBox(height: AppSpacing.space4),

                      AppTop10Grid(
                        items: _top10Items,
                        aspectRatio: 1.0,
                        spacing: AppSpacing.space3,
                        onItemTap: (index) {
                          debugPrint('Navigate to: ${_top10Items[index].titulo}');
                        },
                        onItemRemove: (index) {
                          setState(() {
                            _top10Items.removeAt(index);
                            // Reordenar rankings
                            for (int i = 0; i < _top10Items.length; i++) {
                              _top10Items[i] = Top10ItemData(
                                imageUrl: _top10Items[i].imageUrl,
                                titulo: _top10Items[i].titulo,
                                ranking: i + 1,
                              );
                            }
                          });
                        },
                      ),

                      // Empty slots si hay menos de 10
                      if (_top10Items.length < 10) ...[
                        SizedBox(height: AppSpacing.space3),
                        GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppSpacing.space3,
                            mainAxisSpacing: AppSpacing.space3,
                            childAspectRatio: 1.0,
                          ),
                          itemCount: 10 - _top10Items.length,
                          itemBuilder: (context, index) {
                            return AppTop10EmptySlot(
                              onTap: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Agregar obra al Top 10')),
                                );
                              },
                            );
                          },
                        ),
                      ],
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
            description: 'Cómo usar los Top 10 items en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Top 10 Item Individual\n'
                  'AppTop10Item(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  ranking: 1,\n'
                  '  aspectRatio: 1.0, // Square\n'
                  '  onTap: () { },\n'
                  '  onRemove: () { },\n'
                  ')\n\n'
                  '// Top 10 Item Portrait (4:5)\n'
                  'AppTop10Item.portrait(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  ranking: 1,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Top 10 Grid\n'
                  'AppTop10Grid(\n'
                  '  items: top10Items,\n'
                  '  aspectRatio: 1.0,\n'
                  '  spacing: 12,\n'
                  '  onItemTap: (index) { },\n'
                  '  onItemRemove: (index) { },\n'
                  ')\n\n'
                  '// Empty Slot\n'
                  'AppTop10EmptySlot(\n'
                  '  onTap: () {\n'
                  '    // Agregar obra al Top 10\n'
                  '  },\n'
                  ')\n\n'
                  '// Top10ItemData Model\n'
                  'final item = Top10ItemData(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  ranking: 1,\n'
                  ');',
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

  String _getTitulo(int index) {
    final titulos = [
      'Mural de la Libertad',
      'Graffiti Urbano',
      'Escultura Moderna',
      'Performance Art',
      'Arte Callejero',
      'Mural Abstracto',
      'Graffiti Colorido',
      'Escultura Pública',
      'Performance Vivo',
      'Arte Mural',
    ];
    return titulos[index % titulos.length];
  }
}

