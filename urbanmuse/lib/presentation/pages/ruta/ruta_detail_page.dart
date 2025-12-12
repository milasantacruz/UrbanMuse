import 'package:flutter/material.dart';

/// Página de detalle de ruta
class RutaDetailPage extends StatelessWidget {
  final String rutaId;
  
  const RutaDetailPage({
    super.key,
    required this.rutaId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Ruta'),
      ),
      body: Center(
        child: Text('Ruta Detail Page - ID: $rutaId - Por implementar'),
      ),
    );
  }
}

