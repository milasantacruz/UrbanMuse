import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';

/// Enum para las categorías de obra de arte urbano
enum MapPinCategory {
  graffiti,
  mural,
  escultura,
  performance,
  userLocation,
  generic,
}

/// Enum para los tamaños del Map Pin
enum MapPinSize {
  small,  // 32x40
  medium, // 40x50 (default)
  large,  // 48x60
  xlarge, // 56x70
}

/// Extensión para obtener propiedades del tamaño
extension MapPinSizeExtension on MapPinSize {
  double get width {
    switch (this) {
      case MapPinSize.small:
        return 32;
      case MapPinSize.medium:
        return 40;
      case MapPinSize.large:
        return 48;
      case MapPinSize.xlarge:
        return 56;
    }
  }

  double get height {
    switch (this) {
      case MapPinSize.small:
        return 40;
      case MapPinSize.medium:
        return 50;
      case MapPinSize.large:
        return 60;
      case MapPinSize.xlarge:
        return 70;
    }
  }

  double get iconSize {
    switch (this) {
      case MapPinSize.small:
        return 14;
      case MapPinSize.medium:
        return 18;
      case MapPinSize.large:
        return 22;
      case MapPinSize.xlarge:
        return 26;
    }
  }

  double get avatarSize {
    switch (this) {
      case MapPinSize.small:
        return 20;
      case MapPinSize.medium:
        return 26;
      case MapPinSize.large:
        return 32;
      case MapPinSize.xlarge:
        return 38;
    }
  }

  double get borderWidth {
    switch (this) {
      case MapPinSize.small:
        return 2;
      case MapPinSize.medium:
        return 2.5;
      case MapPinSize.large:
        return 3;
      case MapPinSize.xlarge:
        return 3.5;
    }
  }
}

/// Extensión para obtener propiedades del color de categoría
extension MapPinCategoryExtension on MapPinCategory {
  Color get color {
    switch (this) {
      case MapPinCategory.graffiti:
        return AppColors.categoryGraffiti;
      case MapPinCategory.mural:
        return AppColors.categoryMural;
      case MapPinCategory.escultura:
        return AppColors.categoryEscultura;
      case MapPinCategory.performance:
        return AppColors.categoryPerformance;
      case MapPinCategory.userLocation:
        return AppColors.primary;
      case MapPinCategory.generic:
        return AppColors.primary;
    }
  }

  IconData get defaultIcon {
    switch (this) {
      case MapPinCategory.graffiti:
        return Icons.format_paint;
      case MapPinCategory.mural:
        return Icons.image;
      case MapPinCategory.escultura:
        return Icons.architecture;
      case MapPinCategory.performance:
        return Icons.theater_comedy;
      case MapPinCategory.userLocation:
        return Icons.person;
      case MapPinCategory.generic:
        return Icons.place;
    }
  }

  String get label {
    switch (this) {
      case MapPinCategory.graffiti:
        return 'Graffiti';
      case MapPinCategory.mural:
        return 'Mural';
      case MapPinCategory.escultura:
        return 'Escultura';
      case MapPinCategory.performance:
        return 'Performance';
      case MapPinCategory.userLocation:
        return 'Tu ubicación';
      case MapPinCategory.generic:
        return 'Obra';
    }
  }
}

/// Map Pin Component para marcar obras de arte urbano en el mapa
/// 
/// Diseño basado en Syncfusion Flutter UI Kit - Material 3 Theme
/// Ref: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/?node-id=2036-431
/// 
/// Uso:
/// ```dart
/// AppMapPin(
///   category: MapPinCategory.graffiti,
///   size: MapPinSize.medium,
///   onTap: () => print('Pin tapped'),
/// )
/// ```
class AppMapPin extends StatelessWidget {
  const AppMapPin({
    super.key,
    required this.category,
    this.size = MapPinSize.medium,
    this.isSelected = false,
    this.showShadow = true,
    this.customIcon,
    this.customColor,
    this.avatarImageUrl,
    this.number,
    this.onTap,
    this.animate = false,
  });

