import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../avatars/avatars.dart';
import '../buttons/buttons.dart';

/// AppArtistCard
/// 
/// Tarjeta para mostrar un artista.
/// Muestra avatar, nombre, bio, estadísticas y botón de acción.
/// 
/// **Características:**
/// - Avatar: 72px circular
/// - Artist name: H3
/// - Bio: Body small, max 2 líneas
/// - Stats row: Obras count + Followers
/// - Action button: "Ver perfil" (outlined)
/// - Shadow: Elevation 2
/// - Padding: 16px
/// - Border radius: 12px
/// - Background: Secondary (#66715B)
/// 
/// **Figma Reference:**
/// https://www.figma.com/design/.../node-id=2043-2173
class AppArtistCard extends StatelessWidget {
  final String artistName;
  final String? bio;
  final String? avatarUrl;
  final int obrasCount;
  final int? followersCount;
  final VoidCallback? onTap;
  final VoidCallback? onViewProfile;
  final bool showButton;
  final bool isCompact;

  const AppArtistCard({
    super.key,
    required this.artistName,
    this.bio,
    this.avatarUrl,
    this.obrasCount = 0,
    this.followersCount,
    this.onTap,
    this.onViewProfile,
    this.showButton = true,
    this.isCompact = false,
  });

  /// Constructor para versión compacta (sin botón)
  const AppArtistCard.compact({
    super.key,
    required this.artistName,
    this.bio,
    this.avatarUrl,
    this.obrasCount = 0,
    this.followersCount,
    this.onTap,
  })  : onViewProfile = null,
        showButton = false,
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
        padding: EdgeInsets.all(isCompact ? AppSpacing.space3 : AppSpacing.space4), // 12px o 16px
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Avatar
            _buildAvatar(),
            
            SizedBox(height: AppSpacing.space3), // 12px
            
            // Nombre del artista
            Text(
              artistName,
              style: AppTextStyles.h3.copyWith(
                color: AppColors.onSecondary, // Blanco
              ),
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            
            // Bio (si existe)
            if (bio != null && bio!.isNotEmpty) ...[
              SizedBox(height: AppSpacing.space2), // 8px
              Text(
                bio!,
                style: AppTextStyles.bodySmall.copyWith(
                  color: AppColors.onSecondary.withOpacity(0.8),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
            
            SizedBox(height: AppSpacing.space3), // 12px
            
            // Stats row
            _buildStats(context),
            
            // Botón "Ver perfil" (si showButton es true)
            if (showButton && onViewProfile != null) ...[
              SizedBox(height: AppSpacing.space4), // 16px
              SizedBox(
                width: double.infinity,
                child: AppButton.primaryOutlined(
                  label: 'Ver perfil',
                  onPressed: onViewProfile,
                  isExpanded: true,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    // Large = 64px, XLarge = 88px
    final size = isCompact ? AvatarSize.large : AvatarSize.xLarge;
    
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      // Avatar con imagen
      return AppAvatar.simple(
        imageUrl: avatarUrl,
        size: size,
      );
    } else {
      // Avatar con iniciales
      final initials = artistName.split(' ').map((word) => word[0]).take(2).join();
      return AppAvatar.simple(
        initials: initials,
        size: size,
        backgroundColor: AppColors.primary,
      );
    }
  }

  Widget _buildStats(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Obras count
        _buildStatItem(
          icon: Icons.palette_outlined,
          label: '$obrasCount',
          tooltip: '$obrasCount obras',
        ),
        
        // Separador
        if (followersCount != null) ...[
          SizedBox(width: AppSpacing.space4), // 16px
          Container(
            width: 1,
            height: 16,
            color: AppColors.onSecondary.withOpacity(0.3),
          ),
          SizedBox(width: AppSpacing.space4), // 16px
          
          // Followers count
          _buildStatItem(
            icon: Icons.people_outline,
            label: _formatCount(followersCount!),
            tooltip: '$followersCount seguidores',
          ),
        ],
      ],
    );
  }

  Widget _buildStatItem({
    required IconData icon,
    required String label,
    required String tooltip,
  }) {
    return Tooltip(
      message: tooltip,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: 16,
            color: AppColors.onSecondary.withOpacity(0.8),
          ),
          SizedBox(width: AppSpacing.space1), // 4px
          Text(
            label,
            style: AppTextStyles.labelMedium.copyWith(
              color: AppColors.onSecondary.withOpacity(0.8),
            ),
          ),
        ],
      ),
    );
  }

