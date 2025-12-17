import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/map_pins/map_pins.dart';

/// Página de preview para los Map Pins
/// Ruta: /preview/map-pins
class MapPinsPreviewPage extends StatefulWidget {
  const MapPinsPreviewPage({super.key});

  @override
  State<MapPinsPreviewPage> createState() => _MapPinsPreviewPageState();
}

class _MapPinsPreviewPageState extends State<MapPinsPreviewPage> {
  int? _selectedPinIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Pins'),
        backgroundColor: AppColors.surface,
      ),
      backgroundColor: AppColors.neutral100,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Descripción
            _buildDescription(),
            const SizedBox(height: 24),

            // Pins por Categoría
            _buildSection(
              title: '🎨 Pins por Categoría',
              child: _buildCategoryPins(),
            ),

            // Tamaños
            _buildSection(
              title: '📐 Tamaños',
              child: _buildSizesDemo(),
            ),

            // Estados
            _buildSection(
              title: '✨ Estados',
              child: _buildStatesDemo(),
            ),

            // Pins numerados (para rutas)
            _buildSection(
              title: '🔢 Pins Numerados (Rutas)',
              child: _buildNumberedPins(),
            ),

            // Pins con Avatar
            _buildSection(
              title: '👤 Pins con Avatar',
              child: _buildAvatarPins(),
            ),

            // Pin Dots (simplificados)
            _buildSection(
              title: '⚫ Pin Dots (Simplificados)',
              child: _buildPinDots(),
            ),

            // Clusters
            _buildSection(
              title: '🔵 Clusters',
              child: _buildClusters(),
            ),

            // Demo interactivo
            _buildSection(
              title: '🗺️ Demo Interactivo',
              child: _buildInteractiveDemo(),
            ),

            // User Location con animación
            _buildSection(
              title: '📍 User Location (Animado)',
              child: _buildUserLocationDemo(),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildDescription() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.info_outline, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                'Map Pins',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Componentes para marcar obras de arte urbano en el mapa. '
            'Incluyen variantes por categoría, tamaños, estados y tipos especiales '
            '(numerados, con avatar, dots y clusters).',
            style: TextStyle(color: AppColors.onSurfaceVariant),
          ),
        ],
      ),
    );
  }

  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        const SizedBox(height: 16),
        child,
      ],
    );
  }

  Widget _buildCategoryPins() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryPinItem(MapPinCategory.graffiti),
              _buildCategoryPinItem(MapPinCategory.mural),
              _buildCategoryPinItem(MapPinCategory.escultura),
              _buildCategoryPinItem(MapPinCategory.performance),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildCategoryPinItem(MapPinCategory.userLocation),
              _buildCategoryPinItem(MapPinCategory.generic),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryPinItem(MapPinCategory category) {
    return Column(
      children: [
        AppMapPin(
          category: category,
          size: MapPinSize.large,
          onTap: () => _showSnackBar('${category.label} tapped'),
        ),
        const SizedBox(height: 8),
        Text(
          category.label,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          _colorToHex(category.color),
          style: const TextStyle(
            fontSize: 10,
            color: AppColors.neutral500,
          ),
        ),
      ],
    );
  }

  Widget _buildSizesDemo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: MapPinSize.values.map((size) {
          return Column(
            children: [
              AppMapPin(
                category: MapPinCategory.mural,
                size: size,
              ),
              const SizedBox(height: 8),
              Text(
                size.name,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                '${size.width.toInt()}×${size.height.toInt()}',
                style: const TextStyle(
                  fontSize: 10,
                  color: AppColors.neutral500,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }

  Widget _buildStatesDemo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // Normal
          Column(
            children: [
              AppMapPin(
                category: MapPinCategory.graffiti,
                size: MapPinSize.large,
              ),
              const SizedBox(height: 8),
              const Text(
                'Normal',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          // Selected
          Column(
            children: [
              AppMapPin(
                category: MapPinCategory.graffiti,
                size: MapPinSize.large,
                isSelected: true,
              ),
              const SizedBox(height: 8),
              const Text(
                'Selected',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
          // Sin sombra
          Column(
            children: [
              AppMapPin(
                category: MapPinCategory.graffiti,
                size: MapPinSize.large,
                showShadow: false,
              ),
              const SizedBox(height: 8),
              const Text(
                'Sin sombra',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNumberedPins() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Para mostrar el orden de visita en rutas',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: List.generate(10, (index) {
              final categories = MapPinCategory.values
                  .where((c) =>
                      c != MapPinCategory.userLocation &&
                      c != MapPinCategory.generic)
                  .toList();
              return AppMapPin(
                category: categories[index % categories.length],
                size: MapPinSize.medium,
                number: index + 1,
              );
            }),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatarPins() {
    final avatarUrls = [
      'https://i.pravatar.cc/150?img=1',
      'https://i.pravatar.cc/150?img=2',
      'https://i.pravatar.cc/150?img=3',
      'https://i.pravatar.cc/150?img=4',
    ];

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Mostrar avatar del artista en el pin',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < avatarUrls.length; i++)
                AppMapPin(
                  category: MapPinCategory.values[i],
                  size: MapPinSize.large,
                  avatarImageUrl: avatarUrls[i],
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPinDots() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Versión simplificada para zoom alejado o muchos pins',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (final category in MapPinCategory.values.where((c) =>
                  c != MapPinCategory.userLocation &&
                  c != MapPinCategory.generic))
                Column(
                  children: [
                    AppMapPinDot(
                      category: category,
                      size: 20,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      category.label,
                      style: const TextStyle(fontSize: 10),
                    ),
                  ],
                ),
            ],
          ),
          const SizedBox(height: 16),
          // Tamaños diferentes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (final size in [12.0, 16.0, 20.0, 24.0])
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      AppMapPinDot(
                        category: MapPinCategory.generic,
                        size: size,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${size.toInt()}px',
                        style: const TextStyle(fontSize: 10),
                      ),
                    ],
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildClusters() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Para agrupar múltiples obras en un área',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  AppMapPinCluster(
                    count: 5,
                    size: MapPinSize.medium,
                    onTap: () => _showSnackBar('Cluster con 5 obras'),
                  ),
                  const SizedBox(height: 8),
                  const Text('5', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  AppMapPinCluster(
                    count: 12,
                    size: MapPinSize.large,
                    onTap: () => _showSnackBar('Cluster con 12 obras'),
                  ),
                  const SizedBox(height: 8),
                  const Text('12', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  AppMapPinCluster(
                    count: 48,
                    size: MapPinSize.large,
                    color: AppColors.categoryMural,
                    onTap: () => _showSnackBar('Cluster con 48 obras'),
                  ),
                  const SizedBox(height: 8),
                  const Text('48', style: TextStyle(fontSize: 12)),
                ],
              ),
              Column(
                children: [
                  AppMapPinCluster(
                    count: 150,
                    size: MapPinSize.xlarge,
                    onTap: () => _showSnackBar('Cluster con 150 obras'),
                  ),
                  const SizedBox(height: 8),
                  const Text('150 (99+)', style: TextStyle(fontSize: 12)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInteractiveDemo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Toca un pin para seleccionarlo',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          // Simulación de mapa con pins
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: AppColors.neutral200,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: NetworkImage(
                    'https://api.mapbox.com/styles/v1/mapbox/streets-v12/static/-58.4370,-34.6037,13,0/400x200@2x?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw'),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: Stack(
              children: [
                // Pin 1
                Positioned(
                  left: 50,
                  top: 40,
                  child: AppMapPin(
                    category: MapPinCategory.graffiti,
                    size: MapPinSize.medium,
                    isSelected: _selectedPinIndex == 0,
                    onTap: () => setState(() => _selectedPinIndex = 0),
                  ),
                ),
                // Pin 2
                Positioned(
                  left: 120,
                  top: 80,
                  child: AppMapPin(
                    category: MapPinCategory.mural,
                    size: MapPinSize.medium,
                    isSelected: _selectedPinIndex == 1,
                    onTap: () => setState(() => _selectedPinIndex = 1),
                  ),
                ),
                // Pin 3
                Positioned(
                  right: 100,
                  top: 50,
                  child: AppMapPin(
                    category: MapPinCategory.escultura,
                    size: MapPinSize.medium,
                    isSelected: _selectedPinIndex == 2,
                    onTap: () => setState(() => _selectedPinIndex = 2),
                  ),
                ),
                // Pin 4
                Positioned(
                  right: 40,
                  top: 120,
                  child: AppMapPin(
                    category: MapPinCategory.performance,
                    size: MapPinSize.medium,
                    isSelected: _selectedPinIndex == 3,
                    onTap: () => setState(() => _selectedPinIndex = 3),
                  ),
                ),
                // Cluster
                Positioned(
                  left: 200,
                  top: 130,
                  child: AppMapPinCluster(
                    count: 7,
                    size: MapPinSize.medium,
                    onTap: () => _showSnackBar('Cluster: 7 obras en esta zona'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          if (_selectedPinIndex != null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primaryContainer,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Icon(
                    MapPinCategory.values[_selectedPinIndex!].defaultIcon,
                    color: MapPinCategory.values[_selectedPinIndex!].color,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Pin seleccionado: ${MapPinCategory.values[_selectedPinIndex!].label}',
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildUserLocationDemo() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
          ),
        ],
      ),
      child: Column(
        children: [
          const Text(
            'Pin con animación de pulso para ubicación del usuario',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: SizedBox(
              height: 100,
              width: 100,
              child: Center(
                child: AppMapPin(
                  category: MapPinCategory.userLocation,
                  size: MapPinSize.large,
                  animate: true,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }

  String _colorToHex(Color color) {
    final r = color.r.toInt();
    final g = color.g.toInt();
    final b = color.b.toInt();
    return '#${r.toRadixString(16).padLeft(2, '0')}${g.toRadixString(16).padLeft(2, '0')}${b.toRadixString(16).padLeft(2, '0')}'.toUpperCase();
  }
}
