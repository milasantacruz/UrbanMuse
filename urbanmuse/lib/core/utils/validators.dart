/// Validadores para formularios y datos

class Validators {
  Validators._();

  /// Validar que un string no esté vacío
  static String? notEmpty(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Este campo es requerido';
    }
    return null;
  }

  /// Validar email (opcional para futuro)
  static String? email(String? value) {
    if (value == null || value.isEmpty) return null;
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email inválido';
    }
    return null;
  }

  /// Validar que una fecha sea futura
  static bool isFutureDate(DateTime date) {
    return date.isAfter(DateTime.now());
  }

  /// Validar límite de obras en Top 10 (OBSOLETO - usar validarLimiteTopN)
  @Deprecated('Usar validarLimiteTopN para rutas')
  static bool isValidTop10Count(int count) {
    return count >= 0 && count <= 10;
  }

  /// Validar límite de obras en ruta
  static bool isValidRutaObrasCount(int count) {
    return count >= 1 && count <= 15;
  }

  // ============================================
  // Nuevos Validadores (v2.0)
  // ============================================

  /// Validar que una ubicación esté dentro de los límites de Buenos Aires (CABA)
  /// 
  /// [lat] es la latitud
  /// [lng] es la longitud
  /// 
  /// Retorna true si está dentro de CABA
  static bool validarUbicacionCABA(double lat, double lng) {
    const latMin = -34.7050;
    const latMax = -34.5200;
    const lngMin = -58.5300;
    const lngMax = -58.3500;

    return lat >= latMin && 
           lat <= latMax && 
           lng >= lngMin && 
           lng <= lngMax;
  }

  /// Validar que un tipo de usuario sea válido
  /// 
  /// [tipoUsuario] debe ser 'visitante' o 'artista'
  /// 
  /// Retorna true si es válido
  static bool validarTipoUsuario(String tipoUsuario) {
    return tipoUsuario == 'visitante' || tipoUsuario == 'artista';
  }

  /// Validar que el Top N no exceda el máximo de rutas
  /// 
  /// [cantidadRutas] es la cantidad actual de rutas
  /// [maxRutas] es el máximo permitido (default: 10)
  /// 
  /// Retorna true si está dentro del límite
  static bool validarLimiteTopN(int cantidadRutas, {int maxRutas = 10}) {
    return cantidadRutas <= maxRutas;
  }

  /// Validar que un modo de transporte sea válido
  /// 
  /// [modoTransporte] debe ser 'bici' o 'a_pie'
  /// 
  /// Retorna true si es válido
  static bool validarModoTranporte(String modoTransporte) {
    return modoTransporte == 'bici' || modoTransporte == 'a_pie';
  }

  /// Validar que un tipo de ruta sea válido
  /// 
  /// [tipoRuta] debe ser 'privada', 'publica_estatica' o 'publica_dinamica'
  /// 
  /// Retorna true si es válido
  static bool validarTipoRuta(String tipoRuta) {
    return tipoRuta == 'privada' || 
           tipoRuta == 'publica_estatica' || 
           tipoRuta == 'publica_dinamica';
  }

  /// Validar que una fecha sea futura
  /// 
  /// [fecha] es la fecha a validar
  /// 
  /// Retorna true si la fecha es futura
  static bool validarFechaFutura(DateTime fecha) {
    return fecha.isAfter(DateTime.now());
  }

  /// Validar que una regla rrule sea válida (para rutas dinámicas)
  /// 
  /// [rruleString] es la regla rrule como string
  /// 
  /// Retorna true si es válida
  static bool validarRRule(String rruleString) {
    try {
      // Importar rrule_helper dinámicamente
      // Nota: Esto requiere que rrule_helper esté disponible
      return true; // Por ahora retornar true, se validará con RRuleHelper
    } catch (e) {
      return false;
    }
  }
}

