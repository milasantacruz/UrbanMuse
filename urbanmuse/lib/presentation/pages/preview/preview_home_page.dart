import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme.dart';

/// Página principal de preview para acceder a todos los componentes
class PreviewHomePage extends StatelessWidget {
  const PreviewHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Component Preview'),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Card(
            color: AppColors.primaryContainer,
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.visibility,
                        color: AppColors.onPrimaryContainer,
                        size: 32,
                      ),
                      SizedBox(width: AppSpacing.space3),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Component Showcase',
                              style: AppTextStyles.h2.copyWith(
                                color: AppColors.onPrimaryContainer,
                              ),
                            ),
                            SizedBox(height: AppSpacing.space1),
                            Text(
                              'Sistema de visualización de componentes de diseño',
                              style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.onPrimaryContainer,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space3),
                  Container(
                    padding: EdgeInsets.all(AppSpacing.space3),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.2),
                      borderRadius:
                          BorderRadius.circular(AppBorderRadius.radiusMd),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.check_circle,
                          color: AppColors.onPrimaryContainer,
                          size: 16,
                        ),
                        SizedBox(width: AppSpacing.space2),
                        Expanded(
                          child: Text(
                            'Colores sincronizados con Figma UI Kit ✅',
                            style: AppTextStyles.caption.copyWith(
                              color: AppColors.onPrimaryContainer,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Atoms Section
          _buildSectionHeader(
            icon: Icons.science,
            title: 'Atoms',
            subtitle: 'Componentes atómicos básicos',
          ),
          _buildComponentTile(
            context: context,
            title: 'Buttons',
            subtitle: 'Primary, Secondary, Outlined, Text, FAB',
            icon: Icons.smart_button,
            route: '/preview/buttons',
            badgeText: '✓ Implementado',
            badgeColor: AppColors.success,
          ),
          _buildComponentTile(
            context: context,
            title: 'Icons',
            subtitle: 'Iconos de Material y custom',
            icon: Icons.interests,
            route: '/preview/icons',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),
          _buildComponentTile(
            context: context,
            title: 'Text Styles',
            subtitle: 'Tipografía y estilos de texto',
            icon: Icons.text_fields,
            route: '/preview/text-styles',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),
          _buildComponentTile(
            context: context,
            title: 'Input Fields',
            subtitle: 'Text fields, text areas, search',
            icon: Icons.input,
            route: '/preview/inputs',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),

          SizedBox(height: AppSpacing.space6),

          // Molecules Section
          _buildSectionHeader(
            icon: Icons.category,
            title: 'Molecules',
            subtitle: 'Componentes moleculares compuestos',
          ),
          _buildComponentTile(
            context: context,
            title: 'Search Bar',
            subtitle: 'Barra de búsqueda con filtros',
            icon: Icons.search,
            route: '/preview/search-bar',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),
          _buildComponentTile(
            context: context,
            title: 'Category Badges',
            subtitle: 'Badges de categorías de obras',
            icon: Icons.label,
            route: '/preview/badges',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),
          _buildComponentTile(
            context: context,
            title: 'Map Pins',
            subtitle: 'Pins de mapa por categoría',
            icon: Icons.place,
            route: '/preview/map-pins',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),

          SizedBox(height: AppSpacing.space6),

          // Organisms Section
          _buildSectionHeader(
            icon: Icons.view_module,
            title: 'Organisms',
            subtitle: 'Componentes organizacionales complejos',
          ),
          _buildComponentTile(
            context: context,
            title: 'Obra Card',
            subtitle: 'Tarjetas de obra (grid y lista)',
            icon: Icons.art_track,
            route: '/preview/obra-card',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),
          _buildComponentTile(
            context: context,
            title: 'App Bar',
            subtitle: 'Barra de navegación superior',
            icon: Icons.web_asset,
            route: '/preview/app-bar',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),
          _buildComponentTile(
            context: context,
            title: 'Bottom Navigation',
            subtitle: 'Navegación inferior',
            icon: Icons.navigation,
            route: '/preview/bottom-nav',
            badgeText: 'Próximamente',
            badgeColor: AppColors.neutral400,
          ),

          SizedBox(height: AppSpacing.space6),

          // Design Info
          Card(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info_outline, size: 20),
                      SizedBox(width: AppSpacing.space2),
                      Text(
                        'Información del Sistema',
                        style: AppTextStyles.label.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space3),
                  _buildInfoRow('Design System', 'Material Design 3'),
                  _buildInfoRow('UI Kit Base', 'Syncfusion Flutter UI Kit'),
                  _buildInfoRow('Primary Color', '#6BA034 (verde)'),
                  _buildInfoRow('Secondary Color', '#66715B (verde oscuro)'),
                  _buildInfoRow('Border Radius', 'Sistema 8px'),
                  _buildInfoRow('Spacing', 'Sistema 8px base'),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space8),
        ],
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required String subtitle,
  }) {
    return Padding(
      padding: EdgeInsets.only(
        left: AppSpacing.space2,
        bottom: AppSpacing.space3,
      ),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.primary),
          SizedBox(width: AppSpacing.space2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.h3.copyWith(
                  color: AppColors.primary,
                ),
              ),
              Text(
                subtitle,
                style: AppTextStyles.caption.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildComponentTile({
    required BuildContext context,
    required String title,
    required String subtitle,
    required IconData icon,
    required String route,
    required String badgeText,
    required Color badgeColor,
  }) {
    final isImplemented = badgeText.contains('Implementado');

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: AppColors.primaryContainer,
          child: Icon(
            icon,
            color: AppColors.onPrimaryContainer,
          ),
        ),
        title: Text(
          title,
          style: AppTextStyles.label.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.caption,
        ),
        trailing: Container(
          padding: EdgeInsets.symmetric(
            horizontal: AppSpacing.space2,
            vertical: AppSpacing.space1,
          ),
          decoration: BoxDecoration(
            color: badgeColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(AppBorderRadius.radiusSm),
            border: Border.all(
              color: badgeColor.withOpacity(0.3),
              width: 1,
            ),
          ),
          child: Text(
            badgeText,
            style: AppTextStyles.caption.copyWith(
              color: badgeColor,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        onTap: isImplemented
            ? () {
                context.push(route);
              }
            : null,
        enabled: isImplemented,
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.space2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTextStyles.caption.copyWith(
                color: AppColors.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.caption,
            ),
          ),
        ],
      ),
    );
  }
}

