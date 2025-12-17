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
  
  /// Fecha en que el artista publicó la obra
  final DateTime? fechaPublicacion;
  
  /// Indica si el usuario actual puede eliminar esta obra
  /// Solo es true si el usuario es artista y es el creador de la obra
  final bool puedeEliminar;

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
    this.fechaPublicacion,
    this.puedeEliminar = false,
  });

  /// Copiar con nuevos valores
  Obra copyWith({
    String? id,
    String? titulo,
    String? artistaId,
    String? artistaNombre,
    String? categoria,
    Ubicacion? ubicacion,
    String? foto,
    DateTime? fecha,
    int? likes,
    DateTime? fechaPublicacion,
    bool? puedeEliminar,
  }) {
    return Obra(
      id: id ?? this.id,
      titulo: titulo ?? this.titulo,
      artistaId: artistaId ?? this.artistaId,
      artistaNombre: artistaNombre ?? this.artistaNombre,
      categoria: categoria ?? this.categoria,
      ubicacion: ubicacion ?? this.ubicacion,
      foto: foto ?? this.foto,
      fecha: fecha ?? this.fecha,
      likes: likes ?? this.likes,
      fechaPublicacion: fechaPublicacion ?? this.fechaPublicacion,
      puedeEliminar: puedeEliminar ?? this.puedeEliminar,
    );
  }

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
        fechaPublicacion,
        puedeEliminar,
      ];
}

