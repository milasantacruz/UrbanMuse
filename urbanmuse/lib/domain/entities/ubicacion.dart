import 'package:equatable/equatable.dart';

/// Entidad de ubicación geográfica
class Ubicacion extends Equatable {
  final double lat;
  final double lng;
  final String? direccion;
  final String? barrio;

  const Ubicacion({
    required this.lat,
    required this.lng,
    this.direccion,
    this.barrio,
  });

  @override
  List<Object?> get props => [lat, lng, direccion, barrio];
}

