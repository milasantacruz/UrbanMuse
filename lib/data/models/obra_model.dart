import '../../domain/entities/obra.dart';
import 'ubicacion_model.dart';
import '../datasources/local/hive_utils.dart';

/// Modelo de datos para Obra
/// 
/// Extiende de la entidad Obra y agrega serialización JSON
class ObraModel extends Obra {
  const ObraModel({
    required super.id,
    required super.titulo,
    required super.artistaId,
    required super.artistaNombre,
    required super.categoria,
    required super.ubicacion,
    required super.foto,
    super.fecha,
    super.likes = 0,
    super.fechaPublicacion,
    super.puedeEliminar = false,
  });

  /// Crear desde JSON
  factory ObraModel.fromJson(Map<String, dynamic> json) {
    return ObraModel(
      id: json['id'] as String,
      titulo: json['titulo'] as String,
      artistaId: json['artistaId'] as String,
      artistaNombre: json['artistaNombre'] as String,
      categoria: json['categoria'] as String,
      ubicacion: UbicacionModel.fromJson(HiveUtils.toMapStringDynamic(json['ubicacion'])),
      foto: json['foto'] as String,
      fecha: json['fecha'] != null ? DateTime.parse(json['fecha'] as String) : null,
      likes: json['likes'] as int? ?? 0,
      fechaPublicacion: json['fechaPublicacion'] != null 
          ? DateTime.parse(json['fechaPublicacion'] as String) 
          : null,
      puedeEliminar: json['puedeEliminar'] as bool? ?? false,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'titulo': titulo,
      'artistaId': artistaId,
      'artistaNombre': artistaNombre,
      'categoria': categoria,
      'ubicacion': ubicacion is UbicacionModel
          ? (ubicacion as UbicacionModel).toJson()
          : UbicacionModel.fromEntity(ubicacion).toJson(),
      'foto': foto,
      'fecha': fecha?.toIso8601String(),
      'likes': likes,
      'fechaPublicacion': fechaPublicacion?.toIso8601String(),
      'puedeEliminar': puedeEliminar,
    };
  }

  /// Crear desde entidad Obra
  factory ObraModel.fromEntity(Obra obra) {
    return ObraModel(
      id: obra.id,
      titulo: obra.titulo,
      artistaId: obra.artistaId,
      artistaNombre: obra.artistaNombre,
      categoria: obra.categoria,
      ubicacion: obra.ubicacion is UbicacionModel
          ? obra.ubicacion
          : UbicacionModel.fromEntity(obra.ubicacion),
      foto: obra.foto,
      fecha: obra.fecha,
      likes: obra.likes,
      fechaPublicacion: obra.fechaPublicacion,
      puedeEliminar: obra.puedeEliminar,
    );
  }

  /// Convertir a entidad Obra
  Obra toEntity() {
    return Obra(
      id: id,
      titulo: titulo,
      artistaId: artistaId,
      artistaNombre: artistaNombre,
      categoria: categoria,
      ubicacion: ubicacion,
      foto: foto,
      fecha: fecha,
      likes: likes,
      fechaPublicacion: fechaPublicacion,
      puedeEliminar: puedeEliminar,
    );
  }
}

