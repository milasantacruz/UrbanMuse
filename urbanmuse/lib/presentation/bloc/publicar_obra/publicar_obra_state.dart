import 'package:equatable/equatable.dart';
import '../../../domain/entities/obra.dart';

/// Estados del PublicarObraCubit
/// 
/// Flujo multi-step para publicar una obra (4 pasos)
abstract class PublicarObraState extends Equatable {
  const PublicarObraState();
  
  @override
  List<Object?> get props => [];
}

/// Estado inicial
class PublicarObraInitial extends PublicarObraState {
  const PublicarObraInitial();
}

/// Estado de carga
class PublicarObraLoading extends PublicarObraState {
  const PublicarObraLoading();
}

/// Estado de paso actual (1-4)
class PublicarObraStepState extends PublicarObraState {
  final int currentStep; // 1: Foto, 2: Información, 3: Ubicación, 4: Revisar
  final String? fotoPath;
  final String? titulo;
  final String? categoria;
  final String? artistaId;
  final String? artistaNombre;
  final double? lat;
  final double? lng;
  final String? direccion;
  final String? barrio;
  
  const PublicarObraStepState({
    required this.currentStep,
    this.fotoPath,
    this.titulo,
    this.categoria,
    this.artistaId,
    this.artistaNombre,
    this.lat,
    this.lng,
    this.direccion,
    this.barrio,
  });
  
  @override
  List<Object?> get props => [
    currentStep,
    fotoPath,
    titulo,
    categoria,
    artistaId,
    artistaNombre,
    lat,
    lng,
    direccion,
    barrio,
  ];
  
  PublicarObraStepState copyWith({
    int? currentStep,
    String? fotoPath,
    String? titulo,
    String? categoria,
    String? artistaId,
    String? artistaNombre,
    double? lat,
    double? lng,
    String? direccion,
    String? barrio,
  }) {
    return PublicarObraStepState(
      currentStep: currentStep ?? this.currentStep,
      fotoPath: fotoPath ?? this.fotoPath,
      titulo: titulo ?? this.titulo,
      categoria: categoria ?? this.categoria,
      artistaId: artistaId ?? this.artistaId,
      artistaNombre: artistaNombre ?? this.artistaNombre,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
      direccion: direccion ?? this.direccion,
      barrio: barrio ?? this.barrio,
    );
  }
}

/// Estado de publicación exitosa
class PublicarObraSuccess extends PublicarObraState {
  final Obra obra;
  
  const PublicarObraSuccess(this.obra);
  
  @override
  List<Object?> get props => [obra];
}

/// Estado de error
class PublicarObraError extends PublicarObraState {
  final String message;
  
  const PublicarObraError(this.message);
  
  @override
  List<Object?> get props => [message];
}

