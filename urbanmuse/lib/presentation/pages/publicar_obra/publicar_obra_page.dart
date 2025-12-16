import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../domain/entities/ubicacion.dart';
import '../../bloc/publicar_obra/publicar_obra_cubit.dart';
import '../../bloc/publicar_obra/publicar_obra_state.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/publicar_obra/publicar_obra.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../../core/theme/theme.dart';

/// Página para publicar una obra (multi-step, solo artistas)
class PublicarObraPage extends StatefulWidget {
  const PublicarObraPage({super.key});

  @override
  State<PublicarObraPage> createState() => _PublicarObraPageState();
}

class _PublicarObraPageState extends State<PublicarObraPage> {
  int _currentStep = 1; // 1-4
  
  // Paso 1: Foto
  File? _foto;
  
  // Paso 2: Información
  String _titulo = '';
  String _descripcion = '';
  String _tecnica = '';
  List<String> _tags = [];
  String? _categoria;
  
  // Paso 3: Ubicación
  Ubicacion? _ubicacion;
  
  // Controllers
  final TextEditingController _tituloController = TextEditingController();
  final TextEditingController _descripcionController = TextEditingController();
  final TextEditingController _tecnicaController = TextEditingController();

  @override
  void dispose() {
    _tituloController.dispose();
    _descripcionController.dispose();
    _tecnicaController.dispose();
    super.dispose();
  }

  void _nextStep() {
    if (_canProceedToNextStep()) {
      if (_currentStep < 4) {
        setState(() => _currentStep++);
      } else {
        _publicarObra();
      }
    }
  }


  bool _canProceedToNextStep() {
    switch (_currentStep) {
      case 1:
        return _foto != null;
      case 2:
        return _titulo.trim().isNotEmpty && _categoria != null;
      case 3:
        return _ubicacion != null && _ubicacion!.estaEnCABA;
      case 4:
        return true; // Revisión final
      default:
        return false;
    }
  }

  void _publicarObra() {
    if (!_canProceedToNextStep()) return;

    // TODO: Obtener artistaId del usuario actual
    const artistaId = 'current_artista_id';
    const artistaNombre = 'Artista Actual';

    // Iniciar flujo
    context.read<PublicarObraCubit>().startPublicacion(
      artistaId: artistaId,
      artistaNombre: artistaNombre,
    );

    // Guardar foto
    context.read<PublicarObraCubit>().saveFoto(_foto!.path);

    // Guardar información
    context.read<PublicarObraCubit>().saveInformacion(
      titulo: _titulo.trim(),
      categoria: _categoria!,
    );

    // Guardar ubicación
    context.read<PublicarObraCubit>().saveUbicacion(
      lat: _ubicacion!.lat,
      lng: _ubicacion!.lng,
      direccion: _ubicacion!.direccion,
      barrio: _ubicacion!.barrio,
    );

    // Publicar
    context.read<PublicarObraCubit>().publicar();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<PublicarObraCubit>(),
      child: BlocListener<PublicarObraCubit, PublicarObraState>(
        listener: (context, state) {
          if (state is PublicarObraSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Obra publicada exitosamente')),
            );
            context.pop();
          }
          if (state is PublicarObraError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
        },
        child: Scaffold(
          appBar: AppTopBar.create(
            title: 'Publicar Obra',
            onClose: () => context.pop(),
            actions: [
              if (_currentStep < 4)
                TextButton(
                  onPressed: _canProceedToNextStep() ? _nextStep : null,
                  child: const Text('Siguiente'),
                )
              else
                TextButton(
                  onPressed: _canProceedToNextStep() ? _publicarObra : null,
                  child: const Text('Publicar'),
                ),
            ],
          ),
          body: Column(
            children: [
              // Step Indicator
              StepIndicator(
                currentStep: _currentStep - 1, // 0-based
              ),

              // Contenido del paso actual
              Expanded(
                child: BlocBuilder<PublicarObraCubit, PublicarObraState>(
                  builder: (context, state) {
                    if (state is PublicarObraLoading) {
                      return const LoadingIndicator();
                    }

                    return _buildStepContent();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStepContent() {
    switch (_currentStep) {
      case 1:
        return _buildStep1();
      case 2:
        return _buildStep2();
      case 3:
        return _buildStep3();
      case 4:
        return _buildStep4();
      default:
        return const SizedBox.shrink();
    }
  }

  // Paso 1: Subir foto
  Widget _buildStep1() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: FotoUploader(
        initialImage: _foto,
        onImageSelected: (file) {
          setState(() => _foto = file);
        },
        errorText: _foto == null ? 'La foto es requerida' : null,
      ),
    );
  }

  // Paso 2: Información
  Widget _buildStep2() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: InformacionForm(
        initialTitulo: _titulo,
        initialDescripcion: _descripcion,
        initialTecnica: _tecnica,
        initialTags: _tags,
        initialCategoria: _categoria,
        onTituloChanged: (value) {
          setState(() => _titulo = value);
        },
        onDescripcionChanged: (value) {
          setState(() => _descripcion = value);
        },
        onTecnicaChanged: (value) {
          setState(() => _tecnica = value);
        },
        onTagsChanged: (value) {
          setState(() => _tags = value);
        },
        onCategoriaChanged: (value) {
          setState(() => _categoria = value);
        },
        tituloError: _titulo.trim().isEmpty ? 'El título es requerido' : null,
        categoriaError: _categoria == null ? 'La categoría es requerida' : null,
      ),
    );
  }

  // Paso 3: Ubicación
  Widget _buildStep3() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: UbicacionSelector(
        initialUbicacion: _ubicacion,
        onUbicacionSelected: (ubicacion) {
          setState(() => _ubicacion = ubicacion);
        },
        errorText: _ubicacion != null && !_ubicacion!.estaEnCABA
            ? 'La ubicación debe estar dentro de CABA'
            : null,
      ),
    );
  }

  // Paso 4: Revisar y confirmar
  Widget _buildStep4() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return SingleChildScrollView(
      padding: EdgeInsets.all(AppSpacing.space4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            'Revisa la información',
            style: AppTextStyles.titleLarge,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: AppSpacing.space5),

          // Foto
          if (_foto != null)
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: AppBorderRadius.medium,
                border: Border.all(color: colorScheme.outline),
              ),
              clipBehavior: Clip.antiAlias,
              child: Image.file(
                _foto!,
                fit: BoxFit.cover,
              ),
            ),
          SizedBox(height: AppSpacing.space4),

          // Información
          _buildReviewItem('Título', _titulo),
          if (_descripcion.isNotEmpty)
            _buildReviewItem('Descripción', _descripcion),
          if (_tecnica.isNotEmpty)
            _buildReviewItem('Técnica', _tecnica),
          _buildReviewItem('Categoría', _categoria ?? ''),
          if (_tags.isNotEmpty)
            _buildReviewItem('Tags', _tags.join(', ')),
          _buildReviewItem(
            'Ubicación',
            _ubicacion?.direccion ?? _ubicacion?.barrio ?? 'Ubicación no especificada',
          ),
        ],
      ),
    );
  }

  Widget _buildReviewItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: AppSpacing.space3),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.labelLarge,
          ),
          SizedBox(height: AppSpacing.space1),
          Text(
            value,
            style: AppTextStyles.bodyLarge,
          ),
        ],
      ),
    );
  }
}

