import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:intl/intl.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../core/constants/app_constants.dart';
import '../../../domain/entities/ruta.dart';
import '../../../domain/entities/ubicacion.dart';
import '../../../domain/entities/obra.dart';
import '../../bloc/ruta/ruta_bloc.dart';
import '../../bloc/ruta/ruta_event.dart' as ruta_event;
import '../../bloc/ruta/ruta_state.dart';
import '../../bloc/obra/obra_bloc.dart';
import '../../bloc/obra/obra_event.dart';
import '../../bloc/obra/obra_state.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/step_indicators/app_route_step_indicator.dart';
import '../../widgets/mapa/custom_map.dart';
import '../../widgets/cards/app_obra_card.dart';
import '../../widgets/buttons/app_button.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/modals/app_filter_modal.dart';
import '../../widgets/encuentro/rrule_selector.dart';
import '../../../core/theme/theme.dart';

/// Página de creación de ruta (multi-step)
class CreateRutaPage extends StatefulWidget {
  final Ubicacion? puntoA;
  final Ubicacion? puntoB;
  
  const CreateRutaPage({
    super.key,
    this.puntoA,
    this.puntoB,
  });

  @override
  State<CreateRutaPage> createState() => _CreateRutaPageState();
}

class _CreateRutaPageState extends State<CreateRutaPage> {
  int _currentStep = 1; // 1-7
  
  // Paso 1-2: Puntos A y B
  late Ubicacion? _puntoA;
  late Ubicacion? _puntoB;
  
  // Paso 3-4: Obras
  List<Obra> _obrasEnCamino = [];
  List<String> _obrasSeleccionadas = [];
  List<String>? _filteredCategories;
  List<String>? _filteredArtistas;
  
  // Paso 5: Transporte y Tipo de Ruta
  ModoTransporte _modoTransporte = ModoTransporte.bici;
  TipoRuta _tipoRuta = TipoRuta.privada;
  
  // Paso 6: Participantes
  List<String> _participantesIds = [];
  
  // Paso 7: Configuración final
  String _nombreRuta = '';
  String? _rrule;
  DateTime? _fechaInicial;
  TimeOfDay? _hora;
  
  final TextEditingController _nombreController = TextEditingController();
  bool _obrasCargadas = false; // Flag para evitar cargar múltiples veces

  @override
  void initState() {
    super.initState();
    // Inicializar puntos A y B desde los parámetros si están disponibles
    _puntoA = widget.puntoA;
    _puntoB = widget.puntoB;
    
    // Si ya tenemos ambos puntos, avanzar al paso 3
    if (_puntoA != null && _puntoB != null) {
      _currentStep = 3;
    } else if (_puntoA != null) {
      _currentStep = 2;
    }
  }
  

