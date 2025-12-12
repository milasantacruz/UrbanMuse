import 'package:equatable/equatable.dart';
import '../../../domain/entities/ruta.dart';

/// Estados del RutaBloc
abstract class RutaState extends Equatable {
  const RutaState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class RutaInitial extends RutaState {
  const RutaInitial();
}

/// Estado de carga
class RutaLoading extends RutaState {
  const RutaLoading();
}

/// Estado de éxito con lista de rutas
class RutaLoaded extends RutaState {
  final List<Ruta> rutas;
  
  const RutaLoaded(this.rutas);
  
  @override
  List<Object?> get props => [rutas];
}

/// Estado de éxito con ruta individual
class RutaDetailLoaded extends RutaState {
  final Ruta ruta;
  
  const RutaDetailLoaded(this.ruta);
  
  @override
  List<Object?> get props => [ruta];
}

/// Estado de creación exitosa
class RutaCreated extends RutaState {
  final Ruta ruta;
  
  const RutaCreated(this.ruta);
  
  @override
  List<Object?> get props => [ruta];
}

/// Estado de error
class RutaError extends RutaState {
  final String message;
  
  const RutaError(this.message);
  
  @override
  List<Object?> get props => [message];
}

