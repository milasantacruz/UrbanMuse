import 'package:equatable/equatable.dart';
import '../../../domain/entities/obra.dart';

/// Estados del ObraBloc
abstract class ObraState extends Equatable {
  const ObraState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class ObraInitial extends ObraState {
  const ObraInitial();
}

/// Estado de carga
class ObraLoading extends ObraState {
  const ObraLoading();
}

/// Estado de éxito con lista de obras
class ObraLoaded extends ObraState {
  final List<Obra> obras;
  
  const ObraLoaded(this.obras);
  
  @override
  List<Object?> get props => [obras];
}

/// Estado de éxito con obra individual
class ObraDetailLoaded extends ObraState {
  final Obra obra;
  
  const ObraDetailLoaded(this.obra);
  
  @override
  List<Object?> get props => [obra];
}

/// Estado de error
class ObraError extends ObraState {
  final String message;
  
  const ObraError(this.message);
  
  @override
  List<Object?> get props => [message];
}

