import 'package:equatable/equatable.dart';
import '../../../domain/entities/ruta.dart';

/// Estados del TopNCubit
/// 
/// **Cambio importante:** Ahora maneja rutas (no obras)
abstract class TopNState extends Equatable {
  const TopNState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class TopNInitial extends TopNState {
  const TopNInitial();
}

/// Estado de carga
class TopNLoading extends TopNState {
  const TopNLoading();
}

/// Estado de éxito con Top N de rutas
class TopNLoaded extends TopNState {
  final List<Ruta> rutas;
  
  const TopNLoaded(this.rutas);
  
  @override
  List<Object?> get props => [rutas];
}

/// Estado de error
class TopNError extends TopNState {
  final String message;
  
  const TopNError(this.message);
  
  @override
  List<Object?> get props => [message];
}

