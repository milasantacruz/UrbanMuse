import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../../widgets/loading/loading.dart';
import '../../widgets/buttons/buttons.dart';

/// LoadingPreviewPage
/// 
/// Página de showcase para los componentes AppLoader
/// Muestra todas las variantes: circular, lineal, overlay, con mensaje
class LoadingPreviewPage extends StatefulWidget {
  const LoadingPreviewPage({super.key});

  @override
  State<LoadingPreviewPage> createState() => _LoadingPreviewPageState();
}

class _LoadingPreviewPageState extends State<LoadingPreviewPage> {
  bool _isLoading = false;
  double _progress = 0.3;
  bool _showOverlay = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Loading Indicators Preview'),
      ),
      body: Stack(
        children: [
          ListView(
            padding: EdgeInsets.all(AppSpacing.space4),
            children: [
              // Header
              Text(
                'Loading Indicators',
                style: AppTextStyles.displaySmall,
              ),
              SizedBox(height: AppSpacing.space2),
              Text(
                'Indicadores de carga circulares y lineales siguiendo Material 3',
                style: AppTextStyles.bodyLarge,
              ),
              SizedBox(height: AppSpacing.space8),

              // Circular Loaders - Sizes
              _buildSection(
                title: 'Tamaños de Loader Circular',
                description: 'Loaders en diferentes tamaños predefinidos',
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLoaderExample(
                        title: 'Small',
                        subtitle: '24px',
                        loader: const AppLoader.small(),
                      ),
                      _buildLoaderExample(
                        title: 'Medium',
                        subtitle: '40px',
                        loader: const AppLoader.medium(),
                      ),
                      _buildLoaderExample(
                        title: 'Large',
                        subtitle: '56px',
                        loader: const AppLoader.large(),
                      ),
                      _buildLoaderExample(
                        title: 'XLarge',
                        subtitle: '72px',
                        loader: const AppLoader.xLarge(),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Circular Loaders - Colors
              _buildSection(
                title: 'Colores de Loader',
                description: 'Loaders con diferentes colores del tema',
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLoaderExample(
                        title: 'Primary',
                        subtitle: 'Verde',
                        loader: AppLoader.primary(
                          loaderSize: LoaderSize.large,
                        ),
                      ),
                      _buildLoaderExample(
                        title: 'Secondary',
                        subtitle: 'Verde oscuro',
                        loader: AppLoader(
                          loaderSize: LoaderSize.large,
                          color: AppColors.secondary,
                        ),
                      ),
                      _buildLoaderExample(
                        title: 'Accent',
                        subtitle: 'Terciario',
                        loader: AppLoader(
                          loaderSize: LoaderSize.large,
                          color: AppColors.tertiary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Circular Loaders - Stroke Width
              _buildSection(
                title: 'Grosor del Anillo',
                description: 'Loaders con diferentes grosores (2px, 4px, 6px, 8px)',
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLoaderExample(
                        title: '2px',
                        subtitle: 'Thin',
                        loader: const AppLoader(
                          loaderSize: LoaderSize.large,
                          strokeWidth: 2.0,
                        ),
                      ),
                      _buildLoaderExample(
                        title: '4px',
                        subtitle: 'Default',
                        loader: const AppLoader(
                          loaderSize: LoaderSize.large,
                          strokeWidth: 4.0,
                        ),
                      ),
                      _buildLoaderExample(
                        title: '6px',
                        subtitle: 'Thick',
                        loader: const AppLoader(
                          loaderSize: LoaderSize.large,
                          strokeWidth: 6.0,
                        ),
                      ),
                      _buildLoaderExample(
                        title: '8px',
                        subtitle: 'Extra Thick',
                        loader: const AppLoader(
                          loaderSize: LoaderSize.large,
                          strokeWidth: 8.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Determinate Loaders
              _buildSection(
                title: 'Loader con Progreso',
                description: 'Loaders mostrando progreso específico (0.0 - 1.0)',
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildLoaderExample(
                        title: '25%',
                        subtitle: 'value: 0.25',
                        loader: const AppLoader.large(
                          value: 0.25,
                        ),
                      ),
                      _buildLoaderExample(
                        title: '50%',
                        subtitle: 'value: 0.50',
                        loader: const AppLoader.large(
                          value: 0.50,
                        ),
                      ),
                      _buildLoaderExample(
                        title: '75%',
                        subtitle: 'value: 0.75',
                        loader: const AppLoader.large(
                          value: 0.75,
                        ),
                      ),
                      _buildLoaderExample(
                        title: '100%',
                        subtitle: 'value: 1.0',
                        loader: const AppLoader.large(
                          value: 1.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space4),
                  Slider(
                    value: _progress,
                    onChanged: (value) => setState(() => _progress = value),
                    min: 0,
                    max: 1,
                  ),
                  Center(
                    child: AppLoader.large(
                      value: _progress,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Linear Loaders
              _buildSection(
                title: 'Loader Lineal',
                description: 'Barras de progreso horizontales',
                children: [
                  Text('Indeterminate', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  const AppLinearLoader.indeterminate(),
                  SizedBox(height: AppSpacing.space6),
                  Text('Determinate - 30%', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  const AppLinearLoader.determinate(progress: 0.3),
                  SizedBox(height: AppSpacing.space6),
                  Text('Determinate - 70%', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  const AppLinearLoader.determinate(progress: 0.7),
                  SizedBox(height: AppSpacing.space6),
                  Text('Custom Color - Accent', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  AppLinearLoader(
                    value: _progress,
                    color: AppColors.tertiary,
                  ),
                  SizedBox(height: AppSpacing.space6),
                  Text('Custom Height - 8px', style: AppTextStyles.label),
                  SizedBox(height: AppSpacing.space2),
                  AppLinearLoader(
                    value: _progress,
                    height: 8.0,
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Button Loader
              _buildSection(
                title: 'Loader en Botón',
                description: 'Loader pequeño para usar dentro de botones',
                children: [
                  AppButton.primary(
                    label: _isLoading ? '' : 'Cargar Datos',
                    onPressed: _isLoading
                        ? null
                        : () {
                            setState(() => _isLoading = true);
                            Future.delayed(const Duration(seconds: 2), () {
                              if (mounted) {
                                setState(() => _isLoading = false);
                              }
                            });
                          },
                    leftIcon: _isLoading
                        ? const AppLoaderButton()
                        : const Icon(Icons.cloud_download),
                    isExpanded: true,
                  ),
                  SizedBox(height: AppSpacing.space3),
                  AppButton.secondary(
                    label: 'Guardando...',
                    onPressed: null,
                    leftIcon: const AppLoaderButton(color: Colors.white70),
                    isExpanded: true,
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Overlay Loader
              _buildSection(
                title: 'Loader con Overlay',
                description: 'Loader de pantalla completa con mensaje',
                children: [
                  AppButton.primary(
                    label: 'Mostrar Overlay',
                    onPressed: () {
                      setState(() => _showOverlay = true);
                      Future.delayed(const Duration(seconds: 3), () {
                        if (mounted) {
                          setState(() => _showOverlay = false);
                        }
                      });
                    },
                    leftIcon: const Icon(Icons.fullscreen),
                    isExpanded: true,
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Practical Examples
              _buildSection(
                title: 'Ejemplos Prácticos',
                description: 'Uso de loaders en contextos reales',
                children: [
                  // Card con loader
                  Text('Card con Loader', style: AppTextStyles.h3),
                  SizedBox(height: AppSpacing.space4),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.space4),
                      child: Column(
                        children: [
                          Text(
                            'Cargando Obras',
                            style: AppTextStyles.h2,
                          ),
                          SizedBox(height: AppSpacing.space4),
                          const AppLoader.large(),
                          SizedBox(height: AppSpacing.space4),
                          Text(
                            'Por favor espera...',
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: AppSpacing.space6),

                  // List item con loader
                  Text('List Item con Loader', style: AppTextStyles.h3),
                  SizedBox(height: AppSpacing.space4),
                  Card(
                    child: ListTile(
                      leading: const AppLoader.small(),
                      title: Text('Sincronizando...', style: AppTextStyles.body),
                      subtitle: Text('Actualizando obras', style: AppTextStyles.caption),
                      trailing: const Icon(Icons.sync),
                    ),
                  ),

                  SizedBox(height: AppSpacing.space6),

                  // Progress card
                  Text('Progress Card', style: AppTextStyles.h3),
                  SizedBox(height: AppSpacing.space4),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.space4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Descargando Mapa', style: AppTextStyles.h3),
                          SizedBox(height: AppSpacing.space2),
                          Text('70% completado', style: AppTextStyles.caption),
                          SizedBox(height: AppSpacing.space3),
                          const AppLinearLoader.determinate(progress: 0.7),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
              const Divider(),
              SizedBox(height: AppSpacing.space8),

              // Code Examples
              _buildSection(
                title: 'Ejemplos de Código',
                description: 'Cómo usar los loaders en tu código',
                children: [
                  Container(
                    padding: EdgeInsets.all(AppSpacing.space4),
                    decoration: BoxDecoration(
                      color: AppColors.surface,
                      borderRadius: AppBorderRadius.medium,
                    ),
                    child: Text(
                      '// Circular indeterminado\n'
                      'AppLoader.medium()\n\n'
                      '// Circular con progreso\n'
                      'AppLoader.large(\n'
                      '  value: 0.5,  // 50%\n'
                      ')\n\n'
                      '// Custom color y tamaño\n'
                      'AppLoader(\n'
                      '  loaderSize: LoaderSize.large,\n'
                      '  color: AppColors.tertiary,\n'
                      '  strokeWidth: 6.0,\n'
                      ')\n\n'
                      '// Linear indeterminado\n'
                      'AppLinearLoader.indeterminate()\n\n'
                      '// Linear con progreso\n'
                      'AppLinearLoader.determinate(\n'
                      '  progress: 0.7,\n'
                      ')\n\n'
                      '// Loader en botón\n'
                      'AppButton.primary(\n'
                      '  label: \'Loading...\',\n'
                      '  icon: AppLoaderButton(),\n'
                      '  onPressed: null,\n'
                      ')\n\n'
                      '// Overlay con mensaje\n'
                      'AppLoaderOverlay(\n'
                      '  message: \'Cargando datos...\',\n'
                      ')',
                      style: AppTextStyles.caption,
                    ),
                  ),
                ],
              ),

              SizedBox(height: AppSpacing.space8),
            ],
          ),

          // Overlay Loader
          if (_showOverlay)
            const AppLoaderOverlay(
              message: 'Cargando datos...\nPor favor espera',
            ),
        ],
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
        Text(title, style: AppTextStyles.h2),
        SizedBox(height: AppSpacing.space2),
        Text(description, style: AppTextStyles.bodySmall),
        SizedBox(height: AppSpacing.space4),
        ...children,
      ],
    );
  }

  Widget _buildLoaderExample({
    required String title,
    required String subtitle,
    required Widget loader,
  }) {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.borderColor.withOpacity(0.3)),
            borderRadius: AppBorderRadius.medium,
          ),
          child: Center(child: loader),
        ),
        SizedBox(height: AppSpacing.space2),
        Text(title, style: AppTextStyles.label),
        Text(subtitle, style: AppTextStyles.caption),
      ],
    );
  }
}

