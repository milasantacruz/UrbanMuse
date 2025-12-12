import 'package:equatable/equatable.dart';

/// Eventos del ObraBloc
abstract class ObraEvent extends Equatable {
  const ObraEvent();
  
  @override
  List<Object?> get props => [];
}

/// Evento para cargar todas las obras
class LoadObras extends ObraEvent {
  const LoadObras();
}

/// Evento para buscar obras
class SearchObras extends ObraEvent {
  final String query;
  
  const SearchObras(this.query);
  
  @override
  List<Object?> get props => [query];
}

/// Evento para filtrar obras
class FilterObras extends ObraEvent {
  final List<String>? categorias;
  final List<String>? artistaIds;
  
  const FilterObras({
    this.categorias,
    this.artistaIds,
  });
  
  @override
  List<Object?> get props => [categorias, artistaIds];
}

/// Evento para obtener obra por ID
class GetObraById extends ObraEvent {
  final String id;
  
  const GetObraById(this.id);
  
  @override
  List<Object?> get props => [id];
}

