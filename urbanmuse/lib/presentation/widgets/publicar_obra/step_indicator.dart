import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// StepIndicator
/// 
/// Indicador de pasos para el flujo de publicar obra (4 pasos).
/// Muestra el progreso y el paso actual.
class StepIndicator extends StatelessWidget {
  final int currentStep; // 0-3 (4 pasos)
  final List<String> stepLabels;

  const StepIndicator({
    super.key,
    required this.currentStep,
    this.stepLabels = const [
      'Foto',
      'Información',
      'Ubicación',
      'Confirmar',
    ],
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: AppSpacing.space4,
        vertical: AppSpacing.space3,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(4, (index) {
          final isActive = index == currentStep;
          final isCompleted = index < currentStep;
          
          return Expanded(
            child: Row(
              children: [
                // Círculo del paso
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? colorScheme.primary
                        : isActive
                            ? colorScheme.primary
                            : colorScheme.surfaceVariant,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isActive || isCompleted
                          ? colorScheme.primary
                          : colorScheme.outline,
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: isCompleted
                        ? Icon(
                            Icons.check,
                            size: 18,
                            color: colorScheme.onPrimary,
                          )
                        : Text(
                            '${index + 1}',
                            style: AppTextStyles.labelMedium.copyWith(
                              color: isActive
                                  ? colorScheme.onPrimary
                                  : colorScheme.onSurfaceVariant,
                            ),
                          ),
                  ),
                ),
                
                // Línea conectora (excepto el último)
                if (index < 3)
                  Expanded(
                    child: Container(
                      height: 2,
                      margin: EdgeInsets.symmetric(horizontal: AppSpacing.space1),
                      decoration: BoxDecoration(
                        color: isCompleted
                            ? colorScheme.primary
                            : colorScheme.surfaceVariant,
                      ),
                    ),
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