  String _formatCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 10000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    } else if (count < 1000000) {
      return '${(count / 1000).round()}k';
    } else {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
  }
}

/// AppArtistCardHorizontal
/// 
/// Versión horizontal de la tarjeta de artista.
/// Útil para listas de resultados de búsqueda.
class AppArtistCardHorizontal extends StatelessWidget {
  final String artistName;
  final String? bio;
  final String? avatarUrl;
  final int obrasCount;
  final int? followersCount;
  final VoidCallback? onTap;

  const AppArtistCardHorizontal({
    super.key,
    required this.artistName,
    this.bio,
    this.avatarUrl,
    this.obrasCount = 0,
    this.followersCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.secondary, // Verde oscuro #66715B
          borderRadius: BorderRadius.circular(12),
          boxShadow: AppShadows.small,
        ),
        padding: EdgeInsets.all(AppSpacing.space3), // 12px
        child: Row(
          children: [
            // Avatar
            _buildAvatar(),
            
            SizedBox(width: AppSpacing.space3), // 12px
            
            // Contenido
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Nombre
                  Text(
                    artistName,
                    style: AppTextStyles.titleMedium.copyWith(
                      color: AppColors.onSecondary,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  // Bio (si existe)
                  if (bio != null && bio!.isNotEmpty) ...[
                    SizedBox(height: AppSpacing.space1), // 4px
                    Text(
                      bio!,
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.onSecondary.withOpacity(0.7),
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                  
                  SizedBox(height: AppSpacing.space2), // 8px
                  
                  // Stats
                  Row(
                    children: [
                      Icon(
                        Icons.palette_outlined,
                        size: 14,
                        color: AppColors.onSecondary.withOpacity(0.7),
                      ),
                      SizedBox(width: AppSpacing.space1 / 2), // 2px
                      Text(
                        '$obrasCount obras',
                        style: AppTextStyles.caption.copyWith(
                          color: AppColors.onSecondary.withOpacity(0.7),
                        ),
                      ),
                      
                      if (followersCount != null) ...[
                        SizedBox(width: AppSpacing.space3), // 12px
                        Icon(
                          Icons.people_outline,
                          size: 14,
                          color: AppColors.onSecondary.withOpacity(0.7),
                        ),
                        SizedBox(width: AppSpacing.space1 / 2), // 2px
                        Text(
                          '${_formatCount(followersCount!)} seguidores',
                          style: AppTextStyles.caption.copyWith(
                            color: AppColors.onSecondary.withOpacity(0.7),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
            
            // Chevron
            Icon(
              Icons.chevron_right,
              color: AppColors.onSecondary.withOpacity(0.5),
              size: 24,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAvatar() {
    // Medium = 48px es el más cercano a 56px
    const size = AvatarSize.medium;
    
    if (avatarUrl != null && avatarUrl!.isNotEmpty) {
      return AppAvatar.simple(
        imageUrl: avatarUrl,
        size: size,
      );
    } else {
      final initials = artistName.split(' ').map((word) => word[0]).take(2).join();
      return AppAvatar.simple(
        initials: initials,
        size: size,
        backgroundColor: AppColors.primary,
      );
    }
  }

  String _formatCount(int count) {
    if (count < 1000) {
      return count.toString();
    } else if (count < 10000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    } else if (count < 1000000) {
      return '${(count / 1000).round()}k';
    } else {
      return '${(count / 1000000).toStringAsFixed(1)}M';
    }
  }
}

