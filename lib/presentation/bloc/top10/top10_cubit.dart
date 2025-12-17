import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/obra.dart';
import '../../../domain/usecases/top10/get_top10.dart';
import '../../../domain/usecases/top10/add_to_top10.dart';
import '../../../domain/usecases/top10/remove_from_top10.dart';
import '../../../domain/usecases/top10/reorder_top10.dart';
import 'top10_state.dart';

/// Cubit para gestión de estado del Top 10
class Top10Cubit extends Cubit<Top10State> {
  final GetTop10 getTop10;
  final AddToTop10 addToTop10;
  final RemoveFromTop10 removeFromTop10;
  final ReorderTop10 reorderTop10;
  
  Top10Cubit({
    required this.getTop10,
    required this.addToTop10,
    required this.removeFromTop10,
    required this.reorderTop10,
  }) : super(const Top10Initial());
  
  /// Cargar Top 10
  Future<void> loadTop10() async {
    emit(const Top10Loading());
    final result = await getTop10();
    result.fold(
      (failure) => emit(Top10Error(failure.message)),
      (obras) => emit(Top10Loaded(obras)),
    );
  }
  
  /// Agregar obra al Top 10
  Future<void> addObra(Obra obra) async {
    final result = await addToTop10(obra);
    result.fold(
      (failure) => emit(Top10Error(failure.message)),
      (obras) => emit(Top10Loaded(obras)),
    );
  }
  
  /// Remover obra del Top 10
  Future<void> removeObra(String obraId) async {
    final result = await removeFromTop10(obraId);
    result.fold(
      (failure) => emit(Top10Error(failure.message)),
      (obras) => emit(Top10Loaded(obras)),
    );
  }
  
  /// Reordenar Top 10
  Future<void> reorderObras(List<String> obraIds) async {
    final result = await reorderTop10(obraIds);
    result.fold(
      (failure) => emit(Top10Error(failure.message)),
      (obras) => emit(Top10Loaded(obras)),
    );
  }
}

