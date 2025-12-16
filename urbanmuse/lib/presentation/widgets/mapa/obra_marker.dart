import 'package:flutter/material.dart';
import '../map_pins/app_map_pin.dart';

/// ObraMarker
/// 
/// Marcador personalizado para obras en el mapa.
/// Usa AppMapPin con la categoría correspondiente.
class ObraMarker extends StatelessWidget {
  final String categoria;
  final MapPinSize size;

  const ObraMarker({
    super.key,
    required this.categoria,
    this.size = MapPinSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    // Convertir categoría string a enum
    MapPinCategory pinCategory;
    switch (categoria.toLowerCase()) {
      case 'graffiti':
        pinCategory = MapPinCategory.graffiti;
        break;
      case 'mural':
        pinCategory = MapPinCategory.mural;
        break;
      case 'escultura':
        pinCategory = MapPinCategory.escultura;
        break;
      case 'performance':
        pinCategory = MapPinCategory.performance;
        break;
      default:
        pinCategory = MapPinCategory.generic;
    }

    return AppMapPin(
      category: pinCategory,
      size: size,
    );
  }
}

