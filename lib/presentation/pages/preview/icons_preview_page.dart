import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/icons/icons.dart';

/// Página de preview para visualizar y testear componentes de iconos
class IconsPreviewPage extends StatelessWidget {
  const IconsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Icons Preview'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Icon Components',
              style: AppTextStyles.h1,
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Iconos basados en Material Icons y sincronizados con Figma UI Kit',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: AppSpacing.space6),

            // Divider
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Icon Sizes
            _buildSection(
              title: 'Icon Sizes',
              description: 'Tamaños de iconos disponibles según Material 3',
              children: [
                Row(
                  children: [
                    _buildIconSizeDemo(
                      icon: AppIcons.home,
                      size: AppIconSize.small,
                      label: 'Small (16px)',
                    ),
                    SizedBox(width: AppSpacing.space6),
                    _buildIconSizeDemo(
                      icon: AppIcons.home,
                      size: AppIconSize.medium,
                      label: 'Medium (24px)',
                    ),
                    SizedBox(width: AppSpacing.space6),
                    _buildIconSizeDemo(
                      icon: AppIcons.home,
                      size: AppIconSize.large,
                      label: 'Large (32px)',
                    ),
                    SizedBox(width: AppSpacing.space6),
                    _buildIconSizeDemo(
                      icon: AppIcons.home,
                      size: AppIconSize.extraLarge,
                      label: 'XLarge (48px)',
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Navigation Icons
            _buildSection(
              title: 'Navigation Icons',
              description: 'Iconos para navegación principal',
              children: [
                _buildIconGrid([
                  _IconItem(icon: AppIcons.home, label: 'home'),
                  _IconItem(icon: AppIcons.homeFilled, label: 'home_filled'),
                  _IconItem(icon: AppIcons.explore, label: 'explore'),
                  _IconItem(icon: AppIcons.exploreFilled, label: 'explore_filled'),
                  _IconItem(icon: AppIcons.route, label: 'route'),
                  _IconItem(icon: AppIcons.routeFilled, label: 'route_filled'),
                  _IconItem(icon: AppIcons.favorite, label: 'favorite'),
                  _IconItem(icon: AppIcons.favoriteFilled, label: 'favorite_filled'),
                  _IconItem(icon: AppIcons.profile, label: 'profile'),
                  _IconItem(icon: AppIcons.profileFilled, label: 'profile_filled'),
                ]),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Action Icons
            _buildSection(
              title: 'Action Icons',
              description: 'Iconos para acciones principales',
              children: [
                _buildIconGrid([
                  _IconItem(icon: AppIcons.search, label: 'search'),
                  _IconItem(icon: AppIcons.filter, label: 'filter'),
                  _IconItem(icon: AppIcons.filterFilled, label: 'filter_filled'),
                  _IconItem(icon: AppIcons.add, label: 'add'),
                  _IconItem(icon: AppIcons.share, label: 'share'),
                  _IconItem(icon: AppIcons.close, label: 'close'),
                  _IconItem(icon: AppIcons.back, label: 'back'),
                  _IconItem(icon: AppIcons.moreVert, label: 'more_vert'),
                  _IconItem(icon: AppIcons.edit, label: 'edit'),
                  _IconItem(icon: AppIcons.delete, label: 'delete'),
                ]),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Category Icons
            _buildSection(
              title: 'Category Icons',
              description: 'Iconos de categorías con colores específicos',
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildCategoryDemo(ArtCategory.graffiti, 'Graffiti'),
                    _buildCategoryDemo(ArtCategory.mural, 'Mural'),
                    _buildCategoryDemo(ArtCategory.escultura, 'Escultura'),
                    _buildCategoryDemo(ArtCategory.performance, 'Performance'),
                  ],
                ),
                SizedBox(height: AppSpacing.space4),
                Text(
                  'Los iconos de categorías usan colores específicos del design system',
                  style: AppTextStyles.caption,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Map Icons
            _buildSection(
              title: 'Map Icons',
              description: 'Iconos para funcionalidades del mapa',
              children: [
                _buildIconGrid([
                  _IconItem(icon: AppIcons.location, label: 'location'),
                  _IconItem(icon: AppIcons.locationFilled, label: 'location_filled'),
                  _IconItem(icon: AppIcons.myLocation, label: 'my_location'),
                  _IconItem(icon: AppIcons.directions, label: 'directions'),
                  _IconItem(icon: AppIcons.directionsWalk, label: 'walk'),
                  _IconItem(icon: AppIcons.directionsBike, label: 'bike'),
                ]),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Social Icons
            _buildSection(
              title: 'Social Icons',
              description: 'Iconos para funcionalidades sociales',
              children: [
                _buildIconGrid([
                  _IconItem(icon: AppIcons.group, label: 'group'),
                  _IconItem(icon: AppIcons.groupFilled, label: 'group_filled'),
                  _IconItem(icon: AppIcons.person, label: 'person'),
                  _IconItem(icon: AppIcons.personFilled, label: 'person_filled'),
                ]),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // UI Icons
            _buildSection(
              title: 'UI Icons',
              description: 'Iconos para elementos de interfaz',
              children: [
                _buildIconGrid([
                  _IconItem(icon: AppIcons.check, label: 'check'),
                  _IconItem(icon: AppIcons.checkCircle, label: 'check_circle'),
                  _IconItem(icon: AppIcons.error, label: 'error'),
                  _IconItem(icon: AppIcons.warning, label: 'warning'),
                  _IconItem(icon: AppIcons.info, label: 'info'),
                  _IconItem(icon: AppIcons.visibility, label: 'visibility'),
                  _IconItem(icon: AppIcons.visibilityOff, label: 'visibility_off'),
                  _IconItem(icon: AppIcons.calendar, label: 'calendar'),
                  _IconItem(icon: AppIcons.time, label: 'time'),
                  _IconItem(icon: AppIcons.arrowForward, label: 'arrow_forward'),
                  _IconItem(icon: AppIcons.chevronRight, label: 'chevron_right'),
                  _IconItem(icon: AppIcons.expandMore, label: 'expand_more'),
                ]),
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

  Widget _buildIconSizeDemo({
    required IconData icon,
    required AppIconSize size,
    required String label,
  }) {
    return Column(
      children: [
        AppIcon(icon: icon, size: size),
        SizedBox(height: AppSpacing.space2),
        Text(
          label,
          style: AppTextStyles.caption,
        ),
      ],
    );
  }

  Widget _buildIconGrid(List<_IconItem> icons) {
    return Wrap(
      spacing: AppSpacing.space4,
      runSpacing: AppSpacing.space4,
      children: icons.map((item) {
        return SizedBox(
          width: 80,
          child: Column(
            children: [
              AppIcon.large(icon: item.icon),
              SizedBox(height: AppSpacing.space2),
              Text(
                item.label,
                style: AppTextStyles.caption,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildCategoryDemo(ArtCategory category, String label) {
    return Column(
      children: [
        CategoryIcon(
          category: category,
          size: AppIconSize.extraLarge,
        ),
        SizedBox(height: AppSpacing.space2),
        Text(
          label,
          style: AppTextStyles.caption.copyWith(
            fontWeight: FontWeight.w600,
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
                  'Uso de Iconos',
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space3),
            Text(
              '// Usar tamaños predefinidos\n'
              'AppIcon.small(icon: AppIcons.home)\n'
              'AppIcon.medium(icon: AppIcons.search)\n'
              'AppIcon.large(icon: AppIcons.favorite)\n\n'
              '// Iconos de categorías con color\n'
              'CategoryIcon(category: ArtCategory.graffiti)',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

class _IconItem {
  final IconData icon;
  final String label;

  const _IconItem({
    required this.icon,
    required this.label,
  });
}

