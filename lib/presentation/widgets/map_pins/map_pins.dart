/// Map Pins - Componentes de marcadores de mapa para Graffiti Trails
/// 
/// Incluye:
/// - [AppMapPin] - Pin principal con forma de teardrop
/// - [AppMapPinDot] - Pin simplificado como punto
/// - [AppMapPinCluster] - Pin para agrupar múltiples obras
/// 
/// Uso:
/// ```dart
/// import 'package:urbanmuse/presentation/widgets/map_pins/map_pins.dart';
/// 
/// AppMapPin(
///   category: MapPinCategory.graffiti,
///   size: MapPinSize.medium,
///   onTap: () => print('Pin tapped'),
/// )
/// ```
library;

export 'app_map_pin.dart';
