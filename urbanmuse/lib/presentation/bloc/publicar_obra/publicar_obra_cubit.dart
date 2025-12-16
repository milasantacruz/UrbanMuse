import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/obra.dart';
import '../../../domain/entities/ubicacion.dart';
import '../../../domain/usecases/publicar_obra/publicar_obra.dart';
import '../../../domain/usecases/publicar_obra/get_obras_publicadas.dart';
import '../../../domain/usecases/publicar_obra/editar_obra.dart';
import '../../../domain/usecases/publicar_obra/eliminar_obra.dart';
import '../../../domain/repositories/publicar_obra_repository.dart';
import 'publicar_obra_state.dart';

/// Cubit para gestión de estado de publicación de obras
/// 
/// Solo artistas pueden publicar obras.
/// Flujo multi-step: Foto → Información → Ubicación → Revisar
class PublicarObraCubit extends Cubit<PublicarObraState> {
  final PublicarObra publicarObra;
  final GetObrasPublicadas getObrasPublicadas;
  final EditarObra editarObra;
  final EliminarObra eliminarObra;
  final PublicarObraRepository repository;
  
  PublicarObraCubit({
    required this.publicarObra,
    required this.getObrasPublicadas,
    required this.editarObra,
    required this.eliminarObra,
    required this.repository,
  }) : super(const PublicarObraInitial());
  
  /// Iniciar flujo de publicación
  void startPublicacion({
    required String artistaId,
    required String artistaNombre,
  }) {
    emit(PublicarObraStepState(
      currentStep: 1,
      artistaId: artistaId,
      artistaNombre: artistaNombre,
    ));
  }
  
  /// Guardar foto (Paso 1)
  void saveFoto(String fotoPath) {
    final currentState = state;
    if (currentState is PublicarObraStepState) {
      emit(currentState.copyWith(
        fotoPath: fotoPath,
        currentStep: 2,
      ));
    }
  }
  
  /// Guardar información (Paso 2)
  void saveInformacion({
    required String titulo,
    required String categoria,
  }) {
    final currentState = state;
    if (currentState is PublicarObraStepState) {
      emit(currentState.copyWith(
        titulo: titulo,
        categoria: categoria,
        currentStep: 3,
      ));
    }
  }
  
  /// Guardar ubicación (Paso 3)
  void saveUbicacion({
    required double lat,
    required double lng,
    String? direccion,
    String? barrio,
  }) {
    final currentState = state;
    if (currentState is PublicarObraStepState) {
      emit(currentState.copyWith(
        lat: lat,
        lng: lng,
        direccion: direccion,
        barrio: barrio,
        currentStep: 4,
      ));
    }
  }
  
  /// Publicar obra (Paso 4 - Final)
  Future<void> publicar() async {
    final currentState = state;
    if (currentState is! PublicarObraStepState) {
      emit(const PublicarObraError('Debes completar todos los pasos primero'));
      return;
    }
    
    // Validar que todos los campos estén completos
    if (currentState.fotoPath == null ||
        currentState.titulo == null ||
        currentState.categoria == null ||
        currentState.artistaId == null ||
        currentState.artistaNombre == null ||
        currentState.lat == null ||
        currentState.lng == null) {
      emit(const PublicarObraError('Faltan campos requeridos'));
      return;
    }
    
    emit(const PublicarObraLoading());
    
    // Crear obra
    final obra = Obra(
      id: DateTime.now().millisecondsSinceEpoch.toString(), // Temporal para MVP1
      titulo: currentState.titulo!,
      artistaId: currentState.artistaId!,
      artistaNombre: currentState.artistaNombre!,
      categoria: currentState.categoria!,
      ubicacion: Ubicacion(
        lat: currentState.lat!,
        lng: currentState.lng!,
        direccion: currentState.direccion,
        barrio: currentState.barrio,
      ),
      foto: currentState.fotoPath!,
      fechaPublicacion: DateTime.now(),
      puedeEliminar: true,
    );
    
    final result = await publicarObra(obra);
    result.fold(
      (failure) => emit(PublicarObraError(failure.message)),
      (obraPublicada) => emit(PublicarObraSuccess(obraPublicada)),
    );
  }
  
  /// Cargar obras publicadas por artista
  Future<void> loadObrasPublicadas(String artistaId) async {
    emit(const PublicarObraLoading());
    final result = await getObrasPublicadas(artistaId);
    result.fold(
      (failure) => emit(PublicarObraError(failure.message)),
      (_) {
        // Por ahora no emitimos estado específico, se manejará en la UI
        emit(const PublicarObraInitial());
      },
    );
  }
  
  /// Editar obra
  Future<void> editar({
    required Obra obra,
    required String userId,
  }) async {
    emit(const PublicarObraLoading());
    final result = await editarObra(obra: obra, userId: userId);
    result.fold(
      (failure) => emit(PublicarObraError(failure.message)),
      (obraEditada) => emit(PublicarObraSuccess(obraEditada)),
    );
  }
  
  /// Eliminar obra
  Future<void> eliminar({
    required String obraId,
    required String userId,
  }) async {
    emit(const PublicarObraLoading());
    final result = await eliminarObra(obraId: obraId, userId: userId);
    result.fold(
      (failure) => emit(PublicarObraError(failure.message)),
      (_) => emit(const PublicarObraInitial()),
    );
  }
  
  /// Volver al paso anterior
  void previousStep() {
    final currentState = state;
    if (currentState is PublicarObraStepState && currentState.currentStep > 1) {
      emit(currentState.copyWith(
        currentStep: currentState.currentStep - 1,
      ));
    }
  }
  
  /// Resetear flujo
  void reset() {
    emit(const PublicarObraInitial());
  }
}

