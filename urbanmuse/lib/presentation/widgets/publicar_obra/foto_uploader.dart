import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../core/theme/theme.dart';
import '../buttons/buttons.dart';

/// FotoUploader
/// 
/// Widget para subir una foto de obra.
/// Permite tomar foto con cámara o seleccionar de galería.
class FotoUploader extends StatefulWidget {
  final File? initialImage;
  final Function(File) onImageSelected;
  final String? errorText;

  const FotoUploader({
    super.key,
    this.initialImage,
    required this.onImageSelected,
    this.errorText,
  });

  @override
  State<FotoUploader> createState() => _FotoUploaderState();
}

class _FotoUploaderState extends State<FotoUploader> {
  File? _selectedImage;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _selectedImage = widget.initialImage;
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _picker.pickImage(
        source: source,
        maxWidth: 1920,
        maxHeight: 1920,
        imageQuality: 85,
      );

      if (image != null) {
        final file = File(image.path);
        setState(() => _selectedImage = file);
        widget.onImageSelected(file);
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al seleccionar imagen: $e')),
        );
      }
    }
  }

  void _removeImage() {
    setState(() => _selectedImage = null);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Preview de imagen
        if (_selectedImage != null)
          Container(
            height: 300,
            margin: EdgeInsets.only(bottom: AppSpacing.space4),
            decoration: BoxDecoration(
              borderRadius: AppBorderRadius.medium,
              border: Border.all(
                color: colorScheme.outline,
              ),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: AppBorderRadius.medium,
                  child: Image.file(
                    _selectedImage!,
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: double.infinity,
                  ),
                ),
                Positioned(
                  top: AppSpacing.space2,
                  right: AppSpacing.space2,
                  child: IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ),
                    onPressed: _removeImage,
                  ),
                ),
              ],
            ),
          ),

        // Botones de selección
        if (_selectedImage == null) ...[
          AppButton.primary(
            label: 'Tomar Foto',
            leftIcon: const Icon(Icons.camera_alt),
            onPressed: () => _pickImage(ImageSource.camera),
          ),
          SizedBox(height: AppSpacing.space2),
          AppButton.primaryOutlined(
            label: 'Seleccionar de Galería',
            leftIcon: const Icon(Icons.photo_library),
            onPressed: () => _pickImage(ImageSource.gallery),
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

