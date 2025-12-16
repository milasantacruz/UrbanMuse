import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'ubicacion.dart';

/// Tipos de ruta
enum TipoRuta {
  privada,
  publicaEstatica,
  publicaDinamica,
}

/// Modos de transporte
enum ModoTransporte {
  bici,
  aPie,
}

/// Entidad de ruta
/// 
/// Una ruta puede ser:
/// - **Privada:** Solo visible para el creador
/// - **Pública Estática:** Visible para todos, sin fecha/hora
/// - **Pública Dinámica:** Evento repetitivo con rrule (ej: todos los domingos)
class Ruta extends Equatable {
  final String id;
  final String nombre;
  final Ubicacion puntoA;
  final Ubicacion puntoB;
  final List<String> obraIds; // IDs de obras en la ruta
  final List<int> ordenVisita; // Orden de visita de las obras (índices)
  final double distancia; // en metros
  final double tiempoEstimado; // en minutos
  final ModoTransporte modoTransporte; // 'bici' o 'a_pie'
  final TipoRuta tipo; // privada, publica_estatica, publica_dinamica
  final String creadorId; // ID del usuario que creó la ruta
  final DateTime fechaCreacion;
  
  // Campos para rutas dinámicas (solo si tipo == publicaDinamica)
  final String? rrule; // Regla de repetición (RFC 5545)
  final DateTime? fechaInicial; // Fecha de inicio del evento
  final TimeOfDay? hora; // Hora del evento
  
  // Campos para rutas públicas
  final List<String> asistentesIds; // IDs de usuarios que se unieron (solo si es pública y dinámica)
  
  // Helpers
  bool get esPublica => tipo == TipoRuta.publicaEstatica || tipo == TipoRuta.publicaDinamica;
  bool get esDinamica => tipo == TipoRuta.publicaDinamica;
  bool get esPrivada => tipo == TipoRuta.privada;

  const Ruta({
    required this.id,
    required this.nombre,
    required this.puntoA,
    required this.puntoB,
    required this.obraIds,
    required this.ordenVisita,
    required this.distancia,
    required this.tiempoEstimado,
    required this.modoTransporte,
    required this.tipo,
    required this.creadorId,
    required this.fechaCreacion,
    this.rrule,
    this.fechaInicial,
    this.hora,
    this.asistentesIds = const [],
  });

  /// Copiar con nuevos valores
  Ruta copyWith({
    String? id,
    String? nombre,
    Ubicacion? puntoA,
    Ubicacion? puntoB,
    List<String>? obraIds,
    List<int>? ordenVisita,
    double? distancia,
    double? tiempoEstimado,
    ModoTransporte? modoTransporte,
    TipoRuta? tipo,
    String? creadorId,
    DateTime? fechaCreacion,
    String? rrule,
    DateTime? fechaInicial,
    TimeOfDay? hora,
    List<String>? asistentesIds,
  }) {
    return Ruta(
      id: id ?? this.id,
      nombre: nombre ?? this.nombre,
      puntoA: puntoA ?? this.puntoA,
      puntoB: puntoB ?? this.puntoB,
      obraIds: obraIds ?? this.obraIds,
      ordenVisita: ordenVisita ?? this.ordenVisita,
      distancia: distancia ?? this.distancia,
      tiempoEstimado: tiempoEstimado ?? this.tiempoEstimado,
      modoTransporte: modoTransporte ?? this.modoTransporte,
      tipo: tipo ?? this.tipo,
      creadorId: creadorId ?? this.creadorId,
      fechaCreacion: fechaCreacion ?? this.fechaCreacion,
      rrule: rrule ?? this.rrule,
      fechaInicial: fechaInicial ?? this.fechaInicial,
      hora: hora ?? this.hora,
      asistentesIds: asistentesIds ?? this.asistentesIds,
    );
  }

  @override
  List<Object?> get props => [
        id,
        nombre,
        puntoA,
        puntoB,
        obraIds,
        ordenVisita,
        distancia,
        tiempoEstimado,
        modoTransporte,
        tipo,
        creadorId,
        fechaCreacion,
        rrule,
        fechaInicial,
        hora,
        asistentesIds,
      ];
}

