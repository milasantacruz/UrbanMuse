import 'package:intl/intl.dart';

/// Utilidades para formatear fechas
class DateFormatter {
  DateFormatter._();

  /// Formatear fecha para mostrar (ej: "15 de marzo, 2024")
  static String formatDisplayDate(DateTime date) {
    return DateFormat('d \'de\' MMMM, yyyy', 'es').format(date);
  }

  /// Formatear fecha corta (ej: "15/03/2024")
  static String formatShortDate(DateTime date) {
    return DateFormat('dd/MM/yyyy', 'es').format(date);
  }

  /// Formatear fecha y hora (ej: "15/03/2024 10:30")
  static String formatDateTime(DateTime date) {
    return DateFormat('dd/MM/yyyy HH:mm', 'es').format(date);
  }

  /// Formatear solo hora (ej: "10:30 AM")
  static String formatTime(DateTime date) {
    return DateFormat('hh:mm a', 'es').format(date);
  }
}

