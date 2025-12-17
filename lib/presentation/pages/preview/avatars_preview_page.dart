import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/avatars/avatars.dart';

/// Página de preview para visualizar y testear avatars
class AvatarsPreviewPage extends StatelessWidget {
  const AvatarsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatars Preview'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Avatars',
              style: AppTextStyles.h1,
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Componentes de avatar basados en Material 3 y sincronizados con Figma UI Kit',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: AppSpacing.space6),

            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Avatar Sizes
            _buildSection(
              title: 'Tamaños de Avatar',
              description: 'Avatares con imágenes en diferentes tamaños',
              children: [
                Wrap(
                  spacing: AppSpacing.space4,
                  runSpacing: AppSpacing.space4,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: [
                    Column(
                      children: [
                        const AppAvatar.simple(
                          imageUrl: 'lib/assets/3d_avatar_1.png',
                          size: AvatarSize.small,
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Small (32px)', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppAvatar.simple(
                          imageUrl: 'lib/assets/3d_avatar_2.png',
                          size: AvatarSize.medium,
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Medium (48px)', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppAvatar.simple(
                          imageUrl: 'lib/assets/3d_avatar_3.png',
                          size: AvatarSize.large,
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Large (64px)', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppAvatar.simple(
                          imageUrl: 'lib/assets/3d_avatar_4.png',
                          size: AvatarSize.xLarge,
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('XLarge (88px)', style: AppTextStyles.caption),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Avatar with Verified Badge
            _buildSection(
              title: 'Avatares Verificados',
              description: 'Avatares con badge de verificación azul',
              children: [
                Wrap(
                  spacing: AppSpacing.space4,
                  runSpacing: AppSpacing.space4,
                  children: [
                    Column(
                      children: [
                        const AppAvatar.verified(
                          imageUrl: 'lib/assets/3d_avatar_1.png',
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Diego Mural', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppAvatar.verified(
                          imageUrl: 'lib/assets/3d_avatar_5.png',
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Laura Art', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppAvatar.verified(
                          imageUrl: 'lib/assets/3d_avatar_6.png',
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Max Graf', style: AppTextStyles.caption),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Avatar with Edit Badge
            _buildSection(
              title: 'Avatares Editables',
              description: 'Avatares con badge de edición (click para editar)',
              children: [
                Wrap(
                  spacing: AppSpacing.space4,
                  runSpacing: AppSpacing.space4,
                  children: [
                    Column(
                      children: [
                        AppAvatar.editable(
                          imageUrl: 'lib/assets/3d_avatar_2.png',
                          onEdit: () {
                            _showEditDialog(context, 'Cambiar foto de perfil');
                          },
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Tu Perfil', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        AppAvatar.editable(
                          imageUrl: 'lib/assets/3d_avatar_3.png',
                          onEdit: () {
                            _showEditDialog(context, 'Actualizar avatar');
                          },
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Artista', style: AppTextStyles.caption),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Avatar con iniciales
            _buildSection(
              title: 'Avatares con Iniciales',
              description: 'Avatares mostrando iniciales (fallback sin imagen)',
              children: [
                Wrap(
                  spacing: AppSpacing.space3,
                  runSpacing: AppSpacing.space3,
                  children: [
                    _buildAvatarWithName('Diego Mural', 'DM'),
                    _buildAvatarWithName('Laura Art', 'LA'),
                    _buildAvatarWithName('Max Graf', 'MG'),
                    _buildAvatarWithName('Ana Silva', 'AS'),
                    _buildAvatarWithName('Pedro Torres', 'PT'),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Mixed: Images + Initials
            _buildSection(
              title: 'Mixto: Imágenes + Iniciales',
              description: 'Combinación de avatares con imágenes e iniciales',
              children: [
                Wrap(
                  spacing: AppSpacing.space3,
                  runSpacing: AppSpacing.space3,
                  children: [
                    _buildAvatarWithImage('lib/assets/3d_avatar_1.png', 'Diego Mural'),
                    _buildAvatarWithName('Laura Art', 'LA'),
                    _buildAvatarWithImage('lib/assets/3d_avatar_4.png', 'Max Graf'),
                    _buildAvatarWithName('Ana Silva', 'AS'),
                    _buildAvatarWithImage('lib/assets/3d_avatar_6.png', 'Pedro Torres'),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Circle Avatar (para listas)
            _buildSection(
              title: 'Circle Avatars',
              description: 'Avatares circulares simples para listas y cards',
              children: [
                Wrap(
                  spacing: AppSpacing.space3,
                  runSpacing: AppSpacing.space3,
                  children: const [
                    AppCircleAvatar(initials: 'A', size: 32),
                    AppCircleAvatar(initials: 'B', size: 40),
                    AppCircleAvatar(initials: 'C', size: 48),
                    AppCircleAvatar(initials: 'D', size: 56),
                    AppCircleAvatar(initials: 'E', size: 64),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Practical Examples
            _buildSection(
              title: 'Ejemplos Prácticos',
              description: 'Uso de avatares en contexto real',
              children: [
                _buildPracticalExample(),
              ],
            ),

            SizedBox(height: AppSpacing.space8),

            // Usage Info
            _buildUsageInfo(),

            SizedBox(height: AppSpacing.space8),
          ],
        ),
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
        Text(
          title,
          style: AppTextStyles.h2,
        ),
        SizedBox(height: AppSpacing.space2),
        Text(
          description,
          style: AppTextStyles.bodySmall,
        ),
        SizedBox(height: AppSpacing.space4),
        ...children,
      ],
    );
  }

  Widget _buildAvatarWithName(String name, String initials) {
    return Column(
      children: [
        AppCircleAvatar(
          initials: initials,
          size: 48,
          backgroundColor: _getRandomColor(initials),
        ),
        SizedBox(height: AppSpacing.space1),
        Text(
          name,
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildAvatarWithImage(String imageUrl, String name) {
    return Column(
      children: [
        AppCircleAvatar(
          imageUrl: imageUrl,
          size: 48,
        ),
        SizedBox(height: AppSpacing.space1),
        Text(
          name,
          style: AppTextStyles.caption,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Color _getRandomColor(String initials) {
    final colors = [
      AppColors.categoryGraffiti.withOpacity(0.2),
      AppColors.categoryMural.withOpacity(0.2),
      AppColors.categoryEscultura.withOpacity(0.2),
      AppColors.categoryPerformance.withOpacity(0.2),
      AppColors.primary.withOpacity(0.2),
    ];
    final index = initials.hashCode.abs() % colors.length;
    return colors[index];
  }

  Widget _buildPracticalExample() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Perfil de usuario
            Text(
              'Perfil de Artista',
              style: AppTextStyles.h3,
            ),
            SizedBox(height: AppSpacing.space4),
            Row(
              children: [
                const AppAvatar.verified(
                  imageUrl: 'lib/assets/3d_avatar_1.png',
                  size: AvatarSize.xLarge,
                ),
                SizedBox(width: AppSpacing.space4),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Diego Mural',
                            style: AppTextStyles.h3,
                          ),
                          SizedBox(width: AppSpacing.space1),
                          const Icon(
                            Icons.verified,
                            size: 18,
                            color: Color(0xFF1D9BF0),
                          ),
                        ],
                      ),
                      Text(
                        '@diegomural_art',
                        style: AppTextStyles.bodySmall,
                      ),
                      SizedBox(height: AppSpacing.space2),
                      Text(
                        'Artista urbano especializado en murales',
                        style: AppTextStyles.caption,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space6),
            const Divider(),
            SizedBox(height: AppSpacing.space4),

            // Lista de comentarios
            Text(
              'Comentarios Recientes',
              style: AppTextStyles.h3,
            ),
            SizedBox(height: AppSpacing.space4),
            _buildCommentItem(
              name: 'Laura Art',
              imageUrl: 'lib/assets/3d_avatar_5.png',
              comment: 'Increíble obra! 🎨',
            ),
            SizedBox(height: AppSpacing.space3),
            _buildCommentItem(
              name: 'Max Graf',
              imageUrl: 'lib/assets/3d_avatar_6.png',
              comment: 'Me encanta el uso de colores',
            ),
            SizedBox(height: AppSpacing.space3),
            _buildCommentItem(
              name: 'Ana Silva',
              initials: 'AS',
              comment: 'Dónde está ubicado?',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCommentItem({
    required String name,
    String? imageUrl,
    String? initials,
    required String comment,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppCircleAvatar(
          imageUrl: imageUrl,
          initials: initials,
          size: 40,
          backgroundColor: initials != null ? _getRandomColor(initials) : null,
        ),
        SizedBox(width: AppSpacing.space3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: AppTextStyles.label,
              ),
              SizedBox(height: AppSpacing.space1),
              Text(
                comment,
                style: AppTextStyles.body,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildUsageInfo() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.code, size: 20),
                SizedBox(width: AppSpacing.space2),
                Text(
                  'Uso de Avatares',
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space3),
            Text(
              '// Con imagen local\n'
              'AppAvatar.simple(\n'
              '  imageUrl: \'lib/assets/3d_avatar_1.png\',\n'
              '  size: AvatarSize.medium,\n'
              ')\n\n'
              '// Con iniciales (fallback)\n'
              'AppAvatar.simple(\n'
              '  initials: \'DM\',\n'
              '  size: AvatarSize.medium,\n'
              ')\n\n'
              '// Avatar verificado\n'
              'AppAvatar.verified(\n'
              '  imageUrl: \'lib/assets/3d_avatar_1.png\',\n'
              ')\n\n'
              '// Avatar editable\n'
              'AppAvatar.editable(\n'
              '  imageUrl: \'lib/assets/3d_avatar_2.png\',\n'
              '  onEdit: () => _pickImage(),\n'
              ')\n\n'
              '// Circle avatar (para listas)\n'
              'AppCircleAvatar(\n'
              '  imageUrl: \'https://...\',  // URL remota\n'
              '  size: 40,\n'
              ')',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }

  void _showEditDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(title),
        content: const Text('Aquí se abriría el selector de imagen'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Seleccionar'),
          ),
        ],
      ),
    );
  }
}

