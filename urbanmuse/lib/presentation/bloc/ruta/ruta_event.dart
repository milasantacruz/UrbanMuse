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
  final String transporte;
  
  const CalculateRuta({
    required this.puntoAId,
    required this.puntoBId,
    required this.obraIds,
    required this.transporte,
  });
  
  @override
  List<Object?> get props => [puntoAId, puntoBId, obraIds, transporte];
}

