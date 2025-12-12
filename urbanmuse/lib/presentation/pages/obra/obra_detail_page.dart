import 'package:flutter/material.dart';

/// Página de detalle de obra
class ObraDetailPage extends StatelessWidget {
  final String obraId;
  
  const ObraDetailPage({
    super.key,
    required this.obraId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalle de Obra'),
      ),
      body: Center(
        child: Text('Obra Detail Page - ID: $obraId - Por implementar'),
      ),
    );
  }
}

