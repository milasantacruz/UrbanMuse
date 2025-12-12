import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/step_indicators/step_indicators.dart';

/// Página de preview para Route Step Indicator
class RouteStepIndicatorPreviewPage extends StatelessWidget {
  const RouteStepIndicatorPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Route Step Indicator Preview'),
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(AppSpacing.space4),
        children: [
          // Header info
          Card(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.info_outline, size: 20),
                      SizedBox(width: AppSpacing.space2),
                      Text(
                        'AppRouteStepIndicator',
                        style: AppTextStyles.h3,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Indicador de pasos para el flujo de creación de rutas. '
                    'Muestra el progreso del usuario a través de los pasos de creación.',
                    style: AppTextStyles.bodySmall,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Create Ruta Flow (6 pasos)
          _buildSectionTitle('Flujo de Creación de Ruta (6 pasos)'),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: 'Paso 1 - Punto A',
            child: const AppRouteStepIndicator.createRuta(
              currentStep: 1,
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: 'Paso 2 - Punto B',
            child: const AppRouteStepIndicator.createRuta(
              currentStep: 2,
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: 'Paso 3 - Obras en el Camino',
            child: const AppRouteStepIndicator.createRuta(
              currentStep: 3,
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: 'Paso 4 - Seleccionar Obras',
            child: const AppRouteStepIndicator.createRuta(
              currentStep: 4,
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: 'Paso 5 - Transporte',
            child: const AppRouteStepIndicator.createRuta(
              currentStep: 5,
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: 'Paso 6 - Generar Ruta (Completado)',
            child: const AppRouteStepIndicator.createRuta(
              currentStep: 6,
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Custom Steps
          _buildSectionTitle('Pasos Personalizados'),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: '5 pasos personalizados (Paso 2)',
            child: AppRouteStepIndicator(
              currentStep: 2,
              totalSteps: 5,
              stepLabels: const [
                'Inicio',
                'Configuración',
                'Revisión',
                'Aprobación',
                'Final',
              ],
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildStepShowcase(
            label: '4 pasos (Paso 3 completado)',
            child: AppRouteStepIndicator(
              currentStep: 4,
              totalSteps: 4,
              stepLabels: const [
                'Paso 1',
                'Paso 2',
                'Paso 3',
                'Paso 4',
              ],
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // No Scrollable
          _buildSectionTitle('Versión No Scrollable'),
          SizedBox(height: AppSpacing.space3),
          Card(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Versión fija (no scrollable)',
                    style: AppTextStyles.label,
                  ),
                  SizedBox(height: AppSpacing.space3),
                  const AppRouteStepIndicator.createRuta(
                    currentStep: 3,
                    scrollable: false,
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Interactive Demo
          _buildSectionTitle('Demo Interactiva'),
          SizedBox(height: AppSpacing.space3),
          const _InteractiveStepDemo(),

          SizedBox(height: AppSpacing.space6),

          // Specifications
          _buildSectionTitle('Especificaciones'),
          SizedBox(height: AppSpacing.space3),
          Card(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSpecRow('Step Circle', ''),
                  _buildSpecRow('  Size', '40px'),
                  _buildSpecRow('  Completed', 'Primary color + check icon'),
                  _buildSpecRow('  Current', 'Primary color + number + shadow'),
                  _buildSpecRow('  Upcoming', 'Gray + border + number'),
                  const Divider(),
                  _buildSpecRow('Connector Line', ''),
                  _buildSpecRow('  Width', '40px'),
                  _buildSpecRow('  Height', '2px'),
                  _buildSpecRow('  Color', 'Primary (completed) / Gray (upcoming)'),
                  const Divider(),
                  _buildSpecRow('Label', ''),
                  _buildSpecRow('  Font', 'Roboto 12px'),
                  _buildSpecRow('  Width', '60px (fixed)'),
                  _buildSpecRow('  Max lines', '2'),
                  _buildSpecRow('  Color', 'Primary (current) / OnSurface (others)'),
                  const Divider(),
                  _buildSpecRow('Layout', ''),
                  _buildSpecRow('  Direction', 'Horizontal'),
                  _buildSpecRow('  Scrollable', 'Yes (default)'),
                  _buildSpecRow('  Padding', '16px horizontal'),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space8),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: AppTextStyles.h3,
    );
  }

  Widget _buildStepShowcase({
    required String label,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: AppTextStyles.label,
            ),
            SizedBox(height: AppSpacing.space3),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSpecRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.space1),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 150,
            child: Text(
              label,
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.caption,
            ),
          ),
        ],
      ),
    );
  }
}

/// Widget interactivo para demostrar el cambio de pasos
class _InteractiveStepDemo extends StatefulWidget {
  const _InteractiveStepDemo();

  @override
  State<_InteractiveStepDemo> createState() => _InteractiveStepDemoState();
}

class _InteractiveStepDemoState extends State<_InteractiveStepDemo> {
  int currentStep = 1;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Toca los botones para cambiar el paso actual:',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: AppSpacing.space4),
            AppRouteStepIndicator.createRuta(
              currentStep: currentStep,
            ),
            SizedBox(height: AppSpacing.space4),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: currentStep > 1
                      ? () => setState(() => currentStep--)
                      : null,
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Anterior'),
                ),
                Text(
                  'Paso $currentStep de 6',
                  style: AppTextStyles.label,
                ),
                ElevatedButton.icon(
                  onPressed: currentStep < 6
                      ? () => setState(() => currentStep++)
                      : null,
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Siguiente'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
