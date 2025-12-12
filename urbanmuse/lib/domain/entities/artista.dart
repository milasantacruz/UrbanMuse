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

