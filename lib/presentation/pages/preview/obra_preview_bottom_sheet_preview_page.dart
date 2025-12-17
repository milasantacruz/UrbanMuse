import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/modals/modals.dart';
import '../../widgets/buttons/buttons.dart';

/// ObraPreviewBottomSheetPreviewPage
/// 
/// Página de showcase para AppObraPreviewBottomSheet
/// Muestra el bottom sheet de preview de obra con todas sus funcionalidades
class ObraPreviewBottomSheetPreviewPage extends StatelessWidget {
  const ObraPreviewBottomSheetPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obra Preview Bottom Sheet'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Obra Preview Bottom Sheet',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Bottom Sheet para mostrar preview de obra desde mapa o feed',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Ejemplos
          _buildSection(
            title: 'Abrir Bottom Sheet',
            description: 'Usa los botones para abrir diferentes variantes',
            children: [
              // Ejemplo 1: Obra con distancia
              AppButton.primary(
                label: 'Abrir Preview (con distancia)',
                onPressed: () {
                  AppObraPreviewBottomSheet.show(
                    context,
                    imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                    titulo: 'Mural de la Cultura',
                    artista: 'Diego Mural',
                    categoria: 'mural',
                    distancia: '1.2 km',
                    onVerDetalles: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Navegando a detalles...')),
                      );
                    },
                  );
                },
                isExpanded: true,
              ),

              SizedBox(height: AppSpacing.space3),

              // Ejemplo 2: Obra sin distancia
              AppButton.primary(
                label: 'Abrir Preview (sin distancia)',
                onPressed: () {
                  AppObraPreviewBottomSheet.show(
                    context,
                    imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                    titulo: 'Grafiti Urbano',
                    artista: 'Ana Spray',
                    categoria: 'graffiti',
                    onVerDetalles: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Navegando a detalles...')),
                      );
                    },
                  );
                },
                isExpanded: true,
              ),

              SizedBox(height: AppSpacing.space3),

              // Ejemplo 3: Diferentes categorías
              Wrap(
                spacing: AppSpacing.space2,
                runSpacing: AppSpacing.space2,
                children: [
                  AppButton.primaryOutlined(
                    label: 'Graffiti',
                    onPressed: () {
                      AppObraPreviewBottomSheet.show(
                        context,
                        imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                        titulo: 'Arte en la Calle',
                        artista: 'Carlos Arte',
                        categoria: 'graffiti',
                        distancia: '500 m',
                      );
                    },
                  ),
                  AppButton.primaryOutlined(
                    label: 'Mural',
                    onPressed: () {
                      AppObraPreviewBottomSheet.show(
                        context,
                        imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                        titulo: 'Mural Comunitario',
                        artista: 'María Street',
                        categoria: 'mural',
                        distancia: '2.5 km',
                      );
                    },
                  ),
                  AppButton.primaryOutlined(
                    label: 'Escultura',
                    onPressed: () {
                      AppObraPreviewBottomSheet.show(
                        context,
                        imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                        titulo: 'Escultura Moderna',
                        artista: 'Pablo Urbano',
                        categoria: 'escultura',
                        distancia: '800 m',
                      );
                    },
                  ),
                  AppButton.primaryOutlined(
                    label: 'Performance',
                    onPressed: () {
                      AppObraPreviewBottomSheet.show(
                        context,
                        imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                        titulo: 'Performance Art',
                        artista: 'Laura Graffiti',
                        categoria: 'performance',
                        distancia: '1.8 km',
                      );
                    },
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - MapaPage
          _buildSection(
            title: 'Ejemplo Práctico: MapaPage',
            description: 'Integración del Bottom Sheet en una página de mapa',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.map, size: 20, color: AppColors.primary),
                          SizedBox(width: AppSpacing.space2),
                          Text('Mapa de Obras', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space4),

                      // Simulación de mapa
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          color: AppColors.surface2,
                          borderRadius: AppBorderRadius.medium,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                Icons.map,
                                size: 64,
                                color: AppColors.onSurfaceVariant,
                              ),
                            ),
                            // Pin simulado
                            Positioned(
                              top: 80,
                              left: 120,
                              child: GestureDetector(
                                onTap: () {
                                  AppObraPreviewBottomSheet.show(
                                    context,
                                    imageUrl: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
                                    titulo: 'Obra en el Mapa',
                                    artista: 'Artista Local',
                                    categoria: 'mural',
                                    distancia: '1.2 km',
                                    onVerDetalles: () {
                                      // Navegar a ObraDetailPage
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          content: Text('Navegando a ObraDetailPage...'),
                                        ),
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(AppSpacing.space2),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    shape: BoxShape.circle,
                                    boxShadow: AppShadows.medium,
                                  ),
                                  child: Icon(
                                    Icons.location_on,
                                    color: AppColors.onPrimary,
                                    size: 24,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: AppSpacing.space4),
                      Text(
                        'Toca el pin en el mapa para ver el preview',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.onSurfaceVariant,
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

          // Especificaciones
          _buildSection(
            title: 'Especificaciones',
            description: 'Detalles técnicos del componente',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildSpecItem('Height inicial', '25% de pantalla (configurable)'),
                    _buildSpecItem('Border radius', '28px (top corners)'),
                    _buildSpecItem('Handle bar', '40px × 4px, rounded 2px'),
                    _buildSpecItem('Image height', '80px, full width'),
                    _buildSpecItem('Background', 'secondaryContainer (#E8F8DE)'),
                    _buildSpecItem('Padding', '16px (AppSpacing.space4)'),
                    _buildSpecItem('Title', 'H3 (AppTextStyles.h3)'),
                    _buildSpecItem('Artist', 'Body Medium, onSurfaceVariant'),
                    _buildSpecItem('Category Badge', 'CategoryBadge.rounded'),
                    _buildSpecItem('Distance', 'Opcional, con icono location_on'),
                    _buildSpecItem('Button', 'Primary, expanded width'),
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
            description: 'Cómo usar el Bottom Sheet en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Abrir Bottom Sheet (Helper)\n'
                  'AppObraPreviewBottomSheet.show(\n'
                  '  context,\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  artista: obra.artista,\n'
                  '  categoria: obra.categoria,\n'
                  '  distancia: \'1.2 km\', // Opcional\n'
                  '  onVerDetalles: () {\n'
                  '    // Navegar a ObraDetailPage\n'
                  '    Navigator.pushNamed(context, \'/obra/\${obra.id}\');\n'
                  '  },\n'
                  ');\n\n'
                  '// Usar directamente el widget\n'
                  'AppObraPreviewBottomSheet(\n'
                  '  imageUrl: obra.imageUrl,\n'
                  '  titulo: obra.titulo,\n'
                  '  artista: obra.artista,\n'
                  '  categoria: obra.categoria,\n'
                  '  distancia: \'1.2 km\',\n'
                  '  onVerDetalles: () { },\n'
                  '  initialHeight: 0.3, // 30% de pantalla\n'
                  ')\n\n'
                  '// En un GestureDetector (Map Pin)\n'
                  'GestureDetector(\n'
                  '  onTap: () {\n'
                  '    AppObraPreviewBottomSheet.show(context, ...);\n'
                  '  },\n'
                  '  child: Icon(Icons.location_on),\n'
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

  Widget _buildSpecItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.space2),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              label,
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodySmall.copyWith(
                color: AppColors.onSurfaceVariant,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

