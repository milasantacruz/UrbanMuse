import 'package:equatable/equatable.dart';
import '../../../domain/entities/salida_grupal.dart';

/// Estados del SalidaCubit
abstract class SalidaState extends Equatable {
  const SalidaState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class SalidaInitial extends SalidaState {
  const SalidaInitial();
}

/// Estado de carga
class SalidaLoading extends SalidaState {
  const SalidaLoading();
}

/// Estado de éxito con lista de salidas
class SalidaLoaded extends SalidaState {
  final List<SalidaGrupal> salidas;
  
  const SalidaLoaded(this.salidas);
  
  @override
  List<Object?> get props => [salidas];
}

/// Estado de éxito con salida individual
class SalidaDetailLoaded extends SalidaState {
  final SalidaGrupal salida;
  
  const SalidaDetailLoaded(this.salida);
  
  @override
  List<Object?> get props => [salida];
}

/// Estado de creación exitosa
class SalidaCreated extends SalidaState {
  final SalidaGrupal salida;
  
  const SalidaCreated(this.salida);
  
  @override
  List<Object?> get props => [salida];
}

/// Estado de error
class SalidaError extends SalidaState {
  final String message;
  
  const SalidaError(this.message);
  
  @override
  List<Object?> get props => [message];
}

