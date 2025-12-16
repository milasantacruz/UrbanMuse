import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../domain/entities/ruta.dart';
import '../../../domain/entities/obra.dart';

/// RutaPolyline
/// 
/// Widget para dibujar la ruta en el mapa como una polyline.
/// Muestra el camino desde el punto A hasta el punto B pasando por las obras seleccionadas.
class RutaPolyline extends StatelessWidget {
  final Ruta ruta;
  final List<Obra> obras; // Obras incluidas en la ruta
  final Color? color;
  final double strokeWidth;
  final bool showMarkers;

  const RutaPolyline({
    super.key,
    required this.ruta,
    required this.obras,
    this.color,
    this.strokeWidth = 4.0,
    this.showMarkers = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final polylineColor = color ?? colorScheme.primary;

    // Construir lista de puntos para la polyline
    final points = <LatLng>[];

    // Punto A (inicio)
    points.add(LatLng(
      ruta.puntoA.lat,
      ruta.puntoA.lng,
    ));

    // Obras en orden (si están ordenadas)
    for (final obraId in ruta.obraIds) {
      final obra = obras.firstWhere(
        (o) => o.id == obraId,
        orElse: () => obras.first, // Fallback
      );
      points.add(LatLng(
        obra.ubicacion.lat,
        obra.ubicacion.lng,
      ));
    }

    // Punto B (fin)
    points.add(LatLng(
      ruta.puntoB.lat,
      ruta.puntoB.lng,
    ));

    if (points.length < 2) {
      return const SizedBox.shrink();
    }

    return PolylineLayer(
      polylines: [
        Polyline(
          points: points,
          strokeWidth: strokeWidth,
          color: polylineColor,
          borderStrokeWidth: strokeWidth * 0.5,
          borderColor: Colors.white,
        ),
      ],
    );
  }
}

/// RutaPolylineLayer
/// 
/// Layer completo para mostrar una ruta en el mapa.
/// Incluye polyline, marcadores de inicio/fin, y marcadores de obras.
class RutaPolylineLayer extends StatelessWidget {
  final Ruta ruta;
  final List<Obra> obras;
  final Color? color;
  final double strokeWidth;
  final Function(Obra)? onObraTap;
  final Function()? onStartTap;
  final Function()? onEndTap;

  const RutaPolylineLayer({
    super.key,
    required this.ruta,
    required this.obras,
    this.color,
    this.strokeWidth = 4.0,
    this.onObraTap,
    this.onStartTap,
    this.onEndTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final routeColor = color ?? colorScheme.primary;

    // Construir puntos
    final points = <LatLng>[];
    points.add(LatLng(
      ruta.puntoA.lat,
      ruta.puntoA.lng,
    ));
    for (final obraId in ruta.obraIds) {
      final obra = obras.firstWhere(
        (o) => o.id == obraId,
        orElse: () => obras.first,
      );
      points.add(LatLng(
        obra.ubicacion.lat,
        obra.ubicacion.lng,
      ));
    }
    points.add(LatLng(
      ruta.puntoB.lat,
      ruta.puntoB.lng,
    ));

    if (points.length < 2) {
      return const SizedBox.shrink();
    }

    return Stack(
      children: [
        // Polyline
        PolylineLayer(
          polylines: [
            Polyline(
              points: points,
              strokeWidth: strokeWidth,
              color: routeColor,
              borderStrokeWidth: strokeWidth * 0.5,
              borderColor: Colors.white,
            ),
          ],
        ),

        // Marcadores
        MarkerLayer(
          markers: [
            // Marcador de inicio
            Marker(
              point: points.first,
              width: 40,
              height: 40,
              child: GestureDetector(
                onTap: onStartTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),

            // Marcador de fin
            Marker(
              point: points.last,
              width: 40,
              height: 40,
              child: GestureDetector(
                onTap: onEndTap,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 3,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.flag,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

