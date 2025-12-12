import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/cards/cards.dart';

/// ArtistCardPreviewPage
/// 
/// Página de showcase para AppArtistCard
/// Muestra todas las variantes del componente de tarjeta de artista
class ArtistCardPreviewPage extends StatelessWidget {
  const ArtistCardPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Artist Card Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Artist Card',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Tarjetas para mostrar información de artistas',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Artist Card - Standard
          _buildSection(
            title: 'Artist Card - Standard',
            description: 'Versión completa con avatar, bio, stats y botón',
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
                  return AppArtistCard(
                    artistName: _getArtistName(index),
                    bio: _getBio(index),
                    avatarUrl: _getAvatarUrl(index),
                    obrasCount: 15 + (index * 5),
                    followersCount: 120 + (index * 50),
                    onViewProfile: () {
                      debugPrint('View profile: ${_getArtistName(index)}');
                    },
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tap en: ${_getArtistName(index)}')),
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

          // Artist Card - Compact (sin botón)
          _buildSection(
            title: 'Artist Card - Compact',
            description: 'Versión compacta sin botón, ideal para grids',
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: AppSpacing.space3,
                  mainAxisSpacing: AppSpacing.space3,
                  childAspectRatio: 0.85,
                ),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return AppArtistCard.compact(
                    artistName: _getArtistName(index),
                    bio: _getBio(index),
                    avatarUrl: _getAvatarUrl(index),
                    obrasCount: 15 + (index * 5),
                    followersCount: 120 + (index * 50),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tap en: ${_getArtistName(index)}')),
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

          // Artist Card - Horizontal
          _buildSection(
            title: 'Artist Card - Horizontal',
            description: 'Versión horizontal para listas de resultados',
            children: [
              ...List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.space3),
                  child: AppArtistCardHorizontal(
                    artistName: _getArtistName(index),
                    bio: _getBio(index),
                    avatarUrl: _getAvatarUrl(index),
                    obrasCount: 15 + (index * 5),
                    followersCount: 120 + (index * 50),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Tap en: ${_getArtistName(index)}')),
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

          // Sin Avatar (con iniciales)
          _buildSection(
            title: 'Sin Avatar - Con Iniciales',
            description: 'Cuando no hay imagen, muestra iniciales',
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
                  return AppArtistCard(
                    artistName: _getArtistName(index),
                    bio: _getBio(index),
                    avatarUrl: null, // Sin URL = muestra iniciales
                    obrasCount: 15 + (index * 5),
                    followersCount: 120 + (index * 50),
                    onViewProfile: () {
                      debugPrint('View profile: ${_getArtistName(index)}');
                    },
                  );
                },
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - Feed de Artistas
          _buildSection(
            title: 'Ejemplo Práctico: Feed de Artistas',
            description: 'Grid de artistas destacados',
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
                          Text('Artistas Destacados', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space4),
                      
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
                          return AppArtistCard(
                            artistName: _getArtistName(index),
                            bio: _getBio(index),
                            avatarUrl: _getAvatarUrl(index),
                            obrasCount: 15 + (index * 5),
                            followersCount: 120 + (index * 50),
                            onViewProfile: () {
                              debugPrint('Navigate to profile: ${_getArtistName(index)}');
                            },
                          );
                        },
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
            description: 'Lista horizontal de artistas',
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
                          Text('Resultados: "diego"', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space1),
                      Text('4 artistas encontrados', style: AppTextStyles.caption),
                      SizedBox(height: AppSpacing.space4),
                      
                      ...List.generate(4, (index) {
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.space3),
                          child: AppArtistCardHorizontal(
                            artistName: _getArtistName(index),
                            bio: _getBio(index),
                            avatarUrl: _getAvatarUrl(index),
                            obrasCount: 15 + (index * 5),
                            followersCount: 120 + (index * 50),
                            onTap: () {
                              debugPrint('Navigate to: ${_getArtistName(index)}');
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
            description: 'Cómo usar las artist cards en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Artist Card Standard\n'
                  'AppArtistCard(\n'
                  '  artistName: artista.name,\n'
                  '  bio: artista.bio,\n'
                  '  avatarUrl: artista.avatarUrl,\n'
                  '  obrasCount: artista.obrasCount,\n'
                  '  followersCount: artista.followersCount,\n'
                  '  onViewProfile: () {\n'
                  '    // Navigate to profile\n'
                  '  },\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Artist Card Compact (sin botón)\n'
                  'AppArtistCard.compact(\n'
                  '  artistName: artista.name,\n'
                  '  bio: artista.bio,\n'
                  '  avatarUrl: artista.avatarUrl,\n'
                  '  obrasCount: artista.obrasCount,\n'
                  '  followersCount: artista.followersCount,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Artist Card Horizontal\n'
                  'AppArtistCardHorizontal(\n'
                  '  artistName: artista.name,\n'
                  '  bio: artista.bio,\n'
                  '  avatarUrl: artista.avatarUrl,\n'
                  '  obrasCount: artista.obrasCount,\n'
                  '  followersCount: artista.followersCount,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Grid de artistas\n'
                  'GridView.builder(\n'
                  '  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(\n'
                  '    crossAxisCount: 2,\n'
                  '    crossAxisSpacing: 12,\n'
                  '    mainAxisSpacing: 12,\n'
                  '    childAspectRatio: 0.75,\n'
                  '  ),\n'
                  '  itemBuilder: (context, index) {\n'
                  '    return AppArtistCard(...);\n'
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
  String _getArtistName(int index) {
    final names = [
      'Diego Mural',
      'Ana Spray',
      'Carlos Arte',
      'María Street',
      'Pablo Urbano',
    ];
    return names[index % names.length];
  }

  String _getBio(int index) {
    final bios = [
      'Artista urbano especializado en murales de gran formato',
      'Graffitera con 10 años de experiencia en arte callejero',
      'Muralista mexicano, fusión de tradición y modernidad',
      'Performance artist y activista cultural',
      'Escultor urbano, obras en espacios públicos',
    ];
    return bios[index % bios.length];
  }

  String? _getAvatarUrl(int index) {
    // Usa los avatares 3D que tenemos en assets
    final avatars = [
      'lib/assets/3d_avatar_1.png',
      'lib/assets/3d_avatar_2.png',
      'lib/assets/3d_avatar_3.png',
      'lib/assets/3d_avatar_4.png',
      'lib/assets/3d_avatar_5.png',
    ];
    return avatars[index % avatars.length];
  }
}

