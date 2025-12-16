import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../domain/entities/encuentro.dart';
import '../../../domain/entities/ubicacion.dart';
import '../../bloc/encuentro/encuentro_cubit.dart';
import '../../bloc/encuentro/encuentro_state.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/inputs/app_text_field.dart';
import '../../../core/theme/theme.dart';
import '../../../core/utils/rrule_helper.dart';
import '../../../core/constants/app_constants.dart';

/// Página para crear un encuentro
/// 
/// Solo artistas pueden crear encuentros.
/// Permite configurar fecha, hora, ubicación, descripción y repetición (rrule).
class CreateEncuentroPage extends StatefulWidget {
  const CreateEncuentroPage({super.key});

  @override
  State<CreateEncuentroPage> createState() => _CreateEncuentroPageState();
}

class _CreateEncuentroPageState extends State<CreateEncuentroPage> {
  final _formKey = GlobalKey<FormState>();
  final _descripcionController = TextEditingController();
  
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;
  Ubicacion? _selectedUbicacion;
  String? _selectedTipoRepeticion; // null, 'diario', 'semanal', 'mensual', 'anual'
  
  @override
  void dispose() {
    _descripcionController.dispose();
    super.dispose();
  }
  
  Future<void> _selectDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now.add(const Duration(days: 1)),
      firstDate: now,
      lastDate: now.add(const Duration(days: 365)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }
  
  Future<void> _selectTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() => _selectedTime = picked);
    }
  }
  
  void _selectUbicacion() {
    // TODO: Implementar selector de ubicación con mapa
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Selector de ubicación en desarrollo')),
    );
  }
  
  void _createEncuentro() {
    if (!_formKey.currentState!.validate()) return;
    if (_selectedDate == null || _selectedTime == null || _selectedUbicacion == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Completa todos los campos requeridos')),
      );
      return;
    }
    
    // TODO: Obtener artistaId del usuario actual
    const artistaId = 'current_artista_id'; // Temporal para MVP1
    const artistaNombre = 'Artista Actual'; // Temporal para MVP1
    const creadorId = 'current_user_id'; // Temporal para MVP1
    
    String? rrule;
    if (_selectedTipoRepeticion != null) {
      rrule = RRuleHelper.crearReglaRepeticion(
        tipoRepeticion: _selectedTipoRepeticion!,
        fechaInicial: _selectedDate!,
      );
    }
    
    final encuentro = Encuentro(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      artistaId: artistaId,
      artistaNombre: artistaNombre,
      ubicacion: _selectedUbicacion!,
      fecha: _selectedDate!,
      hora: _selectedTime!,
      descripcion: _descripcionController.text,
      creadorId: creadorId,
      fechaCreacion: DateTime.now(),
      rrule: rrule,
    );
    
    context.read<EncuentroCubit>().create(encuentro);
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return BlocProvider(
      create: (_) => di.getIt<EncuentroCubit>(),
      child: BlocListener<EncuentroCubit, EncuentroState>(
        listener: (context, state) {
          if (state is EncuentroCreated) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Encuentro creado exitosamente')),
            );
            Navigator.of(context).pop();
          }
          if (state is EncuentroError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          appBar: AppTopBar.create(
            title: 'Crear Encuentro',
            onClose: () => Navigator.of(context).pop(),
            actions: [
              TextButton(
                onPressed: _createEncuentro,
                child: const Text('Crear'),
              ),
            ],
          ),
          body: BlocBuilder<EncuentroCubit, EncuentroState>(
            builder: (context, state) {
              if (state is EncuentroLoading) {
                return const LoadingIndicator();
              }
              
              return SingleChildScrollView(
                padding: EdgeInsets.all(AppSpacing.space4),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Fecha
                      _buildSection(
                        title: 'Fecha',
                        child: InkWell(
                          onTap: _selectDate,
                          child: Container(
                            padding: EdgeInsets.all(AppSpacing.space4),
                            decoration: BoxDecoration(
                              border: Border.all(color: colorScheme.outline),
                              borderRadius: AppBorderRadius.medium,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.calendar_today, color: colorScheme.onSurfaceVariant),
                                SizedBox(width: AppSpacing.space2),
                                Text(
                                  _selectedDate != null
                                      ? DateFormat('EEEE, d MMMM yyyy', 'es_AR').format(_selectedDate!)
                                      : 'Seleccionar fecha',
                                  style: AppTextStyles.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: AppSpacing.space4),
                      
                      // Hora
                      _buildSection(
                        title: 'Hora',
                        child: InkWell(
                          onTap: _selectTime,
                          child: Container(
                            padding: EdgeInsets.all(AppSpacing.space4),
                            decoration: BoxDecoration(
                              border: Border.all(color: colorScheme.outline),
                              borderRadius: AppBorderRadius.medium,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.access_time, color: colorScheme.onSurfaceVariant),
                                SizedBox(width: AppSpacing.space2),
                                Text(
                                  _selectedTime != null
                                      ? _selectedTime!.format(context)
                                      : 'Seleccionar hora',
                                  style: AppTextStyles.bodyLarge,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: AppSpacing.space4),
                      
                      // Ubicación
                      _buildSection(
                        title: 'Ubicación',
                        child: InkWell(
                          onTap: _selectUbicacion,
                          child: Container(
                            padding: EdgeInsets.all(AppSpacing.space4),
                            decoration: BoxDecoration(
                              border: Border.all(color: colorScheme.outline),
                              borderRadius: AppBorderRadius.medium,
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.location_on, color: colorScheme.onSurfaceVariant),
                                SizedBox(width: AppSpacing.space2),
                                Expanded(
                                  child: Text(
                                    _selectedUbicacion?.direccion ?? 
                                    _selectedUbicacion?.barrio ??
                                    'Seleccionar ubicación',
                                    style: AppTextStyles.bodyLarge,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      
                      SizedBox(height: AppSpacing.space4),
                      
                      // Descripción
                      _buildSection(
                        title: 'Descripción',
                        child: AppTextField(
                          controller: _descripcionController,
                          hint: 'Describe el encuentro...',
                          maxLines: 4,
                        ),
                      ),
                      
                      SizedBox(height: AppSpacing.space4),
                      
                      // Repetición (opcional)
                      _buildSection(
                        title: 'Repetición (opcional)',
                        child: DropdownButtonFormField<String>(
                          value: _selectedTipoRepeticion,
                          decoration: InputDecoration(
                            hintText: 'Seleccionar tipo de repetición',
                            border: OutlineInputBorder(
                              borderRadius: AppBorderRadius.medium,
                            ),
                          ),
                          items: [
                            const DropdownMenuItem(
                              value: null,
                              child: Text('Sin repetición'),
                            ),
                            ...AppConstants.repeticiones.map((tipo) {
                              return DropdownMenuItem(
                                value: tipo,
                                child: Text(tipo),
                              );
                            }),
                          ],
                          onChanged: (value) {
                            setState(() => _selectedTipoRepeticion = value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
  
  Widget _buildSection({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTextStyles.labelLarge,
        ),
        SizedBox(height: AppSpacing.space2),
        child,
      ],
    );
  }
}

