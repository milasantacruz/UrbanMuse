import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/ruta.dart';
import '../../../domain/usecases/topn/get_topn.dart';
import '../../../domain/usecases/topn/add_ruta_to_topn.dart';
import '../../../domain/usecases/topn/remove_ruta_from_topn.dart';
import '../../../domain/usecases/topn/reorder_topn.dart';
import 'topn_state.dart';

/// Cubit para gestión de estado del Top N (Rutas Favoritas)
/// 
/// **Cambio importante:** Ahora maneja rutas (no obras), máximo 10 rutas
class TopNCubit extends Cubit<TopNState> {
  final GetTopN getTopN;
  final AddRutaToTopN addRutaToTopN;
  final RemoveRutaFromTopN removeRutaFromTopN;
  final ReorderTopN reorderTopN;
  
  TopNCubit({
    required this.getTopN,
    required this.addRutaToTopN,
    required this.removeRutaFromTopN,
    required this.reorderTopN,
  }) : super(const TopNInitial());
  
  /// Cargar Top N
  Future<void> loadTopN() async {
    emit(const TopNLoading());
    final result = await getTopN();
    result.fold(
      (failure) => emit(TopNError(failure.message)),
      (rutas) => emit(TopNLoaded(rutas)),
    );
  }
  
  /// Agregar ruta al Top N
  Future<void> addRuta(Ruta ruta) async {
    final result = await addRutaToTopN(ruta.id);
    result.fold(
      (failure) => emit(TopNError(failure.message)),
      (rutas) => emit(TopNLoaded(rutas)),
    );
  }
  
  /// Remover ruta del Top N
  Future<void> removeRuta(String rutaId) async {
    final result = await removeRutaFromTopN(rutaId);
    result.fold(
      (failure) => emit(TopNError(failure.message)),
      (rutas) => emit(TopNLoaded(rutas)),
    );
  }
  
  /// Reordenar Top N
  Future<void> reorderRutas(List<String> rutaIds) async {
    final result = await reorderTopN(rutaIds);
    result.fold(
      (failure) => emit(TopNError(failure.message)),
      (rutas) => emit(TopNLoaded(rutas)),
    );
  }
}

