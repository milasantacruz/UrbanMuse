import 'package:equatable/equatable.dart';
import 'ubicacion.dart';

/// Entidad de ruta
class Ruta extends Equatable {
  final String id;
  final String nombre;
  final Ubicacion puntoA;
  final Ubicacion puntoB;
  final List<String> obraIds; // IDs de obras en la ruta
  final double distancia; // en metros
  final double tiempoEstimado; // en minutos
  final String transporte; // 'a_pie' o 'bici'
  final DateTime fechaCreacion;

  const Ruta({
    required this.id,
    required this.nombre,
    required this.puntoA,
    required this.puntoB,
    required this.obraIds,
    required this.distancia,
    required this.tiempoEstimado,
    required this.transporte,
    required this.fechaCreacion,
  });

  @override
  List<Object?> get props => [
        id,
        nombre,
        puntoA,
        puntoB,
        obraIds,
        distancia,
        tiempoEstimado,
        transporte,
        fechaCreacion,
      ];
}

