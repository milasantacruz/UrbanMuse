import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// Badge type para avatar
enum AvatarBadgeType {
  none, // Sin badge
  verified, // Badge de verificado
  edit, // Badge de editar
}

/// Tamaños de avatar
enum AvatarSize {
  small, // 32px
  medium, // 48px
  large, // 64px
  xLarge, // 88px (default de Figma)
}

/// Avatar personalizado siguiendo Material 3 y Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-
class AppAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final AvatarBadgeType badgeType;
  final AvatarSize size;
  final VoidCallback? onEdit;
  final Color? backgroundColor;

  const AppAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.badgeType = AvatarBadgeType.none,
    this.size = AvatarSize.xLarge,
    this.onEdit,
    this.backgroundColor,
  });

  /// Constructor para avatar sin badge
  const AppAvatar.simple({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = AvatarSize.medium,
    this.backgroundColor,
  })  : badgeType = AvatarBadgeType.none,
        onEdit = null;

  /// Constructor para avatar verificado
  const AppAvatar.verified({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = AvatarSize.xLarge,
    this.backgroundColor,
  })  : badgeType = AvatarBadgeType.verified,
        onEdit = null;

  /// Constructor para avatar editable
  const AppAvatar.editable({
    super.key,
    this.imageUrl,
    this.initials,
    required this.onEdit,
    this.size = AvatarSize.xLarge,
    this.backgroundColor,
  }) : badgeType = AvatarBadgeType.edit;

  @override
  Widget build(BuildContext context) {
    final avatarSize = _getAvatarSize();
    final badgeSize = _getBadgeSize();

    return SizedBox(
      width: avatarSize,
      height: avatarSize + (badgeType != AvatarBadgeType.none ? 4 : 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          // Avatar principal
          Positioned(
            top: badgeType != AvatarBadgeType.none ? 4 : 0,
            left: 0,
            child: _buildAvatar(avatarSize),
          ),

          // Badge (verified o edit)
          if (badgeType != AvatarBadgeType.none)
            Positioned(
              bottom: 0,
              right: 0,
              child: _buildBadge(badgeSize),
            ),
        ],
      ),
    );
  }

  Widget _buildAvatar(double size) {
    // Determinar si es una imagen local o remota
    final isLocalImage = imageUrl != null && imageUrl!.startsWith('lib/assets');
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
        image: imageUrl != null
            ? DecorationImage(
                image: isLocalImage
                    ? AssetImage(imageUrl!) as ImageProvider
                    : NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null
          ? Center(
              child: Text(
                initials ?? '?',
                style: TextStyle(
                  fontSize: size * 0.4,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSurface,
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildBadge(double size) {
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: const Color(0xFF1C212B), // Badge background from Figma
        shape: BoxShape.circle,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: badgeType == AvatarBadgeType.verified
              ? const Color(0xFF1D9BF0) // Blue primary
              : const Color(0xFF1C212B),
          shape: BoxShape.circle,
        ),
        child: badgeType == AvatarBadgeType.verified
            ? const Icon(
                Icons.verified,
                color: Colors.white,
                size: 14,
              )
            : InkWell(
                onTap: onEdit,
                borderRadius: BorderRadius.circular(size / 2),
                child: const Icon(
                  Icons.add_a_photo_outlined,
                  color: Color(0xFFF5F8FA), // White from Figma
                  size: 14,
                ),
              ),
      ),
    );
  }

  double _getAvatarSize() {
    switch (size) {
      case AvatarSize.small:
        return 32;
      case AvatarSize.medium:
        return 48;
      case AvatarSize.large:
        return 64;
      case AvatarSize.xLarge:
        return 88;
    }
  }

  double _getBadgeSize() {
    switch (size) {
      case AvatarSize.small:
        return 16;
      case AvatarSize.medium:
        return 20;
      case AvatarSize.large:
        return 24;
      case AvatarSize.xLarge:
        return 26.67; // Tamaño exacto de Figma
    }
  }
}

/// Avatar simple circular sin badges (para listas y cards)
class AppCircleAvatar extends StatelessWidget {
  final String? imageUrl;
  final String? initials;
  final double size;
  final Color? backgroundColor;

  const AppCircleAvatar({
    super.key,
    this.imageUrl,
    this.initials,
    this.size = 40,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Determinar si es una imagen local o remota
    final isLocalImage = imageUrl != null && imageUrl!.startsWith('lib/assets');
    
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary.withOpacity(0.1),
        shape: BoxShape.circle,
        image: imageUrl != null
            ? DecorationImage(
                image: isLocalImage
                    ? AssetImage(imageUrl!) as ImageProvider
                    : NetworkImage(imageUrl!),
                fit: BoxFit.cover,
              )
            : null,
      ),
      child: imageUrl == null
          ? Center(
              child: Text(
                initials ?? '?',
                style: TextStyle(
                  fontSize: size * 0.4,
                  fontWeight: FontWeight.w600,
                  color: AppColors.onSurface,
                ),
              ),
            )
          : null,
    );
  }
}

