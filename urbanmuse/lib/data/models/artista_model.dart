import '../../domain/entities/artista.dart';

/// Modelo de datos para Artista
/// 
/// Extiende de la entidad Artista y agrega serialización JSON
class ArtistaModel extends Artista {
  const ArtistaModel({
    required super.id,
    required super.nombre,
    super.bio,
    super.foto,
    super.instagram,
    super.obrasCount = 0,
  });

  /// Crear desde JSON
  factory ArtistaModel.fromJson(Map<String, dynamic> json) {
    return ArtistaModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      bio: json['bio'] as String?,
      foto: json['foto'] as String?,
      instagram: json['instagram'] as String?,
      obrasCount: json['obrasCount'] as int? ?? 0,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'bio': bio,
      'foto': foto,
      'instagram': instagram,
      'obrasCount': obrasCount,
    };
  }

  /// Crear desde entidad Artista
  factory ArtistaModel.fromEntity(Artista artista) {
    return ArtistaModel(
      id: artista.id,
      nombre: artista.nombre,
      bio: artista.bio,
      foto: artista.foto,
      instagram: artista.instagram,
      obrasCount: artista.obrasCount,
    );
  }

  /// Convertir a entidad Artista
  Artista toEntity() {
    return Artista(
      id: id,
      nombre: nombre,
      bio: bio,
      foto: foto,
      instagram: instagram,
      obrasCount: obrasCount,
    );
  }
}

