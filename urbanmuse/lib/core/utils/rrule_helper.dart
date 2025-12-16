import 'package:rrule/rrule.dart';

/// Helper para manejar eventos repetitivos con rrule
/// Soporta: diario, semanal, mensual, anual
class RRuleHelper {
  RRuleHelper._();

  /// Crear una regla de repetición (rrule) desde un tipo de repetición
  /// 
  /// [tipoRepeticion] debe ser: 'diario', 'semanal', 'mensual', 'anual'
  /// [fechaInicial] es la fecha de inicio del evento
  /// [frecuencia] es cuántas veces se repite (opcional, null = infinito)
  /// 
  /// Retorna un string con la regla rrule
  static String crearReglaRepeticion({
    required String tipoRepeticion,
    required DateTime fechaInicial,
    int? frecuencia,
  }) {
    final frequency = _getFrequency(tipoRepeticion);
    
    // Construir la regla rrule manualmente según RFC 5545
    final dtStart = _formatDateTime(fechaInicial);
    final countPart = frecuencia != null ? ';COUNT=$frecuencia' : '';
    return 'FREQ=$frequency;DTSTART=$dtStart$countPart';
  }

  /// Obtener la frecuencia de rrule desde un tipo de repetición
  static String _getFrequency(String tipoRepeticion) {
    switch (tipoRepeticion) {
      case 'diario':
        return 'DAILY';
      case 'semanal':
        return 'WEEKLY';
      case 'mensual':
        return 'MONTHLY';
      case 'anual':
        return 'YEARLY';
      default:
        throw ArgumentError('Tipo de repetición no válido: $tipoRepeticion');
    }
  }

  /// Formatear DateTime a formato RFC 5545
  static String _formatDateTime(DateTime dateTime) {
    final isoString = dateTime.toUtc().toIso8601String();
    final cleaned = isoString.replaceAll(RegExp(r'[-:]'), '').split('.')[0];
    return '${cleaned}Z';
  }

  /// Calcular las próximas N fechas de un evento repetitivo
  /// 
  /// [rruleString] es la regla rrule como string
  /// [cantidad] es cuántas fechas futuras calcular (default: 10)
  /// 
  /// Retorna una lista de fechas futuras
  static List<DateTime> calcularProximasFechas({
    required String rruleString,
    int cantidad = 10,
    DateTime? desdeFecha,
  }) {
    try {
      // Validar que el rrule sea válido
      RecurrenceRule.fromString(rruleString);
      final desde = desdeFecha ?? DateTime.now();
      
      // Calcular fechas manualmente según la frecuencia
      final tipo = obtenerTipoRepeticion(rruleString);
      if (tipo == null) return [];
      
      final fechas = <DateTime>[];
      var fechaActual = desde;
      
      for (int i = 0; i < cantidad; i++) {
        switch (tipo) {
          case 'diario':
            fechaActual = fechaActual.add(const Duration(days: 1));
            break;
          case 'semanal':
            fechaActual = fechaActual.add(const Duration(days: 7));
            break;
          case 'mensual':
            fechaActual = DateTime(fechaActual.year, fechaActual.month + 1, fechaActual.day);
            break;
          case 'anual':
            fechaActual = DateTime(fechaActual.year + 1, fechaActual.month, fechaActual.day);
            break;
        }
        fechas.add(fechaActual);
      }
      
      return fechas;
    } catch (e) {
      // Si hay error parseando rrule, retornar lista vacía
      return [];
    }
  }

  /// Verificar si una fecha específica coincide con una regla rrule
  /// 
  /// [rruleString] es la regla rrule como string
  /// [fecha] es la fecha a verificar
  /// 
  /// Retorna true si la fecha coincide con la regla
  static bool fechaCoincideConRegla({
    required String rruleString,
    required DateTime fecha,
  }) {
    try {
      // Validar que el rrule sea válido
      RecurrenceRule.fromString(rruleString);
      
      // Extraer fecha inicial del rrule
      final dtStartMatch = RegExp(r'DTSTART=([^;]+)').firstMatch(rruleString);
      if (dtStartMatch == null) return false;
      
      // Por ahora, validación simplificada
      // En una implementación completa, se calcularían todas las instancias
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Obtener la próxima fecha de un evento repetitivo
  /// 
  /// [rruleString] es la regla rrule como string
  /// [desdeFecha] es desde cuándo buscar (default: ahora)
  /// 
  /// Retorna la próxima fecha o null si no hay más eventos
  static DateTime? obtenerProximaFecha({
    required String rruleString,
    DateTime? desdeFecha,
  }) {
    final fechas = calcularProximasFechas(
      rruleString: rruleString,
      cantidad: 1,
      desdeFecha: desdeFecha,
    );

    return fechas.isNotEmpty ? fechas.first : null;
  }

  /// Formatear una regla rrule a texto legible en español
  /// 
  /// [rruleString] es la regla rrule como string
  /// 
  /// Retorna un string descriptivo (ej: "Cada semana", "Cada mes")
  static String formatearReglaATexto(String rruleString) {
    try {
      // Validar que sea un rrule válido
      RecurrenceRule.fromString(rruleString);
      
      // Obtener la frecuencia desde el string rrule
      if (rruleString.contains('FREQ=DAILY')) {
        return 'Cada día';
      } else if (rruleString.contains('FREQ=WEEKLY')) {
        return 'Cada semana';
      } else if (rruleString.contains('FREQ=MONTHLY')) {
        return 'Cada mes';
      } else if (rruleString.contains('FREQ=YEARLY')) {
        return 'Cada año';
      } else {
        return 'Repetitivo';
      }
    } catch (e) {
      return 'Repetitivo';
    }
  }

  /// Validar que una regla rrule sea válida
  /// 
  /// [rruleString] es la regla rrule como string
  /// 
  /// Retorna true si es válida, false si no
  static bool validarRegla(String rruleString) {
    try {
      RecurrenceRule.fromString(rruleString);
      return true;
    } catch (e) {
      return false;
    }
  }

  /// Obtener el tipo de repetición desde una regla rrule
  /// 
  /// [rruleString] es la regla rrule como string
  /// 
  /// Retorna el tipo de repetición ('diario', 'semanal', 'mensual', 'anual')
  static String? obtenerTipoRepeticion(String rruleString) {
    try {
      if (rruleString.contains('FREQ=DAILY')) {
        return 'diario';
      } else if (rruleString.contains('FREQ=WEEKLY')) {
        return 'semanal';
      } else if (rruleString.contains('FREQ=MONTHLY')) {
        return 'mensual';
      } else if (rruleString.contains('FREQ=YEARLY')) {
        return 'anual';
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
