import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/usecases/obra/get_obras.dart';
import '../../../domain/usecases/obra/get_obra_by_id.dart';
import '../../../domain/usecases/obra/search_obras.dart';
import '../../../domain/usecases/obra/filter_obras.dart';
import 'obra_event.dart' as event;
import 'obra_state.dart';

/// BLoC para gestión de estado de obras
class ObraBloc extends Bloc<event.ObraEvent, ObraState> {
  final GetObras getObras;
  final GetObraById getObraById;
  final SearchObras searchObras;
  final FilterObras filterObras;
  
  ObraBloc({
    required this.getObras,
    required this.getObraById,
    required this.searchObras,
    required this.filterObras,
  }) : super(const ObraInitial()) {
    on<event.LoadObras>(_onLoadObras);
    on<event.GetObraById>(_onGetObraById);
    on<event.SearchObras>(_onSearchObras);
    on<event.FilterObras>(_onFilterObras);
  }
  
  Future<void> _onLoadObras(
    event.LoadObras ev,
    Emitter<ObraState> emit,
  ) async {
    emit(const ObraLoading());
    final result = await getObras();
    result.fold(
      (failure) => emit(ObraError(failure.message)),
      (obras) => emit(ObraLoaded(obras)),
    );
  }
  
  Future<void> _onGetObraById(
    event.GetObraById ev,
    Emitter<ObraState> emit,
  ) async {
    emit(const ObraLoading());
    final result = await getObraById(ev.id);
    result.fold(
      (failure) => emit(ObraError(failure.message)),
      (obra) => emit(ObraDetailLoaded(obra)),
    );
  }
  
  Future<void> _onSearchObras(
    event.SearchObras ev,
    Emitter<ObraState> emit,
  ) async {
    emit(const ObraLoading());
    final result = await searchObras(ev.query);
    result.fold(
      (failure) => emit(ObraError(failure.message)),
      (obras) => emit(ObraLoaded(obras)),
    );
  }
  
  Future<void> _onFilterObras(
    event.FilterObras ev,
    Emitter<ObraState> emit,
  ) async {
    emit(const ObraLoading());
    final result = await filterObras(
      categorias: ev.categorias,
      artistaIds: ev.artistaIds,
    );
    result.fold(
      (failure) => emit(ObraError(failure.message)),
      (obras) => emit(ObraLoaded(obras)),
    );
  }
}

