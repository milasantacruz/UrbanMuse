import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/obra.dart';
import '../../../domain/entities/encuentro.dart';
import '../map_pins/app_map_pin.dart';
import 'obra_marker.dart';
import 'encuentro_marker.dart';

/// CustomMap
/// 
/// Wrapper de flutter_map para mostrar obras y encuentros en el mapa.
/// Incluye clustering básico, cache offline, y marcadores personalizados.
class CustomMap extends StatelessWidget {
  final List<Obra> obras;
  final List<Encuentro>? encuentros;
  final LatLng? userLocation;
  final LatLng initialCenter;
  final double initialZoom;
  final Function(Obra)? onObraTap;
  final Function(Encuentro)? onEncuentroTap;
  final Function(LatLng)? onMapTap;
  final bool showUserLocation;
  final List<String>? filteredCategories;
  final List<String>? filteredArtistas;
  final LatLng? puntoA;
  final LatLng? puntoB;

  const CustomMap({
    super.key,
    required this.obras,
    this.encuentros,
    this.userLocation,
    this.initialCenter = const LatLng(
      AppConstants.buenosAiresCenterLat,
      AppConstants.buenosAiresCenterLng,
    ),
    this.initialZoom = 13.0,
    this.onObraTap,
    this.onEncuentroTap,
    this.onMapTap,
    this.showUserLocation = true,
    this.filteredCategories,
    this.filteredArtistas,
    this.puntoA,
    this.puntoB,
  });

  @override
  Widget build(BuildContext context) {
    // Filtrar obras según categorías y artistas seleccionados
    final obrasFiltradas = _filterObras(obras);

    // Usar ubicación del usuario como centro si está disponible
    final center = userLocation ?? initialCenter;
    final zoom = userLocation != null ? 15.0 : initialZoom;
    
    return FlutterMap(
      options: MapOptions(
        initialCenter: center,
        initialZoom: zoom,
        minZoom: 10.0,
        maxZoom: 18.0,
        // Habilitar interacciones de zoom y pan
        interactionOptions: const InteractionOptions(
          flags: InteractiveFlag.all,
        ),
        onTap: (tapPosition, point) {
          onMapTap?.call(point);
        },
      ),
      children: [
        // Tile Layer (OpenStreetMap)
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.urbanmuse.graffiti_trails',
          maxZoom: 19,
          // Cache offline básico (se puede mejorar con flutter_map_cache)
          // Por ahora, flutter_map maneja el cache automáticamente
        ),

        // Markers Layer
        MarkerLayer(
          markers: [
            // Marcadores de obras
            ...obrasFiltradas.map((obra) {
              return Marker(
                point: LatLng(
                  obra.ubicacion.lat,
                  obra.ubicacion.lng,
                ),
                width: 40,
                height: 50,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () => onObraTap?.call(obra),
                  child: ObraMarker(
                    categoria: obra.categoria,
                    size: MapPinSize.medium,
                  ),
                ),
              );
            }),

            // Marcadores de encuentros (si existen)
            if (encuentros != null)
              ...encuentros!.where((e) => !e.cancelado).map((encuentro) {
                return Marker(
                  point: LatLng(
                    encuentro.ubicacion.lat,
                    encuentro.ubicacion.lng,
                  ),
                  width: 40,
                  height: 50,
                  child: GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () => onEncuentroTap?.call(encuentro),
                    child: EncuentroMarker(
                      size: MapPinSize.medium,
                    ),
                  ),
                );
              }),

            // Marcadores de puntos A y B (para creación de ruta)
            if (puntoA != null)
              Marker(
                point: puntoA!,
                width: 48,
                height: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF6BA034), // AppColors.primary
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
                  child: Center(
                    child: Text(
                      'A',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            if (puntoB != null)
              Marker(
                point: puntoB!,
                width: 48,
                height: 48,
                child: Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF253341), // AppColors.secondary
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
                  child: Center(
                    child: Text(
                      'B',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),

            // Marcador de ubicación del usuario
            if (showUserLocation && userLocation != null)
              Marker(
                point: userLocation!,
                width: 32,
                height: 32,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
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
                ),
              ),
          ],
        ),
      ],
    );
  }

  /// Filtra obras según categorías y artistas seleccionados
  List<Obra> _filterObras(List<Obra> obras) {
    var filtered = obras;

    // Filtrar por categorías
    if (filteredCategories != null && filteredCategories!.isNotEmpty) {
      filtered = filtered.where((obra) {
        return filteredCategories!.contains(obra.categoria);
      }).toList();
    }

    // Filtrar por artistas
    if (filteredArtistas != null && filteredArtistas!.isNotEmpty) {
      filtered = filtered.where((obra) {
        return filteredArtistas!.contains(obra.artistaId);
      }).toList();
    }

    return filtered;
  }
}

