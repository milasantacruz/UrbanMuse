import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../core/theme/theme.dart';
import '../../../domain/entities/ubicacion.dart';
import '../../bloc/ruta/ruta_bloc.dart';
import '../../bloc/ruta/ruta_event.dart' as ruta_event;
import '../../bloc/ruta/ruta_state.dart';
import '../../bloc/obra/obra_bloc.dart';
import '../../bloc/obra/obra_event.dart';
import '../../bloc/obra/obra_state.dart';
import '../step_indicators/app_route_step_indicator.dart';
import '../cards/app_obra_card.dart';
import '../buttons/app_button.dart';
import '../common/loading_indicator.dart';
import '../common/error_widget.dart';
import 'dart:math' as math;
import '../../../domain/entities/obra.dart';
import '../../../domain/entities/ruta.dart';

/// Modal para crear ruta manteniendo el mapa visible
class CreateRutaModal extends StatefulWidget {
  final Ubicacion puntoA;
  final Ubicacion puntoB;
  final VoidCallback onClose;
  final VoidCallback onRutaCreated;

  const CreateRutaModal({
    super.key,
    required this.puntoA,
    required this.puntoB,
    required this.onClose,
    required this.onRutaCreated,
  });

  @override
  State<CreateRutaModal> createState() => _CreateRutaModalState();
}

class _CreateRutaModalState extends State<CreateRutaModal> {
  int _currentStep = 2; // Empezar en paso 2 (selección de obras), paso 1 ya completado
  
  // Paso 2: Obras
  List<Obra> _obrasEnCamino = [];
  List<String> _obrasSeleccionadas = [];
  
  // Paso 3: Transporte y Tipo de Ruta
  ModoTransporte _modoTransporte = ModoTransporte.bici;
  TipoRuta _tipoRuta = TipoRuta.privada;
  
  // Paso 4: Participantes
  List<String> _participantesIds = [];
  
  // Paso 5: Revisión final
  String _nombreRuta = '';
  String? _rrule;
  DateTime? _fechaInicial;
  TimeOfDay? _hora;
  
  bool _obrasCargadas = false;
  BuildContext? _blocContext; // Contexto con acceso a los Blocs

  @override
  void dispose() {
    super.dispose();
  }

  void _nextStep() {
    if (_canProceedToNextStep()) {
      if (_currentStep < 5) {
        setState(() {
          _currentStep++;
          // Cargar obras cuando se avanza al paso 2
          if (_currentStep == 2 && !_obrasCargadas) {
            _calculateObrasEnCamino();
          }
        });
      } else {
        _createRuta();
      }
    }
  }

  void _previousStep() {
    if (_currentStep > 1) {
      setState(() => _currentStep--);
    }
  }

  bool _canProceedToNextStep() {
    switch (_currentStep) {
      case 1:
        return true; // Paso 1 siempre completado (puntos A y B)
      case 2:
        return _obrasSeleccionadas.isNotEmpty; // Debe seleccionar al menos una obra
      case 3:
        return true; // Transporte y tipo de ruta siempre tienen valor
      case 4:
        return true; // Participantes es opcional
      case 5:
        return _nombreRuta.trim().isNotEmpty &&
            (_tipoRuta != TipoRuta.publicaDinamica ||
                (_rrule != null && _fechaInicial != null && _hora != null));
      default:
        return false;
    }
  }

  void _calculateObrasEnCamino() {
    // Cargar todas las obras primero
    if (_blocContext != null) {
      _blocContext!.read<ObraBloc>().add(LoadObras());
    }
  }

