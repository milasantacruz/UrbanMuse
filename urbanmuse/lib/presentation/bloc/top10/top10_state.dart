import 'package:equatable/equatable.dart';
import '../../../domain/entities/obra.dart';

/// Estados del Top10Cubit
abstract class Top10State extends Equatable {
  const Top10State();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class Top10Initial extends Top10State {
  const Top10Initial();
}

/// Estado de carga
class Top10Loading extends Top10State {
  const Top10Loading();
}

/// Estado de éxito con Top 10
class Top10Loaded extends Top10State {
  final List<Obra> obras;
  
  const Top10Loaded(this.obras);
  
  @override
  List<Object?> get props => [obras];
}

/// Estado de error
class Top10Error extends Top10State {
  final String message;
  
  const Top10Error(this.message);
  
  @override
  List<Object?> get props => [message];
}

