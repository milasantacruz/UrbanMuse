import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/cards/cards.dart';

/// ObraCardPreviewPage
/// 
/// Página de showcase para AppObraCard
/// Muestra todas las variantes del componente de tarjeta de obra
class ObraCardPreviewPage extends StatefulWidget {
  const ObraCardPreviewPage({super.key});

  @override
  State<ObraCardPreviewPage> createState() => _ObraCardPreviewPageState();
}

class _ObraCardPreviewPageState extends State<ObraCardPreviewPage> {
  final Set<int> _favorites = {0, 2};

  void _toggleFavorite(int index) {
    setState(() {
      if (_favorites.contains(index)) {
        _favorites.remove(index);
      } else {
        _favorites.add(index);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obra Card Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Obra Card',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Tarjetas para mostrar obras de arte urbano',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Grid Version
          _buildSection(
            title: 'Grid Version (Feed/Galería)',
            description: 'Versión vertical para grids de 2 columnas',
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.space3,
                  mainAxisSpacing: AppSpacing.space3,
                  childAspectRatio: 0.75,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AppObraCard.grid(
                    imageUrl: _getImageUrl(index),
                    titulo: _getTitulo(index),
                    artista: _getArtista(index),
                    categoria: _getCategoria(index),
                    ubicacion: _getUbicacion(index),
                    isFavorite: _favorites.contains(index),
                    onFavoriteToggle: () => _toggleFavorite(index),
                    likes: 120 + (index * 30),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tap en: ${_getTitulo(index)}')),
                      );
                    },
                  );
                },
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // List Version
          _buildSection(
            title: 'List Version (Búsqueda/Lista)',
            description: 'Versión horizontal para listas de resultados',
            children: [
              ...List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.space3),
                  child: AppObraCard.list(
                    imageUrl: _getImageUrl(index),
                    titulo: _getTitulo(index),
                    artista: _getArtista(index),
                    categoria: _getCategoria(index),
                    ubicacion: _getUbicacion(index),
                    isFavorite: _favorites.contains(index),
                    onFavoriteToggle: () => _toggleFavorite(index),
                    likes: 120 + (index * 30),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tap en: ${_getTitulo(index)}')),
                      );
                    },
                  ),
                );
              }),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Compact Version
          _buildSection(
            title: 'Compact Version (Obras Relacionadas)',
            description: 'Versión compacta para scroll horizontal',
            children: [
              SizedBox(
                height: 180,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  separatorBuilder: (context, index) => SizedBox(width: AppSpacing.space3),
                  itemBuilder: (context, index) {
                    return AppObraCardCompact(
                      imageUrl: _getImageUrl(index),
                      titulo: _getTitulo(index),
                      artista: _getArtista(index),
                      categoria: _getCategoria(index),
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Tap en: ${_getTitulo(index)}')),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Diferentes Aspect Ratios
          _buildSection(
            title: 'Diferentes Aspect Ratios',
            description: 'Grid cards con distintas proporciones de imagen',
            children: [
              Column(
                children: [
                  // 16:9
                  Text('Aspect Ratio 16:9', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  AppObraCard.grid(
                    imageUrl: _getImageUrl(0),
                    titulo: 'Mural de la Libertad',
                    artista: 'Diego Mural',
                    categoria: 'mural',
                    ubicacion: 'Av. Corrientes 1234',
                    aspectRatio: 16 / 9,
                    onTap: () {},
                  ),
                  
                  SizedBox(height: AppSpacing.space4),
                  
                  // 1:1
                  Text('Aspect Ratio 1:1 (Cuadrado)', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  AppObraCard.grid(
                    imageUrl: _getImageUrl(1),
                    titulo: 'Arte Callejero',
                    artista: 'Ana Spray',
                    categoria: 'graffiti',
                    ubicacion: 'Palermo Viejo',
                    aspectRatio: 1,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - Feed
          _buildSection(
            title: 'Ejemplo Práctico: Feed Page',
            description: 'Grid de 2 columnas con scroll',
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
                        ],
                      ),
                      SizedBox(height: AppSpacing.space4),
                      
                      SizedBox(
                        height: 500,
                        child: GridView.builder(
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: AppSpacing.space3,
                            mainAxisSpacing: AppSpacing.space3,
                            childAspectRatio: 0.75,
                          ),
                          itemCount: 8,
                          itemBuilder: (context, index) {
                            return AppObraCard.grid(
                              imageUrl: _getImageUrl(index),
                              titulo: _getTitulo(index),
                              artista: _getArtista(index),
                              categoria: _getCategoria(index),
                              ubicacion: _getUbicacion(index),
                              isFavorite: _favorites.contains(index),
                              onFavoriteToggle: () => _toggleFavorite(index),
                              likes: 120 + (index * 30),
                              onTap: () {
                                debugPrint('Navigate to ObraDetailPage: ${_getTitulo(index)}');
                              },
                            );
                          },
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

          // Ejemplo Práctico - Búsqueda
          _buildSection(
            title: 'Ejemplo Práctico: Resultados de Búsqueda',
            description: 'Lista con version horizontal',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.search, size: 20, color: AppColors.primary),
                          SizedBox(width: AppSpacing.space2),
                          Text('Resultados: "mural"', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space1),
                      Text('4 obras encontradas', style: AppTextStyles.caption),
                      SizedBox(height: AppSpacing.space4),
                      
                      ...List.generate(4, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.space3),
                          child: AppObraCard.list(
                            imageUrl: _getImageUrl(index),
                            titulo: _getTitulo(index),
                            artista: _getArtista(index),
                            categoria: _getCategoria(index),
                            ubicacion: _getUbicacion(index),
                            onTap: () {
                              debugPrint('Navigate to: ${_getTitulo(index)}');
                            },
                          ),
                        );
                      }),
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
            description: 'Cómo usar las obra cards en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Grid Version (Feed)\n'
                  'AppObraCard.grid(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  artista: obra.artista,\n'
                  '  categoria: obra.categoria,\n'
                  '  ubicacion: obra.ubicacion,\n'
                  '  isFavorite: obra.isFavorite,\n'
                  '  onFavoriteToggle: () { },\n'
                  '  likes: obra.likes,\n'
                  '  aspectRatio: 4/3,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// List Version (Búsqueda)\n'
                  'AppObraCard.list(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  artista: obra.artista,\n'
                  '  categoria: obra.categoria,\n'
                  '  ubicacion: obra.ubicacion,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Compact Version (Horizontal Scroll)\n'
                  'AppObraCardCompact(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  artista: obra.artista,\n'
                  '  categoria: obra.categoria,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Grid de 2 columnas\n'
                  'GridView.builder(\n'
                  '  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(\n'
                  '    crossAxisCount: 2,\n'
                  '    crossAxisSpacing: 12,\n'
                  '    mainAxisSpacing: 12,\n'
                  '    childAspectRatio: 0.75,\n'
                  '  ),\n'
                  '  itemBuilder: (context, index) {\n'
                  '    return AppObraCard.grid(...);\n'
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

  // Mock data helpers
  String _getImageUrl(int index) {
    // URLs de imágenes de ejemplo (placeholder)
    final images = [
      'https://picsum.photos/seed/obra1/400/300',
      'https://picsum.photos/seed/obra2/400/300',
      'https://picsum.photos/seed/obra3/400/300',
      'https://picsum.photos/seed/obra4/400/300',
      'https://picsum.photos/seed/obra5/400/300',
    ];
    return images[index % images.length];
  }

  String _getTitulo(int index) {
    final titulos = [
      'Mural de la Libertad',
      'Graffiti Urbano',
      'Escultura Moderna',
      'Performance Art',
      'Arte Callejero',
    ];
    return titulos[index % titulos.length];
  }

  String _getArtista(int index) {
    final artistas = [
      'Diego Mural',
      'Ana Spray',
      'Carlos Arte',
      'María Street',
      'Pablo Urbano',
    ];
    return artistas[index % artistas.length];
  }

  String _getCategoria(int index) {
    final categorias = ['mural', 'graffiti', 'escultura', 'performance'];
    return categorias[index % categorias.length];
  }

  String _getUbicacion(int index) {
    final ubicaciones = [
      'Av. Corrientes 1234',
      'Palermo Viejo',
      'San Telmo',
      'Recoleta',
      'Villa Crespo',
    ];
    return ubicaciones[index % ubicaciones.length];
  }
}

