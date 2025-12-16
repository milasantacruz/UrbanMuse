import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'ubicacion.dart';

/// Entidad de encuentro de artista
/// 
/// Un encuentro es un evento donde un artista anuncia que va a pintar en vivo
/// en un lugar específico. Puede ser un evento único o repetitivo.
/// Los usuarios pueden unirse y recibir notificaciones.
class Encuentro extends Equatable {
  final String id;
  final String artistaId;
  final String artistaNombre;
  final Ubicacion ubicacion;
  final DateTime fecha;
  final TimeOfDay hora;
  final String descripcion;
  final String creadorId; // ID del artista que creó el encuentro
  final DateTime fechaCreacion;
  
  /// Regla de repetición (RFC 5545) si es un evento repetitivo
  /// Si es null, es un evento único
  final String? rrule;
  
  /// IDs de usuarios que se unieron al encuentro
  final List<String> asistentesIds;
  
  /// Indica si el encuentro está cancelado
  final bool cancelado;
  
  // Helpers
  bool get esRepetitivo => rrule != null && rrule!.isNotEmpty;
  bool get esUnico => !esRepetitivo;

  const Encuentro({
    required this.id,
    required this.artistaId,
    required this.artistaNombre,
    required this.ubicacion,
    required this.fecha,
    required this.hora,
    required this.descripcion,
    required this.creadorId,
    required this.fechaCreacion,
    this.rrule,
    this.asistentesIds = const [],
    this.cancelado = false,
  });

  /// Copiar con nuevos valores
  Encuentro copyWith({
    String? id,
    String? artistaId,
    String? artistaNombre,
    Ubicacion? ubicacion,
    DateTime? fecha,
    TimeOfDay? hora,
    String? descripcion,
    String? creadorId,
    DateTime? fechaCreacion,
    String? rrule,
    List<String>? asistentesIds,
    bool? cancelado,
  }) {
    return Encuentro(
      id: id ?? this.id,
      artistaId: artistaId ?? this.artistaId,
      artistaNombre: artistaNombre ?? this.artistaNombre,
      ubicacion: ubicacion ?? this.ubicacion,
      fecha: fecha ?? this.fecha,
      hora: hora ?? this.hora,
      descripcion: descripcion ?? this.descripcion,
      creadorId: creadorId ?? this.creadorId,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      rrule: rrule ?? this.rrule,
      asistentesIds: asistentesIds ?? this.asistentesIds,
      cancelado: cancelado ?? this.cancelado,
    );
  }

  @override
  List<Object?> get props => [
        id,
        artistaId,
        artistaNombre,
        ubicacion,
        fecha,
        hora,
        descripcion,
        creadorId,
        fechaCreacion,
        rrule,
        asistentesIds,
        cancelado,
      ];
}

