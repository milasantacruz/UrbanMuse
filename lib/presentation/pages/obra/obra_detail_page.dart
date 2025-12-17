import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../bloc/obra/obra_bloc.dart';
import '../../bloc/obra/obra_event.dart';
import '../../bloc/obra/obra_state.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/headers/app_obra_detail_header.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/mapa/custom_map.dart';
import '../../../core/theme/theme.dart';

/// Página de detalle de obra
class ObraDetailPage extends StatelessWidget {
  final String obraId;

  const ObraDetailPage({
    super.key,
    required this.obraId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<ObraBloc>()..add(GetObraById(obraId)),
      child: Scaffold(
        appBar: AppTopBar.detail(
          title: 'Obra',
          onBack: () => context.pop(),
        ),
        body: BlocBuilder<ObraBloc, ObraState>(
          builder: (context, state) {
            if (state is ObraLoading) {
              return const LoadingIndicator();
            }

            if (state is ObraError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<ObraBloc>().add(GetObraById(obraId)),
              );
            }

            if (state is ObraDetailLoaded) {
              final obra = state.obra;
              final theme = Theme.of(context);
              final colorScheme = theme.colorScheme;

              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Header con imagen
                    AppObraDetailHeader(
                      imageUrl: obra.foto,
                      titulo: obra.titulo,
                      categoria: obra.categoria,
                    ),

                    // Información
                    Padding(
                      padding: EdgeInsets.all(AppSpacing.space4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Artista
                          Text(
                            'Artista',
                            style: AppTextStyles.labelLarge,
                          ),
                          SizedBox(height: AppSpacing.space2),
                          Text(
                            obra.artistaNombre,
                            style: AppTextStyles.bodyLarge,
                          ),
                          SizedBox(height: AppSpacing.space5),

                          // Mapa
                          Text(
                            'Ubicación',
                            style: AppTextStyles.labelLarge,
                          ),
                          SizedBox(height: AppSpacing.space2),
                          Container(
                            height: 200,
                            decoration: BoxDecoration(
                              borderRadius: AppBorderRadius.medium,
                              border: Border.all(
                                color: colorScheme.outline,
                              ),
                            ),
                            clipBehavior: Clip.antiAlias,
                            child: CustomMap(
                              obras: const [],
                              initialCenter: LatLng(
                                obra.ubicacion.lat,
                                obra.ubicacion.lng,
                              ),
                              initialZoom: 16.0,
                              showUserLocation: false,
                            ),
                          ),
                          SizedBox(height: AppSpacing.space4),

                          // Botones de acción
                          AppButton.primary(
                            label: 'Ver en Mapa',
                            leftIcon: const Icon(Icons.map),
                            onPressed: () {
                              // TODO: Navegar a mapa centrado en esta obra
                              context.push('/');
                            },
                          ),
                          SizedBox(height: AppSpacing.space2),
                          AppButton.primaryOutlined(
                            label: 'Ver Perfil del Artista',
                            leftIcon: const Icon(Icons.person),
                            onPressed: () {
                              context.push('/artista/${obra.artistaId}');
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
