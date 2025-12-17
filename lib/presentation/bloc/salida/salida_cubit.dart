import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/salida/create_salida.dart';
import '../../../domain/usecases/salida/get_salidas.dart';
import '../../../domain/usecases/salida/join_salida.dart';
import 'salida_state.dart';

/// Cubit para gestión de estado de salidas grupales
class SalidaCubit extends Cubit<SalidaState> {
  final CreateSalida createSalida;
  final GetSalidas getSalidas;
  final JoinSalida joinSalida;
  
  SalidaCubit({
    required this.createSalida,
    required this.getSalidas,
    required this.joinSalida,
  }) : super(const SalidaInitial());
  
  /// Cargar todas las salidas
  Future<void> loadSalidas() async {
    emit(const SalidaLoading());
    final result = await getSalidas();
    result.fold(
      (failure) => emit(SalidaError(failure.message)),
      (salidas) => emit(SalidaLoaded(salidas)),
    );
  }
  
  /// Crear salida grupal
  Future<void> createSalidaGrupal(dynamic salida) async {
    emit(const SalidaLoading());
    final result = await createSalida(salida);
    result.fold(
      (failure) => emit(SalidaError(failure.message)),
      (salida) => emit(SalidaCreated(salida)),
    );
  }
  
  /// Unirse a una salida
  Future<void> joinSalidaGrupal(String salidaId, String userId) async {
    emit(const SalidaLoading());
    final result = await joinSalida(salidaId, userId);
    result.fold(
      (failure) => emit(SalidaError(failure.message)),
      (salida) => emit(SalidaDetailLoaded(salida)),
    );
  }
}