  void _createRuta() {
    if (!_canProceedToNextStep()) return;
    
    // Verificar que tenemos acceso al contexto del bloc
    if (_blocContext == null) {
      debugPrint('Error: No hay contexto del bloc disponible');
      return;
    }

    // Generar nombre automático basado en puntos
    final nombreRuta = _nombreRuta.isNotEmpty 
        ? _nombreRuta 
        : 'Ruta ${widget.puntoA.barrio ?? 'A'} - ${widget.puntoB.barrio ?? 'B'}';

    final ruta = Ruta(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      nombre: nombreRuta,
      puntoA: widget.puntoA,
      puntoB: widget.puntoB,
      obraIds: _obrasSeleccionadas,
      ordenVisita: List.generate(_obrasSeleccionadas.length, (i) => i),
      distancia: 0.0,
      tiempoEstimado: 0.0,
      modoTransporte: _modoTransporte,
      tipo: _tipoRuta,
      creadorId: 'current_user_id',
      fechaCreacion: DateTime.now(),
      rrule: _rrule,
      fechaInicial: _fechaInicial,
      hora: _hora,
      asistentesIds: _participantesIds,
    );

    _blocContext!.read<RutaBloc>().add(ruta_event.CreateRuta(ruta));
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
          // Guardar referencia al contexto del bloc
          _blocContext = blocContext;
          
          // Cargar obras cuando el BlocProvider esté disponible
          if (!_obrasCargadas) {
            _obrasCargadas = true;
            WidgetsBinding.instance.addPostFrameCallback((_) {
              if (mounted) {
                try {
                  blocContext.read<ObraBloc>().add(LoadObras());
                } catch (e) {
                  debugPrint('Error al cargar obras: $e');
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
                // Recargar rutas en el perfil si está disponible
                try {
                  // Intentar recargar rutas en el perfil usando el contexto global
                  // Esto se hará automáticamente cuando se navegue al perfil
                } catch (e) {
                  debugPrint('No se pudo recargar rutas en perfil: $e');
                }
                widget.onRutaCreated();
              }
              if (state is RutaError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.message)),
                );
              }
            },
            child: Container(
              height: MediaQuery.of(context).size.height * 0.9,
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(AppBorderRadius.large.topLeft.x),
                  topRight: Radius.circular(AppBorderRadius.large.topRight.x),
                ),
              ),
              child: Column(
                children: [
                  // Header con botón cerrar
                  Container(
                    padding: EdgeInsets.all(AppSpacing.space4),
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.outlineVariant,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Crear Ruta',
                            style: AppTextStyles.titleLarge,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: widget.onClose,
                        ),
                      ],
                    ),
                  ),
                  
                  // Step Indicator (5 pasos)
                  Padding(
                    padding: EdgeInsets.all(AppSpacing.space4),
                    child: AppRouteStepIndicator(
                      currentStep: _currentStep,
                      totalSteps: 5,
                      stepLabels: const [
                        'Puntos',
                        'Obras',
                        'Transporte',
                        'Participantes',
                        'Revisión',
                      ],
                    ),
                  ),

                  // Contenido del paso actual
                  Expanded(
                    child: _buildStepContent(),
                  ),
                  
                  // Botones de acción
                  Container(
                    padding: EdgeInsets.all(AppSpacing.space4),
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                          color: AppColors.outlineVariant,
                          width: 1,
                        ),
                      ),
                    ),
                    child: Row(
                      children: [
                        // Botón Atrás (visible desde paso 2 en adelante)
                        if (_currentStep > 1)
                          TextButton(
                            onPressed: _previousStep,
                            child: const Text('Atrás'),
                          ),
                        const Spacer(),
                        // Botón Siguiente o Crear
                        if (_currentStep < 5)
                          AppButton.primary(
                            label: 'Siguiente',
                            onPressed: _canProceedToNextStep() ? _nextStep : null,
                          )
                        else
                          AppButton.primary(
                            label: 'Crear Ruta',
                            onPressed: _canProceedToNextStep() ? _createRuta : null,
                          ),
                      ],
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
    switch (_currentStep) {
      case 1:
        return _buildStep1(); // Puntos A y B (ya seleccionados)
      case 2:
        return _buildStep2(); // Selección de obras
      case 3:
        return _buildStep3(); // Seleccionar transporte y tipo de ruta
      case 4:
        return _buildStep4(); // Invitar participantes
      case 5:
        return _buildStep5(); // Revisión final
      default:
        return const SizedBox.shrink();
    }
  }

  // Paso 1: Puntos A y B (ya seleccionados, solo mostrar info)
  Widget _buildStep1() {
    return Padding(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Puntos seleccionados',
            style: AppTextStyles.titleLarge,
          ),
          SizedBox(height: AppSpacing.space4),
          _buildPuntoCard('Punto A', widget.puntoA, AppColors.primary),
          SizedBox(height: AppSpacing.space3),
          _buildPuntoCard('Punto B', widget.puntoB, AppColors.secondary),
        ],
      ),
    );
  }

  Widget _buildPuntoCard(String label, Ubicacion ubicacion, Color color) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.space4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: AppBorderRadius.medium,
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                label == 'Punto A' ? 'A' : 'B',
                style: AppTextStyles.labelLarge.copyWith(
                  color: label == 'Punto A' ? AppColors.onPrimary : AppColors.onSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          SizedBox(width: AppSpacing.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.labelMedium,
                ),
                SizedBox(height: AppSpacing.space1),
                Text(
                  ubicacion.direccion ?? '${ubicacion.lat.toStringAsFixed(4)}, ${ubicacion.lng.toStringAsFixed(4)}',
                  style: AppTextStyles.bodyMedium,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Paso 2: Selección de obras con cards e icono +/X
  Widget _buildStep2() {
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
          // Filtrar obras que están en el camino
          final todasLasObras = state.obras;
          final obrasFiltradas = _filterObrasEnCamino(todasLasObras);
          
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              setState(() {
                _obrasEnCamino = obrasFiltradas;
              });
            }
          });
        }

        return SingleChildScrollView(
          padding: EdgeInsets.all(AppSpacing.space4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Selecciona las obras',
                style: AppTextStyles.titleLarge,
              ),
              SizedBox(height: AppSpacing.space2),
              Text(
                'Se encontraron ${_obrasEnCamino.length} obras en el camino',
                style: AppTextStyles.bodyMedium,
              ),
              SizedBox(height: AppSpacing.space4),
              if (_obrasEnCamino.isEmpty)
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(AppSpacing.space5),
                    child: Text(
                      'No se encontraron obras en el camino',
                      style: AppTextStyles.bodyLarge,
                    ),
                  ),
                )
              else
                ..._obrasEnCamino.map((obra) {
                  final isSelected = _obrasSeleccionadas.contains(obra.id);
                  return Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.space2),
                    child: Stack(
                      children: [
                        AppObraCard.list(
                          imageUrl: obra.foto,
                          titulo: obra.titulo,
                          artista: obra.artistaNombre,
                          categoria: obra.categoria,
                          ubicacion: obra.ubicacion.barrio,
                          showChevron: false, // Ocultar chevron, usamos el icono +/X
                          onTap: () {
                            setState(() {
                              if (isSelected) {
                                _obrasSeleccionadas.remove(obra.id);
                              } else {
                                _obrasSeleccionadas.add(obra.id);
                              }
                            });
                          },
                        ),
                        // Icono +/X en la esquina derecha
                        Positioned(
                          top: AppSpacing.space2,
                          right: AppSpacing.space2,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if (isSelected) {
                                  _obrasSeleccionadas.remove(obra.id);
                                } else {
                                  _obrasSeleccionadas.add(obra.id);
                                }
                              });
                            },
                            child: Container(
                              width: 32,
                              height: 32,
                              decoration: BoxDecoration(
                                color: isSelected ? AppColors.error : AppColors.primary,
                                shape: BoxShape.circle,
                                boxShadow: AppShadows.small,
                              ),
                              child: Icon(
                                isSelected ? Icons.close : Icons.add,
                                color: AppColors.white,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            ],
          ),
        );
      },
    );
  }

  // Paso 3: Seleccionar transporte y tipo de ruta
  Widget _buildStep3() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
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
    );
  }

  // Paso 4: Invitar participantes
  Widget _buildStep4() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
              AppButton.secondary(
                label: 'Agregar participante',
                leftIcon: const Icon(Icons.person_add, size: 20),
                onPressed: _showAddParticipantDialog,
              ),
              SizedBox(height: AppSpacing.space4),
            ],
          ),
        ),
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

  // Paso 5: Revisión final
  Widget _buildStep5() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Revisión final',
            style: AppTextStyles.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.space5),
          
          // Card de resumen
          Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: AppBorderRadius.medium,
              boxShadow: AppShadows.small,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Resumen de la ruta',
                  style: AppTextStyles.titleMedium,
                ),
                SizedBox(height: AppSpacing.space4),
                
                // Puntos
                _buildResumenItem(
                  'Punto A',
                  widget.puntoA.direccion ?? '${widget.puntoA.lat.toStringAsFixed(4)}, ${widget.puntoA.lng.toStringAsFixed(4)}',
                  Icons.location_on,
                  AppColors.primary,
                ),
                SizedBox(height: AppSpacing.space3),
                _buildResumenItem(
                  'Punto B',
                  widget.puntoB.direccion ?? '${widget.puntoB.lat.toStringAsFixed(4)}, ${widget.puntoB.lng.toStringAsFixed(4)}',
                  Icons.location_on,
                  AppColors.secondary,
                ),
                SizedBox(height: AppSpacing.space4),
                
                Divider(color: AppColors.outlineVariant),
                SizedBox(height: AppSpacing.space4),
                
                // Obras seleccionadas
                _buildResumenItem(
                  'Obras seleccionadas',
                  '${_obrasSeleccionadas.length} obra${_obrasSeleccionadas.length != 1 ? 's' : ''}',
                  Icons.art_track,
                  AppColors.tertiary,
                ),
                SizedBox(height: AppSpacing.space3),
                
                // Transporte
                _buildResumenItem(
                  'Transporte',
                  _modoTransporte == ModoTransporte.bici ? 'Bicicleta' : 'A pie',
                  _modoTransporte == ModoTransporte.bici ? Icons.directions_bike : Icons.directions_walk,
                  AppColors.primary,
                ),
                SizedBox(height: AppSpacing.space3),
                
                // Tipo de ruta
                _buildResumenItem(
                  'Tipo de ruta',
                  _tipoRuta == TipoRuta.privada 
                      ? 'Privada' 
                      : _tipoRuta == TipoRuta.publicaEstatica 
                          ? 'Pública Estática' 
                          : 'Pública Dinámica',
                  Icons.public,
                  AppColors.secondary,
                ),
                if (_participantesIds.isNotEmpty) ...[
                  SizedBox(height: AppSpacing.space3),
                  _buildResumenItem(
                    'Participantes',
                    '${_participantesIds.length} participante${_participantesIds.length != 1 ? 's' : ''}',
                    Icons.people,
                    AppColors.tertiary,
                  ),
                ],
              ],
            ),
          ),
          SizedBox(height: AppSpacing.space5),
          
          // Nombre de la ruta
          Text(
            'Nombre de la ruta',
            style: AppTextStyles.labelLarge,
          ),
          SizedBox(height: AppSpacing.space2),
          TextField(
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
                          ? '${_fechaInicial!.day}/${_fechaInicial!.month}/${_fechaInicial!.year}'
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
          ],
        ],
      ),
    );
  }

  Widget _buildResumenItem(String label, String value, IconData icon, Color color) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(AppSpacing.space2),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            borderRadius: AppBorderRadius.small,
          ),
          child: Icon(icon, color: color, size: 20),
        ),
        SizedBox(width: AppSpacing.space3),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: AppTextStyles.labelMedium.copyWith(
                  color: AppColors.onSurfaceVariant,
                ),
              ),
              SizedBox(height: AppSpacing.space1),
              Text(
                value,
                style: AppTextStyles.bodyMedium,
              ),
            ],
          ),
        ),
      ],
    );
  }


  // Métodos de cálculo de distancia (copiados de CreateRutaPage)
  double _calculateDistance(double lat1, double lng1, double lat2, double lng2) {
    const double earthRadius = 6371;
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

  double _distanceToLineSegment(
    double pointLat,
    double pointLng,
    double lineStartLat,
    double lineStartLng,
    double lineEndLat,
    double lineEndLng,
  ) {
    final distToStart = _calculateDistance(pointLat, pointLng, lineStartLat, lineStartLng);
    final distToEnd = _calculateDistance(pointLat, pointLng, lineEndLat, lineEndLng);
    final segmentLength = _calculateDistance(lineStartLat, lineStartLng, lineEndLat, lineEndLng);
    
    if (segmentLength < 0.001) {
      return distToStart < distToEnd ? distToStart : distToEnd;
    }
    
    final lat1 = _toRadians(lineStartLat);
    final lng1 = _toRadians(lineStartLng);
    final lat2 = _toRadians(lineEndLat);
    final lng2 = _toRadians(lineEndLng);
    final latP = _toRadians(pointLat);
    final lngP = _toRadians(pointLng);
    
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

  List<Obra> _filterObrasEnCamino(List<Obra> todasLasObras) {
    const double radioMaximoKm = 2.0;
    
    final obrasFiltradas = todasLasObras.where((obra) {
      final distancia = _distanceToLineSegment(
        obra.ubicacion.lat,
        obra.ubicacion.lng,
        widget.puntoA.lat,
        widget.puntoA.lng,
        widget.puntoB.lat,
        widget.puntoB.lng,
      );
      
      return distancia <= radioMaximoKm;
    }).toList();
    
    if (obrasFiltradas.isEmpty) {
      return todasLasObras;
    }
    
    return obrasFiltradas;
  }
}

