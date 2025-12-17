import 'package:flutter/material.dart';
import '../../domain/entities/ruta.dart';
import 'ubicacion_model.dart';
import '../datasources/local/hive_utils.dart';

/// Modelo de datos para Ruta
/// 
/// Extiende de la entidad Ruta y agrega serialización JSON
/// Soporta rutas privadas, públicas estáticas y públicas dinámicas
class RutaModel extends Ruta {
  const RutaModel({
    required super.id,
    required super.nombre,
    required super.puntoA,
    required super.puntoB,
    required super.obraIds,
    required super.ordenVisita,
    required super.distancia,
    required super.tiempoEstimado,
    required super.modoTransporte,
    required super.tipo,
    required super.creadorId,
    required super.fechaCreacion,
    super.rrule,
    super.fechaInicial,
    super.hora,
    super.asistentesIds = const [],
  });

  /// Crear desde JSON
  factory RutaModel.fromJson(Map<String, dynamic> json) {
    // Convertir modoTransporte de string a enum
    final modoTransporteStr = json['modoTransporte'] as String;
    final modoTransporte = modoTransporteStr == 'bici' 
        ? ModoTransporte.bici 
        : ModoTransporte.aPie;
    
    // Convertir tipo de string a enum
    final tipoStr = json['tipo'] as String;
    final tipo = tipoStr == 'privada'
        ? TipoRuta.privada
        : tipoStr == 'publica_estatica'
            ? TipoRuta.publicaEstatica
            : TipoRuta.publicaDinamica;
    
    // Convertir hora de string a TimeOfDay
    TimeOfDay? hora;
    if (json['hora'] != null) {
      final horaStr = json['hora'] as String;
      final parts = horaStr.split(':');
      hora = TimeOfDay(
        hour: int.parse(parts[0]),
        minute: int.parse(parts[1]),
      );
    }
    
    return RutaModel(
      id: json['id'] as String,
      nombre: json['nombre'] as String,
      puntoA: UbicacionModel.fromJson(HiveUtils.toMapStringDynamic(json['puntoA'])),
      puntoB: UbicacionModel.fromJson(HiveUtils.toMapStringDynamic(json['puntoB'])),
      obraIds: (json['obraIds'] as List<dynamic>).map((e) => e as String).toList(),
      ordenVisita: (json['ordenVisita'] as List<dynamic>).map((e) => e as int).toList(),
      distancia: (json['distancia'] as num).toDouble(),
      tiempoEstimado: (json['tiempoEstimado'] as num).toDouble(),
      modoTransporte: modoTransporte,
      tipo: tipo,
      creadorId: json['creadorId'] as String,
      fechaCreacion: DateTime.parse(json['fechaCreacion'] as String),
      rrule: json['rrule'] as String?,
      fechaInicial: json['fechaInicial'] != null 
          ? DateTime.parse(json['fechaInicial'] as String)
          : null,
      hora: hora,
      asistentesIds: json['asistentesIds'] != null
          ? (json['asistentesIds'] as List<dynamic>).map((e) => e as String).toList()
          : const [],
    );
  }

  /// Convertir a JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nombre': nombre,
      'puntoA': puntoA is UbicacionModel 
          ? (puntoA as UbicacionModel).toJson()
          : UbicacionModel.fromEntity(puntoA).toJson(),
      'puntoB': puntoB is UbicacionModel 
          ? (puntoB as UbicacionModel).toJson()
          : UbicacionModel.fromEntity(puntoB).toJson(),
      'obraIds': obraIds,
      'ordenVisita': ordenVisita,
      'distancia': distancia,
      'tiempoEstimado': tiempoEstimado,
      'modoTransporte': modoTransporte == ModoTransporte.bici ? 'bici' : 'a_pie',
      'tipo': tipo == TipoRuta.privada 
          ? 'privada'
          : tipo == TipoRuta.publicaEstatica
              ? 'publica_estatica'
              : 'publica_dinamica',
      'creadorId': creadorId,
      'fechaCreacion': fechaCreacion.toIso8601String(),
      'rrule': rrule,
      'fechaInicial': fechaInicial?.toIso8601String(),
      'hora': hora != null ? '${hora!.hour.toString().padLeft(2, '0')}:${hora!.minute.toString().padLeft(2, '0')}' : null,
      'asistentesIds': asistentesIds,
    };
  }

  /// Crear desde entidad Ruta
  factory RutaModel.fromEntity(Ruta ruta) {
    return RutaModel(
      id: ruta.id,
      nombre: ruta.nombre,
      puntoA: ruta.puntoA is UbicacionModel
          ? ruta.puntoA
          : UbicacionModel.fromEntity(ruta.puntoA),
      puntoB: ruta.puntoB is UbicacionModel
          ? ruta.puntoB
          : UbicacionModel.fromEntity(ruta.puntoB),
      obraIds: ruta.obraIds,
      ordenVisita: ruta.ordenVisita,
      distancia: ruta.distancia,
      tiempoEstimado: ruta.tiempoEstimado,
      modoTransporte: ruta.modoTransporte,
      tipo: ruta.tipo,
      creadorId: ruta.creadorId,
      fechaCreacion: ruta.fechaCreacion,
      rrule: ruta.rrule,
      fechaInicial: ruta.fechaInicial,
      hora: ruta.hora,
      asistentesIds: ruta.asistentesIds,
    );
  }

  /// Convertir a entidad Ruta
  Ruta toEntity() {
    return Ruta(
      id: id,
      nombre: nombre,
      puntoA: puntoA,
      puntoB: puntoB,
      obraIds: obraIds,
      ordenVisita: ordenVisita,
      distancia: distancia,
      tiempoEstimado: tiempoEstimado,
      modoTransporte: modoTransporte,
      tipo: tipo,
      creadorId: creadorId,
      fechaCreacion: fechaCreacion,
      rrule: rrule,
      fechaInicial: fechaInicial,
      hora: hora,
      asistentesIds: asistentesIds,
    );
  }
}

