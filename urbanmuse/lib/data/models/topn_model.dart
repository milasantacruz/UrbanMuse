/// Modelo de datos para Top N (Rutas Favoritas)
/// 
/// **Cambio importante:** Ahora maneja rutas (no obras), máximo 10 rutas.
/// Reemplaza Top10Model que manejaba obras.
class TopNModel {
  final String userId;
  final List<String> rutaIds; // IDs de rutas en orden (máximo 10)

  const TopNModel({
    required this.userId,
    required this.rutaIds,
  });

  /// Crear desde JSON
  factory TopNModel.fromJson(Map<String, dynamic> json) {
    return TopNModel(
      userId: json['userId'] as String,
      rutaIds: (json['rutaIds'] as List<dynamic>).map((e) => e as String).toList(),
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'rutaIds': rutaIds,
    };
  }

  /// Validar que no exceda el límite
  bool get isValid => rutaIds.length <= 10;

  /// Validar que no haya duplicados
  bool get hasDuplicates => rutaIds.length != rutaIds.toSet().length;
}

