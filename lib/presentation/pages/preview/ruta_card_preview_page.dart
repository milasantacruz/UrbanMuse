import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/cards/cards.dart';

/// RutaCardPreviewPage
/// 
/// Página de showcase para AppRutaCard
/// Muestra todas las variantes del componente de tarjeta de ruta
class RutaCardPreviewPage extends StatelessWidget {
  const RutaCardPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ruta Card Preview'),
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header
          Text(
            'Ruta Card',
            style: AppTextStyles.displaySmall,
          ),
          SizedBox(height: AppSpacing.space2),
          Text(
            'Tarjetas para mostrar rutas guardadas',
            style: AppTextStyles.bodyLarge,
          ),
          SizedBox(height: AppSpacing.space8),

          // Ruta Card - Standard
          _buildSection(
            title: 'Ruta Card - Standard',
            description: 'Versión completa con mapa, stats, fecha y acciones',
            children: [
              AppRutaCard(
                routeName: 'Murales de Palermo',
                distanceKm: 2.3,
                durationMinutes: 45,
                obrasCount: 5,
                transportType: TransportType.walk,
                createdDate: DateTime.now().subtract(const Duration(days: 2)),
                mapThumbnailUrl: 'https://picsum.photos/seed/map1/400/225',
                onShare: () {
                  debugPrint('Share ruta');
                },
                onDelete: () {
                  debugPrint('Delete ruta');
                },
                onTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tap en ruta')),
                  );
                },
              ),
              SizedBox(height: AppSpacing.space3),
              AppRutaCard(
                routeName: 'Graffiti Tour Centro',
                distanceKm: 5.8,
                durationMinutes: 120,
                obrasCount: 12,
                transportType: TransportType.bike,
                createdDate: DateTime.now().subtract(const Duration(days: 7)),
                onShare: () {
                  debugPrint('Share ruta');
                },
                onDelete: () {
                  debugPrint('Delete ruta');
                },
                onTap: () {},
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ruta Card - Compact
          _buildSection(
            title: 'Ruta Card - Compact',
            description: 'Versión compacta sin acciones',
            children: [
              AppRutaCard.compact(
                routeName: 'Arte Urbano Recoleta',
                distanceKm: 1.5,
                durationMinutes: 30,
                obrasCount: 4,
                transportType: TransportType.walk,
                onTap: () {},
              ),
              SizedBox(height: AppSpacing.space3),
              AppRutaCard.compact(
                routeName: 'Esculturas Públicas',
                distanceKm: 3.2,
                durationMinutes: 60,
                obrasCount: 8,
                transportType: TransportType.bike,
                mapThumbnailUrl: 'https://picsum.photos/seed/map2/400/225',
                onTap: () {},
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ruta Card - Horizontal
          _buildSection(
            title: 'Ruta Card - Horizontal',
            description: 'Versión horizontal para listas',
            children: [
              AppRutaCardHorizontal(
                routeName: 'Murales de Palermo',
                distanceKm: 2.3,
                durationMinutes: 45,
                obrasCount: 5,
                transportType: TransportType.walk,
                mapThumbnailUrl: 'https://picsum.photos/seed/map3/200/200',
                onTap: () {},
              ),
              SizedBox(height: AppSpacing.space3),
              AppRutaCardHorizontal(
                routeName: 'Graffiti Tour Centro',
                distanceKm: 5.8,
                durationMinutes: 120,
                obrasCount: 12,
                transportType: TransportType.bike,
                onTap: () {},
              ),
              SizedBox(height: AppSpacing.space3),
              AppRutaCardHorizontal(
                routeName: 'Arte Callejero San Telmo',
                distanceKm: 1.8,
                durationMinutes: 35,
                obrasCount: 6,
                transportType: TransportType.walk,
                mapThumbnailUrl: 'https://picsum.photos/seed/map4/200/200',
                onTap: () {},
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Tipos de transporte
          _buildSection(
            title: 'Tipos de Transporte',
            description: 'Walk, Bike, Car',
            children: [
              Row(
                children: [
                  Expanded(
                    child: AppRutaCard.compact(
                      routeName: 'A pie',
                      distanceKm: 1.5,
                      durationMinutes: 30,
                      obrasCount: 4,
                      transportType: TransportType.walk,
                      onTap: () {},
                    ),
                  ),
                  SizedBox(width: AppSpacing.space3),
                  Expanded(
                    child: AppRutaCard.compact(
                      routeName: 'En bici',
                      distanceKm: 5.0,
                      durationMinutes: 25,
                      obrasCount: 10,
                      transportType: TransportType.bike,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),

          SizedBox(height: AppSpacing.space8),
          const Divider(),
          SizedBox(height: AppSpacing.space8),

          // Ejemplo Práctico - Lista de Rutas
          _buildSection(
            title: 'Ejemplo Práctico: Lista de Rutas',
            description: 'Grid de rutas guardadas',
            children: [
              Card(
                child: Padding(
                  padding: EdgeInsets.all(AppSpacing.space4),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.route, size: 20, color: AppColors.primary),
                          SizedBox(width: AppSpacing.space2),
                          Text('Mis Rutas', style: AppTextStyles.h3),
                        ],
                      ),
                      SizedBox(height: AppSpacing.space4),

                      ...List.generate(3, (index) {
                        final rutas = [
                          {
                            'name': 'Murales de Palermo',
                            'distance': 2.3,
                            'duration': 45,
                            'obras': 5,
                            'transport': TransportType.walk,
                          },
                          {
                            'name': 'Graffiti Tour Centro',
                            'distance': 5.8,
                            'duration': 120,
                            'obras': 12,
                            'transport': TransportType.bike,
                          },
                          {
                            'name': 'Arte Urbano Recoleta',
                            'distance': 1.5,
                            'duration': 30,
                            'obras': 4,
                            'transport': TransportType.walk,
                          },
                        ];

                        final ruta = rutas[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.space3),
                          child: AppRutaCardHorizontal(
                            routeName: ruta['name'] as String,
                            distanceKm: ruta['distance'] as double,
                            durationMinutes: ruta['duration'] as int,
                            obrasCount: ruta['obras'] as int,
                            transportType: ruta['transport'] as TransportType,
                            onTap: () {
                              debugPrint('Navigate to: ${ruta['name']}');
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
            description: 'Cómo usar las ruta cards en tu código',
            children: [
              Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Text(
                  '// Ruta Card Standard\n'
                  'AppRutaCard(\n'
                  '  routeName: ruta.name,\n'
                  '  distanceKm: ruta.distanceKm,\n'
                  '  durationMinutes: ruta.durationMinutes,\n'
                  '  obrasCount: ruta.obrasCount,\n'
                  '  transportType: TransportType.walk,\n'
                  '  createdDate: ruta.createdDate,\n'
                  '  mapThumbnailUrl: ruta.mapUrl,\n'
                  '  onShare: () { },\n'
                  '  onDelete: () { },\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Ruta Card Compact\n'
                  'AppRutaCard.compact(\n'
                  '  routeName: ruta.name,\n'
                  '  distanceKm: ruta.distanceKm,\n'
                  '  durationMinutes: ruta.durationMinutes,\n'
                  '  obrasCount: ruta.obrasCount,\n'
                  '  transportType: TransportType.bike,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Ruta Card Horizontal\n'
                  'AppRutaCardHorizontal(\n'
                  '  routeName: ruta.name,\n'
                  '  distanceKm: ruta.distanceKm,\n'
                  '  durationMinutes: ruta.durationMinutes,\n'
                  '  obrasCount: ruta.obrasCount,\n'
                  '  transportType: TransportType.walk,\n'
                  '  mapThumbnailUrl: ruta.mapUrl,\n'
                  '  onTap: () { },\n'
                  ')\n\n'
                  '// Transport Types\n'
                  'enum TransportType {\n'
                  '  walk,  // Icons.directions_walk\n'
                  '  bike,  // Icons.directions_bike\n'
                  '  car,   // Icons.directions_car\n'
                  '}',
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
}

