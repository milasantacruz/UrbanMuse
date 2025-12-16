import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/theme.dart';
import '../../../domain/entities/ubicacion.dart';
import '../mapa/mapa.dart';
import '../inputs/inputs.dart';

/// UbicacionSelector
/// 
/// Widget para seleccionar la ubicación de una obra en el mapa.
/// Permite buscar por dirección o seleccionar directamente en el mapa.
/// Valida que la ubicación esté dentro de CABA.
class UbicacionSelector extends StatefulWidget {
  final Ubicacion? initialUbicacion;
  final Function(Ubicacion) onUbicacionSelected;
  final String? errorText;

  const UbicacionSelector({
    super.key,
    this.initialUbicacion,
    required this.onUbicacionSelected,
    this.errorText,
  });

  @override
  State<UbicacionSelector> createState() => _UbicacionSelectorState();
}

class _UbicacionSelectorState extends State<UbicacionSelector> {
  LatLng? _selectedPoint;
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _barrioController = TextEditingController();
  bool _isValid = false;

  @override
  void initState() {
    super.initState();
    if (widget.initialUbicacion != null) {
      _selectedPoint = LatLng(
        widget.initialUbicacion!.lat,
        widget.initialUbicacion!.lng,
      );
      _direccionController.text = widget.initialUbicacion!.direccion ?? '';
      _barrioController.text = widget.initialUbicacion!.barrio ?? '';
      _isValid = widget.initialUbicacion!.estaEnCABA;
    }
  }

  @override
  void dispose() {
    _direccionController.dispose();
    _barrioController.dispose();
    super.dispose();
  }

  void _onMapTap(LatLng point) {
    setState(() {
      _selectedPoint = point;
      _isValid = _validatePoint(point);
    });
    _updateUbicacion();
  }

  bool _validatePoint(LatLng point) {
    return point.latitude >= AppConstants.buenosAiresLatMin &&
        point.latitude <= AppConstants.buenosAiresLatMax &&
        point.longitude >= AppConstants.buenosAiresLngMin &&
        point.longitude <= AppConstants.buenosAiresLngMax;
  }

  void _updateUbicacion() {
    if (_selectedPoint != null && _isValid) {
      final ubicacion = Ubicacion(
        lat: _selectedPoint!.latitude,
        lng: _selectedPoint!.longitude,
        direccion: _direccionController.text.trim().isEmpty
            ? null
            : _direccionController.text.trim(),
        barrio: _barrioController.text.trim().isEmpty
            ? null
            : _barrioController.text.trim(),
      );
      widget.onUbicacionSelected(ubicacion);
    }
  }

  void _useCurrentLocation() {
    // TODO: Implementar geolocalización
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Funcionalidad de ubicación actual en desarrollo'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Mapa
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: AppBorderRadius.medium,
            border: Border.all(
              color: colorScheme.outline,
            ),
          ),
          clipBehavior: Clip.antiAlias,
          child: Stack(
            children: [
              CustomMap(
                obras: const [],
                initialCenter: _selectedPoint ??
                    const LatLng(
                      AppConstants.buenosAiresCenterLat,
                      AppConstants.buenosAiresCenterLng,
                    ),
                initialZoom: _selectedPoint != null ? 16.0 : 13.0,
                onMapTap: _onMapTap,
                showUserLocation: false,
              ),
              
              // Marcador de selección
              if (_selectedPoint != null)
                Positioned.fill(
                  child: IgnorePointer(
                    child: Center(
                      child: Icon(
                        Icons.location_on,
                        size: 48,
                        color: _isValid ? colorScheme.primary : colorScheme.error,
                      ),
                    ),
                  ),
                ),
              
              // Botón de ubicación actual
              Positioned(
                top: AppSpacing.space2,
                right: AppSpacing.space2,
                child: FloatingActionButton.small(
                  onPressed: _useCurrentLocation,
                  child: const Icon(Icons.my_location),
                ),
              ),
            ],
          ),
        ),
        
        SizedBox(height: AppSpacing.space4),
        
        // Mensaje de validación
        if (_selectedPoint != null && !_isValid)
          Container(
            padding: EdgeInsets.all(AppSpacing.space3),
            decoration: BoxDecoration(
              color: colorScheme.errorContainer,
              borderRadius: AppBorderRadius.medium,
            ),
            child: Row(
              children: [
                Icon(
                  Icons.error_outline,
                  color: colorScheme.onErrorContainer,
                ),
                SizedBox(width: AppSpacing.space2),
                Expanded(
                  child: Text(
                    'La ubicación debe estar dentro de CABA',
                    style: AppTextStyles.bodySmall.copyWith(
                      color: colorScheme.onErrorContainer,
                    ),
                  ),
                ),
              ],
            ),
          ),
        
        if (_selectedPoint != null && _isValid) ...[
          SizedBox(height: AppSpacing.space4),
          
          // Dirección (opcional)
          AppTextField(
            controller: _direccionController,
            label: 'Dirección (opcional)',
            hint: 'Ej: Av. Corrientes 1234',
            onChanged: (_) => _updateUbicacion(),
          ),
          
          SizedBox(height: AppSpacing.space4),
          
          // Barrio (opcional)
          AppTextField(
            controller: _barrioController,
            label: 'Barrio (opcional)',
            hint: 'Ej: Palermo, San Telmo...',
            onChanged: (_) => _updateUbicacion(),
          ),
        ],
        
        // Error text
        if (widget.errorText != null) ...[
          SizedBox(height: AppSpacing.space2),
          Text(
            widget.errorText!,
            style: AppTextStyles.bodySmall.copyWith(
              color: colorScheme.error,
            ),
          ),
        ],
      ],
    );
  }
}