  /// Categoría del pin que determina el color
  final MapPinCategory category;

  /// Tamaño del pin
  final MapPinSize size;

  /// Si el pin está seleccionado (muestra borde más grueso)
  final bool isSelected;

  /// Si mostrar sombra debajo del pin
  final bool showShadow;

  /// Icono personalizado (sobreescribe el icono de la categoría)
  final IconData? customIcon;

  /// Color personalizado (sobreescribe el color de la categoría)
  final Color? customColor;

  /// URL de imagen para mostrar avatar en lugar de icono
  final String? avatarImageUrl;

  /// Número para mostrar en el pin (para rutas numeradas 1-10)
  final int? number;

  /// Callback cuando se toca el pin
  final VoidCallback? onTap;

  /// Si el pin debe tener animación de pulso (para ubicación del usuario)
  final bool animate;

  @override
  Widget build(BuildContext context) {
    final pinColor = customColor ?? category.color;
    final icon = customIcon ?? category.defaultIcon;

    Widget pinWidget = CustomPaint(
      size: Size(size.width, size.height),
      painter: _MapPinPainter(
        color: pinColor,
        isSelected: isSelected,
        showShadow: showShadow,
        borderWidth: size.borderWidth,
      ),
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: EdgeInsets.only(bottom: size.height * 0.2),
          child: Center(
            child: _buildContent(icon, pinColor),
          ),
        ),
      ),
    );

    // Agregar animación de pulso si es necesario
    if (animate && category == MapPinCategory.userLocation) {
      pinWidget = _AnimatedPulseWrapper(
        color: pinColor,
        size: size,
        child: pinWidget,
      );
    }

    // Hacer tappable si hay callback
    if (onTap != null) {
      pinWidget = GestureDetector(
        onTap: onTap,
        child: pinWidget,
      );
    }

    return pinWidget;
  }

  Widget _buildContent(IconData icon, Color pinColor) {
    // Si hay número, mostrar número
    if (number != null) {
      return Container(
        width: size.avatarSize,
        height: size.avatarSize,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            number.toString(),
            style: TextStyle(
              color: pinColor,
              fontSize: size.iconSize,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
    }

    // Si hay imagen de avatar, mostrar avatar
    if (avatarImageUrl != null && avatarImageUrl!.isNotEmpty) {
      return Container(
        width: size.avatarSize,
        height: size.avatarSize,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          border: Border.all(color: Colors.white, width: 2),
          image: DecorationImage(
            image: NetworkImage(avatarImageUrl!),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    // Por defecto, mostrar icono
    return Container(
      width: size.avatarSize,
      height: size.avatarSize,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: size.iconSize,
        color: pinColor,
      ),
    );
  }
}

/// Painter personalizado para dibujar la forma de teardrop del pin
class _MapPinPainter extends CustomPainter {
  _MapPinPainter({
    required this.color,
    required this.isSelected,
    required this.showShadow,
    required this.borderWidth,
  });

  final Color color;
  final bool isSelected;
  final bool showShadow;
  final double borderWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final borderPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.stroke
      ..strokeWidth = isSelected ? borderWidth * 1.5 : borderWidth;

    // Sombra
    if (showShadow) {
      final shadowPaint = Paint()
        ..color = Colors.black.withValues(alpha: 0.25)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 4);
      
      final shadowPath = _createPinPath(size, offsetY: 2);
      canvas.drawPath(shadowPath, shadowPaint);
    }

    // Forma del pin
    final path = _createPinPath(size);
    canvas.drawPath(path, paint);
    canvas.drawPath(path, borderPaint);

    // Borde adicional si está seleccionado
    if (isSelected) {
      final glowPaint = Paint()
        ..color = color.withValues(alpha: 0.3)
        ..style = PaintingStyle.stroke
        ..strokeWidth = borderWidth * 2.5;
      canvas.drawPath(path, glowPaint);
    }
  }

  Path _createPinPath(Size size, {double offsetY = 0}) {
    final path = Path();
    final centerX = size.width / 2;
    final topRadius = size.width / 2 - 1;
    final bottomY = size.height - 2 + offsetY;
    final topY = topRadius + offsetY;

    // Dibujar forma de lágrima (teardrop)
    // Empezamos desde el punto inferior
    path.moveTo(centerX, bottomY);

    // Curva izquierda hacia arriba
    path.quadraticBezierTo(
      0, // control point x
      size.height * 0.4 + offsetY, // control point y
      0 + 1, // end x
      topY, // end y
    );

    // Arco superior (círculo)
    path.arcToPoint(
      Offset(size.width - 1, topY),
      radius: Radius.circular(topRadius),
      clockwise: true,
    );

    // Curva derecha hacia abajo
    path.quadraticBezierTo(
      size.width, // control point x
      size.height * 0.4 + offsetY, // control point y
      centerX, // end x
      bottomY, // end y
    );

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(covariant _MapPinPainter oldDelegate) {
    return oldDelegate.color != color ||
        oldDelegate.isSelected != isSelected ||
        oldDelegate.showShadow != showShadow ||
        oldDelegate.borderWidth != borderWidth;
  }
}

/// Widget wrapper para animación de pulso (ubicación del usuario)
class _AnimatedPulseWrapper extends StatefulWidget {
  const _AnimatedPulseWrapper({
    required this.child,
    required this.color,
    required this.size,
  });

  final Widget child;
  final Color color;
  final MapPinSize size;

  @override
  State<_AnimatedPulseWrapper> createState() => _AnimatedPulseWrapperState();
}

class _AnimatedPulseWrapperState extends State<_AnimatedPulseWrapper>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();

    _scaleAnimation = Tween<double>(begin: 1.0, end: 2.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );

    _opacityAnimation = Tween<double>(begin: 0.4, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Círculo animado de pulso
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            return Transform.scale(
              scale: _scaleAnimation.value,
              child: Opacity(
                opacity: _opacityAnimation.value,
                child: Container(
                  width: widget.size.width,
                  height: widget.size.width,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.color,
                  ),
                ),
              ),
            );
          },
        ),
        // Pin principal
        widget.child,
      ],
    );
  }
}

