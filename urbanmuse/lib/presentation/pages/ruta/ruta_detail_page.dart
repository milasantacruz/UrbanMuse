import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../domain/entities/ruta.dart';
import '../../../domain/entities/obra.dart';
import '../../bloc/ruta/ruta_bloc.dart';
import '../../bloc/ruta/ruta_event.dart';
import '../../bloc/ruta/ruta_state.dart';
import '../../bloc/obra/obra_bloc.dart';
import '../../bloc/obra/obra_event.dart';
import '../../bloc/obra/obra_state.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/mapa/custom_map.dart';
import '../../widgets/cards/app_obra_card.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../../core/theme/theme.dart';

/// Página de detalle de ruta
class RutaDetailPage extends StatelessWidget {
  final String rutaId;

  const RutaDetailPage({
    super.key,
    required this.rutaId,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<RutaBloc>()..add(GetRutaById(rutaId))),
        BlocProvider(create: (_) => di.getIt<ObraBloc>()),
      ],
      child: Scaffold(
        appBar: AppTopBar.detail(
          title: 'Ruta',
          onBack: () => context.pop(),
        ),
        body: BlocBuilder<RutaBloc, RutaState>(
          builder: (context, state) {
            if (state is RutaLoading) {
              return const LoadingIndicator();
            }

            if (state is RutaError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<RutaBloc>().add(GetRutaById(rutaId)),
              );
            }

            if (state is RutaDetailLoaded) {
              final ruta = state.ruta;
              
              // Cargar obras de la ruta
              if (ruta.obraIds.isNotEmpty) {
                context.read<ObraBloc>().add(LoadObras());
              }

              return BlocBuilder<ObraBloc, ObraState>(
                builder: (context, obraState) {
                  final List<Obra> obras = obraState is ObraLoaded
                      ? obraState.obras.where((o) => ruta.obraIds.contains(o.id)).toList()
                      : <Obra>[];

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Mapa con ruta
                        Container(
                          height: 300,
                          child: CustomMap(
                            obras: obras,
                            initialCenter: LatLng(
                              ruta.puntoA.lat,
                              ruta.puntoA.lng,
                            ),
                            initialZoom: 14.0,
                            showUserLocation: false,
                          ),
                        ),

                        // Información de la ruta
                        Padding(
                          padding: EdgeInsets.all(AppSpacing.space4),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                ruta.nombre,
                                style: AppTextStyles.headlineSmall,
                              ),
                              SizedBox(height: AppSpacing.space2),
                              
                              // Stats
                              Row(
                                children: [
                                  Icon(
                                    ruta.modoTransporte == ModoTransporte.bici
                                        ? Icons.directions_bike
                                        : Icons.directions_walk,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  SizedBox(width: AppSpacing.space1),
                                  Text(
                                    _formatDistance(ruta.distancia),
                                    style: AppTextStyles.bodyMedium,
                                  ),
                                  SizedBox(width: AppSpacing.space4),
                                  Icon(
                                    Icons.access_time,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  SizedBox(width: AppSpacing.space1),
                                  Text(
                                    _formatDuration(ruta.tiempoEstimado),
                                    style: AppTextStyles.bodyMedium,
                                  ),
                                  SizedBox(width: AppSpacing.space4),
                                  Icon(
                                    Icons.image,
                                    size: 16,
                                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                                  ),
                                  SizedBox(width: AppSpacing.space1),
                                  Text(
                                    '${ruta.obraIds.length} obras',
                                    style: AppTextStyles.bodyMedium,
                                  ),
                                ],
                              ),
                              SizedBox(height: AppSpacing.space4),

                              // Tipo de ruta
                              Chip(
                                label: Text(_getTipoRutaLabel(ruta.tipo)),
                              ),
                              SizedBox(height: AppSpacing.space5),

                              // Obras en la ruta
                              Text(
                                'Obras en la ruta',
                                style: AppTextStyles.titleMedium,
                              ),
                              SizedBox(height: AppSpacing.space2),
                              
                              if (obras.isEmpty)
                                const LoadingIndicator()
                              else
                                ...obras.map((obra) {
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: AppSpacing.space2),
                                    child: AppObraCard.list(
                                      imageUrl: obra.foto,
                                      titulo: obra.titulo,
                                      artista: obra.artistaNombre,
                                      categoria: obra.categoria,
                                      ubicacion: obra.ubicacion.barrio ?? '',
                                      onTap: () => context.push('/obra/${obra.id}'),
                                    ),
                                  );
                                }).toList(),

                              SizedBox(height: AppSpacing.space5),

                              // Acciones
                              if (ruta.esPublica && !ruta.esDinamica)
                                AppButton.primaryOutlined(
                                  label: 'Convertir a Dinámica',
                                  onPressed: () {
                                    // TODO: Navegar a convertir a dinámica
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(content: Text('Funcionalidad en desarrollo')),
                                    );
                                  },
                                ),
                              
                              if (ruta.esDinamica) ...[
                                AppButton.primary(
                                  label: 'Unirme a la Ruta',
                                  onPressed: () {
                                    // TODO: Obtener userId del usuario actual
                                    const userId = 'current_user_id';
                                    context.read<RutaBloc>().add(
                                      JoinRutaDinamica(
                                        rutaId: ruta.id,
                                        userId: userId,
                                      ),
                                    );
                                  },
                                ),
                                SizedBox(height: AppSpacing.space2),
                                Text(
                                  'Próximos eventos:',
                                  style: AppTextStyles.labelLarge,
                                ),
                                SizedBox(height: AppSpacing.space2),
                                // TODO: Mostrar próximos eventos calculados con rrule
                                Text(
                                  'Lista de próximos eventos en desarrollo',
                                  style: AppTextStyles.bodyMedium,
                                ),
                              ],
                            ],
                          ),
                        ),
                      ],
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

  String _formatDistance(double distanceInMeters) {
    if (distanceInMeters < 1000) {
      return '${distanceInMeters.toInt()}m';
    }
    return '${(distanceInMeters / 1000).toStringAsFixed(1)}km';
  }

  String _formatDuration(double minutes) {
    if (minutes < 60) {
      return '${minutes.toInt()} min';
    }
    final hours = (minutes / 60).floor();
    final mins = (minutes % 60).toInt();
    return '${hours}h ${mins}min';
  }

  String _getTipoRutaLabel(TipoRuta tipo) {
    switch (tipo) {
      case TipoRuta.privada:
        return 'Privada';
      case TipoRuta.publicaEstatica:
        return 'Pública Estática';
      case TipoRuta.publicaDinamica:
        return 'Pública Dinámica';
    }
  }
}
