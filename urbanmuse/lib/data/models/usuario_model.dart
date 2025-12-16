import '../../domain/entities/usuario.dart';

/// Modelo de datos para Usuario
/// 
/// Extiende de la entidad Usuario y agrega serialización JSON
class UsuarioModel extends Usuario {
  const UsuarioModel({
    required super.id,
    required super.nombre,
    required super.email,
    super.foto,
    required super.tipoUsuario,
    required super.fechaRegistro,
    super.artistaId,
  });

  /// Crear desde JSON
  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    // Convertir tipoUsuario de string a enum
    final tipoUsuarioStr = json['tipoUsuario'] as String;
    final tipoUsuario = tipoUsuarioStr == 'artista'
        ? TipoUsuario.artista
        : TipoUsuario.visitante;
    
    return UsuarioModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      email: json['email'] as String,
      foto: json['foto'] as String?,
      tipoUsuario: tipoUsuario,
      fechaRegistro: DateTime.parse(json['fechaRegistro'] as String),
      artistaId: json['artistaId'] as String?,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'email': email,
      'foto': foto,
      'tipoUsuario': tipoUsuario == TipoUsuario.artista ? 'artista' : 'visitante',
      'fechaRegistro': fechaRegistro.toIso8601String(),
      'artistaId': artistaId,
    };
  }

  /// Crear desde entidad Usuario
  factory UsuarioModel.fromEntity(Usuario usuario) {
    return UsuarioModel(
      id: usuario.id,
      nombre: usuario.nombre,
      email: usuario.email,
      foto: usuario.foto,
      tipoUsuario: usuario.tipoUsuario,
      fechaRegistro: usuario.fechaRegistro,
      artistaId: usuario.artistaId,
    );
  }

  /// Convertir a entidad Usuario
  Usuario toEntity() {
    return Usuario(
      id: id,
      nombre: nombre,
      email: email,
      foto: foto,
      tipoUsuario: tipoUsuario,
      fechaRegistro: fechaRegistro,
      artistaId: artistaId,
    );
  }
}

