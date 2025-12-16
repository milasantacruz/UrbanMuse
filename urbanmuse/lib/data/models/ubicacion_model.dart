import '../../domain/entities/ubicacion.dart';

/// Modelo de datos para Ubicacion
/// 
/// Extiende de la entidad Ubicacion y agrega serialización JSON
class UbicacionModel extends Ubicacion {
  const UbicacionModel({
    required super.lat,
    required super.lng,
    super.direccion,
    super.barrio,
  });

  /// Crear desde JSON
  factory UbicacionModel.fromJson(Map<String, dynamic> json) {
    return UbicacionModel(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      direccion: json['direccion'] as String?,
      barrio: json['barrio'] as String?,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
      'direccion': direccion,
      'barrio': barrio,
    };
  }

  /// Crear desde entidad Ubicacion
  factory UbicacionModel.fromEntity(Ubicacion ubicacion) {
    return UbicacionModel(
      lat: ubicacion.lat,
      lng: ubicacion.lng,
      direccion: ubicacion.direccion,
      barrio: ubicacion.barrio,
    );
  }

  /// Convertir a entidad Ubicacion
  Ubicacion toEntity() {
    return Ubicacion(
      lat: lat,
      lng: lng,
      direccion: direccion,
      barrio: barrio,
    );
  }
}

