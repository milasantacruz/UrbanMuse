import 'package:equatable/equatable.dart';

/// Estados del MapaCubit
abstract class MapaState extends Equatable {
  const MapaState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class MapaInitial extends MapaState {
  const MapaInitial();
}

/// Estado con configuración del mapa
class MapaConfigured extends MapaState {
  final double? centerLat;
  final double? centerLng;
  final double zoom;
  final List<String>? categoriasFiltradas;
  final List<String>? artistaIdsFiltrados;
  
  const MapaConfigured({
    this.centerLat,
    this.centerLng,
    this.zoom = 13.0,
    this.categoriasFiltradas,
    this.artistaIdsFiltrados,
  });
  
  @override
  List<Object?> get props => [
        centerLat,
        centerLng,
        zoom,
        categoriasFiltradas,
        artistaIdsFiltrados,
      ];
}

