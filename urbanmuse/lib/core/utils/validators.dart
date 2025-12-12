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

  /// Validar límite de obras en Top 10
  static bool isValidTop10Count(int count) {
    return count >= 0 && count <= 10;
  }

  /// Validar límite de obras en ruta
  static bool isValidRutaObrasCount(int count) {
    return count >= 1 && count <= 15;
  }
}

