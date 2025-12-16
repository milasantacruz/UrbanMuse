import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/encuentro.dart';
import '../../../domain/usecases/encuentro/create_encuentro.dart';
import '../../../domain/usecases/encuentro/get_encuentros.dart';
import '../../../domain/usecases/encuentro/get_encuentros_proximos.dart';
import '../../../domain/usecases/encuentro/get_encuentro_by_id.dart';
import '../../../domain/usecases/encuentro/join_encuentro.dart';
import '../../../domain/usecases/encuentro/cancel_encuentro.dart';
import 'encuentro_state.dart';

/// Cubit para gestión de estado de encuentros
/// 
/// Reemplaza SalidaCubit
/// Solo artistas pueden crear encuentros
class EncuentroCubit extends Cubit<EncuentroState> {
  final CreateEncuentro createEncuentro;
  final GetEncuentros getEncuentros;
  final GetEncuentrosProximos getEncuentrosProximos;
  final GetEncuentroById getEncuentroById;
  final JoinEncuentro joinEncuentro;
  final CancelEncuentro cancelEncuentro;
  
  EncuentroCubit({
    required this.createEncuentro,
    required this.getEncuentros,
    required this.getEncuentrosProximos,
    required this.getEncuentroById,
    required this.joinEncuentro,
    required this.cancelEncuentro,
  }) : super(const EncuentroInitial());
  
  /// Cargar todos los encuentros
  Future<void> loadEncuentros() async {
    emit(const EncuentroLoading());
    final result = await getEncuentros();
    result.fold(
      (failure) => emit(EncuentroError(failure.message)),
      (encuentros) => emit(EncuentrosLoaded(encuentros)),
    );
  }
  
  /// Cargar encuentros próximos
  Future<void> loadEncuentrosProximos() async {
    emit(const EncuentroLoading());
    final result = await getEncuentrosProximos();
    result.fold(
      (failure) => emit(EncuentroError(failure.message)),
      (encuentros) => emit(EncuentrosLoaded(encuentros)),
    );
  }
  
  /// Obtener encuentro por ID
  Future<void> loadEncuentroById(String id) async {
    emit(const EncuentroLoading());
    final result = await getEncuentroById.call(id);
    result.fold(
      (failure) => emit(EncuentroError(failure.message)),
      (encuentro) => emit(EncuentroDetailLoaded(encuentro)),
    );
  }
  
  /// Crear encuentro
  /// 
  /// Solo artistas pueden crear encuentros
  Future<void> create(Encuentro encuentro) async {
    emit(const EncuentroLoading());
    final result = await createEncuentro(encuentro);
    result.fold(
      (failure) => emit(EncuentroError(failure.message)),
      (encuentro) => emit(EncuentroCreated(encuentro)),
    );
  }
  
  /// Unirse a un encuentro
  Future<void> join({
    required String encuentroId,
    required String userId,
  }) async {
    emit(const EncuentroLoading());
    final result = await joinEncuentro(
      encuentroId: encuentroId,
      userId: userId,
    );
    result.fold(
      (failure) => emit(EncuentroError(failure.message)),
      (encuentro) => emit(EncuentroDetailLoaded(encuentro)),
    );
  }
  
  /// Cancelar encuentro
  Future<void> cancel({
    required String encuentroId,
    required String userId,
  }) async {
    emit(const EncuentroLoading());
    final result = await cancelEncuentro(
      encuentroId: encuentroId,
      userId: userId,
    );
    result.fold(
      (failure) => emit(EncuentroError(failure.message)),
      (encuentro) => emit(EncuentroDetailLoaded(encuentro)),
    );
  }
}

