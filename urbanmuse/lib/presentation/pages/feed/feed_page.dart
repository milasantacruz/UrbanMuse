import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../bloc/obra/obra_bloc.dart';
import '../../bloc/obra/obra_event.dart';
import '../../bloc/obra/obra_state.dart';
import '../../widgets/search/app_search_bar.dart';
import '../../layouts/main_layout.dart';
import '../../widgets/cards/app_obra_card.dart';
import '../../widgets/modals/app_filter_modal.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/empty_state.dart';

/// Página de feed de obras
class FeedPage extends StatefulWidget {
  const FeedPage({super.key});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  final TextEditingController _searchController = TextEditingController();
  bool _isGridView = true;
  List<String>? _filteredCategories;
  List<String>? _filteredArtistas;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearch(String query) {
    if (query.trim().isNotEmpty) {
      context.read<ObraBloc>().add(SearchObras(query.trim()));
    } else {
      context.read<ObraBloc>().add(LoadObras());
    }
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
            builder: (context) => AppFilterModal(
              selectedCategories: _filteredCategories ?? [],
              selectedArtists: _filteredArtistas ?? [],
              onCategoriesChanged: (categories) {
                setState(() {
                  _filteredCategories = categories.isNotEmpty ? categories : null;
                });
              },
              onArtistsChanged: (artistas) {
                setState(() {
                  _filteredArtistas = artistas.isNotEmpty ? artistas : null;
                });
              },
              onApply: () {
                Navigator.of(context).pop();
                context.read<ObraBloc>().add(
                  FilterObras(
                    categorias: _filteredCategories,
                    artistaIds: _filteredArtistas,
                  ),
                );
              },
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<ObraBloc>()..add(LoadObras()),
      child: MainLayout(
        title: 'Obras',
        currentBottomNavIndex: 1, // Mapa/Explorar (página principal)
        appBarActions: [
          IconButton(
            icon: Icon(_isGridView ? Icons.view_list : Icons.grid_view),
            onPressed: () {
              setState(() => _isGridView = !_isGridView);
            },
            tooltip: _isGridView ? 'Vista de lista' : 'Vista de grid',
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterModal,
            tooltip: 'Filtrar',
          ),
        ],
        child: Column(
          children: [
            // Barra de búsqueda
            Padding(
              padding: const EdgeInsets.all(16),
              child: AppSearchBar(
                controller: _searchController,
                onChanged: _onSearch,
                onClear: () {
                  _searchController.clear();
                  context.read<ObraBloc>().add(LoadObras());
                },
              ),
            ),

            // Lista de obras
            Expanded(
              child: BlocBuilder<ObraBloc, ObraState>(
                builder: (context, state) {
                  if (state is ObraLoading) {
                    return const LoadingIndicator();
                  }

                  if (state is ObraError) {
                    return ErrorDisplay(
                      message: state.message,
                      onRetry: () => context.read<ObraBloc>().add(LoadObras()),
                    );
                  }

                  if (state is ObraLoaded) {
                    final obras = state.obras;

                    if (obras.isEmpty) {
                      return EmptyState(
                        icon: Icons.image_not_supported,
                        message: 'No se encontraron obras',
                        action: TextButton(
                          onPressed: () {
                            _searchController.clear();
                            _filteredCategories = null;
                            _filteredArtistas = null;
                            context.read<ObraBloc>().add(LoadObras());
                          },
                          child: const Text('Limpiar filtros'),
                        ),
                      );
                    }

                    return _isGridView
                        ? GridView.builder(
                            padding: const EdgeInsets.all(16),
                            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                              childAspectRatio: 0.75,
                            ),
                            itemCount: obras.length,
                            itemBuilder: (context, index) {
                              final obra = obras[index];
                              return AppObraCard.grid(
                                imageUrl: obra.foto,
                                titulo: obra.titulo,
                                artista: obra.artistaNombre,
                                categoria: obra.categoria,
                                ubicacion: obra.ubicacion.barrio,
                                isFavorite: false, // TODO: Integrar con favoritos
                                likes: obra.likes,
                                onTap: () => context.push('/obra/${obra.id}'),
                              );
                            },
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.all(16),
                            itemCount: obras.length,
                            itemBuilder: (context, index) {
                              final obra = obras[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16),
                                child: AppObraCard.list(
                                  imageUrl: obra.foto,
                                  titulo: obra.titulo,
                                  artista: obra.artistaNombre,
                                  categoria: obra.categoria,
                                  ubicacion: obra.ubicacion.barrio,
                                  isFavorite: false,
                                  likes: obra.likes,
                                  onTap: () => context.push('/obra/${obra.id}'),
                                ),
                              );
                            },
                          );
                  }

                  return const SizedBox.shrink();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
