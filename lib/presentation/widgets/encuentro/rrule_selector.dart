import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/utils/rrule_helper.dart';
import '../../../core/theme/theme.dart';

/// RRuleSelector
/// 
/// Widget para seleccionar el tipo de repetición de un evento.
/// Permite elegir entre: diario, semanal, mensual, anual, o sin repetición.
class RRuleSelector extends StatefulWidget {
  final String? initialValue;
  final ValueChanged<String?> onChanged;
  final DateTime fechaInicial;

  const RRuleSelector({
    super.key,
    this.initialValue,
    required this.onChanged,
    required this.fechaInicial,
  });

  @override
  State<RRuleSelector> createState() => _RRuleSelectorState();
}

class _RRuleSelectorState extends State<RRuleSelector> {
  String? _selectedTipo;

  @override
  void initState() {
    super.initState();
    _selectedTipo = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Repetición',
          style: AppTextStyles.labelLarge,
        ),
        SizedBox(height: AppSpacing.space2),
        
        // Opción: Sin repetición
        RadioListTile<String?>(
          title: const Text('Sin repetición'),
          value: null,
          groupValue: _selectedTipo,
          onChanged: (value) {
            setState(() => _selectedTipo = value);
            widget.onChanged(null);
          },
        ),
        
        // Opciones de repetición
        ...AppConstants.repeticiones.map((tipo) {
          return RadioListTile<String?>(
            title: Text(_getTipoLabel(tipo)),
            subtitle: Text(_getTipoDescription(tipo)),
            value: tipo,
            groupValue: _selectedTipo,
            onChanged: (value) {
              setState(() => _selectedTipo = value);
              if (value != null) {
                final rrule = RRuleHelper.crearReglaRepeticion(
                  tipoRepeticion: value,
                  fechaInicial: widget.fechaInicial,
                );
                widget.onChanged(rrule);
              }
            },
          );
        }),
        
        // Vista previa del texto de la regla
        if (_selectedTipo != null) ...[
          SizedBox(height: AppSpacing.space4),
          Container(
            padding: EdgeInsets.all(AppSpacing.space3),
            decoration: BoxDecoration(
              color: colorScheme.surfaceVariant,
              borderRadius: AppBorderRadius.medium,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 20,
                  color: colorScheme.onSurfaceVariant,
                ),
                SizedBox(width: AppSpacing.space2),
                Expanded(
                  child: Text(
                    _getPreviewText(_selectedTipo!),
                    style: AppTextStyles.bodySmall.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  String _getTipoLabel(String tipo) {
    switch (tipo) {
      case AppConstants.repeticionDiario:
        return 'Diario';
      case AppConstants.repeticionSemanal:
        return 'Semanal';
      case AppConstants.repeticionMensual:
        return 'Mensual';
      case AppConstants.repeticionAnual:
        return 'Anual';
      default:
        return tipo;
    }
  }

  String _getTipoDescription(String tipo) {
    switch (tipo) {
      case AppConstants.repeticionDiario:
        return 'Se repite todos los días';
      case AppConstants.repeticionSemanal:
        return 'Se repite cada semana';
      case AppConstants.repeticionMensual:
        return 'Se repite cada mes';
      case AppConstants.repeticionAnual:
        return 'Se repite cada año';
      default:
        return '';
    }
  }

  String _getPreviewText(String tipo) {
    final rrule = RRuleHelper.crearReglaRepeticion(
      tipoRepeticion: tipo,
      fechaInicial: widget.fechaInicial,
    );
    return RRuleHelper.formatearReglaATexto(rrule);
  }
}

