import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../domain/entities/encuentro.dart';
import '../../../core/utils/rrule_helper.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/badges/app_badge.dart';

/// Card para mostrar un encuentro en la lista
class EncuentroCard extends StatelessWidget {
  final Encuentro encuentro;
  final VoidCallback? onTap;

  const EncuentroCard({
    super.key,
    required this.encuentro,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    final fechaCompleta = DateTime(
      encuentro.fecha.year,
      encuentro.fecha.month,
      encuentro.fecha.day,
      encuentro.hora.hour,
      encuentro.hora.minute,
    );
    
    final fechaFormateada = DateFormat('EEEE, d MMMM', 'es_AR').format(encuentro.fecha);
    final horaFormateada = DateFormat('HH:mm').format(fechaCompleta);
    
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppBorderRadius.medium,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: AppBorderRadius.medium,
        child: Padding(
          padding: EdgeInsets.all(AppSpacing.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header: Artista y fecha
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          encuentro.artistaNombre,
                          style: AppTextStyles.titleMedium,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              size: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              fechaFormateada,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Icon(
                              Icons.access_time,
                              size: 14,
                              color: colorScheme.onSurfaceVariant,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              horaFormateada,
                              style: AppTextStyles.bodySmall.copyWith(
                                color: colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  if (encuentro.esRepetitivo)
                    AppBadge(
                      label: RRuleHelper.formatearReglaATexto(encuentro.rrule!),
                    ),
                  if (encuentro.cancelado)
                    AppBadge(
                      label: 'Cancelado',
                    ),
                ],
              ),
              
              SizedBox(height: AppSpacing.space4),
              
              // Descripción
              Text(
                encuentro.descripcion,
                style: AppTextStyles.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              
              SizedBox(height: AppSpacing.space4),
              
              // Footer: Ubicación y asistentes
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    size: 16,
                    color: colorScheme.onSurfaceVariant,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      encuentro.ubicacion.direccion ?? 
                      '${encuentro.ubicacion.barrio ?? "Ubicación"}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  if (encuentro.asistentesIds.isNotEmpty) ...[
                    const SizedBox(width: 12),
                    Icon(
                      Icons.people,
                      size: 16,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${encuentro.asistentesIds.length}',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

