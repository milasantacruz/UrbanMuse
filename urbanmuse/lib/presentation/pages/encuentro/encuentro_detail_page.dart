import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../bloc/encuentro/encuentro_cubit.dart';
import '../../bloc/encuentro/encuentro_state.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/buttons/app_button.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/rrule_helper.dart';

/// Página de detalle de un encuentro
class EncuentroDetailPage extends StatelessWidget {
  final String encuentroId;
  
  const EncuentroDetailPage({
    super.key,
    required this.encuentroId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<EncuentroCubit>()..loadEncuentroById(encuentroId),
      child: Scaffold(
        appBar: AppTopBar.detail(
          title: 'Encuentro',
          onBack: () => Navigator.of(context).pop(),
        ),
        body: BlocBuilder<EncuentroCubit, EncuentroState>(
          builder: (context, state) {
            if (state is EncuentroLoading) {
              return const LoadingIndicator();
            }
            
            if (state is EncuentroError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<EncuentroCubit>().loadEncuentroById(encuentroId),
              );
            }
            
            if (state is EncuentroDetailLoaded) {
              final encuentro = state.encuentro;
              final fechaCompleta = DateTime(
                encuentro.fecha.year,
                encuentro.fecha.month,
                encuentro.fecha.day,
                encuentro.hora.hour,
                encuentro.hora.minute,
              );
              
              return SingleChildScrollView(
                padding: EdgeInsets.all(AppSpacing.space4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Artista
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: CircleAvatar(
                        child: Text(encuentro.artistaNombre[0].toUpperCase()),
                      ),
                      title: Text(
                        encuentro.artistaNombre,
                        style: AppTextStyles.titleLarge,
                      ),
                    ),
                    
                    SizedBox(height: AppSpacing.space5),
                    
                    // Fecha y hora
                    _buildInfoRow(
                      context,
                      icon: Icons.calendar_today,
                      label: 'Fecha',
                      value: DateFormat('EEEE, d MMMM yyyy', 'es_AR').format(encuentro.fecha),
                    ),
                    _buildInfoRow(
                      context,
                      icon: Icons.access_time,
                      label: 'Hora',
                      value: DateFormat('HH:mm').format(fechaCompleta),
                    ),
                    
                    // Repetición
                    if (encuentro.esRepetitivo && encuentro.rrule != null)
                      _buildInfoRow(
                        context,
                        icon: Icons.repeat,
                        label: 'Repetición',
                        value: RRuleHelper.formatearReglaATexto(encuentro.rrule!),
                      ),
                    
                    // Ubicación
                    _buildInfoRow(
                      context,
                      icon: Icons.location_on,
                      label: 'Ubicación',
                      value: encuentro.ubicacion.direccion ?? 
                             encuentro.ubicacion.barrio ?? 
                             'Ubicación no especificada',
                    ),
                    
                    SizedBox(height: AppSpacing.space4),
                    
                    // Descripción
                    Text(
                      'Descripción',
                      style: AppTextStyles.labelLarge,
                    ),
                    SizedBox(height: AppSpacing.space2),
                    Text(
                      encuentro.descripcion,
                      style: AppTextStyles.bodyLarge,
                    ),
                    
                    SizedBox(height: AppSpacing.space5),
                    
                    // Asistentes
                    if (encuentro.asistentesIds.isNotEmpty) ...[
                      Text(
                        'Asistentes (${encuentro.asistentesIds.length})',
                        style: AppTextStyles.labelLarge,
                      ),
                      SizedBox(height: AppSpacing.space2),
                      // TODO: Mostrar lista de asistentes
                      Text(
                        'Lista de asistentes en desarrollo',
                        style: AppTextStyles.bodyMedium,
                      ),
                    ],
                    
                    SizedBox(height: AppSpacing.space5),
                    
                    // Botones de acción
                    if (!encuentro.cancelado) ...[
                      AppButton.primary(
                        label: 'Unirme al Encuentro',
                        onPressed: () {
                          // TODO: Obtener userId del usuario actual
                          const userId = 'current_user_id';
                          context.read<EncuentroCubit>().join(
                            encuentroId: encuentro.id,
                            userId: userId,
                          );
                        },
                      ),
                      SizedBox(height: AppSpacing.space2),
                    ],
                    
                    if (encuentro.cancelado)
                      AppButton.primaryOutlined(
                        label: 'Este encuentro ha sido cancelado',
                        onPressed: null,
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
  
  Widget _buildInfoRow(BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.space4),
      child: Row(
        children: [
          Icon(icon, color: colorScheme.onSurfaceVariant),
          SizedBox(width: AppSpacing.space2),
          Text(
            '$label: ',
            style: AppTextStyles.bodyMedium.copyWith(
              color: colorScheme.onSurfaceVariant,
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}

