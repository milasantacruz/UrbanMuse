import 'package:equatable/equatable.dart';
import '../../../domain/entities/usuario.dart';

/// Estados del UsuarioCubit
abstract class UsuarioState extends Equatable {
  const UsuarioState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class UsuarioInitial extends UsuarioState {
  const UsuarioInitial();
}

/// Estado de carga
class UsuarioLoading extends UsuarioState {
  const UsuarioLoading();
}

/// Estado de éxito con usuario
class UsuarioLoaded extends UsuarioState {
  final Usuario usuario;
  
  const UsuarioLoaded(this.usuario);
  
  @override
  List<Object?> get props => [usuario];
}

/// Estado de registro exitoso
class UsuarioRegistered extends UsuarioState {
  final Usuario usuario;
  
  const UsuarioRegistered(this.usuario);
  
  @override
  List<Object?> get props => [usuario];
}

/// Estado de actualización exitosa
class UsuarioUpdated extends UsuarioState {
  final Usuario usuario;
  
  const UsuarioUpdated(this.usuario);
  
  @override
  List<Object?> get props => [usuario];
}

/// Estado de error
class UsuarioError extends UsuarioState {
  final String message;
  
  const UsuarioError(this.message);
  
  @override
  List<Object?> get props => [message];
}

