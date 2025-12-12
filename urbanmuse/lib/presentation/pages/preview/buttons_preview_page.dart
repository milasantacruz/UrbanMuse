import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/buttons/app_fab.dart';

/// Página de preview para visualizar y testear componentes de botones
class ButtonsPreviewPage extends StatefulWidget {
  const ButtonsPreviewPage({super.key});

  @override
  State<ButtonsPreviewPage> createState() => _ButtonsPreviewPageState();
}

class _ButtonsPreviewPageState extends State<ButtonsPreviewPage> {
  bool _isLoading = false;

  void _simulateLoading() {
    setState(() => _isLoading = true);
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) setState(() => _isLoading = false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buttons Preview'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Button Components',
              style: AppTextStyles.h1,
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Componentes de botones basados en Material 3 y sincronizados con Figma UI Kit',
              style: AppTextStyles.bodySmall.copyWith(
              ),
            ),
            SizedBox(height: AppSpacing.space6),

            // Divider
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Primary Buttons - Filled
            _buildSection(
              title: 'Primary Buttons (Filled)',
              description: 'Botones principales para acciones primarias',
              children: [
                AppButton.primary(
                  label: 'Primary Button',
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primary(
                  label: 'With Left Icon',
                  leftIcon: const Icon(Icons.add, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primary(
                  label: 'With Right Icon',
                  rightIcon: const Icon(Icons.arrow_forward, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primary(
                  label: 'Loading State',
                  isLoading: _isLoading,
                  onPressed: _simulateLoading,
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primary(
                  label: 'Disabled Button',
                  onPressed: null,
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primary(
                  label: 'Expanded Button',
                  isExpanded: true,
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Primary Buttons - Outlined
            _buildSection(
              title: 'Primary Buttons (Outlined)',
              description: 'Botones con borde para acciones secundarias',
              children: [
                AppButton.primaryOutlined(
                  label: 'Outlined Button',
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primaryOutlined(
                  label: 'With Left Icon',
                  leftIcon: const Icon(Icons.filter_alt, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primaryOutlined(
                  label: 'With Right Icon',
                  rightIcon: const Icon(Icons.chevron_right, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primaryOutlined(
                  label: 'Disabled Outlined',
                  onPressed: null,
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.primaryOutlined(
                  label: 'Expanded Outlined',
                  isExpanded: true,
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Text Buttons (Flat)
            _buildSection(
              title: 'Text Buttons (Flat)',
              description: 'Botones de texto para acciones terciarias',
              children: [
                AppButton.text(
                  label: 'Text Button',
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.text(
                  label: 'Cancel',
                  leftIcon: const Icon(Icons.close, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.text(
                  label: 'Next',
                  rightIcon: const Icon(Icons.arrow_forward, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.text(
                  label: 'Disabled Text',
                  onPressed: null,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Secondary Buttons
            _buildSection(
              title: 'Secondary Buttons',
              description: 'Botones secundarios con secondary container color',
              children: [
                AppButton.secondary(
                  label: 'Secondary Button',
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.secondary(
                  label: 'With Icon',
                  leftIcon: const Icon(Icons.share, size: 18),
                  onPressed: () {},
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.secondary(
                  label: 'Disabled Secondary',
                  onPressed: null,
                ),
                SizedBox(height: AppSpacing.space4),
                AppButton.secondary(
                  label: 'Expanded Secondary',
                  isExpanded: true,
                  onPressed: () {},
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Floating Action Buttons
            _buildSection(
              title: 'Floating Action Buttons (FAB)',
              description: 'FABs para acciones flotantes principales',
              children: [
                Row(
                  children: [
                    AppFAB.regular(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                    SizedBox(width: AppSpacing.space4),
                    AppFAB.large(
                      icon: const Icon(Icons.add),
                      onPressed: () {},
                    ),
                    SizedBox(width: AppSpacing.space4),
                    AppFAB.extended(
                      icon: const Icon(Icons.add),
                      label: 'Crear Ruta',
                      onPressed: () {},
                    ),
                  ],
                ),
                SizedBox(height: AppSpacing.space4),
                Text(
                  'Regular FAB / Large FAB / Extended FAB',
                  style: AppTextStyles.caption.copyWith(
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Button Combinations
            _buildSection(
              title: 'Button Combinations',
              description: 'Ejemplos de uso común en la aplicación',
              children: [
                // Example 1: Confirm/Cancel Dialog
                _buildExampleCard(
                  title: 'Dialog Actions',
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      AppButton.text(
                        label: 'Cancelar',
                        onPressed: () {},
                      ),
                      SizedBox(width: AppSpacing.space3),
                      AppButton.primary(
                        label: 'Confirmar',
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.space4),

                // Example 2: Form Actions
                _buildExampleCard(
                  title: 'Form Actions',
                  child: Row(
                    children: [
                      Expanded(
                        child: AppButton.primaryOutlined(
                          label: 'Atrás',
                          leftIcon: const Icon(Icons.arrow_back, size: 18),
                          onPressed: () {},
                        ),
                      ),
                      SizedBox(width: AppSpacing.space3),
                      Expanded(
                        flex: 2,
                        child: AppButton.primary(
                          label: 'Siguiente',
                          rightIcon: const Icon(Icons.arrow_forward, size: 18),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: AppSpacing.space4),

                // Example 3: Stacked buttons
                _buildExampleCard(
                  title: 'Stacked Buttons',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppButton.primary(
                        label: 'Agregar a Top 10',
                        leftIcon: const Icon(Icons.favorite, size: 18),
                        isExpanded: true,
                        onPressed: () {},
                      ),
                      SizedBox(height: AppSpacing.space3),
                      AppButton.primaryOutlined(
                        label: 'Ver en mapa',
                        leftIcon: const Icon(Icons.map, size: 18),
                        isExpanded: true,
                        onPressed: () {},
                      ),
                      SizedBox(height: AppSpacing.space3),
                      AppButton.text(
                        label: 'Compartir',
                        leftIcon: const Icon(Icons.share, size: 18),
                        isExpanded: true,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),

            // Color Info
            _buildColorInfo(),

            SizedBox(height: AppSpacing.space8),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required String description,
    required List<Widget> children,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.h2,
        ),
        SizedBox(height: AppSpacing.space2),
        Text(
          description,
          style: AppTextStyles.bodySmall.copyWith(
          ),
        ),
        SizedBox(height: AppSpacing.space4),
        ...children,
      ],
    );
  }

  Widget _buildExampleCard({
    required String title,
    required Widget child,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppTextStyles.bodySmall.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: AppSpacing.space3),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildColorInfo() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(
                  Icons.palette,
                  size: 20,
                ),
                SizedBox(width: AppSpacing.space2),
                Text(
                  'Colores Sincronizados con Figma',
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Primary: #6BA034 (verde)\nSecondary: #66715B (verde oscuro)\nBasado en: Syncfusion Flutter UI Kit - Material 3 Theme',
              style: AppTextStyles.caption.copyWith(
              ),
            ),
          ],
        ),
      ),
    );
  }
}

