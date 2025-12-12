import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/tooltips/tooltips.dart';
import '../../widgets/buttons/buttons.dart';

/// Página de preview para Tooltips
class TooltipsPreviewPage extends StatelessWidget {
  const TooltipsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tooltips Preview'),
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
                        'AppTooltip',
                        style: AppTextStyles.h3,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Tooltips informativos con dos variantes: Normal y With Header. '
                    'Basados en el diseño de Syncfusion Flutter UI Kit.',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Figma: node-id=3975-28867',
                    style: AppTextStyles.caption.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Type: Normal
          _buildSectionTitle('Type: Normal'),
          SizedBox(height: AppSpacing.space3),
          _buildTooltipShowcase(
            label: 'Tooltip Normal',
            child: const AppTooltip.normal(
              message: 'Tool Tip',
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildTooltipShowcase(
            label: 'Tooltip Normal (texto largo)',
            child: const AppTooltip.normal(
              message: 'Este es un tooltip con texto más largo',
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Type: With Header
          _buildSectionTitle('Type: With Header'),
          SizedBox(height: AppSpacing.space3),
          _buildTooltipShowcase(
            label: 'Con Header y Close Icon',
            child: AppTooltip.withHeader(
              header: 'Header',
              message:
                  'This sample demonstrates the smart positioning functionalities of the tooltip which will open by dragging the picture.',
              showCloseIcon: true,
              onClose: () {},
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildTooltipShowcase(
            label: 'Sin Close Icon',
            child: const AppTooltip.withHeader(
              header: 'Información',
              message: 'Este tooltip no tiene icono de cerrar.',
              showCloseIcon: false,
            ),
          ),
          SizedBox(height: AppSpacing.space3),
          _buildTooltipShowcase(
            label: 'Width personalizado (250px)',
            child: AppTooltip.withHeader(
              header: 'Ancho Custom',
              message: 'Este tooltip tiene un ancho personalizado de 250px para mostrar más contenido.',
              showCloseIcon: true,
              onClose: () {},
              width: 250,
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Interactive Demo
          _buildSectionTitle('Demo Interactiva'),
          SizedBox(height: AppSpacing.space3),
          Card(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Toca o mantén presionado para ver el tooltip:',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: AppSpacing.space4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AppTooltipWrapper(
                        message: 'Tooltip normal!',
                        showOnTap: true,
                        showOnLongPress: false,
                        child: AppButton.primaryOutlined(
                          label: 'Tap me',
                          onPressed: () {},
                        ),
                      ),
                      AppTooltipWrapper(
                        message:
                            'Este tooltip tiene más información y un header.',
                        header: 'Información',
                        type: AppTooltipType.withHeader,
                        showOnTap: true,
                        showOnLongPress: false,
                        child: AppButton.primary(
                          label: 'Con Header',
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

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
                  _buildSpecRow('Type Normal', ''),
                  _buildSpecRow('  Background', 'OnSurface (#1C1B1F)'),
                  _buildSpecRow('  Text color', 'OnInverseSurface (#F4EFF4)'),
                  _buildSpecRow('  Border radius', '2px'),
                  _buildSpecRow('  Padding', '3px vertical, 8px horizontal'),
                  _buildSpecRow('  Font', 'Roboto Regular 12px'),
                  const Divider(),
                  _buildSpecRow('Type With Header', ''),
                  _buildSpecRow('  Border radius', '4px'),
                  _buildSpecRow('  Padding', '8px'),
                  _buildSpecRow('  Width', '181px (default)'),
                  _buildSpecRow('  Gap interno', '12px'),
                  _buildSpecRow('  Header font', 'Roboto Medium 12px'),
                  _buildSpecRow('  Body font', 'Roboto Regular 12px'),
                  _buildSpecRow('  Close icon', '12px'),
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

  Widget _buildTooltipShowcase({
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
            Center(child: child),
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
