import 'package:flutter/material.dart';
import '../map_pins/app_map_pin.dart';

/// EncuentroMarker
/// 
/// Marcador especial para encuentros de artistas en el mapa.
/// Diferente de los marcadores de obras para distinguirlos visualmente.
class EncuentroMarker extends StatelessWidget {
  final MapPinSize size;

  const EncuentroMarker({
    super.key,
    this.size = MapPinSize.medium,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final width = size.width;
    final height = size.height;
    final iconSize = size.iconSize;

    return Container(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Círculo exterior (pulso animado - opcional)
          Container(
            width: width * 1.3,
            height: height * 1.3,
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer.withOpacity(0.3),
              shape: BoxShape.circle,
            ),
          ),
          
          // Pin principal
          Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
              color: colorScheme.primary,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Icon(
              Icons.brush,
              size: iconSize,
              color: colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

