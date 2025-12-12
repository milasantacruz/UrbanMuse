import 'package:flutter/material.dart';

/// Página de creación de salida grupal
class CreateSalidaPage extends StatelessWidget {
  final String? rutaId;
  
  const CreateSalidaPage({
    super.key,
    this.rutaId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear Salida Grupal'),
      ),
      body: Center(
        child: Text('Create Salida Page - Ruta ID: ${rutaId ?? "ninguna"} - Por implementar'),
      ),
    );
  }
}

