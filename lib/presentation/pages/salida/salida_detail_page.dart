import 'package:flutter/material.dart';

/// Página de detalle de salida grupal
class SalidaDetailPage extends StatelessWidget {
  final String salidaId;
  
  const SalidaDetailPage({
    super.key,
    required this.salidaId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Salida'),
      ),
      body: Center(
        child: Text('Salida Detail Page - ID: $salidaId - Por implementar'),
      ),
    );
  }
}

