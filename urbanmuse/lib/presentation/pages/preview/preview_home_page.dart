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
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.visibility,
                        size: 32,
                      ),
                      SizedBox(width: AppSpacing.space3),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Component Showcase',
                              style: AppTextStyles.h2,
                            ),
                            SizedBox(height: AppSpacing.space1),
                            Text(
                              'Sistema de visualización de componentes de diseño',
                              style: AppTextStyles.bodySmall,
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
                      borderRadius:
                          BorderRadius.circular(AppBorderRadius.radiusMd),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.check_circle,
                          size: 16,
                        ),
                        SizedBox(width: AppSpacing.space2),
                        Expanded(
                          child: Text(
                            'Colores sincronizados con Figma UI Kit ✅',
                            style: AppTextStyles.caption.copyWith(
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
          ),
          _buildComponentTile(
            context: context,
            title: 'Icons',
            subtitle: 'Iconos de Material y custom',
            icon: Icons.interests,
            route: '/preview/icons',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Text Styles',
            subtitle: 'Tipografía y estilos de texto',
            icon: Icons.text_fields,
            route: '/preview/text-styles',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Input Fields',
            subtitle: 'Text fields, text areas, search',
            icon: Icons.input,
            route: '/preview/inputs',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Badges',
            subtitle: 'Dot, Circle, Rounded, Category',
            icon: Icons.label,
            route: '/preview/badges',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Avatars',
            subtitle: 'Avatar con verified y edit badges',
            icon: Icons.account_circle,
            route: '/preview/avatars',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Dividers',
            subtitle: 'Separadores horizontales y verticales',
            icon: Icons.horizontal_rule,
            route: '/preview/dividers',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Loading Indicators',
            subtitle: 'Progress indicators circulares y lineales',
            icon: Icons.refresh,
            route: '/preview/loading',
            badgeText: '✓ Implementado',
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
            subtitle: 'Barra de búsqueda con filtros y autocomplete',
            icon: Icons.search,
            route: '/preview/search-bar',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Filter Chips',
            subtitle: 'Chips de filtro multi-select con grupos',
            icon: Icons.filter_alt,
            route: '/preview/chips',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Map Pins',
            subtitle: 'Pins de mapa por categoría de arte urbano',
            icon: Icons.place,
            route: '/preview/map-pins',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Tooltips',
            subtitle: 'Tooltips informativos (Normal y With Header)',
            icon: Icons.chat_bubble_outline,
            route: '/preview/tooltips',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Dialog Box',
            subtitle: 'Cajas de diálogo con header, content y footer',
            icon: Icons.crop_square,
            route: '/preview/dialogs',
            badgeText: '✓ Implementado',
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
            subtitle: 'Tarjetas de obra (grid, list, compact)',
            icon: Icons.art_track,
            route: '/preview/obra-card',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Artist Card',
            subtitle: 'Tarjetas de artista con avatar, bio y stats',
            icon: Icons.person,
            route: '/preview/artist-card',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'App Bars & Navigation',
            subtitle: 'Top bars (home, detail, map) + Bottom nav',
            icon: Icons.view_carousel,
            route: '/preview/app-bars',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Ruta Card',
            subtitle: 'Tarjetas de ruta con mapa, stats y acciones',
            icon: Icons.route,
            route: '/preview/ruta-card',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Top 10 Grid Item',
            subtitle: 'Items del grid Top 10 con ranking y overlay',
            icon: Icons.star,
            route: '/preview/top10-item',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Filter Modal',
            subtitle: 'Modal de filtros (categorías y artistas)',
            icon: Icons.filter_alt,
            route: '/preview/filter-modal',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Obra Preview Bottom Sheet',
            subtitle: 'Bottom sheet para preview de obra desde mapa',
            icon: Icons.open_in_browser,
            route: '/preview/obra-preview-bottom-sheet',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Route Step Indicator',
            subtitle: 'Indicador de pasos para creación de rutas (6 pasos)',
            icon: Icons.timeline,
            route: '/preview/route-step-indicator',
            badgeText: '✓ Implementado',
          ),
          _buildComponentTile(
            context: context,
            title: 'Obra Detail Header',
            subtitle: 'Header hero para página de detalle de obra',
            icon: Icons.image,
            route: '/preview/obra-detail-header',
            badgeText: '✓ Implementado',
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
          Icon(icon, size: 20),
          SizedBox(width: AppSpacing.space2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: AppTextStyles.h3,
              ),
              Text(
                subtitle,
                style: AppTextStyles.caption,
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
  }) {
    final isImplemented = badgeText.contains('Implementado');

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          child: Icon(icon),
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
            borderRadius: BorderRadius.circular(AppBorderRadius.radiusSm),
            border: Border.all(width: 1),
          ),
          child: Text(
            badgeText,
            style: AppTextStyles.caption.copyWith(
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

