import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// Estado de un paso en el indicador
enum StepState {
  completed, // Paso completado (con check)
  current, // Paso actual (resaltado)
  upcoming, // Paso futuro (gris)
}

/// Modelo para un paso del indicador
class StepData {
  final int number;
  final String label;
  final StepState state;

  const StepData({
    required this.number,
    required this.label,
    required this.state,
  });
}

/// Route Step Indicator
/// 
/// Indicador de pasos para el flujo de creación de rutas (7 pasos).
/// Muestra el progreso del usuario a través de los pasos de creación.
/// 
/// **Características:**
/// - 7 pasos numerados (1-7)
/// - Línea de progreso conectando pasos
/// - Paso actual resaltado (primary color)
/// - Pasos completados (check icon)
/// - Pasos futuros (gris)
/// - Labels debajo de los números
/// - Layout horizontal, scrollable
/// 
/// **Figma Reference:**
/// Basado en Material 3 Stepper y design system de Graffiti Trails
class AppRouteStepIndicator extends StatelessWidget {
  final int currentStep; // Paso actual (1-based)
  final int totalSteps; // Total de pasos (default: 6)
  final List<String>? stepLabels; // Labels opcionales para cada paso
  final bool scrollable; // Si es scrollable horizontalmente

  const AppRouteStepIndicator({
    super.key,
    required this.currentStep,
    this.totalSteps = 6,
    this.stepLabels,
    this.scrollable = true,
  });

  /// Constructor con labels predefinidos para creación de ruta
  const AppRouteStepIndicator.createRuta({
    super.key,
    required this.currentStep,
    this.scrollable = true,
  })  : totalSteps = 7,
        stepLabels = const [
          'Punto A',
          'Punto B',
          'Obras',
          'Seleccionar',
          'Transporte',
          'Participantes',
          'Generar',
        ];

  @override
  Widget build(BuildContext context) {
    final steps = _buildSteps();

    final content = Row(
      mainAxisSize: MainAxisSize.min,
      children: steps,
    );

    if (scrollable) {
      return SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4),
        child: content,
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4),
      child: content,
    );
  }

  List<Widget> _buildSteps() {
    final List<Widget> steps = [];

    for (int i = 1; i <= totalSteps; i++) {
      final state = _getStepState(i);
      final label = stepLabels != null && i <= stepLabels!.length
          ? stepLabels![i - 1]
          : 'Paso $i';

      steps.add(_buildStep(i, state, label));

      // Agregar línea conectora (excepto después del último paso)
      if (i < totalSteps) {
        steps.add(_buildConnector(state, _getStepState(i + 1)));
      }
    }

    return steps;
  }

  StepState _getStepState(int stepNumber) {
    if (stepNumber < currentStep) {
      return StepState.completed;
    } else if (stepNumber == currentStep) {
      return StepState.current;
    } else {
      return StepState.upcoming;
    }
  }

  Widget _buildStep(int number, StepState state, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Círculo del paso
        _buildStepCircle(number, state),
        SizedBox(height: AppSpacing.space2),
        // Label
        _buildStepLabel(label, state),
      ],
    );
  }

  Widget _buildStepCircle(int number, StepState state) {
    final size = 40.0;
    final fontSize = 16.0;

    switch (state) {
      case StepState.completed:
        // Círculo verde con check
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: Icon(
            Icons.check,
            size: 24,
            color: AppColors.white,
          ),
        );

      case StepState.current:
        // Círculo verde con número (resaltado)
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.3),
                blurRadius: 8,
                spreadRadius: 2,
              ),
            ],
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: GoogleFonts.roboto(
                fontSize: fontSize,
                fontWeight: FontWeight.w600, // SemiBold
                color: AppColors.white,
              ),
            ),
          ),
        );

      case StepState.upcoming:
        // Círculo gris con número
        return Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            color: AppColors.neutral300,
            shape: BoxShape.circle,
            border: Border.all(
              color: AppColors.neutral400,
              width: 1,
            ),
          ),
          child: Center(
            child: Text(
              number.toString(),
              style: GoogleFonts.roboto(
                fontSize: fontSize,
                fontWeight: FontWeight.w500, // Medium
                color: AppColors.neutral700,
              ),
            ),
          ),
        );
    }
  }

  Widget _buildStepLabel(String label, StepState state) {
    final color = state == StepState.current
        ? AppColors.primary
        : state == StepState.completed
            ? AppColors.onSurface
            : AppColors.onSurfaceVariant;

    return SizedBox(
      width: 60, // Ancho fijo para alineación
      child: Text(
        label,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.roboto(
          fontSize: 12,
          fontWeight: state == StepState.current
              ? FontWeight.w600 // SemiBold para paso actual
              : FontWeight.w400, // Regular para otros
          height: 16 / 12,
          color: color,
        ),
      ),
    );
  }

  Widget _buildConnector(StepState fromState, StepState toState) {
    // Determinar color de la línea
    Color lineColor;
    if (fromState == StepState.completed || toState == StepState.completed) {
      // Si alguno de los pasos está completado, la línea es verde
      lineColor = AppColors.primary;
    } else if (fromState == StepState.current) {
      // Si el paso actual está conectado, mitad verde
      lineColor = AppColors.primary;
    } else {
      // Ambos futuros, línea gris
      lineColor = AppColors.neutral300;
    }

    return Container(
      width: 40,
      height: 2,
      margin: EdgeInsets.only(
        top: 20, // Alineado con el centro del círculo
        left: AppSpacing.space1,
        right: AppSpacing.space1,
      ),
      decoration: BoxDecoration(
        color: lineColor,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }
}