  @override
  void dispose() {
    _nombreController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_canProceedToNextStep()) {
      if (_currentStep < 7) {
        setState(() {
          _currentStep++;
          // Resetear flag cuando se avanza al paso 3 manualmente
          if (_currentStep == 3) {
            _obrasCargadas = false;
          }
        });
        if (_currentStep == 3) {
          _calculateObrasEnCamino();
        }
      } else {
        _createRuta();
      }
    }
  }


  bool _canProceedToNextStep() {
    switch (_currentStep) {
      case 1:
        return _puntoA != null;
      case 2:
        return _puntoB != null;
      case 3:
        return true; // Solo muestra obras
      case 4:
        return _obrasSeleccionadas.isNotEmpty;
      case 5:
        return true; // Transporte y tipo de ruta siempre tienen valor
      case 6:
        return true; // Participantes es opcional
      case 7:
        return _nombreRuta.trim().isNotEmpty &&
            (_tipoRuta != TipoRuta.publicaDinamica ||
                (_rrule != null && _fechaInicial != null && _hora != null));
      default:
        return false;
    }
  }

  void _calculateObrasEnCamino() {
    if (_puntoA == null || _puntoB == null) {
      return;
    }
    
    // Verificar que el BlocProvider esté disponible antes de usarlo
    if (!mounted) return;
    
    try {
      // Cargar todas las obras primero
      // El filtro se aplicará automáticamente cuando se reciban las obras
      context.read<ObraBloc>().add(LoadObras());
    } catch (e) {
      // Si el BlocProvider no está disponible, esperar un frame más
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          try {
            context.read<ObraBloc>().add(LoadObras());
          } catch (e2) {
            debugPrint('Error al cargar obras: $e2');
          }
        }
      });
    }
  }
  
  /// Calcula la distancia en kilómetros entre dos puntos usando la fórmula de Haversine
  double _calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    const double earthRadius = 6371; // Radio de la Tierra en km
    
    final double dLat = _toRadians(lat2 - lat1);
    final double dLng = _toRadians(lng2 - lng1);
    
    final double a = math.sin(dLat / 2) * math.sin(dLat / 2) +
        math.cos(_toRadians(lat1)) * math.cos(_toRadians(lat2)) *
        math.sin(dLng / 2) * math.sin(dLng / 2);
    
    final double c = 2 * math.atan2(math.sqrt(a), math.sqrt(1 - a));
    
    return earthRadius * c;
  }
  
  double _toRadians(double degrees) {
    return degrees * (3.141592653589793 / 180);
  }
  
  /// Calcula la distancia perpendicular desde un punto a una línea (A-B)
  /// Retorna la distancia en kilómetros
  double _distanceToLineSegment(
    double pointLat,
    double pointLng,
    double lineStartLat,
    double lineStartLng,
    double lineEndLat,
    double lineEndLng,
  ) {
    // Convertir a radianes
    final lat1 = _toRadians(lineStartLat);
    final lng1 = _toRadians(lineStartLng);
    final lat2 = _toRadians(lineEndLat);
    final lng2 = _toRadians(lineEndLng);
    final latP = _toRadians(pointLat);
    final lngP = _toRadians(pointLng);
    
    // Calcular distancia desde el punto hasta cada extremo del segmento
    final distToStart = _calculateDistance(pointLat, pointLng, lineStartLat, lineStartLng);
    final distToEnd = _calculateDistance(pointLat, pointLng, lineEndLat, lineEndLng);
    
    // Calcular distancia del segmento
    final segmentLength = _calculateDistance(lineStartLat, lineStartLng, lineEndLat, lineEndLng);
    
    // Si el segmento es muy corto, usar la distancia al punto más cercano
    if (segmentLength < 0.001) {
      return distToStart < distToEnd ? distToStart : distToEnd;
    }
    
    // Calcular producto escalar para determinar si el punto está dentro del segmento
    final dx = lng2 - lng1;
    final dy = lat2 - lat1;
    final dpx = lngP - lng1;
    final dpy = latP - lat1;
    
    final dot = dx * dpx + dy * dpy;
    final lenSq = dx * dx + dy * dy;
    
    if (lenSq == 0) {
      return distToStart;
    }
    
    final param = dot / lenSq;
    
    double closestLat, closestLng;
    if (param < 0) {
      closestLat = lineStartLat;
      closestLng = lineStartLng;
    } else if (param > 1) {
      closestLat = lineEndLat;
      closestLng = lineEndLng;
    } else {
      closestLat = lineStartLat + param * (lineEndLat - lineStartLat);
      closestLng = lineStartLng + param * (lineEndLng - lineStartLng);
    }
    
    return _calculateDistance(pointLat, pointLng, closestLat, closestLng);
  }
  
  /// Filtra obras que están cerca del camino entre punto A y punto B
  List<Obra> _filterObrasEnCamino(List<Obra> todasLasObras) {
    if (_puntoA == null || _puntoB == null) {
      // Si no hay puntos, mostrar todas las obras
      return todasLasObras;
    }
    
    // Radio máximo de 2 km para encontrar más obras (más generoso)
    const double radioMaximoKm = 2.0;
    
    final obrasFiltradas = todasLasObras.where((obra) {
      final distancia = _distanceToLineSegment(
        obra.ubicacion.lat,
        obra.ubicacion.lng,
        _puntoA!.lat,
        _puntoA!.lng,
        _puntoB!.lat,
        _puntoB!.lng,
      );
      
      return distancia <= radioMaximoKm;
    }).toList();
    
    // Si no hay obras en el radio, mostrar todas las obras como fallback
    // para que el usuario pueda seleccionar igualmente
    if (obrasFiltradas.isEmpty) {
      return todasLasObras;
    }
    
    return obrasFiltradas;
  }

  void _createRuta() {
    if (!_canProceedToNextStep()) return;

    final ruta = Ruta(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nombre: _nombreRuta.trim(),
      puntoA: _puntoA!,
      puntoB: _puntoB!,
      obraIds: _obrasSeleccionadas,
      ordenVisita: List.generate(_obrasSeleccionadas.length, (i) => i),
      distancia: 0.0, // Se calculará
      tiempoEstimado: 0.0, // Se calculará
      modoTransporte: _modoTransporte,
      tipo: _tipoRuta,
      creadorId: 'current_user_id', // TODO: Obtener del usuario actual
      fechaCreacion: DateTime.now(),
      rrule: _rrule,
      fechaInicial: _fechaInicial,
      hora: _hora,
      asistentesIds: _participantesIds,
    );

    context.read<RutaBloc>().add(ruta_event.CreateRuta(ruta));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<RutaBloc>()),
        BlocProvider(create: (_) => di.getIt<ObraBloc>()),
      ],
      child: Builder(
        builder: (blocContext) {
          // Cargar obras cuando el BlocProvider esté disponible y estemos en paso 3
          if (_currentStep == 3 && 
              _puntoA != null && 
              _puntoB != null && 
              !_obrasCargadas) {
            _obrasCargadas = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                try {
                  blocContext.read<ObraBloc>().add(LoadObras());
                } catch (e) {
                  debugPrint('Error al cargar obras en Builder: $e');
                }
              }
            });
          }
          
          return BlocListener<RutaBloc, RutaState>(
            listener: (context, state) {
              if (state is RutaCreated) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Ruta creada exitosamente')),
                );
                context.pop();
              }
              if (state is RutaError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: Scaffold(
          appBar: AppTopBar.create(
            title: 'Crear Ruta (Paso $_currentStep/7)',
            onClose: () => context.pop(),
            actions: [
              Builder(
                builder: (context) {
                  debugPrint('AppBar: _currentStep = $_currentStep, canProceed = ${_canProceedToNextStep()}');
                  if (_currentStep < 7) {
                    return TextButton(
                      onPressed: _canProceedToNextStep() ? _nextStep : null,
                      child: const Text('Siguiente'),
                    );
                  } else {
                    return TextButton(
                      onPressed: _canProceedToNextStep() ? _createRuta : null,
                      child: const Text('Crear'),
                    );
                  }
                },
              ),
            ],
          ),
          body: Column(
            children: [
              // Step Indicator
              AppRouteStepIndicator.createRuta(
                currentStep: _currentStep,
              ),

              // Contenido del paso actual
              Expanded(
                child: Builder(
                  builder: (context) {
                    // Cargar obras cuando el BlocProvider esté disponible y estemos en paso 3
                    if (_currentStep == 3 && 
                        _puntoA != null && 
                        _puntoB != null && 
                        !_obrasCargadas) {
                      _obrasCargadas = true;
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (mounted) {
                          try {
                            context.read<ObraBloc>().add(LoadObras());
                          } catch (e) {
                            debugPrint('Error al cargar obras en Builder: $e');
                          }
                        }
                      });
                    }
                    
                    return BlocBuilder<RutaBloc, RutaState>(
                      builder: (context, rutaState) {
                        if (rutaState is RutaLoading) {
                          return const LoadingIndicator();
                        }

                        return _buildStepContent();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildStepContent() {
    // Debug: Verificar que los pasos se están ejecutando
    debugPrint('=== Building step content for step: $_currentStep ===');
    
    // Widget de debug visible
    Widget debugWidget = Container(
      padding: EdgeInsets.all(8),
      color: Colors.red.withOpacity(0.3),
      child: Text(
        'DEBUG: Paso $_currentStep de 7',
        style: TextStyle(
          color: Colors.red,
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    );
    
    Widget? stepWidget;
    switch (_currentStep) {
      case 1:
        stepWidget = _buildStep1();
        break;
      case 2:
        stepWidget = _buildStep2();
        break;
      case 3:
        stepWidget = _buildStep3();
        break;
      case 4:
        debugPrint('Building step 4: Seleccionar obras');
        stepWidget = _buildStep4();
        break;
      case 5:
        debugPrint('Building step 5: Transporte y Tipo de Ruta');
        stepWidget = _buildStep5();
        break;
      case 6:
        debugPrint('Building step 6: Participantes');
        stepWidget = _buildStep6();
        break;
      case 7:
        debugPrint('Building step 7: Configuración final');
        stepWidget = _buildStep7();
        break;
      default:
        debugPrint('Unknown step: $_currentStep');
        stepWidget = const SizedBox.shrink();
        break;
    }
    
    // Retornar el widget del paso con el debug widget arriba
    return Column(
      children: [
        debugWidget,
        Expanded(child: stepWidget),
      ],
    );
  }

  // Paso 1: Seleccionar punto A
  Widget _buildStep1() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppSpacing.space4),
          child: Text(
            'Selecciona el punto de inicio',
            style: AppTextStyles.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: CustomMap(
            obras: const [],
            initialCenter: _puntoA != null
                ? LatLng(_puntoA!.lat, _puntoA!.lng)
                : const LatLng(
                    AppConstants.buenosAiresCenterLat,
                    AppConstants.buenosAiresCenterLng,
                  ),
            initialZoom: _puntoA != null ? 16.0 : 13.0,
            onMapTap: (point) {
              setState(() {
                _puntoA = Ubicacion(
                  lat: point.latitude,
                  lng: point.longitude,
                );
              });
            },
            showUserLocation: false,
          ),
        ),
        if (_puntoA != null)
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            child: AppButton.primary(
              label: 'Confirmar punto A',
              onPressed: _nextStep,
            ),
          ),
      ],
    );
  }

  // Paso 2: Seleccionar punto B
  Widget _buildStep2() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppSpacing.space4),
          child: Text(
            'Selecciona el punto de destino',
            style: AppTextStyles.titleLarge,
            textAlign: TextAlign.center,
          ),
        ),
        Expanded(
          child: CustomMap(
            obras: const [],
            initialCenter: _puntoB != null
                ? LatLng(_puntoB!.lat, _puntoB!.lng)
                : _puntoA != null
                    ? LatLng(_puntoA!.lat, _puntoA!.lng)
                    : const LatLng(
                        AppConstants.buenosAiresCenterLat,
                        AppConstants.buenosAiresCenterLng,
                      ),
            initialZoom: _puntoB != null ? 16.0 : 13.0,
            onMapTap: (point) {
              setState(() {
                _puntoB = Ubicacion(
                  lat: point.latitude,
                  lng: point.longitude,
                );
              });
            },
            showUserLocation: false,
          ),
        ),
        if (_puntoB != null)
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            child: AppButton.primary(
              label: 'Confirmar punto B',
              onPressed: _nextStep,
            ),
          ),
      ],
    );
  }

  // Paso 3: Mostrar obras en el camino
  Widget _buildStep3() {
    return BlocBuilder<ObraBloc, ObraState>(
      builder: (context, state) {
        if (state is ObraLoading) {
          return const LoadingIndicator();
        }

        if (state is ObraError) {
          return ErrorDisplay(
            message: state.message,
            onRetry: () => context.read<ObraBloc>().add(LoadObras()),
          );
        }

        if (state is ObraLoaded) {
          // Filtrar obras que están en el camino entre punto A y punto B
          final todasLasObras = state.obras;
          final obrasFiltradas = _filterObrasEnCamino(todasLasObras);
          
          // Actualizar el estado para que el widget se reconstruya
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _obrasEnCamino = obrasFiltradas;
              });
            }
          });
          
          // Debug: verificar que se están cargando obras
          debugPrint('Total obras cargadas: ${todasLasObras.length}');
          debugPrint('Obras en camino después del filtro: ${obrasFiltradas.length}');
          if (_puntoA != null && _puntoB != null) {
            debugPrint('Punto A: ${_puntoA!.lat}, ${_puntoA!.lng}');
            debugPrint('Punto B: ${_puntoB!.lat}, ${_puntoB!.lng}');
          }
        }

        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(AppSpacing.space4),
              child: Column(
                children: [
                  Text(
                    'Obras disponibles en el camino',
                    style: AppTextStyles.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Se encontraron ${_obrasEnCamino.length} obras',
                    style: AppTextStyles.bodyMedium,
                  ),
                ],
              ),
            ),
            Expanded(
              child: _obrasEnCamino.isEmpty
                  ? Center(
                      child: Text(
                        'No se encontraron obras en el camino',
                        style: AppTextStyles.bodyLarge,
                      ),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(AppSpacing.space4),
                      itemCount: _obrasEnCamino.length,
                      itemBuilder: (context, index) {
                        final obra = _obrasEnCamino[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: AppSpacing.space2),
                          child: AppObraCard.list(
                            imageUrl: obra.foto,
                            titulo: obra.titulo,
                            artista: obra.artistaNombre,
                            categoria: obra.categoria,
                            ubicacion: obra.ubicacion.barrio,
                            onTap: () {
                              // TODO: Mostrar detalle o seleccionar
                            },
                          ),
                        );
                      },
                    ),
            ),
          ],
        );
      },
    );
  }

  // Paso 4: Seleccionar obras deseadas
  Widget _buildStep4() {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.all(AppSpacing.space4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Selecciona las obras',
                style: AppTextStyles.titleLarge,
              ),
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: _showFilterModal,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(AppSpacing.space4),
            itemCount: _obrasEnCamino.length,
            itemBuilder: (context, index) {
              final obra = _obrasEnCamino[index];
              final isSelected = _obrasSeleccionadas.contains(obra.id);
              
              return CheckboxListTile(
                title: Text(obra.titulo),
                subtitle: Text(obra.artistaNombre),
                value: isSelected,
                onChanged: (selected) {
                  setState(() {
                    if (selected == true) {
                      _obrasSeleccionadas.add(obra.id);
                    } else {
                      _obrasSeleccionadas.remove(obra.id);
                    }
                  });
                },
                secondary: Image.network(
                  obra.foto,
                  width: 60,
                  height: 60,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported);
                  },
                ),
              );
            },
          ),
        ),
        if (_obrasSeleccionadas.isNotEmpty)
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            child: Text(
              '${_obrasSeleccionadas.length} obras seleccionadas',
              style: AppTextStyles.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ),
      ],
    );
  }

  // Paso 5: Seleccionar transporte y tipo de ruta
  Widget _buildStep5() {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Widget de prueba para verificar que se renderiza
            Container(
              padding: EdgeInsets.all(AppSpacing.space4),
              color: Colors.blue.withOpacity(0.2),
              child: Text(
                'PASO 5: TRANSPORTE Y TIPO DE RUTA',
                style: AppTextStyles.titleLarge.copyWith(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: AppSpacing.space4),
            Text(
              'Modo de transporte',
              style: AppTextStyles.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.space5),
            RadioListTile<ModoTransporte>(
              title: const Text('Bicicleta'),
              subtitle: const Text('Recomendado para rutas más largas'),
              value: ModoTransporte.bici,
              groupValue: _modoTransporte,
              onChanged: (value) {
                setState(() => _modoTransporte = value!);
              },
              secondary: const Icon(Icons.directions_bike, size: 48),
            ),
            RadioListTile<ModoTransporte>(
              title: const Text('A pie'),
              subtitle: const Text('Ideal para rutas cortas'),
              value: ModoTransporte.aPie,
              groupValue: _modoTransporte,
              onChanged: (value) {
                setState(() => _modoTransporte = value!);
              },
              secondary: const Icon(Icons.directions_walk, size: 48),
            ),
            SizedBox(height: AppSpacing.space5),
            Divider(height: AppSpacing.space5),
            SizedBox(height: AppSpacing.space5),
            Text(
              'Tipo de ruta',
              style: AppTextStyles.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: AppSpacing.space5),
            RadioListTile<TipoRuta>(
              title: const Text('Privada'),
              subtitle: const Text('Solo visible para ti'),
              value: TipoRuta.privada,
              groupValue: _tipoRuta,
              onChanged: (value) {
                setState(() {
                  _tipoRuta = value!;
                  if (_tipoRuta != TipoRuta.publicaDinamica) {
                    _rrule = null;
                    _fechaInicial = null;
                    _hora = null;
                  }
                });
              },
            ),
            RadioListTile<TipoRuta>(
              title: const Text('Pública Estática'),
              subtitle: const Text('Visible para todos, sin fecha/hora'),
              value: TipoRuta.publicaEstatica,
              groupValue: _tipoRuta,
              onChanged: (value) {
                setState(() {
                  _tipoRuta = value!;
                  if (_tipoRuta != TipoRuta.publicaDinamica) {
                    _rrule = null;
                    _fechaInicial = null;
                    _hora = null;
                  }
                });
              },
            ),
            RadioListTile<TipoRuta>(
              title: const Text('Pública Dinámica'),
              subtitle: const Text('Evento repetitivo con fecha/hora'),
              value: TipoRuta.publicaDinamica,
              groupValue: _tipoRuta,
              onChanged: (value) {
                setState(() => _tipoRuta = value!);
              },
            ),
          ],
        ),
      ),
    );
  }

  // Paso 6: Invitar participantes
  Widget _buildStep6() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Widget de prueba para verificar que se renderiza
        Container(
          padding: EdgeInsets.all(AppSpacing.space4),
          color: Colors.green.withOpacity(0.2),
          child: Text(
            'PASO 6: PARTICIPANTES',
            style: AppTextStyles.titleLarge.copyWith(
              color: Colors.green,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(AppSpacing.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Invitar participantes',
                style: AppTextStyles.titleLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.space2),
              Text(
                'Agrega usuarios para invitar a esta ruta',
                style: AppTextStyles.bodyMedium,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: AppSpacing.space5),
              // Botón para agregar participantes
              AppButton.secondary(
                label: 'Agregar participante',
                leftIcon: const Icon(Icons.person_add, size: 20),
                onPressed: () {
                  // TODO: Mostrar modal o navegar a pantalla de búsqueda de usuarios
                  _showAddParticipantDialog();
                },
              ),
              SizedBox(height: AppSpacing.space4),
            ],
          ),
        ),
        // Lista de participantes agregados
        if (_participantesIds.isEmpty)
          Expanded(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.people_outline,
                    size: 64,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                  SizedBox(height: AppSpacing.space4),
                  Text(
                    'No hay participantes agregados',
                    style: AppTextStyles.bodyLarge.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'Los participantes pueden unirse después si la ruta es pública',
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          )
        else
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: AppSpacing.space4),
              itemCount: _participantesIds.length,
              itemBuilder: (context, index) {
                final participanteId = _participantesIds[index];
                return ListTile(
                  leading: CircleAvatar(
                    child: Text(
                      participanteId.substring(0, 1).toUpperCase(),
                    ),
                  ),
                  title: Text('Usuario ${participanteId.substring(0, 8)}'),
                  subtitle: Text('ID: $participanteId'),
                  trailing: IconButton(
                    icon: const Icon(Icons.remove_circle_outline),
                    onPressed: () {
                      setState(() {
                        _participantesIds.removeAt(index);
                      });
                    },
                  ),
                );
              },
            ),
          ),
      ],
    );
  }

  void _showAddParticipantDialog() {
    final TextEditingController userIdController = TextEditingController();
    
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Agregar participante'),
        content: TextField(
          controller: userIdController,
          decoration: const InputDecoration(
            labelText: 'ID de usuario',
            hintText: 'Ingresa el ID del usuario',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              final userId = userIdController.text.trim();
              if (userId.isNotEmpty && !_participantesIds.contains(userId)) {
                setState(() {
                  _participantesIds.add(userId);
                });
                Navigator.of(context).pop();
              }
            },
            child: const Text('Agregar'),
          ),
        ],
      ),
    );
  }

  // Paso 7: Configuración final
  Widget _buildStep7() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Nombre de la ruta
          Text(
            'Nombre de la ruta',
            style: AppTextStyles.labelLarge,
          ),
          SizedBox(height: AppSpacing.space2),
          TextField(
            controller: _nombreController,
            decoration: InputDecoration(
              hintText: 'Ej: Ruta de Palermo a San Telmo',
              border: OutlineInputBorder(
                borderRadius: AppBorderRadius.medium,
              ),
            ),
            onChanged: (value) {
              setState(() => _nombreRuta = value);
            },
          ),
          SizedBox(height: AppSpacing.space5),

          // Configuración de ruta dinámica
          if (_tipoRuta == TipoRuta.publicaDinamica) ...[
            SizedBox(height: AppSpacing.space5),
            Text(
              'Configuración del evento',
              style: AppTextStyles.labelLarge,
            ),
            SizedBox(height: AppSpacing.space4),
            
            // Fecha inicial
            InkWell(
              onTap: () async {
                final now = DateTime.now();
                final picked = await showDatePicker(
                  context: context,
                  initialDate: now.add(const Duration(days: 1)),
                  firstDate: now,
                  lastDate: now.add(const Duration(days: 365)),
                );
                if (picked != null) {
                  setState(() => _fechaInicial = picked);
                }
              },
              child: Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.calendar_today),
                    SizedBox(width: AppSpacing.space2),
                    Text(
                      _fechaInicial != null
                          ? DateFormat('EEEE, d MMMM yyyy', 'es_AR').format(_fechaInicial!)
                          : 'Seleccionar fecha inicial',
                      style: AppTextStyles.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSpacing.space4),
            
            // Hora
            InkWell(
              onTap: () async {
                final picked = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (picked != null) {
                  setState(() => _hora = picked);
                }
              },
              child: Container(
                padding: EdgeInsets.all(AppSpacing.space4),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.outline,
                  ),
                  borderRadius: AppBorderRadius.medium,
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time),
                    SizedBox(width: AppSpacing.space2),
                    Text(
                      _hora != null
                          ? _hora!.format(context)
                          : 'Seleccionar hora',
                      style: AppTextStyles.bodyLarge,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: AppSpacing.space4),
            
            // Selector de repetición
            if (_fechaInicial != null)
              RRuleSelector(
                initialValue: _rrule,
                fechaInicial: _fechaInicial!,
                onChanged: (rrule) {
                  setState(() => _rrule = rrule);
                },
              ),
          ],

          SizedBox(height: AppSpacing.space5),

          // Resumen
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: AppBorderRadius.medium,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resumen',
                  style: AppTextStyles.titleMedium,
                ),
                SizedBox(height: AppSpacing.space2),
                Text('Obras seleccionadas: ${_obrasSeleccionadas.length}'),
                Text('Transporte: ${_modoTransporte == ModoTransporte.bici ? "Bicicleta" : "A pie"}'),
                Text('Tipo: ${_getTipoRutaLabel(_tipoRuta)}'),
                if (_participantesIds.isNotEmpty)
                  Text('Participantes: ${_participantesIds.length}'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getTipoRutaLabel(TipoRuta tipo) {
    switch (tipo) {
      case TipoRuta.privada:
        return 'Privada';
      case TipoRuta.publicaEstatica:
        return 'Pública Estática';
      case TipoRuta.publicaDinamica:
        return 'Pública Dinámica';
    }
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AppFilterModal(
        selectedCategories: _filteredCategories ?? [],
        selectedArtists: _filteredArtistas ?? [],
        onCategoriesChanged: (categories) {
          setState(() {
            _filteredCategories = categories.isNotEmpty ? categories : null;
          });
        },
        onArtistsChanged: (artistas) {
          setState(() {
            _filteredArtistas = artistas.isNotEmpty ? artistas : null;
          });
        },
        onApply: () {
          Navigator.of(context).pop();
          // TODO: Filtrar obras en camino
        },
      ),
    );
  }
}
