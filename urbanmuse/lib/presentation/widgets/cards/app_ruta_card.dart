import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// AppRutaCard
/// 
/// Tarjeta para mostrar una ruta guardada.
/// Muestra mapa thumbnail, nombre, estadísticas y acciones.
/// 
/// **Características:**
/// - Map thumbnail: 16:9 aspect ratio
/// - Route name: H3
/// - Stats row: Distance + Duration + Obras count
/// - Transport icon: walk/bike
/// - Date created
/// - Action buttons: Share, Delete
/// - Shadow: Elevation 2
/// - Border radius: 12px
/// - Background: Secondary (#66715B)
/// 
/// **Figma Reference:**
/// Basado en especificaciones del sistema
class AppRutaCard extends StatelessWidget {
  final String routeName;
  final double distanceKm;
  final int durationMinutes;
  final int obrasCount;
  final TransportType transportType;
  final DateTime? createdDate;
  final String? mapThumbnailUrl;
  final VoidCallback? onTap;
  final VoidCallback? onShare;
  final VoidCallback? onDelete;
  final bool isCompact;

  const AppRutaCard({
    super.key,
    required this.routeName,
    required this.distanceKm,
    required this.durationMinutes,
    required this.obrasCount,
    this.transportType = TransportType.walk,
    this.createdDate,
    this.mapThumbnailUrl,
    this.onTap,
    this.onShare,
    this.onDelete,
    this.isCompact = false,
  });

  /// Constructor para versión compacta (sin acciones)
  const AppRutaCard.compact({
    super.key,
    required this.routeName,
    required this.distanceKm,
    required this.durationMinutes,
    required this.obrasCount,
    this.transportType = TransportType.walk,
    this.createdDate,
    this.mapThumbnailUrl,
    this.onTap,
  })  : onShare = null,
        onDelete = null,
        isCompact = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary, // Verde oscuro #66715B
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.small, // Elevation 2
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Map thumbnail
            _buildMapThumbnail(),

