import 'package:equatable/equatable.dart';

/// Entidad de artista
class Artista extends Equatable {
  final String id;
  final String nombre;
  final String? bio;
  final String? foto;
  final String? instagram;
  final int obrasCount;

  const Artista({
    required this.id,
    required this.nombre,
    this.bio,
    this.foto,
    this.instagram,
    this.obrasCount = 0,
  });

  /// Copiar con nuevos valores
  Artista copyWith({
    String? id,
    String? nombre,
    String? bio,
    String? foto,
    String? instagram,
    int? obrasCount,
  }) {
    return Artista(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      bio: bio ?? this.bio,
      foto: foto ?? this.foto,
      instagram: instagram ?? this.instagram,
      obrasCount: obrasCount ?? this.obrasCount,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nombre,
        bio,
        foto,
        instagram,
        obrasCount,
      ];
}

