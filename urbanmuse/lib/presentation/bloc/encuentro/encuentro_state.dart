import 'package:equatable/equatable.dart';
import '../../../domain/entities/encuentro.dart';

/// Estados del EncuentroCubit
/// 
/// Reemplaza SalidaState
abstract class EncuentroState extends Equatable {
  const EncuentroState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class EncuentroInitial extends EncuentroState {
  const EncuentroInitial();
}

/// Estado de carga
class EncuentroLoading extends EncuentroState {
  const EncuentroLoading();
}

/// Estado de éxito con lista de encuentros
class EncuentrosLoaded extends EncuentroState {
  final List<Encuentro> encuentros;
  
  const EncuentrosLoaded(this.encuentros);
  
  @override
  List<Object?> get props => [encuentros];
}

/// Estado de éxito con encuentro individual
class EncuentroDetailLoaded extends EncuentroState {
  final Encuentro encuentro;
  
  const EncuentroDetailLoaded(this.encuentro);
  
  @override
  List<Object?> get props => [encuentro];
}

/// Estado de creación exitosa
class EncuentroCreated extends EncuentroState {
  final Encuentro encuentro;
  
  const EncuentroCreated(this.encuentro);
  
  @override
  List<Object?> get props => [encuentro];
}

/// Estado de error
class EncuentroError extends EncuentroState {
  final String message;
  
  const EncuentroError(this.message);
  
  @override
  List<Object?> get props => [message];
}

