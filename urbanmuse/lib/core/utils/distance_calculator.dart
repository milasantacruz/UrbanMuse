import 'dart:math';

/// Utilidades para calcular distancias y rutas
class DistanceCalculator {
  DistanceCalculator._();

  /// Calcular distancia entre dos puntos (Haversine formula)
  /// Retorna distancia en metros
  static double calculateDistance(
    double lat1,
    double lon1,
    double lat2,
    double lon2,
  ) {
    const double earthRadius = 6371000; // Radio de la Tierra en metros
    
    final double dLat = _toRadians(lat2 - lat1);
    final double dLon = _toRadians(lon2 - lon1);
    
    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(_toRadians(lat1)) *
            cos(_toRadians(lat2)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    
    return earthRadius * c;
  }

  /// Convertir grados a radianes
  static double _toRadians(double degrees) {
    return degrees * (pi / 180);
  }

  /// Calcular tiempo estimado de caminata (metros a minutos)
  /// Velocidad promedio: 5 km/h = 83.33 m/min
  static double calculateWalkingTime(double distanceInMeters) {
    const double walkingSpeed = 83.33; // metros por minuto
    return distanceInMeters / walkingSpeed;
  }

  /// Calcular tiempo estimado en bicicleta (metros a minutos)
  /// Velocidad promedio: 15 km/h = 250 m/min
  /// **Principal:** Bici es el modo de transporte principal
  static double calculateBikingTime(double distanceInMeters) {
    const double bikingSpeed = 250.0; // metros por minuto
    return distanceInMeters / bikingSpeed;
  }

  /// Calcular tiempo estimado según modo de transporte
  /// 
  /// [distanceInMeters] es la distancia en metros
  /// [modoTransporte] debe ser 'bici' o 'a_pie'
  /// 
  /// Retorna tiempo estimado en minutos
  static double calculateTimeByTransport({
    required double distanceInMeters,
    required String modoTransporte,
  }) {
    switch (modoTransporte) {
      case 'bici':
        return calculateBikingTime(distanceInMeters);
      case 'a_pie':
        return calculateWalkingTime(distanceInMeters);
      default:
        // Por defecto, usar bici (principal)
        return calculateBikingTime(distanceInMeters);
    }
  }

  /// Formatear distancia para mostrar
  static String formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.round()} m';
    } else {
      final km = distanceInMeters / 1000;
      return '${km.toStringAsFixed(1)} km';
    }
  }

  /// Formatear tiempo estimado para mostrar
  static String formatTime(double timeInMinutes) {
    if (timeInMinutes < 60) {
      return '${timeInMinutes.round()} min';
    } else {
      final hours = (timeInMinutes / 60).floor();
      final minutes = (timeInMinutes % 60).round();
      if (minutes == 0) {
        return '$hours h';
      }
      return '$hours h $minutes min';
    }
  }
}

