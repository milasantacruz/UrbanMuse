import 'package:equatable/equatable.dart';
import 'ubicacion.dart';

/// Entidad de obra de arte callejero
class Obra extends Equatable {
  final String id;
  final String titulo;
  final String artistaId;
  final String artistaNombre;
  final String categoria; // graffiti, mural, escultura, performance
  final Ubicacion ubicacion;
  final String foto;
  final DateTime? fecha;
  final int likes;

  const Obra({
    required this.id,
    required this.titulo,
    required this.artistaId,
    required this.artistaNombre,
    required this.categoria,
    required this.ubicacion,
    required this.foto,
    this.fecha,
    this.likes = 0,
  });

  @override
  List<Object?> get props => [
        id,
        titulo,
        artistaId,
        artistaNombre,
        categoria,
        ubicacion,
        foto,
        fecha,
        likes,
      ];
}

