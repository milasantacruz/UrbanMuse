import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../bloc/encuentro/encuentro_cubit.dart';
import '../../bloc/encuentro/encuentro_state.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/buttons/app_button.dart';
import 'encuentro_card.dart';

/// Página de lista de encuentros
/// 
/// Muestra encuentros próximos (fecha >= hoy).
/// Reemplaza SalidaListPage.
class EncuentroListPage extends StatelessWidget {
  const EncuentroListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<EncuentroCubit>()..loadEncuentrosProximos(),
      child: Scaffold(
        appBar: AppTopBar.home(
          title: 'Encuentros',
          actions: [
            AppButton.text(
              label: '',
              leftIcon: const Icon(Icons.add, size: 20),
              onPressed: () {
                context.push('/encuentro/create');
              },
            ),
          ],
        ),
        body: BlocBuilder<EncuentroCubit, EncuentroState>(
          builder: (context, state) {
            if (state is EncuentroLoading) {
              return const LoadingIndicator();
            }
            
            if (state is EncuentroError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<EncuentroCubit>().loadEncuentrosProximos(),
              );
            }
            
            if (state is EncuentrosLoaded) {
              if (state.encuentros.isEmpty) {
                return EmptyState(
                  icon: Icons.event,
                  message: 'No hay encuentros próximos\nLos artistas anunciarán cuando estarán pintando en vivo',
                  action: AppButton.text(
                    label: 'Explorar Obras',
                    onPressed: () {
                      context.push('/feed');
                    },
                  ),
                );
              }
              
              return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.encuentros.length,
                itemBuilder: (context, index) {
                  final encuentro = state.encuentros[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: EncuentroCard(
                      encuentro: encuentro,
                        onTap: () {
                          context.push('/encuentro/${encuentro.id}');
                        },
                    ),
                  );
                },
              );
            }
            
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}

