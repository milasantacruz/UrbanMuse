import 'package:equatable/equatable.dart';
import '../../core/constants/app_constants.dart';

/// Entidad de ubicación geográfica
/// 
/// Representa una ubicación dentro de Buenos Aires (CABA).
/// Todas las ubicaciones deben estar dentro de los límites de CABA.
class Ubicacion extends Equatable {
  final double lat;
  final double lng;
  final String? direccion;
  final String? barrio; // Barrio de CABA

  const Ubicacion({
    required this.lat,
    required this.lng,
    this.direccion,
    this.barrio,
  });

  /// Verificar si la ubicación está dentro de los límites de CABA
  bool get estaEnCABA {
    return lat >= AppConstants.buenosAiresLatMin &&
        lat <= AppConstants.buenosAiresLatMax &&
        lng >= AppConstants.buenosAiresLngMin &&
        lng <= AppConstants.buenosAiresLngMax;
  }

  /// Copiar con nuevos valores
  Ubicacion copyWith({
    double? lat,
    double? lng,
    String? direccion,
    String? barrio,
  }) {
    return Ubicacion(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      direccion: direccion ?? this.direccion,
      barrio: barrio ?? this.barrio,
    );
  }

  @override
  List<Object?> get props => [lat, lng, direccion, barrio];
}

