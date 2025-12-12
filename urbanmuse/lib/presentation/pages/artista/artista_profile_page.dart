import 'package:flutter/material.dart';

/// Página de perfil de artista
class ArtistaProfilePage extends StatelessWidget {
  final String artistaId;
  
  const ArtistaProfilePage({
    super.key,
    required this.artistaId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil de Artista'),
      ),
      body: Center(
        child: Text('Artista Profile Page - ID: $artistaId - Por implementar'),
      ),
    );
  }
}

