import 'package:equatable/equatable.dart';
import '../../../domain/entities/artista.dart';
import '../../../domain/entities/obra.dart';

/// Estados del ArtistaCubit
abstract class ArtistaState extends Equatable {
  const ArtistaState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class ArtistaInitial extends ArtistaState {
  const ArtistaInitial();
}

/// Estado de carga
class ArtistaLoading extends ArtistaState {
  const ArtistaLoading();
}

/// Estado de éxito con artista y obras
class ArtistaLoaded extends ArtistaState {
  final Artista artista;
  final List<Obra> obras;
  
  const ArtistaLoaded({
    required this.artista,
    required this.obras,
  });
  
  @override
  List<Object?> get props => [artista, obras];
}

/// Estado de error
class ArtistaError extends ArtistaState {
  final String message;
  
  const ArtistaError(this.message);
  
  @override
  List<Object?> get props => [message];
}