/// Map Pin simplificado solo con punto (sin icono interior)
/// Útil para clusters o pins más simples
class AppMapPinDot extends StatelessWidget {
  const AppMapPinDot({
    super.key,
    required this.category,
    this.size = 16,
    this.isSelected = false,
    this.customColor,
    this.onTap,
  });

  final MapPinCategory category;
  final double size;
  final bool isSelected;
  final Color? customColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final color = customColor ?? category.color;

    Widget dot = Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: isSelected ? 3 : 2,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
    );

    if (onTap != null) {
      dot = GestureDetector(onTap: onTap, child: dot);
    }

    return dot;
  }
}

/// Map Pin para clusters de múltiples obras
class AppMapPinCluster extends StatelessWidget {
  const AppMapPinCluster({
    super.key,
    this.count = 0,
    this.size = MapPinSize.medium,
    this.color,
    this.onTap,
  });

  /// Número de obras en el cluster
  final int count;

  /// Tamaño del pin
  final MapPinSize size;

  /// Color personalizado (default: primary)
  final Color? color;

  /// Callback cuando se toca
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final pinColor = color ?? AppColors.primary;
    final displayCount = count > 99 ? '99+' : count.toString();

    Widget cluster = Container(
      width: size.width,
      height: size.width,
      decoration: BoxDecoration(
        color: pinColor,
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white, width: size.borderWidth),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.25),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Text(
          displayCount,
          style: TextStyle(
            color: Colors.white,
            fontSize: size.iconSize,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );

    if (onTap != null) {
      cluster = GestureDetector(onTap: onTap, child: cluster);
    }

    return cluster;
  }
}
