import 'package:flutter/material.dart';
import '../../../domain/entities/obra.dart';
import '../../../domain/entities/artista.dart';
import '../../../domain/entities/ruta.dart';
import '../../../domain/entities/usuario.dart';
import '../../../domain/entities/ubicacion.dart';
import '../../models/obra_model.dart';
import '../../models/artista_model.dart';
import '../../models/ruta_model.dart';
import '../../models/usuario_model.dart';
import 'hive_service.dart';
import 'usuario_local_datasource.dart';

/// Servicio para inicializar datos mock en Hive
/// 
/// Proporciona datos de ejemplo para desarrollo y testing.
/// Incluye obras y artistas de Buenos Aires (CABA).
class MockDataService {
  /// Inicializar datos mock si las cajas están vacías
  static Future<void> initializeMockData() async {
    await _initializeObras();
    await _initializeArtistas();
    await _initializeRutas();
    await _initializeUsuario();
  }

  /// Inicializar obras mock
  static Future<void> _initializeObras() async {
    final box = HiveService.obrasBox;
    
    // Verificar si ya hay datos
    if (box.isNotEmpty) {
      return; // Ya hay datos, no inicializar
    }

    final obras = _getMockObras();
    
    for (final obra in obras) {
      final model = ObraModel.fromEntity(obra);
      await box.put(obra.id, model.toJson());
    }
  }

  /// Inicializar artistas mock
  static Future<void> _initializeArtistas() async {
    final box = HiveService.artistasBox;
    
    // Verificar si ya hay datos
    if (box.isNotEmpty) {
      return; // Ya hay datos, no inicializar
    }

    final artistas = _getMockArtistas();
    
    for (final artista in artistas) {
      final model = ArtistaModel.fromEntity(artista);
      await box.put(artista.id, model.toJson());
    }
  }

  /// Obtener lista de obras mock
  static List<Obra> _getMockObras() {
    return [
      // Palermo
      Obra(
        id: 'obra_001',
        titulo: 'Mural Colectivo Palermo',
        artistaId: 'artista_001',
        artistaNombre: 'Buenos Aires Street Art',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.5889,
          lng: -58.4108,
          direccion: 'Av. Santa Fe 3200',
          barrio: 'Palermo',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 1, 15),
        likes: 234,
      ),
      Obra(
        id: 'obra_002',
        titulo: 'Graffiti en Serrano',
        artistaId: 'artista_002',
        artistaNombre: 'Urban Colors',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.5900,
          lng: -58.4200,
          direccion: 'Serrano 1500',
          barrio: 'Palermo',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 2, 20),
        likes: 189,
      ),
      
