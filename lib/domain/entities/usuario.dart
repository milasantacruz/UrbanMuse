import 'package:equatable/equatable.dart';

/// Tipos de usuario en la aplicación
enum TipoUsuario {
  visitante,
  artista,
}

/// Entidad de usuario
/// 
/// Representa un usuario de la aplicación.
/// - **Visitante:** Puede explorar, crear rutas, agregar a Top N
/// - **Artista:** Además puede publicar obras y crear encuentros
class Usuario extends Equatable {
  final String id;
  final String nombre;
  final String email;
  final String? foto;
  final TipoUsuario tipoUsuario;
  final DateTime fechaRegistro;
  
  /// ID del artista asociado (solo si tipoUsuario == artista)
  /// Si es artista, este ID coincide con el id del perfil de Artista
  final String? artistaId;

  const Usuario({
    required this.id,
    required this.nombre,
    required this.email,
    this.foto,
    required this.tipoUsuario,
    required this.fechaRegistro,
    this.artistaId,
  });

  /// Indica si el usuario es artista
  bool get esArtista => tipoUsuario == TipoUsuario.artista;
  
  /// Indica si el usuario es visitante
  bool get esVisitante => tipoUsuario == TipoUsuario.visitante;

  /// Copiar con nuevos valores
  Usuario copyWith({
    String? id,
    String? nombre,
    String? email,
    String? foto,
    TipoUsuario? tipoUsuario,
    DateTime? fechaRegistro,
    String? artistaId,
  }) {
    return Usuario(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      email: email ?? this.email,
      foto: foto ?? this.foto,
      tipoUsuario: tipoUsuario ?? this.tipoUsuario,
      fechaRegistro: fechaRegistro ?? this.fechaRegistro,
      artistaId: artistaId ?? this.artistaId,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nombre,
        email,
        foto,
        tipoUsuario,
        fechaRegistro,
        artistaId,
      ];
}

