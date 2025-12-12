import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/ruta/create_ruta.dart';
import '../../../domain/usecases/ruta/get_rutas.dart';
import '../../../domain/usecases/ruta/get_ruta_by_id.dart';
import '../../../domain/usecases/ruta/delete_ruta.dart';
import '../../../domain/usecases/ruta/calculate_ruta.dart';
import 'ruta_event.dart' as event;
import 'ruta_state.dart';

/// BLoC para gestión de estado de rutas
class RutaBloc extends Bloc<event.RutaEvent, RutaState> {
  final CreateRuta createRuta;
  final GetRutas getRutas;
  final GetRutaById getRutaById;
  final DeleteRuta deleteRuta;
  final CalculateRuta calculateRuta;
  
  RutaBloc({
    required this.createRuta,
    required this.getRutas,
    required this.getRutaById,
    required this.deleteRuta,
    required this.calculateRuta,
  }) : super(const RutaInitial()) {
    on<event.LoadRutas>(_onLoadRutas);
    on<event.GetRutaById>(_onGetRutaById);
    on<event.CreateRuta>(_onCreateRuta);
    on<event.DeleteRuta>(_onDeleteRuta);
    on<event.CalculateRuta>(_onCalculateRuta);
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
  
  Future<void> _onCalculateRuta(
    event.CalculateRuta ev,
    Emitter<RutaState> emit,
  ) async {
    emit(const RutaLoading());
    // TODO: Implementar cálculo de ruta
    // Por ahora solo emite error
    emit(const RutaError('Cálculo de ruta no implementado aún'));
  }
}

