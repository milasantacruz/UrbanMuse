import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/ruta/create_ruta.dart';
import '../../../domain/usecases/ruta/get_rutas.dart';
import '../../../domain/usecases/ruta/get_rutas_publicas.dart';
import '../../../domain/usecases/ruta/get_rutas_publicas_dinamicas.dart';
import '../../../domain/usecases/ruta/get_ruta_by_id.dart';
import '../../../domain/usecases/ruta/delete_ruta.dart';
import '../../../domain/usecases/ruta/calculate_ruta.dart';
import '../../../domain/usecases/ruta/convertir_a_dinamica.dart';
import '../../../domain/usecases/ruta/join_ruta_dinamica.dart';
import '../../../domain/usecases/ruta/leave_ruta_dinamica.dart';
import '../../../domain/entities/ubicacion.dart';
import 'ruta_event.dart' as event;
import 'ruta_state.dart';

/// BLoC para gestión de estado de rutas
class RutaBloc extends Bloc<event.RutaEvent, RutaState> {
  final CreateRuta createRuta;
  final GetRutas getRutas;
  final GetRutasPublicas getRutasPublicas;
  final GetRutasPublicasDinamicas getRutasPublicasDinamicas;
  final GetRutaById getRutaById;
  final DeleteRuta deleteRuta;
  final CalculateRuta calculateRuta;
  final ConvertirADinamica convertirADinamica;
  final JoinRutaDinamica joinRutaDinamica;
  final LeaveRutaDinamica leaveRutaDinamica;
  
  RutaBloc({
    required this.createRuta,
    required this.getRutas,
    required this.getRutasPublicas,
    required this.getRutasPublicasDinamicas,
    required this.getRutaById,
    required this.deleteRuta,
    required this.calculateRuta,
    required this.convertirADinamica,
    required this.joinRutaDinamica,
    required this.leaveRutaDinamica,
  }) : super(const RutaInitial()) {
    on<event.LoadRutas>(_onLoadRutas);
    on<event.LoadRutasPublicas>(_onLoadRutasPublicas);
    on<event.LoadRutasPublicasDinamicas>(_onLoadRutasPublicasDinamicas);
    on<event.GetRutaById>(_onGetRutaById);
    on<event.CreateRuta>(_onCreateRuta);
    on<event.DeleteRuta>(_onDeleteRuta);
    on<event.CalculateRuta>(_onCalculateRuta);
    on<event.ConvertirADinamica>(_onConvertirADinamica);
    on<event.JoinRutaDinamica>(_onJoinRutaDinamica);
    on<event.LeaveRutaDinamica>(_onLeaveRutaDinamica);
  }
  
  Future<void> _onLoadRutas(
    event.LoadRutas ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await getRutas();
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (rutas) => emit(RutaLoaded(rutas)),
    );
  }
  
  Future<void> _onGetRutaById(
    event.GetRutaById ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await getRutaById(ev.id);
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (ruta) => emit(RutaDetailLoaded(ruta)),
    );
  }
  
  Future<void> _onCreateRuta(
    event.CreateRuta ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await createRuta(ev.ruta);
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (ruta) => emit(RutaCreated(ruta)),
    );
  }
  
  Future<void> _onDeleteRuta(
    event.DeleteRuta ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await deleteRuta(ev.id);
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (_) {
        // Recargar lista después de eliminar
        add(const event.LoadRutas());
      },
    );
  }
  
  Future<void> _onLoadRutasPublicas(
    event.LoadRutasPublicas ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await getRutasPublicas();
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (rutas) => emit(RutaLoaded(rutas)),
    );
  }
  
  Future<void> _onLoadRutasPublicasDinamicas(
    event.LoadRutasPublicasDinamicas ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await getRutasPublicasDinamicas();
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (rutas) => emit(RutaLoaded(rutas)),
    );
  }
  
  Future<void> _onCalculateRuta(
    event.CalculateRuta ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    // TODO: Obtener ubicaciones desde IDs
    // Por ahora, necesitamos las ubicaciones reales
    // Esto se implementará cuando tengamos el contexto de las obras
    emit(const RutaError('Cálculo de ruta requiere implementación de ubicaciones'));
  }
  
  Future<void> _onConvertirADinamica(
    event.ConvertirADinamica ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await convertirADinamica(
      rutaId: ev.rutaId,
      rrule: ev.rrule,
      fechaInicial: ev.fechaInicial,
      hora: ev.hora,
    );
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (ruta) => emit(RutaDetailLoaded(ruta)),
    );
  }
  
  Future<void> _onJoinRutaDinamica(
    event.JoinRutaDinamica ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await joinRutaDinamica(
      rutaId: ev.rutaId,
      userId: ev.userId,
    );
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (ruta) => emit(RutaDetailLoaded(ruta)),
    );
  }
  
  Future<void> _onLeaveRutaDinamica(
    event.LeaveRutaDinamica ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    final result = await leaveRutaDinamica(
      rutaId: ev.rutaId,
      userId: ev.userId,
    );
    result.fold(
      (failure) => emit(RutaError(failure.message)),
      (ruta) => emit(RutaDetailLoaded(ruta)),
    );
  }
}

