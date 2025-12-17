import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/badges/badges.dart';

/// Página de preview para visualizar y testear badges
class BadgesPreviewPage extends StatelessWidget {
  const BadgesPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Badges Preview'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Badges',
              style: AppTextStyles.h1,
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Indicadores visuales basados en Material 3 y sincronizados con Figma UI Kit',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: AppSpacing.space6),

            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Dot Badges
            _buildSection(
              title: 'Dot Badges',
              description: 'Indicadores de punto simple (6x6px)',
              children: [
                Row(
                  children: [
                    const AppBadge.dot(),
                    SizedBox(width: AppSpacing.space4),
                    Text('Default (Primary)', style: AppTextStyles.body),
                  ],
                ),
                SizedBox(height: AppSpacing.space3),
                Row(
                  children: [
                    AppBadge.dot(backgroundColor: AppColors.error),
                    SizedBox(width: AppSpacing.space4),
                    Text('Error Color', style: AppTextStyles.body),
                  ],
                ),
                SizedBox(height: AppSpacing.space3),
                Row(
                  children: [
                    AppBadge.dot(backgroundColor: AppColors.success),
                    SizedBox(width: AppSpacing.space4),
                    Text('Success Color', style: AppTextStyles.body),
                  ],
                ),
                SizedBox(height: AppSpacing.space3),
                Row(
                  children: [
                    AppBadge.dot(backgroundColor: AppColors.warning),
                    SizedBox(width: AppSpacing.space4),
                    Text('Warning Color', style: AppTextStyles.body),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Circle Badges
            _buildSection(
              title: 'Circle Badges',
              description: 'Badges circulares con números (16x16px)',
              children: [
                Wrap(
                  spacing: AppSpacing.space4,
                  runSpacing: AppSpacing.space3,
                  children: [
                    Column(
                      children: [
                        const AppBadge.circle(label: '1'),
                        SizedBox(height: AppSpacing.space1),
                        Text('1', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppBadge.circle(label: '3'),
                        SizedBox(height: AppSpacing.space1),
                        Text('3', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        const AppBadge.circle(label: '9'),
                        SizedBox(height: AppSpacing.space1),
                        Text('9', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        AppBadge.circle(
                          label: '5',
                          backgroundColor: AppColors.error,
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Error', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        AppBadge.circle(
                          label: '2',
                          backgroundColor: AppColors.success,
                        ),
                        SizedBox(height: AppSpacing.space1),
                        Text('Success', style: AppTextStyles.caption),
                      ],
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Rounded Badges
            _buildSection(
              title: 'Rounded Badges',
              description: 'Badges redondeados con texto',
              children: [
                Wrap(
                  spacing: AppSpacing.space3,
                  runSpacing: AppSpacing.space3,
                  children: const [
                    AppBadge.rounded(label: 'Nuevo'),
                    AppBadge.rounded(label: '12'),
                    AppBadge.rounded(label: '123'),
                    AppBadge.rounded(label: '12345'),
                    AppBadge.rounded(label: '99+'),
                  ],
                ),
                SizedBox(height: AppSpacing.space4),
                Text(
                  'Con colores personalizados:',
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(height: AppSpacing.space3),
                Wrap(
                  spacing: AppSpacing.space3,
                  runSpacing: AppSpacing.space3,
                  children: [
                    AppBadge.rounded(
                      label: 'Error',
                      backgroundColor: AppColors.error,
                    ),
                    AppBadge.rounded(
                      label: 'Success',
                      backgroundColor: AppColors.success,
                    ),
                    AppBadge.rounded(
                      label: 'Warning',
                      backgroundColor: AppColors.warning,
                    ),
                    AppBadge.rounded(
                      label: 'Info',
                      backgroundColor: AppColors.info,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Category Badges
            _buildSection(
              title: 'Category Badges',
              description: 'Badges de categorías con colores específicos',
              children: [
                Wrap(
                  spacing: AppSpacing.space3,
                  runSpacing: AppSpacing.space3,
                  children: const [
                    CategoryBadge.rounded(category: 'Graffiti'),
                    CategoryBadge.rounded(category: 'Mural'),
                    CategoryBadge.rounded(category: 'Escultura'),
                    CategoryBadge.rounded(category: 'Performance'),
                  ],
                ),
                SizedBox(height: AppSpacing.space4),
                Text(
                  'Versiones circle:',
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(height: AppSpacing.space3),
                Wrap(
                  spacing: AppSpacing.space4,
                  runSpacing: AppSpacing.space3,
                  children: const [
                    CategoryBadge.circle(category: 'G'),
                    CategoryBadge.circle(category: 'M'),
                    CategoryBadge.circle(category: 'E'),
                    CategoryBadge.circle(category: 'P'),
                  ],
                ),
                SizedBox(height: AppSpacing.space4),
                Text(
                  'Versiones dot:',
                  style: AppTextStyles.bodySmall,
                ),
                SizedBox(height: AppSpacing.space3),
                Row(
                  children: [
                    const CategoryBadge.dot(category: 'Graffiti'),
                    SizedBox(width: AppSpacing.space2),
                    Text('Graffiti', style: AppTextStyles.bodySmall),
                    SizedBox(width: AppSpacing.space4),
                    const CategoryBadge.dot(category: 'Mural'),
                    SizedBox(width: AppSpacing.space2),
                    Text('Mural', style: AppTextStyles.bodySmall),
                    SizedBox(width: AppSpacing.space4),
                    const CategoryBadge.dot(category: 'Escultura'),
                    SizedBox(width: AppSpacing.space2),
                    Text('Escultura', style: AppTextStyles.bodySmall),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Notification Badges
            _buildSection(
              title: 'Notification Badges',
              description: 'Badges de notificación sobre iconos',
              children: [
                Wrap(
                  spacing: AppSpacing.space6,
                  runSpacing: AppSpacing.space4,
                  children: [
                    Column(
                      children: [
                        NotificationBadge(
                          count: 3,
                          child: Icon(Icons.notifications, size: 32),
                        ),
                        SizedBox(height: AppSpacing.space2),
                        Text('count: 3', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        NotificationBadge(
                          count: 99,
                          child: Icon(Icons.email, size: 32),
                        ),
                        SizedBox(height: AppSpacing.space2),
                        Text('count: 99', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        NotificationBadge(
                          count: 150,
                          child: Icon(Icons.chat_bubble, size: 32),
                        ),
                        SizedBox(height: AppSpacing.space2),
                        Text('count: 150 (99+)', style: AppTextStyles.caption),
                      ],
                    ),
                    Column(
                      children: [
                        NotificationBadge(
                          count: 1,
                          type: AppBadgeType.dot,
                          child: Icon(Icons.favorite, size: 32),
                        ),
                        SizedBox(height: AppSpacing.space2),
                        Text('dot type', style: AppTextStyles.caption),
                      ],
                    ),
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
              description: 'Uso de badges en contexto real',
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

  Widget _buildPracticalExample() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Lista de obras con categorías
            Text(
              'Obras de Arte',
              style: AppTextStyles.h3,
            ),
            SizedBox(height: AppSpacing.space4),
            _buildObraItem(
              title: 'El Beso de la Libertad',
              category: 'Mural',
              isNew: true,
            ),
            SizedBox(height: AppSpacing.space3),
            _buildObraItem(
              title: 'Revolución Urbana',
              category: 'Graffiti',
              isNew: false,
            ),
            SizedBox(height: AppSpacing.space3),
            _buildObraItem(
              title: 'Monumento al Futuro',
              category: 'Escultura',
              isNew: false,
            ),
            SizedBox(height: AppSpacing.space6),
            const Divider(),
            SizedBox(height: AppSpacing.space4),

            // Navigation con notificaciones
            Text(
              'Navegación',
              style: AppTextStyles.h3,
            ),
            SizedBox(height: AppSpacing.space4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildNavItem(
                  icon: Icons.explore,
                  label: 'Explorar',
                  count: 0,
                ),
                _buildNavItem(
                  icon: Icons.favorite,
                  label: 'Favoritos',
                  count: 5,
                ),
                _buildNavItem(
                  icon: Icons.route,
                  label: 'Rutas',
                  count: 2,
                ),
                _buildNavItem(
                  icon: Icons.notifications,
                  label: 'Avisos',
                  count: 12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildObraItem({
    required String title,
    required String category,
    required bool isNew,
  }) {
    return Row(
      children: [
        const CategoryBadge.dot(category: 'Default'),
        SizedBox(width: AppSpacing.space2),
        Expanded(
          child: Text(
            title,
            style: AppTextStyles.body,
          ),
        ),
        CategoryBadge.rounded(category: category),
        if (isNew) ...[
          SizedBox(width: AppSpacing.space2),
          AppBadge.rounded(
            label: 'Nuevo',
            backgroundColor: AppColors.success,
          ),
        ],
      ],
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required String label,
    required int count,
  }) {
    return Column(
      children: [
        NotificationBadge(
          count: count,
          child: Icon(icon, size: 28),
        ),
        SizedBox(height: AppSpacing.space1),
        Text(
          label,
          style: AppTextStyles.caption,
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
                  'Uso de Badges',
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space3),
            Text(
              '// Dot badge\n'
              'AppBadge.dot()\n\n'
              '// Circle badge\n'
              'AppBadge.circle(label: \'3\')\n\n'
              '// Rounded badge\n'
              'AppBadge.rounded(label: \'Nuevo\')\n\n'
              '// Category badge\n'
              'CategoryBadge.rounded(category: \'Mural\')\n\n'
              '// Notification badge\n'
              'NotificationBadge(\n'
              '  count: 5,\n'
              '  child: Icon(Icons.notifications),\n'
              ')',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

