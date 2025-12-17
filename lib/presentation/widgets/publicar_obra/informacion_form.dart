import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/theme.dart';
import '../inputs/inputs.dart';

/// InformacionForm
/// 
/// Formulario para ingresar información de una obra.
/// Incluye: título, descripción, técnica, tags, categoría.
class InformacionForm extends StatefulWidget {
  final String? initialTitulo;
  final String? initialDescripcion;
  final String? initialTecnica;
  final List<String> initialTags;
  final String? initialCategoria;
  final Function(String) onTituloChanged;
  final Function(String) onDescripcionChanged;
  final Function(String) onTecnicaChanged;
  final Function(List<String>) onTagsChanged;
  final Function(String) onCategoriaChanged;
  final String? tituloError;
  final String? descripcionError;
  final String? categoriaError;

  const InformacionForm({
    super.key,
    this.initialTitulo,
    this.initialDescripcion,
    this.initialTecnica,
    this.initialTags = const [],
    this.initialCategoria,
    required this.onTituloChanged,
    required this.onDescripcionChanged,
    required this.onTecnicaChanged,
    required this.onTagsChanged,
    required this.onCategoriaChanged,
    this.tituloError,
    this.descripcionError,
    this.categoriaError,
  });

  @override
  State<InformacionForm> createState() => _InformacionFormState();
}

class _InformacionFormState extends State<InformacionForm> {
  late TextEditingController _tituloController;
  late TextEditingController _descripcionController;
  late TextEditingController _tecnicaController;
  late TextEditingController _tagController;
  
  List<String> _tags = [];
  String? _selectedCategoria;

  @override
  void initState() {
    super.initState();
    _tituloController = TextEditingController(text: widget.initialTitulo);
    _descripcionController = TextEditingController(text: widget.initialDescripcion);
    _tecnicaController = TextEditingController(text: widget.initialTecnica);
    _tagController = TextEditingController();
    _tags = List.from(widget.initialTags);
    _selectedCategoria = widget.initialCategoria;
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descripcionController.dispose();
    _tecnicaController.dispose();
    _tagController.dispose();
    super.dispose();
  }

  void _addTag() {
    final tag = _tagController.text.trim();
    if (tag.isNotEmpty && !_tags.contains(tag)) {
      setState(() {
        _tags.add(tag);
        _tagController.clear();
      });
      widget.onTagsChanged(_tags);
    }
  }

  void _removeTag(String tag) {
    setState(() {
      _tags.remove(tag);
    });
    widget.onTagsChanged(_tags);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Título
        AppTextField(
          controller: _tituloController,
          label: 'Título',
          hint: 'Ingresa el título de la obra',
          isRequired: true,
          onChanged: (value) => widget.onTituloChanged(value),
          errorText: widget.tituloError,
        ),
        
        SizedBox(height: AppSpacing.space4),
        
        // Descripción
        AppTextField(
          controller: _descripcionController,
          label: 'Descripción',
          hint: 'Describe la obra...',
          maxLines: 4,
          onChanged: (value) => widget.onDescripcionChanged(value),
          errorText: widget.descripcionError,
        ),
        
        SizedBox(height: AppSpacing.space4),
        
        // Técnica
        AppTextField(
          controller: _tecnicaController,
          label: 'Técnica',
          hint: 'Ej: Spray, acrílico, stencil...',
          onChanged: (value) => widget.onTecnicaChanged(value),
        ),
        
        SizedBox(height: AppSpacing.space4),
        
        // Categoría
        Text(
          'Categoría',
          style: AppTextStyles.labelLarge,
        ),
        SizedBox(height: AppSpacing.space2),
        Wrap(
          spacing: AppSpacing.space2,
          runSpacing: AppSpacing.space2,
          children: AppConstants.categorias.map((categoria) {
            final isSelected = _selectedCategoria == categoria;
            return FilterChip(
              label: Text(_getCategoriaLabel(categoria)),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedCategoria = selected ? categoria : null;
                });
                if (_selectedCategoria != null) {
                  widget.onCategoriaChanged(_selectedCategoria!);
                }
              },
            );
          }).toList(),
        ),
        if (widget.categoriaError != null) ...[
          SizedBox(height: AppSpacing.space1),
          Text(
            widget.categoriaError!,
            style: AppTextStyles.bodySmall.copyWith(
              color: colorScheme.error,
            ),
          ),
        ],
        
        SizedBox(height: AppSpacing.space4),
        
        // Tags
        Text(
          'Tags',
          style: AppTextStyles.labelLarge,
        ),
        SizedBox(height: AppSpacing.space2),
        Row(
          children: [
            Expanded(
              child: AppTextField(
                controller: _tagController,
                hint: 'Agregar tag',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: _addTag,
                ),
              ),
            ),
          ],
        ),
        if (_tags.isNotEmpty) ...[
          SizedBox(height: AppSpacing.space2),
          Wrap(
            spacing: AppSpacing.space2,
            runSpacing: AppSpacing.space2,
            children: _tags.map((tag) {
              return Chip(
                label: Text(tag),
                onDeleted: () => _removeTag(tag),
              );
            }).toList(),
          ),
        ],
      ],
    );
  }

  String _getCategoriaLabel(String categoria) {
    switch (categoria) {
      case AppConstants.categoriaGraffiti:
        return 'Graffiti';
      case AppConstants.categoriaMural:
        return 'Mural';
      case AppConstants.categoriaEscultura:
        return 'Escultura';
      case AppConstants.categoriaPerformance:
        return 'Performance';
      default:
        return categoria;
    }
  }
}

