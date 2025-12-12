import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/dividers/dividers.dart';

/// DividersPreviewPage
/// 
/// Página de showcase para el componente AppDivider
/// Muestra todas las variantes: horizontal, vertical, inset, con subencabezado
class DividersPreviewPage extends StatelessWidget {
  const DividersPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dividers Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Dividers',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Separadores horizontales y verticales siguiendo Material 3',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Horizontal Dividers Section
          _buildSection(
            title: 'Dividers Horizontales',
            description: 'Separadores horizontales en diferentes variantes',
            children: [
              // Full-width
              _buildDividerExample(
                title: 'Full-width',
                description: 'Divider que ocupa todo el ancho',
                divider: const AppDivider.fullWidth(),
              ),
              SizedBox(height: AppSpacing.space6),

              // Inset
              _buildDividerExample(
                title: 'Inset',
                description: 'Divider con padding izquierdo de 16px',
                divider: const AppDivider.inset(),
              ),
              SizedBox(height: AppSpacing.space6),

              // Middle Inset
              _buildDividerExample(
                title: 'Middle Inset',
                description: 'Divider con padding horizontal de 16px',
                divider: const AppDivider.middleInset(),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Divider with Subhead
          _buildSection(
            title: 'Divider con Subencabezado',
            description: 'Divider seguido de un texto de subencabezado',
            children: [
              _buildDividerExample(
                title: 'With Subhead',
                description: 'Divider + subheader de 14px',
                divider: const AppDivider.withSubhead(
                  subheadText: 'Subheader',
                ),
              ),
              SizedBox(height: AppSpacing.space4),
              _buildDividerExample(
                title: 'Custom Subhead',
                description: 'Divider con texto personalizado',
                divider: const AppDivider.withSubhead(
                  subheadText: 'Obras Recientes',
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Vertical Dividers Section
          _buildSection(
            title: 'Dividers Verticales',
            description: 'Separadores verticales en diferentes alturas',
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildVerticalExample(
                    title: 'Full-width',
                    divider: const AppDivider.verticalFullWidth(),
                  ),
                  _buildVerticalExample(
                    title: 'Inset',
                    divider: const AppDivider.verticalInset(),
                  ),
                  _buildVerticalExample(
                    title: 'Middle Inset',
                    divider: const AppDivider.verticalMiddleInset(),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Practical Examples
          _buildSection(
            title: 'Ejemplos Prácticos',
            description: 'Uso de dividers en contextos reales',
            children: [
              // Lista con dividers
              Text('Lista de Obras', style: AppTextStyles.h3),
              SizedBox(height: AppSpacing.space4),
              Card(
                child: Column(
                  children: [
                    _buildListItem('Mural en Av. Reforma', 'Diego Mural'),
                    const AppDivider.inset(),
                    _buildListItem('Graffiti en Centro', 'Laura Art'),
                    const AppDivider.inset(),
                    _buildListItem('Escultura Urbana', 'Max Graf'),
                  ],
                ),
              ),

              SizedBox(height: AppSpacing.space6),

              // Secciones con subheader
              Text('Secciones con Subheader', style: AppTextStyles.h3),
              SizedBox(height: AppSpacing.space4),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Perfil de Artista', style: AppTextStyles.h2),
                      SizedBox(height: AppSpacing.space4),
                      const AppDivider.withSubhead(
                        subheadText: 'Información Personal',
                      ),
                      SizedBox(height: AppSpacing.space3),
                      Text('Nombre: Diego Mural', style: AppTextStyles.body),
                      Text('Ciudad: CDMX', style: AppTextStyles.body),
                      SizedBox(height: AppSpacing.space4),
                      const AppDivider.withSubhead(
                        subheadText: 'Obras Destacadas',
                      ),
                      SizedBox(height: AppSpacing.space3),
                      Text('15 murales', style: AppTextStyles.body),
                      Text('8 esculturas', style: AppTextStyles.body),
                    ],
                  ),
                ),
              ),

              SizedBox(height: AppSpacing.space6),

              // Dividers verticales en navegación
              Text('Navegación Horizontal', style: AppTextStyles.h3),
              SizedBox(height: AppSpacing.space4),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildNavItem('Inicio', Icons.home),
                      const AppDivider.verticalFullWidth(height: 40),
                      _buildNavItem('Feed', Icons.grid_view),
                      const AppDivider.verticalFullWidth(height: 40),
                      _buildNavItem('Rutas', Icons.route),
                      const AppDivider.verticalFullWidth(height: 40),
                      _buildNavItem('Top 10', Icons.star),
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
            description: 'Cómo usar los dividers en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Horizontal full-width\n'
                  'AppDivider.fullWidth()\n\n'
                  '// Horizontal con inset\n'
                  'AppDivider.inset()\n\n'
                  '// Con subencabezado\n'
                  'AppDivider.withSubhead(\n'
                  '  subheadText: \'Obras Recientes\',\n'
                  ')\n\n'
                  '// Vertical\n'
                  'AppDivider.verticalFullWidth(\n'
                  '  height: 120,\n'
                  ')\n\n'
                  '// Custom color\n'
                  'AppDivider.fullWidth(\n'
                  '  color: AppColors.primary,\n'
                  '  thickness: 2,\n'
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

  Widget _buildDividerExample({
    required String title,
    required String description,
    required Widget divider,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.label),
        SizedBox(height: AppSpacing.space1),
        Text(description, style: AppTextStyles.caption),
        SizedBox(height: AppSpacing.space3),
        Container(
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor.withOpacity(0.3)),
            borderRadius: AppBorderRadius.medium,
          ),
          child: divider,
        ),
      ],
    );
  }

  Widget _buildVerticalExample({
    required String title,
    required Widget divider,
  }) {
    return Column(
      children: [
        Container(
          height: 120,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor.withOpacity(0.3)),
            borderRadius: AppBorderRadius.medium,
          ),
          child: divider,
        ),
        SizedBox(height: AppSpacing.space2),
        Text(title, style: AppTextStyles.caption),
      ],
    );
  }

  Widget _buildListItem(String title, String subtitle) {
    return ListTile(
      leading: const Icon(Icons.art_track),
      title: Text(title, style: AppTextStyles.body),
      subtitle: Text(subtitle, style: AppTextStyles.caption),
      trailing: const Icon(Icons.chevron_right),
    );
  }

  Widget _buildNavItem(String label, IconData icon) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 24),
        SizedBox(height: AppSpacing.space1),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}

