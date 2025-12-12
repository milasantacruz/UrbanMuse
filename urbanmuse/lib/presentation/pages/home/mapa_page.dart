import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../widgets/buttons/app_fab.dart';

/// Página principal - Mapa de arte urbano
class MapaPage extends StatelessWidget {
  const MapaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Graffiti Trails'),
      ),
      body: const Center(
        child: Text('Mapa Page - Por implementar'),
      ),
      floatingActionButton: AppFAB.extended(
        icon: const Icon(Icons.visibility),
        label: 'Preview Components',
        onPressed: () => context.push('/preview'),
      ),
    );
  }
}