            // Contenido
            Padding(
              padding: EdgeInsets.all(isCompact ? AppSpacing.space3 : AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Nombre de la ruta
                  Text(
                    routeName,
                    style: AppTextStyles.h3.copyWith(
                      color: AppColors.onSecondary,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),

                  SizedBox(height: AppSpacing.space2), // 8px

                  // Stats row
                  _buildStatsRow(),

                  // Fecha de creación (si existe y no es compact)
                  if (createdDate != null && !isCompact) ...[
                    SizedBox(height: AppSpacing.space2),
                    _buildDateRow(),
                  ],

                  // Action buttons (si no es compact)
                  if (!isCompact && (onShare != null || onDelete != null)) ...[
                    SizedBox(height: AppSpacing.space3),
                    _buildActionButtons(),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapThumbnail() {
    return Stack(
      children: [
        // Map thumbnail o placeholder
        ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12),
            topRight: Radius.circular(12),
          ),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: mapThumbnailUrl != null && mapThumbnailUrl!.isNotEmpty
                ? Image.network(
                    mapThumbnailUrl!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return _buildMapPlaceholder();
                    },
                  )
                : _buildMapPlaceholder(),
          ),
        ),

        // Transport icon badge (top-left)
        Positioned(
          top: AppSpacing.space2,
          left: AppSpacing.space2,
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
              boxShadow: AppShadows.small,
            ),
            child: Icon(
              _getTransportIcon(),
              size: 20,
              color: AppColors.onPrimary,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMapPlaceholder() {
    return Container(
      color: AppColors.primary.withOpacity(0.2),
      child: Center(
        child: Icon(
          Icons.map,
          size: 48,
          color: AppColors.primary.withOpacity(0.5),
        ),
      ),
    );
  }

  Widget _buildStatsRow() {
    return Row(
      children: [
        // Distance
        _buildStatItem(
          icon: Icons.straighten,
          value: '${distanceKm.toStringAsFixed(1)} km',
        ),

        SizedBox(width: AppSpacing.space3), // 12px

        // Duration
        _buildStatItem(
          icon: Icons.access_time,
          value: _formatDuration(durationMinutes),
        ),

        SizedBox(width: AppSpacing.space3), // 12px

        // Obras count
        _buildStatItem(
          icon: Icons.palette_outlined,
          value: '$obrasCount obras',
        ),
      ],
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String value,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: 16,
          color: AppColors.onSecondary.withOpacity(0.8),
        ),
        SizedBox(width: AppSpacing.space1), // 4px
        Text(
          value,
          style: AppTextStyles.caption.copyWith(
            color: AppColors.onSecondary.withOpacity(0.8),
          ),
        ),
      ],
    );
  }

  Widget _buildDateRow() {
    return Row(
      children: [
        Icon(
          Icons.calendar_today,
          size: 14,
          color: AppColors.onSecondary.withOpacity(0.6),
        ),
        SizedBox(width: AppSpacing.space1),
        Text(
          _formatDate(createdDate!),
          style: AppTextStyles.caption.copyWith(
            color: AppColors.onSecondary.withOpacity(0.6),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (onShare != null) ...[
          IconButton(
            icon: const Icon(Icons.share),
            color: AppColors.onSecondary.withOpacity(0.8),
            iconSize: 20,
            onPressed: onShare,
            tooltip: 'Compartir',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
          ),
        ],
        if (onDelete != null) ...[
          SizedBox(width: AppSpacing.space2),
          IconButton(
            icon: const Icon(Icons.delete_outline),
            color: AppColors.error.withOpacity(0.8),
            iconSize: 20,
            onPressed: onDelete,
            tooltip: 'Eliminar',
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(
              minWidth: 32,
              minHeight: 32,
            ),
          ),
        ],
      ],
    );
  }

  IconData _getTransportIcon() {
    switch (transportType) {
      case TransportType.walk:
        return Icons.directions_walk;
      case TransportType.bike:
        return Icons.directions_bike;
      case TransportType.car:
        return Icons.directions_car;
    }
  }

  String _formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    } else {
      final hours = minutes ~/ 60;
      final mins = minutes % 60;
      return mins > 0 ? '${hours}h ${mins}m' : '${hours}h';
    }
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays == 0) {
      return 'Hoy';
    } else if (difference.inDays == 1) {
      return 'Ayer';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else if (difference.inDays < 30) {
      final weeks = difference.inDays ~/ 7;
      return 'Hace $weeks ${weeks == 1 ? 'semana' : 'semanas'}';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

/// TransportType
/// 
/// Tipo de transporte para la ruta.
enum TransportType {
  walk,
  bike,
  car,
}

/// AppRutaCardHorizontal
/// 
/// Versión horizontal de la tarjeta de ruta.
/// Útil para listas compactas de rutas.
class AppRutaCardHorizontal extends StatelessWidget {
  final String routeName;
  final double distanceKm;
  final int durationMinutes;
  final int obrasCount;
  final TransportType transportType;
  final String? mapThumbnailUrl;
  final VoidCallback? onTap;

  const AppRutaCardHorizontal({
    super.key,
    required this.routeName,
    required this.distanceKm,
    required this.durationMinutes,
    required this.obrasCount,
    this.transportType = TransportType.walk,
    this.mapThumbnailUrl,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          color: AppColors.secondary,
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.small,
        ),
        child: Row(
          children: [
            // Map thumbnail (cuadrado)
            _buildThumbnail(),

            // Contenido
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(AppSpacing.space3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Nombre
                    Text(
                      routeName,
                      style: AppTextStyles.titleMedium.copyWith(
                        color: AppColors.onSecondary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),

                    SizedBox(height: AppSpacing.space2),

                    // Stats compactos
                    Row(
                      children: [
                        Icon(
                          _getTransportIcon(),
                          size: 14,
                          color: AppColors.onSecondary.withOpacity(0.7),
                        ),
                        SizedBox(width: AppSpacing.space1),
                        Text(
                          '${distanceKm.toStringAsFixed(1)} km',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.onSecondary.withOpacity(0.7),
                          ),
                        ),
                        SizedBox(width: AppSpacing.space2),
                        Icon(
                          Icons.access_time,
                          size: 14,
                          color: AppColors.onSecondary.withOpacity(0.7),
                        ),
                        SizedBox(width: AppSpacing.space1),
                        Text(
                          _formatDuration(durationMinutes),
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.onSecondary.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: AppSpacing.space1),

                    // Obras count
                    Text(
                      '$obrasCount obras',
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.onSecondary.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Chevron
            Padding(
              padding: EdgeInsets.only(right: AppSpacing.space3),
              child: Icon(
                Icons.chevron_right,
                color: AppColors.onSecondary.withOpacity(0.5),
                size: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildThumbnail() {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.space2),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: SizedBox(
          width: 80,
          height: 80,
          child: mapThumbnailUrl != null && mapThumbnailUrl!.isNotEmpty
              ? Image.network(
                  mapThumbnailUrl!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholder();
                  },
                )
              : _buildPlaceholder(),
        ),
      ),
    );
  }

  Widget _buildPlaceholder() {
    return Container(
      color: AppColors.primary.withOpacity(0.2),
      child: Icon(
        Icons.map,
        size: 32,
        color: AppColors.primary.withOpacity(0.5),
      ),
    );
  }

  IconData _getTransportIcon() {
    switch (transportType) {
      case TransportType.walk:
        return Icons.directions_walk;
      case TransportType.bike:
        return Icons.directions_bike;
      case TransportType.car:
        return Icons.directions_car;
    }
  }

  String _formatDuration(int minutes) {
    if (minutes < 60) {
      return '$minutes min';
    } else {
      final hours = minutes ~/ 60;
      final mins = minutes % 60;
      return mins > 0 ? '${hours}h ${mins}m' : '${hours}h';
    }
  }
}

