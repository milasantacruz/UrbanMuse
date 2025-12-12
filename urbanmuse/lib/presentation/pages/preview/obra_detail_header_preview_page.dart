import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../widgets/headers/headers.dart';

/// Página de preview para el Obra Detail Header
/// Ruta: /preview/obra-detail-header
class ObraDetailHeaderPreviewPage extends StatefulWidget {
  const ObraDetailHeaderPreviewPage({super.key});

  @override
  State<ObraDetailHeaderPreviewPage> createState() =>
      _ObraDetailHeaderPreviewPageState();
}

class _ObraDetailHeaderPreviewPageState
    extends State<ObraDetailHeaderPreviewPage> {
  bool _isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obra Detail Header'),
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

            // Ejemplo básico
            _buildSection(
              title: '📸 Ejemplo Básico',
              child: _buildBasicExample(),
            ),

            // Diferentes categorías
            _buildSection(
              title: '🎨 Por Categoría',
              child: _buildCategoryExamples(),
            ),

            // Diferentes aspect ratios
            _buildSection(
              title: '📐 Aspect Ratios',
              child: _buildAspectRatioExamples(),
            ),

            // Estados interactivos
            _buildSection(
              title: '✨ Estados Interactivos',
              child: _buildInteractiveExample(),
            ),

            // Sin título overlay
            _buildSection(
              title: '🎭 Sin Título Overlay',
              child: _buildWithoutTitleExample(),
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
                'Obra Detail Header',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Header hero para la página de detalle de obra. Incluye imagen hero, '
            'gradiente overlay, botones flotantes (back, share, favorite), '
            'badge de categoría y título overlay.',
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

  Widget _buildBasicExample() {
    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: AppObraDetailHeader(
        imageUrl:
            'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        titulo: 'Colores de la Ciudad',
        categoria: 'mural',
        onBack: () => _showSnackBar('Back tapped'),
        onShare: () => _showSnackBar('Share tapped'),
        onFavoriteToggle: () {
          setState(() => _isFavorite = !_isFavorite);
          _showSnackBar(_isFavorite ? 'Agregado a favoritos' : 'Removido de favoritos');
        },
        isFavorite: _isFavorite,
        onImageTap: () => _showSnackBar('Image tapped (abrir fullscreen)'),
      ),
    );
  }

  Widget _buildCategoryExamples() {
    final categories = [
      {'name': 'Graffiti', 'category': 'graffiti', 'image': 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800'},
      {'name': 'Mural', 'category': 'mural', 'image': 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800'},
      {'name': 'Escultura', 'category': 'escultura', 'image': 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800'},
      {'name': 'Performance', 'category': 'performance', 'image': 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800'},
    ];

    return Column(
      children: categories.map((cat) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 8, bottom: 8),
                child: Text(
                  cat['name'] as String,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Container(
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
                clipBehavior: Clip.antiAlias,
                child: AppObraDetailHeader(
                  imageUrl: cat['image'] as String,
                  titulo: 'Obra de ${cat['name']}',
                  categoria: cat['category'] as String,
                  aspectRatio: 16 / 9,
                ),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildAspectRatioExamples() {
    return Column(
      children: [
        _buildAspectRatioItem(
          label: '16:9 (Landscape)',
          aspectRatio: 16 / 9,
        ),
        const SizedBox(height: 16),
        _buildAspectRatioItem(
          label: '4:3 (Standard)',
          aspectRatio: 4 / 3,
        ),
        const SizedBox(height: 16),
        _buildAspectRatioItem(
          label: '1:1 (Square)',
          aspectRatio: 1 / 1,
        ),
      ],
    );
  }

  Widget _buildAspectRatioItem({
    required String label,
    required double aspectRatio,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8, bottom: 8),
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        Container(
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
          clipBehavior: Clip.antiAlias,
          child: AppObraDetailHeader(
            imageUrl:
                'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
            titulo: 'Título de la Obra',
            categoria: 'mural',
            aspectRatio: aspectRatio,
          ),
        ),
      ],
    );
  }

  Widget _buildInteractiveExample() {
    return Container(
      padding: const EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Toca los botones para ver las interacciones',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.neutral600,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            clipBehavior: Clip.antiAlias,
            child: AppObraDetailHeader(
              imageUrl:
                  'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
              titulo: 'Obra Interactiva',
              categoria: 'graffiti',
              isFavorite: _isFavorite,
              onBack: () => _showSnackBar('← Back button tapped'),
              onShare: () => _showSnackBar('📤 Share button tapped'),
              onFavoriteToggle: () {
                setState(() => _isFavorite = !_isFavorite);
                _showSnackBar(
                  _isFavorite
                      ? '❤️ Agregado a favoritos'
                      : '🤍 Removido de favoritos',
                );
              },
              onImageTap: () => _showSnackBar('🖼️ Image tapped (abrir fullscreen)'),
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primaryContainer,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  _isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: _isFavorite ? AppColors.error : AppColors.neutral600,
                  size: 20,
                ),
                const SizedBox(width: 8),
                Text(
                  _isFavorite
                      ? 'Obra en favoritos'
                      : 'Obra no está en favoritos',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: _isFavorite
                        ? AppColors.error
                        : AppColors.neutral600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWithoutTitleExample() {
    return Container(
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
      clipBehavior: Clip.antiAlias,
      child: AppObraDetailHeader(
        imageUrl:
            'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        titulo: 'Obra sin título overlay',
        categoria: 'escultura',
        showTitleOverlay: false,
        onBack: () => _showSnackBar('Back tapped'),
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
}
