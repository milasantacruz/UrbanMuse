import 'package:equatable/equatable.dart';
import 'ubicacion.dart';

/// Entidad de salida grupal
class SalidaGrupal extends Equatable {
  final String id;
  final String rutaId;
  final DateTime fecha;
  final DateTime horario;
  final Ubicacion puntoEncuentro;
  final String descripcion;
  final String creadorId;
  final List<String> participantesIds;
  final DateTime fechaCreacion;

  const SalidaGrupal({
    required this.id,
    required this.rutaId,
    required this.fecha,
    required this.horario,
    required this.puntoEncuentro,
    required this.descripcion,
    required this.creadorId,
    required this.participantesIds,
    required this.fechaCreacion,
  });

  @override
  List<Object?> get props => [
        id,
        rutaId,
        fecha,
        horario,
        puntoEncuentro,
        descripcion,
        creadorId,
        participantesIds,
        fechaCreacion,
      ];
}

