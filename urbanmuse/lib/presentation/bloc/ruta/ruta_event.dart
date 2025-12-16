import 'package:equatable/equatable.dart';
import '../../../domain/entities/ruta.dart';

/// Eventos del RutaBloc
abstract class RutaEvent extends Equatable {
  const RutaEvent();
  
  @override
  List<Object?> get props => [];
}

/// Evento para cargar todas las rutas
class LoadRutas extends RutaEvent {
  const LoadRutas();
}

/// Evento para obtener ruta por ID
class GetRutaById extends RutaEvent {
  final String id;
  
  const GetRutaById(this.id);
  
  @override
  List<Object?> get props => [id];
}

/// Evento para crear ruta
class CreateRuta extends RutaEvent {
  final Ruta ruta;
  
  const CreateRuta(this.ruta);
  
  @override
  List<Object?> get props => [ruta];
}

/// Evento para eliminar ruta
class DeleteRuta extends RutaEvent {
  final String id;
  
  const DeleteRuta(this.id);
  
  @override
  List<Object?> get props => [id];
}

/// Evento para calcular ruta
class CalculateRuta extends RutaEvent {
  final String puntoAId;
  final String puntoBId;
  final List<String> obraIds;
  final String modoTransporte; // 'bici' o 'a_pie'
  
  const CalculateRuta({
    required this.puntoAId,
    required this.puntoBId,
    required this.obraIds,
    required this.modoTransporte,
  });
  
  @override
  List<Object?> get props => [puntoAId, puntoBId, obraIds, modoTransporte];
}

/// Evento para cargar rutas públicas
class LoadRutasPublicas extends RutaEvent {
  const LoadRutasPublicas();
}

/// Evento para cargar rutas públicas dinámicas
class LoadRutasPublicasDinamicas extends RutaEvent {
  const LoadRutasPublicasDinamicas();
}

/// Evento para convertir ruta a dinámica
class ConvertirADinamica extends RutaEvent {
  final String rutaId;
  final String rrule;
  final DateTime fechaInicial;
  final String hora; // TimeOfDay como String "HH:mm"
  
  const ConvertirADinamica({
    required this.rutaId,
    required this.rrule,
    required this.fechaInicial,
    required this.hora,
  });
  
  @override
  List<Object?> get props => [rutaId, rrule, fechaInicial, hora];
}

/// Evento para unirse a una ruta dinámica
class JoinRutaDinamica extends RutaEvent {
  final String rutaId;
  final String userId;
  
  const JoinRutaDinamica({
    required this.rutaId,
    required this.userId,
  });
  
  @override
  List<Object?> get props => [rutaId, userId];
}

/// Evento para salir de una ruta dinámica
class LeaveRutaDinamica extends RutaEvent {
  final String rutaId;
  final String userId;
  
  const LeaveRutaDinamica({
    required this.rutaId,
    required this.userId,
  });
  
  @override
  List<Object?> get props => [rutaId, userId];
}

