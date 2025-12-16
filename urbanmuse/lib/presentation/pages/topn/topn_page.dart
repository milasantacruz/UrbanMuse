import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../bloc/topn/topn_cubit.dart';
import '../../bloc/topn/topn_state.dart';
import '../../widgets/cards/app_topn_item.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../layouts/main_layout.dart';

/// Página del Top N (Rutas Favoritas) del usuario
/// 
/// **Cambio importante:** Ahora muestra rutas (no obras), máximo 10 rutas.
/// Permite drag & drop para reordenar.
class TopNPage extends StatelessWidget {
  const TopNPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<TopNCubit>()..loadTopN(),
      child: MainLayout(
        title: 'Mi Top N',
        currentBottomNavIndex: 3, // Favoritos
        appBarActions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              context.push('/rutas');
            },
          ),
        ],
        child: BlocBuilder<TopNCubit, TopNState>(
          builder: (context, state) {
            if (state is TopNLoading) {
              return const LoadingIndicator();
            }
            
            if (state is TopNError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<TopNCubit>().loadTopN(),
              );
            }
            
            if (state is TopNLoaded) {
              if (state.rutas.isEmpty) {
                return EmptyState(
                  icon: Icons.route,
                  message: 'No tienes rutas en tu Top N\nAgrega rutas favoritas para acceder rápidamente a ellas',
                  action: TextButton(
                    onPressed: () {
                      context.push('/rutas');
                    },
                    child: const Text('Explorar Rutas'),
                  ),
                );
              }
              
              return Column(
                children: [
                  // Contador
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${state.rutas.length}/10 rutas',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        if (state.rutas.length < 10)
                          TextButton.icon(
                            icon: const Icon(Icons.add),
                            label: const Text('Agregar Ruta'),
                            onPressed: () {
                              context.push('/rutas');
                            },
                          ),
                      ],
                    ),
                  ),
                  
                  // Grid de rutas
                  Expanded(
                    child: GridView.builder(
                      padding: const EdgeInsets.all(16),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.8,
                      ),
                      itemCount: state.rutas.length,
                      itemBuilder: (context, index) {
                        final ruta = state.rutas[index];
                        return AppTopNItem(
                          ruta: ruta,
                          ranking: index + 1,
                          onTap: () {
                            context.push('/ruta/${ruta.id}');
                          },
                          onRemove: () {
                            context.read<TopNCubit>().removeRuta(ruta.id);
                          },
                          showRemoveButton: true,
                        );
                      },
                    ),
                  ),
                ],
              );
            }
            
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

