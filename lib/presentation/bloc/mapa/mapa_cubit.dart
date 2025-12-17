import 'package:flutter_bloc/flutter_bloc.dart';
import 'mapa_state.dart';

/// Cubit para gestión de estado del mapa
class MapaCubit extends Cubit<MapaState> {
  MapaCubit() : super(const MapaInitial());
  
  /// Configurar centro del mapa
  void setCenter(double lat, double lng, {double? zoom}) {
    emit(MapaConfigured(
      centerLat: lat,
      centerLng: lng,
      zoom: zoom ?? 13.0,
    ));
  }
  
  /// Aplicar filtros
  void applyFilters({
    List<String>? categorias,
    List<String>? artistaIds,
  }) {
    final currentState = state;
    if (currentState is MapaConfigured) {
      emit(MapaConfigured(
        centerLat: currentState.centerLat,
        centerLng: currentState.centerLng,
        zoom: currentState.zoom,
        categoriasFiltradas: categorias,
        artistaIdsFiltrados: artistaIds,
      ));
    } else {
      emit(MapaConfigured(
        categoriasFiltradas: categorias,
        artistaIdsFiltrados: artistaIds,
      ));
    }
  }
  
  /// Limpiar filtros
  void clearFilters() {
    final currentState = state;
    if (currentState is MapaConfigured) {
      emit(MapaConfigured(
        centerLat: currentState.centerLat,
        centerLng: currentState.centerLng,
        zoom: currentState.zoom,
      ));
    }
  }
}

