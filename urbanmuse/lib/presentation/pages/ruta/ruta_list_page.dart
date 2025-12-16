import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../domain/entities/ruta.dart';
import '../../bloc/ruta/ruta_bloc.dart';
import '../../bloc/ruta/ruta_event.dart';
import '../../bloc/ruta/ruta_state.dart';
import '../../widgets/cards/app_ruta_card.dart';
import '../../layouts/main_layout.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/empty_state.dart';
import '../../widgets/buttons/app_button.dart';
import '../../../core/theme/theme.dart';

/// Página de lista de rutas guardadas
class RutaListPage extends StatelessWidget {
  const RutaListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<RutaBloc>()..add(const LoadRutas()),
      child: MainLayout(
        title: 'Mis Rutas',
        currentBottomNavIndex: 2, // Rutas
        appBarActions: [
          AppButton.text(
            label: '',
            leftIcon: const Icon(Icons.add, size: 20),
            onPressed: () => context.push('/ruta/create'),
          ),
        ],
        child: BlocBuilder<RutaBloc, RutaState>(
          builder: (context, state) {
            if (state is RutaLoading) {
              return const LoadingIndicator();
            }

            if (state is RutaError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<RutaBloc>().add(const LoadRutas()),
              );
            }

            if (state is RutaLoaded) {
              if (state.rutas.isEmpty) {
                return EmptyState(
                  icon: Icons.route,
                  message: 'No tienes rutas guardadas\nCrea tu primera ruta para comenzar',
                  action: AppButton.text(
                    label: 'Crear Ruta',
                    onPressed: () => context.push('/ruta/create'),
                  ),
                );
              }

              return ListView.builder(
                padding: EdgeInsets.all(AppSpacing.space4),
                itemCount: state.rutas.length,
                itemBuilder: (context, index) {
                  final ruta = state.rutas[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.space4),
                    child: AppRutaCard(
                      routeName: ruta.nombre,
                      distanceKm: ruta.distancia / 1000,
                      durationMinutes: ruta.tiempoEstimado.toInt(),
                      obrasCount: ruta.obraIds.length,
                      transportType: ruta.modoTransporte == ModoTransporte.bici
                          ? TransportType.bike
                          : TransportType.walk,
                      createdDate: ruta.fechaCreacion,
                      onTap: () => context.push('/ruta/${ruta.id}'),
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
