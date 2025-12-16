import 'package:flutter/material.dart';
import '../../domain/entities/encuentro.dart';
import 'ubicacion_model.dart';
import '../datasources/local/hive_utils.dart';

/// Modelo de datos para Encuentro
/// 
/// Extiende de la entidad Encuentro y agrega serialización JSON
/// Reemplaza SalidaGrupal
class EncuentroModel extends Encuentro {
  const EncuentroModel({
    required super.id,
    required super.artistaId,
    required super.artistaNombre,
    required super.ubicacion,
    required super.fecha,
    required super.hora,
    required super.descripcion,
    required super.creadorId,
    required super.fechaCreacion,
    super.rrule,
    super.asistentesIds = const [],
    super.cancelado = false,
  });

  /// Crear desde JSON
  factory EncuentroModel.fromJson(Map<String, dynamic> json) {
    // Convertir hora de string a TimeOfDay
    final horaStr = json['hora'] as String;
    final horaParts = horaStr.split(':');
    final hora = TimeOfDay(
      hour: int.parse(horaParts[0]),
      minute: int.parse(horaParts[1]),
    );
    
    return EncuentroModel(
      id: json['id'] as String,
      artistaId: json['artistaId'] as String,
      artistaNombre: json['artistaNombre'] as String,
      ubicacion: UbicacionModel.fromJson(HiveUtils.toMapStringDynamic(json['ubicacion'])),
      fecha: DateTime.parse(json['fecha'] as String),
      hora: hora,
      descripcion: json['descripcion'] as String,
      creadorId: json['creadorId'] as String,
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
      rrule: json['rrule'] as String?,
      asistentesIds: json['asistentesIds'] != null
          ? (json['asistentesIds'] as List<dynamic>).map((e) => e as String).toList()
          : const [],
      cancelado: json['cancelado'] as bool? ?? false,
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'artistaId': artistaId,
      'artistaNombre': artistaNombre,
      'ubicacion': ubicacion is UbicacionModel
          ? (ubicacion as UbicacionModel).toJson()
          : UbicacionModel.fromEntity(ubicacion).toJson(),
      'fecha': fecha.toIso8601String(),
      'hora': '${hora.hour.toString().padLeft(2, '0')}:${hora.minute.toString().padLeft(2, '0')}',
      'descripcion': descripcion,
      'creadorId': creadorId,
      'fechaCreacion': fechaCreacion.toIso8601String(),
      'rrule': rrule,
      'asistentesIds': asistentesIds,
      'cancelado': cancelado,
    };
  }

  /// Crear desde entidad Encuentro
  factory EncuentroModel.fromEntity(Encuentro encuentro) {
    return EncuentroModel(
      id: encuentro.id,
      artistaId: encuentro.artistaId,
      artistaNombre: encuentro.artistaNombre,
      ubicacion: encuentro.ubicacion is UbicacionModel
          ? encuentro.ubicacion
          : UbicacionModel.fromEntity(encuentro.ubicacion),
      fecha: encuentro.fecha,
      hora: encuentro.hora,
      descripcion: encuentro.descripcion,
      creadorId: encuentro.creadorId,
      fechaCreacion: encuentro.fechaCreacion,
      rrule: encuentro.rrule,
      asistentesIds: encuentro.asistentesIds,
      cancelado: encuentro.cancelado,
    );
  }

  /// Convertir a entidad Encuentro
  Encuentro toEntity() {
    return Encuentro(
      id: id,
      artistaId: artistaId,
      artistaNombre: artistaNombre,
      ubicacion: ubicacion,
      fecha: fecha,
      hora: hora,
      descripcion: descripcion,
      creadorId: creadorId,
      fechaCreacion: fechaCreacion,
      rrule: rrule,
      asistentesIds: asistentesIds,
      cancelado: cancelado,
    );
  }
}