      // San Telmo
      Obra(
        id: 'obra_003',
        titulo: 'Mural Histórico San Telmo',
        artistaId: 'artista_003',
        artistaNombre: 'Historia Urbana',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.6200,
          lng: -58.3700,
          direccion: 'Defensa 1200',
          barrio: 'San Telmo',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 3, 10),
        likes: 312,
      ),
      Obra(
        id: 'obra_004',
        titulo: 'Stencil Art en Plaza Dorrego',
        artistaId: 'artista_001',
        artistaNombre: 'Buenos Aires Street Art',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.6220,
          lng: -58.3720,
          direccion: 'Humberto 1° 400',
          barrio: 'San Telmo',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 4, 5),
        likes: 156,
      ),
      
      // Villa Crespo
      Obra(
        id: 'obra_005',
        titulo: 'Mural en Villa Crespo',
        artistaId: 'artista_002',
        artistaNombre: 'Urban Colors',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.6000,
          lng: -58.4400,
          direccion: 'Av. Corrientes 5400',
          barrio: 'Villa Crespo',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 5, 12),
        likes: 278,
      ),
      
      // La Boca
      Obra(
        id: 'obra_006',
        titulo: 'Arte en Caminito',
        artistaId: 'artista_003',
        artistaNombre: 'Historia Urbana',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.6350,
          lng: -58.3630,
          direccion: 'Caminito',
          barrio: 'La Boca',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 6, 1),
        likes: 445,
      ),
      
      // Belgrano
      Obra(
        id: 'obra_007',
        titulo: 'Graffiti en Belgrano',
        artistaId: 'artista_001',
        artistaNombre: 'Buenos Aires Street Art',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.5600,
          lng: -58.4600,
          direccion: 'Av. Cabildo 2000',
          barrio: 'Belgrano',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 6, 15),
        likes: 201,
      ),
      
      // Recoleta
      Obra(
        id: 'obra_008',
        titulo: 'Mural en Recoleta',
        artistaId: 'artista_002',
        artistaNombre: 'Urban Colors',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.5900,
          lng: -58.3900,
          direccion: 'Av. Pueyrredón 1800',
          barrio: 'Recoleta',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 7, 3),
        likes: 167,
      ),
      
      // Almagro
      Obra(
        id: 'obra_009',
        titulo: 'Stencil en Almagro',
        artistaId: 'artista_003',
        artistaNombre: 'Historia Urbana',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.6100,
          lng: -58.4200,
          direccion: 'Av. Corrientes 4000',
          barrio: 'Almagro',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 7, 20),
        likes: 123,
      ),
      
      // Barracas
      Obra(
        id: 'obra_010',
        titulo: 'Mural Colectivo Barracas',
        artistaId: 'artista_001',
        artistaNombre: 'Buenos Aires Street Art',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.6400,
          lng: -58.3700,
          direccion: 'Av. Regimiento de Patricios 2000',
          barrio: 'Barracas',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 8, 5),
        likes: 289,
      ),
      
      // Más obras para tener suficientes datos
      Obra(
        id: 'obra_011',
        titulo: 'Graffiti en Colegiales',
        artistaId: 'artista_002',
        artistaNombre: 'Urban Colors',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.5800,
          lng: -58.4500,
          direccion: 'Av. Federico Lacroze 2000',
          barrio: 'Colegiales',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 8, 18),
        likes: 145,
      ),
      Obra(
        id: 'obra_012',
        titulo: 'Mural en Caballito',
        artistaId: 'artista_003',
        artistaNombre: 'Historia Urbana',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.6200,
          lng: -58.4400,
          direccion: 'Av. Rivadavia 5000',
          barrio: 'Caballito',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 9, 2),
        likes: 198,
      ),
      Obra(
        id: 'obra_013',
        titulo: 'Stencil en Boedo',
        artistaId: 'artista_001',
        artistaNombre: 'Buenos Aires Street Art',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.6300,
          lng: -58.4200,
          direccion: 'Av. Boedo 800',
          barrio: 'Boedo',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 9, 15),
        likes: 112,
      ),
      Obra(
        id: 'obra_014',
        titulo: 'Mural en Parque Patricios',
        artistaId: 'artista_002',
        artistaNombre: 'Urban Colors',
        categoria: 'mural',
        ubicacion: Ubicacion(
          lat: -34.6400,
          lng: -58.4000,
          direccion: 'Av. Caseros 3000',
          barrio: 'Parque Patricios',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 10, 1),
        likes: 223,
      ),
      Obra(
        id: 'obra_015',
        titulo: 'Graffiti en Villa Urquiza',
        artistaId: 'artista_003',
        artistaNombre: 'Historia Urbana',
        categoria: 'graffiti',
        ubicacion: Ubicacion(
          lat: -34.5700,
          lng: -58.4800,
          direccion: 'Av. Triunvirato 4000',
          barrio: 'Villa Urquiza',
        ),
        foto: 'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800',
        fecha: DateTime(2024, 10, 12),
        likes: 156,
      ),
    ];
  }

  /// Obtener lista de artistas mock
  static List<Artista> _getMockArtistas() {
    return [
      Artista(
        id: 'artista_001',
        nombre: 'Buenos Aires Street Art',
        bio: 'Colectivo de artistas urbanos dedicados a transformar las calles de Buenos Aires.',
        foto: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
        instagram: '@buenosairesstreetart',
        obrasCount: 5,
      ),
      Artista(
        id: 'artista_002',
        nombre: 'Urban Colors',
        bio: 'Artista especializado en murales coloridos que reflejan la cultura porteña.',
        foto: 'https://images.unsplash.com/photo-1506794778202-cad84cf45f1d?w=400',
        instagram: '@urbancolors',
        obrasCount: 4,
      ),
      Artista(
        id: 'artista_003',
        nombre: 'Historia Urbana',
        bio: 'Murales que cuentan la historia y tradiciones de Buenos Aires.',
        foto: 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=400',
        instagram: '@historiaurbana',
        obrasCount: 6,
      ),
    ];
  }

  /// Inicializar rutas mock
  static Future<void> _initializeRutas() async {
    final box = HiveService.rutasBox;
    
    // Verificar si ya hay datos
    if (box.isNotEmpty) {
      return; // Ya hay datos, no inicializar
    }

    final rutas = _getMockRutas();
    
    for (final ruta in rutas) {
      final model = RutaModel.fromEntity(ruta);
      await box.put(ruta.id, model.toJson());
    }
  }

  /// Obtener lista de rutas mock
  static List<Ruta> _getMockRutas() {
    return [
      // Ruta 1: Palermo a San Telmo (Bici)
      Ruta(
        id: 'ruta_001',
        nombre: 'Ruta Palermo - San Telmo',
        puntoA: Ubicacion(
          lat: -34.5889,
          lng: -58.4108,
          direccion: 'Av. Santa Fe 3200',
          barrio: 'Palermo',
        ),
        puntoB: Ubicacion(
          lat: -34.6200,
          lng: -58.3700,
          direccion: 'Defensa 1200',
          barrio: 'San Telmo',
        ),
        obraIds: ['obra_001', 'obra_002', 'obra_003', 'obra_004'],
        ordenVisita: [0, 1, 2, 3],
        distancia: 8500.0, // 8.5 km
        tiempoEstimado: 34.0, // ~34 min en bici
        modoTransporte: ModoTransporte.bici,
        tipo: TipoRuta.publicaEstatica,
        creadorId: 'user_001',
        fechaCreacion: DateTime(2024, 11, 15),
      ),
      
      // Ruta 2: Villa Crespo a La Boca (Bici)
      Ruta(
        id: 'ruta_002',
        nombre: 'Ruta Villa Crespo - La Boca',
        puntoA: Ubicacion(
          lat: -34.6000,
          lng: -58.4400,
          direccion: 'Av. Corrientes 5400',
          barrio: 'Villa Crespo',
        ),
        puntoB: Ubicacion(
          lat: -34.6350,
          lng: -58.3630,
          direccion: 'Caminito',
          barrio: 'La Boca',
        ),
        obraIds: ['obra_005', 'obra_006'],
        ordenVisita: [0, 1],
        distancia: 6200.0, // 6.2 km
        tiempoEstimado: 25.0, // ~25 min en bici
        modoTransporte: ModoTransporte.bici,
        tipo: TipoRuta.publicaEstatica,
        creadorId: 'user_002',
        fechaCreacion: DateTime(2024, 11, 20),
      ),
      
      // Ruta 3: Belgrano a Recoleta (A pie)
      Ruta(
        id: 'ruta_003',
        nombre: 'Paseo Belgrano - Recoleta',
        puntoA: Ubicacion(
          lat: -34.5600,
          lng: -58.4600,
          direccion: 'Av. Cabildo 2000',
          barrio: 'Belgrano',
        ),
        puntoB: Ubicacion(
          lat: -34.5900,
          lng: -58.3900,
          direccion: 'Av. Pueyrredón 1800',
          barrio: 'Recoleta',
        ),
        obraIds: ['obra_007', 'obra_008'],
        ordenVisita: [0, 1],
        distancia: 4200.0, // 4.2 km
        tiempoEstimado: 50.0, // ~50 min a pie
        modoTransporte: ModoTransporte.aPie,
        tipo: TipoRuta.privada,
        creadorId: 'user_001',
        fechaCreacion: DateTime(2024, 11, 25),
      ),
      
      // Ruta 4: Almagro a Barracas (Bici) - Pública Dinámica
      Ruta(
        id: 'ruta_004',
        nombre: 'Ruta Dominical Almagro - Barracas',
        puntoA: Ubicacion(
          lat: -34.6100,
          lng: -58.4200,
          direccion: 'Av. Corrientes 4000',
          barrio: 'Almagro',
        ),
        puntoB: Ubicacion(
          lat: -34.6400,
          lng: -58.3700,
          direccion: 'Av. Regimiento de Patricios 2000',
          barrio: 'Barracas',
        ),
        obraIds: ['obra_009', 'obra_010'],
        ordenVisita: [0, 1],
        distancia: 4800.0, // 4.8 km
        tiempoEstimado: 19.0, // ~19 min en bici
        modoTransporte: ModoTransporte.bici,
        tipo: TipoRuta.publicaDinamica,
        creadorId: 'user_003',
        fechaCreacion: DateTime(2024, 12, 1),
        rrule: 'FREQ=WEEKLY;BYDAY=SU', // Todos los domingos
        fechaInicial: DateTime(2024, 12, 8),
        hora: const TimeOfDay(hour: 10, minute: 0),
        asistentesIds: ['user_001', 'user_002'],
      ),
      
      // Ruta 5: Colegiales a Caballito (Bici)
      Ruta(
        id: 'ruta_005',
        nombre: 'Ruta Colegiales - Caballito',
        puntoA: Ubicacion(
          lat: -34.5800,
          lng: -58.4500,
          direccion: 'Av. Federico Lacroze 2000',
          barrio: 'Colegiales',
        ),
        puntoB: Ubicacion(
          lat: -34.6200,
          lng: -58.4400,
          direccion: 'Av. Rivadavia 5000',
          barrio: 'Caballito',
        ),
        obraIds: ['obra_011', 'obra_012'],
        ordenVisita: [0, 1],
        distancia: 3500.0, // 3.5 km
        tiempoEstimado: 14.0, // ~14 min en bici
        modoTransporte: ModoTransporte.bici,
        tipo: TipoRuta.publicaEstatica,
        creadorId: 'user_002',
        fechaCreacion: DateTime(2024, 12, 5),
      ),
      
      // Ruta 6: Boedo a Parque Patricios (A pie)
      Ruta(
        id: 'ruta_006',
        nombre: 'Caminata Boedo - Parque Patricios',
        puntoA: Ubicacion(
          lat: -34.6300,
          lng: -58.4200,
          direccion: 'Av. Boedo 800',
          barrio: 'Boedo',
        ),
        puntoB: Ubicacion(
          lat: -34.6400,
          lng: -58.4000,
          direccion: 'Av. Caseros 3000',
          barrio: 'Parque Patricios',
        ),
        obraIds: ['obra_013', 'obra_014'],
        ordenVisita: [0, 1],
        distancia: 2800.0, // 2.8 km
        tiempoEstimado: 34.0, // ~34 min a pie
        modoTransporte: ModoTransporte.aPie,
        tipo: TipoRuta.privada,
        creadorId: 'user_001',
        fechaCreacion: DateTime(2024, 12, 10),
      ),
    ];
  }

  /// Inicializar usuario mock
  static Future<void> _initializeUsuario() async {
    final localDataSource = UsuarioLocalDataSourceImpl();
    
    // Verificar si ya hay un usuario
    final usuarioExistente = await localDataSource.getUsuario();
    if (usuarioExistente != null) {
      return; // Ya hay un usuario, no inicializar
    }

    // Crear usuario mock (visitante por defecto)
    final usuario = _getMockUsuario();
    final model = UsuarioModel.fromEntity(usuario);
    await localDataSource.saveUsuario(model);
  }

  /// Obtener usuario mock
  static Usuario _getMockUsuario() {
    return Usuario(
      id: 'user_001',
      nombre: 'Juan Pérez',
      email: 'juan.perez@example.com',
      foto: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400',
      tipoUsuario: TipoUsuario.visitante,
      fechaRegistro: DateTime(2024, 1, 15),
      artistaId: null, // No es artista
    );
  }
}

