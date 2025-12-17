import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/app_bars/app_bars.dart';

/// AppBarsPreviewPage
/// 
/// Página de showcase para AppTopBar y AppBottomNav
/// Muestra todas las variantes y ejemplos de uso
class AppBarsPreviewPage extends StatefulWidget {
  const AppBarsPreviewPage({super.key});

  @override
  State<AppBarsPreviewPage> createState() => _AppBarsPreviewPageState();
}

class _AppBarsPreviewPageState extends State<AppBarsPreviewPage> {
  int _bottomNavIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppTopBar.detail(
        title: 'App Bars Preview',
        onBack: () => Navigator.of(context).pop(),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'App Bars',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Barras de navegación superior e inferior',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Top App Bar - Home
          _buildSection(
            title: 'Top App Bar - Home',
            description: 'Título + Search + Filter (MapaPage, FeedPage)',
            children: [
              _buildAppBarPreview(
                appBar: const AppTopBar.home(
                  title: 'Graffiti Trails',
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Top App Bar - Detail
          _buildSection(
            title: 'Top App Bar - Detail',
            description: 'Back + Título centrado + Share + More',
            children: [
              _buildAppBarPreview(
                appBar: const AppTopBar.detail(
                  title: 'Mural de la Libertad',
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Top App Bar - Create
          _buildSection(
            title: 'Top App Bar - Create/Edit',
            description: 'Close + Título centrado + Save/Next',
            children: [
              _buildAppBarPreview(
                appBar: AppTopBar.create(
                  title: 'Crear Ruta',
                  actions: [
                    TextButton(
                      onPressed: () {},
                      child: const Text('Siguiente'),
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Top App Bar - Map (Transparent)
          _buildSection(
            title: 'Top App Bar - Map',
            description: 'Transparente para superposición en mapa',
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: AppBorderRadius.medium,
                  image: const DecorationImage(
                    image: NetworkImage('https://picsum.photos/400/200'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    const AppTopBar.map(
                      title: null,
                    ),
                  ],
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Map Bar (Floating Buttons)
          _buildSection(
            title: 'Map Bar - Floating Buttons',
            description: 'Botones flotantes para el mapa',
            children: [
              Container(
                height: 120,
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: AppBorderRadius.medium,
                ),
                child: AppMapBar(
                  searchHint: 'Buscar obras...',
                  onSearchTap: () {
                    debugPrint('Search tapped');
                  },
                  onFilterTap: () {
                    debugPrint('Filter tapped');
                  },
                  onLocationTap: () {
                    debugPrint('Location tapped');
                  },
                ),
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Bottom Navigation Bar - Interactivo
          _buildSection(
            title: 'Bottom Navigation Bar - Interactivo',
            description: 'Navega entre los 4 items: Mapa, Explorar, Rutas, Top 10',
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  border: Border.all(
                    color: AppColors.outlineVariant,
                    width: 1,
                  ),
                ),
                child: AppBottomNav(
                  currentIndex: _bottomNavIndex,
                  onTap: (index) {
                    setState(() {
                      _bottomNavIndex = index;
                    });
                  },
                ),
              ),
              SizedBox(height: AppSpacing.space3),
              Container(
                padding: EdgeInsets.all(AppSpacing.space3),
                decoration: BoxDecoration(
                  color: AppColors.primaryContainer,
                  borderRadius: AppBorderRadius.small,
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 16,
                      color: AppColors.onPrimaryContainer,
                    ),
                    SizedBox(width: AppSpacing.space2),
                    Expanded(
                      child: Text(
                        'Item seleccionado: ${BottomNavItem.fromIndex(_bottomNavIndex).label}',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.onPrimaryContainer,
                        ),
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

          // Bottom Navigation - Todos los Items
          _buildSection(
            title: 'Bottom Navigation - Todos los Items',
            description: 'Muestra cada item seleccionado individualmente',
            children: [
              ...List.generate(4, (index) {
                return Padding(
                  padding: EdgeInsets.only(bottom: AppSpacing.space3),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${BottomNavItem.fromIndex(index).label} (Seleccionado)',
                        style: AppTextStyles.label,
                      ),
                      SizedBox(height: AppSpacing.space2),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: AppBorderRadius.medium,
                          border: Border.all(
                            color: AppColors.outlineVariant,
                            width: 1,
                          ),
                        ),
                        child: AppBottomNav(
                          currentIndex: index,
                          onTap: (newIndex) {
                            setState(() {
                              _bottomNavIndex = newIndex;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Bottom Navigation - Con FAB
          _buildSection(
            title: 'Bottom Navigation - Con FAB',
            description: 'Versión con Floating Action Button integrado',
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  border: Border.all(
                    color: AppColors.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    // Content simulado
                    Container(
                      color: AppColors.surface2,
                      child: Center(
                        child: Text(
                          'Contenido de la página',
                          style: AppTextStyles.bodyLarge.copyWith(
                            color: AppColors.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),

                    // Bottom Navigation con FAB
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AppBottomNavWithFAB(
                        currentIndex: 0,
                        onNavTap: (index) {
                          debugPrint('Nav to: ${BottomNavItem.fromIndex(index).label}');
                        },
                        onFABTap: () {
                          debugPrint('FAB tapped: Crear Ruta');
                        },
                        fabLabel: 'Crear Ruta',
                        fabIcon: Icons.add,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: AppSpacing.space3),
              Text(
                'El FAB se posiciona automáticamente encima del bottom nav',
                style: AppTextStyles.caption,
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - MapaPage
          _buildSection(
            title: 'Ejemplo Práctico: MapaPage',
            description: 'App Bar + Map + Bottom Nav',
            children: [
              Container(
                height: 600,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  border: Border.all(
                    color: AppColors.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Stack(
                  children: [
                    // Mapa simulado
                    Container(
                      color: AppColors.primary.withOpacity(0.1),
                      child: Center(
                        child: Text(
                          '🗺️ MAPA',
                          style: AppTextStyles.h1.copyWith(
                            color: AppColors.primary.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),

                    // Top Bar transparente
                    const Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: AppTopBar.map(),
                    ),

                    // Map Bar con botones flotantes
                    Positioned(
                      top: 60,
                      left: 0,
                      right: 0,
                      child: AppMapBar(
                        onSearchTap: () {
                          debugPrint('Search tapped');
                        },
                        onFilterTap: () {
                          debugPrint('Filter tapped');
                        },
                        onLocationTap: () {
                          debugPrint('Location tapped');
                        },
                      ),
                    ),

                    // Bottom Navigation
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: AppBottomNav(
                        currentIndex: 0,
                        onTap: (index) {
                          debugPrint('Nav to: ${BottomNavItem.fromIndex(index).label}');
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

          // Ejemplo Práctico - FeedPage
          _buildSection(
            title: 'Ejemplo Práctico: FeedPage',
            description: 'App Bar Home + Content + Bottom Nav',
            children: [
              Container(
                height: 400,
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                  border: Border.all(
                    color: AppColors.outlineVariant,
                    width: 1,
                  ),
                ),
                child: Column(
                  children: [
                    // Top Bar Home
                    const AppTopBar.home(
                      title: 'Explorar',
                    ),

                    // Content simulado
                    Expanded(
                      child: Container(
                        color: AppColors.surface2,
                        child: Center(
                          child: Text(
                            'Grid de Obras',
                            style: AppTextStyles.h2.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                        ),
                      ),
                    ),

                    // Bottom Navigation
                    AppBottomNav(
                      currentIndex: 1,
                      onTap: (index) {
                        debugPrint('Nav to: ${BottomNavItem.fromIndex(index).label}');
                      },
                    ),
                  ],
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
            description: 'Cómo usar los app bars en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Top App Bar - Home\n'
                  'Scaffold(\n'
                  '  appBar: AppTopBar.home(\n'
                  '    title: \'Graffiti Trails\',\n'
                  '  ),\n'
                  '  body: ...,\n'
                  ')\n\n'
                  '// Top App Bar - Detail\n'
                  'Scaffold(\n'
                  '  appBar: AppTopBar.detail(\n'
                  '    title: \'Mural de la Libertad\',\n'
                  '    onBack: () { },\n'
                  '  ),\n'
                  '  body: ...,\n'
                  ')\n\n'
                  '// Top App Bar - Create\n'
                  'Scaffold(\n'
                  '  appBar: AppTopBar.create(\n'
                  '    title: \'Crear Ruta\',\n'
                  '    onClose: () { },\n'
                  '    actions: [\n'
                  '      TextButton(\n'
                  '        onPressed: () { },\n'
                  '        child: Text(\'Siguiente\'),\n'
                  '      ),\n'
                  '    ],\n'
                  '  ),\n'
                  '  body: ...,\n'
                  ')\n\n'
                  '// Bottom Navigation\n'
                  'Scaffold(\n'
                  '  body: ...,\n'
                  '  bottomNavigationBar: AppBottomNav(\n'
                  '    currentIndex: _currentIndex,\n'
                  '    onTap: (index) {\n'
                  '      setState(() => _currentIndex = index);\n'
                  '      // Navegar según BottomNavItem.fromIndex(index)\n'
                  '      switch (BottomNavItem.fromIndex(index)) {\n'
                  '        case BottomNavItem.mapa:\n'
                  '          // Navigate to MapaPage\n'
                  '          break;\n'
                  '        case BottomNavItem.explorar:\n'
                  '          // Navigate to FeedPage\n'
                  '          break;\n'
                  '        case BottomNavItem.rutas:\n'
                  '          // Navigate to RutaListPage\n'
                  '          break;\n'
                  '        case BottomNavItem.top10:\n'
                  '          // Navigate to Top10Page\n'
                  '          break;\n'
                  '      }\n'
                  '    },\n'
                  '  ),\n'
                  ')\n\n'
                  '// Bottom Navigation con FAB\n'
                  'Scaffold(\n'
                  '  body: ...,\n'
                  '  bottomNavigationBar: AppBottomNavWithFAB(\n'
                  '    currentIndex: _currentIndex,\n'
                  '    onNavTap: (index) { },\n'
                  '    onFABTap: () {\n'
                  '      // Crear nueva ruta\n'
                  '    },\n'
                  '    fabLabel: \'Crear Ruta\',\n'
                  '    fabIcon: Icons.add,\n'
                  '  ),\n'
                  ')\n\n'
                  '// Map Bar (Floating)\n'
                  'Stack(\n'
                  '  children: [\n'
                  '    MapWidget(),\n'
                  '    Positioned(\n'
                  '      top: 60,\n'
                  '      child: AppMapBar(\n'
                  '        onSearchTap: () { },\n'
                  '        onFilterTap: () { },\n'
                  '        onLocationTap: () { },\n'
                  '      ),\n'
                  '    ),\n'
                  '  ],\n'
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

  Widget _buildAppBarPreview({
    required PreferredSizeWidget appBar,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: AppBorderRadius.medium,
        border: Border.all(
          color: AppColors.outlineVariant,
          width: 1,
        ),
      ),
      child: Column(
        children: [
          appBar,
          Container(
            height: 100,
            color: AppColors.surface2,
            child: Center(
              child: Text(
                'Content Area',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

