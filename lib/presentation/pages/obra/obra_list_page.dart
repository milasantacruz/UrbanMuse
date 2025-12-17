import 'package:flutter/material.dart';

/// Página de lista de obras (opcional, puede usarse en otros contextos)
class ObraListPage extends StatelessWidget {
  const ObraListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Obras'),
      ),
      body: const Center(
        child: Text('Obra List Page - Por implementar'),
      ),
    );
  }
}

