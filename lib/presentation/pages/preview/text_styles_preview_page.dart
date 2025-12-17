import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';

/// Página de preview para visualizar y testear text styles
class TextStylesPreviewPage extends StatelessWidget {
  const TextStylesPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Styles Preview'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Typography System',
              style: AppTextStyles.h1,
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Escalas tipográficas basadas en Material 3 y sincronizadas con Figma UI Kit\n'
              'Fonts: Expletus Sans (Display/Headline/Title) • Exo 2 (Label/Body)',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: AppSpacing.space6),

            // Divider
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Display Styles
            _buildSection(
              title: 'Display Styles',
              description: 'Estilos para títulos hero y principales de gran tamaño',
              children: [
                _buildTextStyleDemo(
                  label: 'Display Large',
                  style: AppTextStyles.displayLarge,
                  sampleText: 'Graffiti Trails',
                  specs: 'Expletus Sans / 57px / Bold / 64px line-height / -0.25 letter-spacing',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Display Medium',
                  style: AppTextStyles.displayMedium,
                  sampleText: 'Arte Urbano',
                  specs: 'Expletus Sans / 45px / Bold / 52px line-height',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Display Small',
                  style: AppTextStyles.displaySmall,
                  sampleText: 'Explora Murales',
                  specs: 'Expletus Sans / 36px / Bold / 44px line-height',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Headline Styles
            _buildSection(
              title: 'Headline Styles',
              description: 'Estilos para encabezados principales',
              children: [
                _buildTextStyleDemo(
                  label: 'Headline Large',
                  style: AppTextStyles.headlineLarge,
                  sampleText: 'Bienvenido a Graffiti Trails',
                  specs: 'Expletus Sans / 32px / SemiBold / 40px line-height',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Headline Medium',
                  style: AppTextStyles.headlineMedium,
                  sampleText: 'Arte Urbano en la Ciudad',
                  specs: 'Expletus Sans / 28px / SemiBold / 36px line-height',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Headline Small',
                  style: AppTextStyles.headlineSmall,
                  sampleText: 'Explora obras increíbles',
                  specs: 'Expletus Sans / 24px / SemiBold / 32px line-height',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Title Styles
            _buildSection(
              title: 'Title Styles',
              description: 'Estilos para títulos secundarios y secciones',
              children: [
                _buildTextStyleDemo(
                  label: 'Title Large',
                  style: AppTextStyles.titleLarge,
                  sampleText: 'Murales destacados',
                  specs: 'Expletus Sans / 22px / Bold / 28px line-height',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Title Medium',
                  style: AppTextStyles.titleMedium,
                  sampleText: 'Obras cercanas a ti',
                  specs: 'Expletus Sans / 16px / Medium / 24px line-height / 0.15 letter-spacing',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Title Small',
                  style: AppTextStyles.titleSmall,
                  sampleText: 'Filtros y categorías',
                  specs: 'Expletus Sans / 14px / Medium / 20px line-height / 0.1 letter-spacing',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Body Styles
            _buildSection(
              title: 'Body Styles',
              description: 'Estilos para contenido de texto principal',
              children: [
                _buildTextStyleDemo(
                  label: 'Body Large',
                  style: AppTextStyles.bodyLarge,
                  sampleText:
                      'Esta obra representa el encuentro entre dos culturas, plasmado en un mural de gran escala en el corazón de la ciudad.',
                  specs: 'Exo 2 / 16px / Regular / 24px line-height / 0.5 letter-spacing',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Body Medium',
                  style: AppTextStyles.bodyMedium,
                  sampleText:
                      'El artista combina técnicas tradicionales con elementos contemporáneos para crear una experiencia visual única que invita a la reflexión.',
                  specs: 'Exo 2 / 14px / Regular / 20px line-height / 0.25 letter-spacing',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Body Small',
                  style: AppTextStyles.bodySmall,
                  sampleText:
                      'Información adicional sobre la obra, su contexto histórico y la técnica empleada por el artista en su creación.',
                  specs: 'Exo 2 / 12px / Regular / 16px line-height',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Label Styles
            _buildSection(
              title: 'Label Styles',
              description: 'Estilos para etiquetas y textos de UI',
              children: [
                _buildTextStyleDemo(
                  label: 'Label Large',
                  style: AppTextStyles.labelLarge,
                  sampleText: 'Nombre del Artista',
                  specs: 'Exo 2 / 14px / SemiBold / 20px line-height / 0.1 letter-spacing',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Label Medium',
                  style: AppTextStyles.labelMedium,
                  sampleText: 'Categoría: Mural',
                  specs: 'Exo 2 / 12px / SemiBold / 16px line-height / 0.5 letter-spacing',
                ),
                SizedBox(height: AppSpacing.space4),
                _buildTextStyleDemo(
                  label: 'Label Small',
                  style: AppTextStyles.labelSmall,
                  sampleText: 'Metadata',
                  specs: 'Exo 2 / 11px / Medium / 16px line-height / 0.5 letter-spacing',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Caption (Alias)
            _buildSection(
              title: 'Caption & Other',
              description: 'Estilos adicionales',
              children: [
                _buildTextStyleDemo(
                  label: 'Caption',
                  style: AppTextStyles.caption,
                  sampleText: 'Información adicional o metadata',
                  specs: 'Exo 2 / 12px / Regular / 16px line-height',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Special: Button Styles
            _buildSection(
              title: 'Button Text',
              description: 'Estilo específico para botones',
              children: [
                _buildTextStyleDemo(
                  label: 'Button',
                  style: AppTextStyles.button,
                  sampleText: 'Crear Ruta',
                  specs: 'Exo 2 / 14px / Medium / 20px line-height / 0.1 letter-spacing',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Practical Examples
            _buildSection(
              title: 'Practical Examples',
              description: 'Ejemplos de uso en contexto',
              children: [
                _buildPracticalExample(),
              ],
            ),

            SizedBox(height: AppSpacing.space8),

            // Usage Info
            _buildUsageInfo(),

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
          style: AppTextStyles.bodySmall,
        ),
        SizedBox(height: AppSpacing.space4),
        ...children,
      ],
    );
  }

  Widget _buildTextStyleDemo({
    required String label,
    required TextStyle style,
    required String sampleText,
    required String specs,
  }) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label
            Text(
              label,
              style: AppTextStyles.label.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: AppSpacing.space1),
            // Specs
            Text(
              specs,
              style: AppTextStyles.caption,
            ),
            SizedBox(height: AppSpacing.space3),
            const Divider(),
            SizedBox(height: AppSpacing.space3),
            // Sample Text
            Text(
              sampleText,
              style: style,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticalExample() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Category
            Text(
              'MURAL',
              style: AppTextStyles.caption.copyWith(
                fontWeight: FontWeight.w600,
                letterSpacing: 1.5,
              ),
            ),
            SizedBox(height: AppSpacing.space2),
            // Title
            Text(
              'El Beso de la Libertad',
              style: AppTextStyles.h2,
            ),
            SizedBox(height: AppSpacing.space3),
            // Body
            Text(
              'Esta obra representa el encuentro entre dos culturas, '
              'plasmado en un mural de gran escala en el corazón de la ciudad. '
              'El artista Diego Mural combina técnicas tradicionales con '
              'elementos contemporáneos para crear una experiencia visual única.',
              style: AppTextStyles.body,
            ),
            SizedBox(height: AppSpacing.space4),
            // Metadata
            Row(
              children: [
                const Icon(Icons.person, size: 16),
                SizedBox(width: AppSpacing.space1),
                Text(
                  'Diego Mural',
                  style: AppTextStyles.label,
                ),
                SizedBox(width: AppSpacing.space4),
                const Icon(Icons.place, size: 16),
                SizedBox(width: AppSpacing.space1),
                Text(
                  'Av. Corrientes 1234',
                  style: AppTextStyles.label,
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Creado en Enero 2024',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildUsageInfo() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(Icons.code, size: 20),
                SizedBox(width: AppSpacing.space2),
                Text(
                  'Uso de Text Styles',
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space3),
            Text(
              '// Usar estilos predefinidos\n'
              'Text(\'Título\', style: AppTextStyles.h1)\n'
              'Text(\'Contenido\', style: AppTextStyles.body)\n'
              'Text(\'Detalle\', style: AppTextStyles.caption)\n\n'
              '// Modificar estilos con copyWith\n'
              'AppTextStyles.body.copyWith(\n'
              '  fontWeight: FontWeight.w600,\n'
              ')',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

