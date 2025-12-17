import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/dialogs/dialogs.dart';
import '../../widgets/buttons/buttons.dart';

/// Página de preview para Dialog Box
class DialogsPreviewPage extends StatelessWidget {
  const DialogsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dialog Box Preview'),
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
                        'AppDialogBox',
                        style: AppTextStyles.h3,
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Caja de diálogo con header, content y footer. '
                    'Variantes: Confirm, Alert, Simple. '
                    'Basado en Syncfusion Flutter UI Kit.',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Figma: node-id=2134-781',
                    style: AppTextStyles.caption.copyWith(
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ],
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Full Dialog Box
          _buildSectionTitle('Dialog Completo'),
          SizedBox(height: AppSpacing.space3),
          Center(
            child: AppDialogBox(
              title: 'Dialog title',
              content: _buildSampleContent(),
              showCloseIcon: true,
              cancelText: 'Cancel',
              confirmText: 'OK',
              onCancel: () {},
              onConfirm: () {},
              onClose: () {},
              height: 316,
            ),
          ),

          SizedBox(height: AppSpacing.space6),

          // Variantes
          _buildSectionTitle('Variantes'),
          SizedBox(height: AppSpacing.space3),

          // Solo Header
          _buildVariantCard(
            label: 'Solo Header (sin footer)',
            child: SizedBox(
              height: 200,
              child: AppDialogBox(
                title: 'Solo Header',
                content: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.space4),
                  child: Text(
                    'Este dialog solo tiene header, sin footer.',
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
                showHeader: true,
                showFooter: false,
                showCloseIcon: true,
                onClose: () {},
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space3),

          // Solo Footer
          _buildVariantCard(
            label: 'Solo Footer (sin header)',
            child: SizedBox(
              height: 180,
              child: AppDialogBox(
                content: Padding(
                  padding: EdgeInsets.symmetric(vertical: AppSpacing.space4),
                  child: Text(
                    'Este dialog solo tiene footer, sin header.',
                    style: AppTextStyles.bodyMedium,
                  ),
                ),
                showHeader: false,
                showFooter: true,
                cancelText: 'Cancel',
                confirmText: 'OK',
                onCancel: () {},
                onConfirm: () {},
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space3),

          // Simple (sin header ni footer)
          _buildVariantCard(
            label: 'Simple (sin header ni footer)',
            child: SizedBox(
              height: 120,
              child: AppDialogBox.simple(
                content: Center(
                  child: Text(
                    'Contenido simple sin header ni footer.',
                    style: AppTextStyles.bodyMedium,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: AppSpacing.space3),

          // Alert (solo botón OK)
          _buildVariantCard(
            label: 'Alert (solo botón OK)',
            child: SizedBox(
              height: 200,
              child: AppDialogBox.alert(
                title: 'Alert',
                content: Text(
                  'Este es un mensaje de alerta. Solo tiene un botón OK.',
                  style: AppTextStyles.bodyMedium,
                ),
                confirmText: 'Entendido',
                onConfirm: () {},
                onClose: () {},
              ),
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
                    'Toca los botones para abrir los dialogs:',
                    style: AppTextStyles.bodySmall,
                  ),
                  SizedBox(height: AppSpacing.space4),
                    Wrap(
                      spacing: AppSpacing.space3,
                      runSpacing: AppSpacing.space3,
                      children: [
                        AppButton.primary(
                          label: 'Confirm Dialog',
                          onPressed: () => _showConfirmDialog(context),
                        ),
                        AppButton.primaryOutlined(
                          label: 'Alert Dialog',
                          onPressed: () => _showAlertDialog(context),
                        ),
                        AppButton.text(
                          label: 'Custom Dialog',
                          onPressed: () => _showCustomDialog(context),
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
                  _buildSpecRow('Container', ''),
                  _buildSpecRow('  Width', '417px (default)'),
                  _buildSpecRow('  Height', '316px (ajustable)'),
                  _buildSpecRow('  Border radius', '36px (7xl)'),
                  _buildSpecRow('  Background', 'Surface3 (#EEF4E8)'),
                  const Divider(),
                  _buildSpecRow('Header', ''),
                  _buildSpecRow('  Title', 'Roboto Regular 24px'),
                  _buildSpecRow('  Close icon', '24px (container 32px)'),
                  _buildSpecRow('  Padding', '24px H, 24px top, 16px bottom'),
                  const Divider(),
                  _buildSpecRow('Footer', ''),
                  _buildSpecRow('  Height', '88px'),
                  _buildSpecRow('  Padding', '24px'),
                  _buildSpecRow('  Button gap', '12px'),
                  _buildSpecRow('  Primary btn', '#6BA034'),
                  _buildSpecRow('  Cancel btn', 'Transparent + text primary'),
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

  Widget _buildVariantCard({
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

  Widget _buildSampleContent() {
    return Container(
      height: 100,
      alignment: Alignment.center,
      child: Text(
        'Contenido del dialog aquí',
        style: GoogleFonts.roboto(
          fontSize: 14,
          color: AppColors.onSurfaceVariant,
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

  void _showConfirmDialog(BuildContext context) {
    showAppDialog(
      context: context,
      title: '¿Confirmar acción?',
      content: Text(
        '¿Estás seguro de que quieres realizar esta acción? Esta operación no se puede deshacer.',
        style: AppTextStyles.bodyMedium,
      ),
      cancelText: 'Cancelar',
      confirmText: 'Confirmar',
      onCancel: () => Navigator.of(context).pop(),
      onConfirm: () {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('¡Acción confirmada!')),
        );
      },
    );
  }

  void _showAlertDialog(BuildContext context) {
    showAppAlert(
      context: context,
      title: 'Información',
      message:
          'Este es un mensaje de alerta importante que el usuario debe leer.',
      confirmText: 'Entendido',
      onConfirm: () => Navigator.of(context).pop(),
    );
  }

  void _showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: AppDialogBox(
          title: 'Formulario',
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(
                  labelText: 'Nombre',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              SizedBox(height: AppSpacing.space3),
              TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ],
          ),
          cancelText: 'Cancelar',
          confirmText: 'Guardar',
          onCancel: () => Navigator.of(context).pop(),
          onConfirm: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('¡Formulario guardado!')),
            );
          },
          onClose: () => Navigator.of(context).pop(),
          height: 320,
        ),
      ),
    );
  }
}
