import 'package:flutter/material.dart';
import '../../../core/theme/theme.dart';
import '../search/app_search_bar.dart';
import '../inputs/inputs.dart';
import '../../../domain/entities/ubicacion.dart';

/// AppMapBar
/// 
/// App Bar especializado para la página del mapa según diseño de Figma.
/// Incluye barra de búsqueda integrada y botones de acción flotantes.
/// Puede mostrar información de puntos A y B cuando se está creando una ruta.
/// 
/// **Características según Figma:**
/// - Barra de búsqueda con fondo blanco/surface en la parte superior
/// - Botones circulares flotantes con sombras: Filter, Location
/// - Muestra punto A y punto B cuando se están seleccionando
/// - Layout horizontal compacto
/// - Fondo transparente para superposición en mapa
/// 
/// **Referencia Figma:**
/// https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/UrbanMuse-Material-ui-kit?node-id=2044-2028
class AppMapBar extends StatelessWidget {
  final TextEditingController? searchController;
  final ValueChanged<String>? onSearchChanged;
  final VoidCallback? onSearchTap;
  final VoidCallback? onFilterTap;
  final VoidCallback? onLocationTap;
  final VoidCallback? onPreviewTap;
  final String? searchHint;
  
  // Puntos para mostrar cuando se está creando una ruta
  final Ubicacion? puntoA;
  final Ubicacion? puntoB;
  final TextEditingController? puntoAController;
  final TextEditingController? puntoBController;
  final ValueChanged<String>? onPuntoAChanged;
  final ValueChanged<String>? onPuntoBChanged;
  final VoidCallback? onPuntoAClear;
  final VoidCallback? onPuntoBClear;

  const AppMapBar({
    super.key,
    this.searchController,
    this.onSearchChanged,
    this.onSearchTap,
    this.onFilterTap,
    this.onLocationTap,
    this.onPreviewTap,
    this.searchHint,
    this.puntoA,
    this.puntoB,
    this.puntoAController,
    this.puntoBController,
    this.onPuntoAChanged,
    this.onPuntoBChanged,
    this.onPuntoAClear,
    this.onPuntoBClear,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.fromLTRB(
          AppSpacing.space4, // 16px
          AppSpacing.space2, // 8px
          AppSpacing.space4, // 16px
          AppSpacing.space2, // 8px
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Mostrar campos de texto para punto A y B (estilo Google Maps)
            if (puntoAController != null || puntoBController != null)
              // Campos de texto para direcciones (reemplazan la barra de búsqueda)
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // Campo Punto A
                  if (puntoAController != null)
                    _buildAddressField(
                      controller: puntoAController!,
                      label: 'Punto A',
                      hint: 'Ingresa dirección de inicio',
                      pointColor: AppColors.primary,
                      onChanged: onPuntoAChanged,
                      onClear: onPuntoAClear,
                      hasValue: puntoA != null,
                    ),
                  if (puntoAController != null && puntoBController != null)
                    SizedBox(height: AppSpacing.space2),
                  // Campo Punto B
                  if (puntoBController != null)
                    _buildAddressField(
                      controller: puntoBController!,
                      label: 'Punto B',
                      hint: 'Ingresa dirección de destino',
                      pointColor: AppColors.secondary,
                      onChanged: onPuntoBChanged,
                      onClear: onPuntoBClear,
                      hasValue: puntoB != null,
                    ),
                ],
              )
            else
              // Barra de búsqueda con fondo blanco según Figma
              Container(
                decoration: BoxDecoration(
                  color: AppColors.surface,
                  borderRadius: AppBorderRadius.medium,
                  boxShadow: AppShadows.small,
                ),
                child: AppSearchBar(
                  controller: searchController,
                  hint: searchHint ?? 'Buscar obras...',
                  mode: AppSearchBarMode.filled,
                  isCompact: false,
                  onChanged: onSearchChanged,
                  onTap: onSearchTap,
                ),
              ),
            
            SizedBox(height: AppSpacing.space3), // 12px
            
            // Botones de acción en fila horizontal
            Row(
              children: [
                // Botón de filtro usando IconButton de Material
                _buildActionButton(
                  context: context,
                  icon: Icons.filter_list,
                  onPressed: onFilterTap,
                  tooltip: 'Filtrar',
                ),
                
                SizedBox(width: AppSpacing.space2), // 8px
                
                // Botón de ubicación usando IconButton de Material
                _buildActionButton(
                  context: context,
                  icon: Icons.my_location,
                  onPressed: onLocationTap,
                  tooltip: 'Mi ubicación',
                ),
                
                if (onPreviewTap != null) ...[
                  SizedBox(width: AppSpacing.space2), // 8px
                  // Botón de preview de widgets
                  _buildActionButton(
                    context: context,
                    icon: Icons.widgets,
                    onPressed: onPreviewTap,
                    tooltip: 'Preview Widgets',
                  ),
                ],
                
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required Color pointColor,
    ValueChanged<String>? onChanged,
    VoidCallback? onClear,
    required bool hasValue,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppBorderRadius.medium,
        boxShadow: AppShadows.small,
      ),
      child: AppTextField(
        controller: controller,
        hint: hint,
        mode: AppTextFieldMode.filled,
        prefixIcon: Container(
          width: 32,
          height: 32,
          margin: EdgeInsets.only(left: AppSpacing.space2, right: AppSpacing.space2),
          decoration: BoxDecoration(
            color: pointColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              label == 'Punto A' ? 'A' : 'B',
              style: AppTextStyles.labelMedium.copyWith(
                color: label == 'Punto A' ? AppColors.onPrimary : AppColors.onSecondary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        suffixIcon: hasValue && onClear != null
            ? IconButton(
                icon: Icon(
                  Icons.close,
                  size: 20,
                  color: AppColors.onSurfaceVariant,
                ),
                onPressed: onClear,
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(
                  minWidth: 40,
                  minHeight: 40,
                ),
              )
            : null,
        onChanged: onChanged,
        keyboardType: TextInputType.streetAddress,
      ),
    );
  }

  Widget _buildActionButton({
    required BuildContext context,
    required IconData icon,
    VoidCallback? onPressed,
    String? tooltip,
  }) {
    return Material(
      color: AppColors.surface,
      borderRadius: AppBorderRadius.full,
      elevation: 2,
      shadowColor: Colors.black.withOpacity(0.15),
      child: Container(
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
        ),
        child: IconButton(
          icon: Icon(icon),
          iconSize: 24,
          color: AppColors.onSurface,
          onPressed: onPressed,
          tooltip: tooltip,
          padding: EdgeInsets.zero,
          constraints: const BoxConstraints(
            minWidth: 48,
            minHeight: 48,
          ),
        ),
      ),
    );
  }
}
