import 'package:flutter/material.dart';

/// Tamaños de iconos según Material 3 y Figma
enum AppIconSize {
  small(16),      // 16px
  medium(24),     // 24px (default Material)
  large(32),      // 32px
  extraLarge(48); // 48px

  final double size;
  const AppIconSize(this.size);
}

/// Widget de icono personalizado siguiendo Material 3 y Figma
/// Basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-
class AppIcon extends StatelessWidget {
  final IconData icon;
  final AppIconSize size;
  final Color? color;
  final String? semanticLabel;

  const AppIcon({
    super.key,
    required this.icon,
    this.size = AppIconSize.medium,
    this.color,
    this.semanticLabel,
  });

  /// Constructor para icono pequeño (16px)
  const AppIcon.small({
    super.key,
    required this.icon,
    this.color,
    this.semanticLabel,
  }) : size = AppIconSize.small;

  /// Constructor para icono mediano (24px) - Default Material
  const AppIcon.medium({
    super.key,
    required this.icon,
    this.color,
    this.semanticLabel,
  }) : size = AppIconSize.medium;

  /// Constructor para icono grande (32px)
  const AppIcon.large({
    super.key,
    required this.icon,
    this.color,
    this.semanticLabel,
  }) : size = AppIconSize.large;

  /// Constructor para icono extra grande (48px)
  const AppIcon.extraLarge({
    super.key,
    required this.icon,
    this.color,
    this.semanticLabel,
  }) : size = AppIconSize.extraLarge;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size.size,
      color: color,
      semanticLabel: semanticLabel,
    );
  }
}

/// Clase de iconos de navegación de la app
class AppIcons {
  AppIcons._();

  // Navigation Icons
  static const IconData home = Icons.home_outlined;
  static const IconData homeFilled = Icons.home;
  static const IconData explore = Icons.explore_outlined;
  static const IconData exploreFilled = Icons.explore;
  static const IconData route = Icons.route_outlined;
  static const IconData routeFilled = Icons.route;
  static const IconData favorite = Icons.favorite_outline;
  static const IconData favoriteFilled = Icons.favorite;
  static const IconData profile = Icons.person_outline;
  static const IconData profileFilled = Icons.person;

  // Action Icons
  static const IconData search = Icons.search;
  static const IconData filter = Icons.filter_alt_outlined;
  static const IconData filterFilled = Icons.filter_alt;
  static const IconData add = Icons.add;
  static const IconData share = Icons.share_outlined;
  static const IconData close = Icons.close;
  static const IconData back = Icons.arrow_back;
  static const IconData moreVert = Icons.more_vert;
  static const IconData edit = Icons.edit_outlined;
  static const IconData delete = Icons.delete_outline;

  // Map Icons
  static const IconData location = Icons.place_outlined;
  static const IconData locationFilled = Icons.place;
  static const IconData myLocation = Icons.my_location;
  static const IconData directions = Icons.directions;
  static const IconData directionsWalk = Icons.directions_walk;
  static const IconData directionsBike = Icons.directions_bike;

  // Social Icons
  static const IconData group = Icons.group_outlined;
  static const IconData groupFilled = Icons.group;
  static const IconData person = Icons.person_outline;
  static const IconData personFilled = Icons.person;

  // Category Icons (Material approximations)
  static const IconData graffiti = Icons.brush; // Spray can approximation
  static const IconData mural = Icons.palette; // Brush/palette
  static const IconData sculpture = Icons.view_in_ar; // 3D cube
  static const IconData performance = Icons.theater_comedy; // Theater masks

  // UI Icons
  static const IconData check = Icons.check;
  static const IconData checkCircle = Icons.check_circle_outline;
  static const IconData checkCircleFilled = Icons.check_circle;
  static const IconData error = Icons.error_outline;
  static const IconData errorFilled = Icons.error;
  static const IconData warning = Icons.warning_amber;
  static const IconData info = Icons.info_outline;
  static const IconData infoFilled = Icons.info;
  static const IconData visibility = Icons.visibility;
  static const IconData visibilityOff = Icons.visibility_off;
  static const IconData calendar = Icons.calendar_today;
  static const IconData time = Icons.access_time;
  static const IconData arrowForward = Icons.arrow_forward;
  static const IconData arrowBack = Icons.arrow_back;
  static const IconData chevronRight = Icons.chevron_right;
  static const IconData chevronLeft = Icons.chevron_left;
  static const IconData expandMore = Icons.expand_more;
  static const IconData expandLess = Icons.expand_less;
}

