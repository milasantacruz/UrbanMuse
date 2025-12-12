import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/inputs/inputs.dart';

/// Página de preview para visualizar y testear input fields
class InputsPreviewPage extends StatelessWidget {
  const InputsPreviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Fields Preview'),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppSpacing.space4),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Text(
              'Input Fields',
              style: AppTextStyles.h1,
            ),
            SizedBox(height: AppSpacing.space2),
            Text(
              'Campos de texto basados en Material 3 y sincronizados con Figma UI Kit',
              style: AppTextStyles.bodySmall,
            ),
            SizedBox(height: AppSpacing.space6),

            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Filled Inputs
            _buildSection(
              title: 'Filled Inputs',
              description: 'Inputs con fondo de color (modo filled)',
              children: [
                const AppTextField.filled(
                  label: 'Nombre del lugar',
                  hint: 'Ingresa el nombre',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.filled(
                  label: 'Con icono izquierdo',
                  hint: 'Buscar obra...',
                  prefixIcon: Icon(Icons.search, size: 18),
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.filled(
                  label: 'Con icono derecho',
                  hint: 'Contraseña',
                  obscureText: true,
                  suffixIcon: Icon(Icons.visibility, size: 18),
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.filled(
                  label: 'Con ambos iconos',
                  hint: 'usuario@email.com',
                  prefixIcon: Icon(Icons.person, size: 18),
                  suffixIcon: Icon(Icons.close, size: 18),
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.filled(
                  label: 'Con helper text',
                  hint: 'Ingresa tu nombre',
                  helperText: 'Este campo es opcional',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.filled(
                  label: 'Campo requerido',
                  hint: 'Obligatorio',
                  isRequired: true,
                  helperText: 'Este campo es requerido',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Outlined Inputs
            _buildSection(
              title: 'Outlined Inputs',
              description: 'Inputs con borde (modo outlined)',
              children: [
                const AppTextField.outlined(
                  label: 'Dirección',
                  hint: 'Calle y número',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Con icono',
                  hint: 'Ubicación',
                  prefixIcon: Icon(Icons.location_on, size: 18),
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Email',
                  hint: 'correo@ejemplo.com',
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.email, size: 18),
                  helperText: 'Ingresa un email válido',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Flat Inputs
            _buildSection(
              title: 'Flat Inputs',
              description: 'Inputs sin fondo, solo con borde inferior',
              children: [
                const AppTextField.flat(
                  label: 'Categoría',
                  hint: 'Selecciona una categoría',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.flat(
                  label: 'Descripción',
                  hint: 'Escribe una descripción...',
                  maxLines: 3,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Validation States
            _buildSection(
              title: 'Estados de Validación',
              description: 'Inputs con estados de success y error',
              children: [
                const AppTextField.filled(
                  label: 'Input válido',
                  hint: 'Nombre válido',
                  validation: AppTextFieldValidation.success,
                  helperText: 'Este nombre está disponible',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.filled(
                  label: 'Input con error',
                  hint: 'Email inválido',
                  validation: AppTextFieldValidation.error,
                  errorText: 'El formato del email no es válido',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Outlined con success',
                  hint: 'Username disponible',
                  prefixIcon: Icon(Icons.person, size: 18),
                  validation: AppTextFieldValidation.success,
                  helperText: '¡Username disponible!',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Outlined con error',
                  hint: 'Contraseña débil',
                  prefixIcon: Icon(Icons.lock, size: 18),
                  validation: AppTextFieldValidation.error,
                  errorText: 'La contraseña debe tener al menos 8 caracteres',
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Disabled State
            _buildSection(
              title: 'Estado Deshabilitado',
              description: 'Inputs deshabilitados',
              children: [
                const AppTextField.filled(
                  label: 'Filled disabled',
                  hint: 'No editable',
                  enabled: false,
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Outlined disabled',
                  hint: 'No editable',
                  enabled: false,
                  prefixIcon: Icon(Icons.lock, size: 18),
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.flat(
                  label: 'Flat disabled',
                  hint: 'No editable',
                  enabled: false,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Compact Size
            _buildSection(
              title: 'Tamaño Compacto',
              description: 'Inputs con altura reducida (40px)',
              children: [
                const AppTextField.filled(
                  label: 'Compact Filled',
                  hint: 'Tamaño compacto',
                  isCompact: true,
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Compact Outlined',
                  hint: 'Tamaño compacto',
                  isCompact: true,
                  prefixIcon: Icon(Icons.search, size: 16),
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.flat(
                  label: 'Compact Flat',
                  hint: 'Tamaño compacto',
                  isCompact: true,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Multiline Inputs
            _buildSection(
              title: 'Inputs Multilinea',
              description: 'Text areas para contenido largo',
              children: [
                const AppTextField.filled(
                  label: 'Descripción de la obra',
                  hint: 'Escribe una descripción detallada...',
                  maxLines: 4,
                  helperText: 'Máximo 500 caracteres',
                ),
                SizedBox(height: AppSpacing.space4),
                const AppTextField.outlined(
                  label: 'Comentario',
                  hint: 'Deja tu comentario...',
                  maxLines: 3,
                ),
              ],
            ),

            SizedBox(height: AppSpacing.space8),
            const Divider(),
            SizedBox(height: AppSpacing.space6),

            // Practical Example
            _buildSection(
              title: 'Ejemplo Práctico',
              description: 'Formulario de creación de obra',
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

  Widget _buildPracticalExample() {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nueva Obra de Arte Urbano',
              style: AppTextStyles.h3,
            ),
            SizedBox(height: AppSpacing.space4),
            const AppTextField.filled(
              label: 'Título de la obra',
              hint: 'Ej: El Beso de la Libertad',
              isRequired: true,
              prefixIcon: Icon(Icons.brush, size: 18),
            ),
            SizedBox(height: AppSpacing.space4),
            const AppTextField.filled(
              label: 'Artista',
              hint: 'Nombre del artista',
              isRequired: true,
              prefixIcon: Icon(Icons.person, size: 18),
            ),
            SizedBox(height: AppSpacing.space4),
            const AppTextField.outlined(
              label: 'Ubicación',
              hint: 'Dirección exacta',
              isRequired: true,
              prefixIcon: Icon(Icons.location_on, size: 18),
              helperText: 'Incluye calle y número',
            ),
            SizedBox(height: AppSpacing.space4),
            const AppTextField.filled(
              label: 'Descripción',
              hint: 'Describe la obra...',
              maxLines: 3,
              helperText: 'Cuéntanos sobre esta obra',
            ),
            SizedBox(height: AppSpacing.space4),
            const AppTextField.outlined(
              label: 'Instagram del artista (opcional)',
              hint: '@username',
              prefixIcon: Icon(Icons.alternate_email, size: 18),
              validation: AppTextFieldValidation.success,
              helperText: 'Perfil encontrado',
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
                  'Uso de Input Fields',
                  style: AppTextStyles.label.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: AppSpacing.space3),
            Text(
              '// Filled input\n'
              'AppTextField.filled(\n'
              '  label: \'Nombre\',\n'
              '  hint: \'Ingresa tu nombre\',\n'
              ')\n\n'
              '// Outlined input\n'
              'AppTextField.outlined(\n'
              '  label: \'Email\',\n'
              '  hint: \'correo@ejemplo.com\',\n'
              '  prefixIcon: Icon(Icons.email),\n'
              ')\n\n'
              '// Con validación\n'
              'AppTextField.filled(\n'
              '  label: \'Username\',\n'
              '  validation: AppTextFieldValidation.success,\n'
              '  helperText: \'Username disponible\',\n'
              ')',
              style: AppTextStyles.caption,
            ),
          ],
        ),
      ),
    );
  }
}

