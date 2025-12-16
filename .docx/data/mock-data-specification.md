# 📦 Mock Data Specification - Graffiti Trails MVP1

## 📋 Objetivo

Especificación de datos de ejemplo (mock data) para desarrollo y testing del MVP1 cuando no hay API disponible.

---

## 🎯 Estrategia: Datos Locales en JSON

Para MVP1, usaremos un archivo JSON con datos de ejemplo que se carga al iniciar la app.

**Ubicación:** `assets/data/mock_data.json`

---

## 📊 Estructura del JSON

```json
{
  "obras": [
    // Array de obras (20-30 obras de ejemplo)
  ],
  "artistas": [
    // Array de artistas (10-15 artistas)
  ],
  "version": "1.0.0",
  "fechaActualizacion": "2024-12-12T00:00:00Z"
}
```

---

## 🎨 Obras de Ejemplo (20 obras)

### Distribución por Categoría
- **Graffiti:** 6 obras
- **Mural:** 8 obras
- **Escultura:** 4 obras
- **Performance:** 2 obras

### Distribución Geográfica
- **Palermo:** 8 obras
- **San Telmo:** 4 obras
- **La Boca:** 3 obras
- **Centro:** 3 obras
- **Villa Crespo:** 2 obras

### Características
- Todas con imágenes (URLs de ejemplo o placeholders)
- Variedad de artistas (5-8 artistas diferentes)
- Fechas variadas (2020-2024)
- Likes variados (10-500)

---

## 👤 Artistas de Ejemplo (8 artistas)

### Características
- Mix de artistas conocidos y emergentes
- Algunos con Instagram, otros sin
- Bios variadas (algunas cortas, algunas largas)
- Fotos de perfil (algunas con, algunas sin)

---

## 📝 Ejemplo Completo de Obra

```json
{
  "id": "obra-001",
  "titulo": "Colores de la Ciudad",
  "artistaId": "artista-001",
  "categoria": "mural",
  "ubicacion": {
    "latitud": -34.5889,
    "longitud": -58.3977,
    "direccion": "Av. Santa Fe 3200",
    "barrio": "Palermo",
    "ciudad": "Buenos Aires",
    "pais": "Argentina"
  },
  "imageUrl": "https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800",
  "imageUrls": [
    "https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800",
    "https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?w=800"
  ],
  "fechaCreacion": "2023-03-15T00:00:00Z",
  "descripcion": "Mural creado durante el festival de arte urbano de Buenos Aires. Representa la diversidad cultural de la ciudad a través de colores vibrantes y formas abstractas.",
  "likes": 142,
  "isVerified": true,
  "fechaRegistro": "2024-01-10T00:00:00Z",
  "tecnica": "Aerosol y pincel",
  "tags": ["festival", "colorido", "centro", "abstracto"]
}
```

---

## 📝 Ejemplo Completo de Artista

```json
{
  "id": "artista-001",
  "nombre": "Diego Mural",
  "bio": "Artista urbano argentino especializado en murales de gran formato. Su trabajo explora temas de identidad cultural y memoria colectiva. Ha participado en festivales internacionales de street art.",
  "imageUrl": "https://i.pravatar.cc/150?img=12",
  "instagramHandle": "diego_mural",
  "websiteUrl": "https://diegomural.com",
  "totalObras": 24,
  "totalLikes": 1250,
  "fechaRegistro": "2023-01-01T00:00:00Z",
  "isVerified": true
}
```

---

## 🗺️ Coordenadas de Buenos Aires

### Zonas Principales

- **Palermo:** lat: -34.5889, lng: -58.3977
- **San Telmo:** lat: -34.6211, lng: -58.3731
- **La Boca:** lat: -34.6345, lng: -58.3631
- **Centro:** lat: -34.6037, lng: -58.4370
- **Villa Crespo:** lat: -34.6000, lng: -58.4500

### Rango Válido para Obras

- **Latitud:** -34.7 a -34.5
- **Longitud:** -58.6 a -58.3

---

## 📋 Checklist de Datos Mock

### Obras (20 mínimo)
- [ ] 6 obras de categoría "graffiti"
- [ ] 8 obras de categoría "mural"
- [ ] 4 obras de categoría "escultura"
- [ ] 2 obras de categoría "performance"
- [ ] Distribuidas en 5 barrios diferentes
- [ ] Variedad de artistas (mínimo 5 artistas diferentes)
- [ ] Todas con imageUrl válida
- [ ] Fechas variadas (2020-2024)
- [ ] Likes variados (10-500)

### Artistas (8 mínimo)
- [ ] 8 artistas únicos
- [ ] Algunos con Instagram, otros sin
- [ ] Algunos con website, otros sin
- [ ] Bios variadas (cortas y largas)
- [ ] Fotos de perfil (algunas con, algunas sin)
- [ ] Mix de verified y no verified

### Relaciones
- [ ] Cada obra tiene artistaId válido
- [ ] Artistas tienen al menos 2 obras cada uno
- [ ] Algunos artistas tienen muchas obras (5+)
- [ ] Algunos artistas tienen pocas obras (2-3)

---

## 🚀 Implementación

### Cargar Mock Data

```dart
// lib/data/datasources/local/mock_data_loader.dart

class MockDataLoader {
  static Future<Map<String, dynamic>> loadMockData() async {
    final String jsonString = await rootBundle.loadString('assets/data/mock_data.json');
    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
  
  static Future<List<ObraModel>> loadObras() async {
    final data = await loadMockData();
    final obrasJson = data['obras'] as List;
    return obrasJson.map((json) => ObraModel.fromJson(json)).toList();
  }
  
  static Future<List<ArtistaModel>> loadArtistas() async {
    final data = await loadMockData();
    final artistasJson = data['artistas'] as List;
    return artistasJson.map((json) => ArtistaModel.fromJson(json)).toList();
  }
}
```

### Inicializar en App

```dart
// En main.dart o injection_container.dart

Future<void> init() async {
  // ... otras inicializaciones
  
  // Cargar mock data si no hay datos cached
  final localDataSource = getIt<ObraLocalDataSource>();
  final obrasCached = await localDataSource.getObras();
  
  if (obrasCached.isEmpty) {
    // Primera vez, cargar mock data
    final mockObras = await MockDataLoader.loadObras();
    await localDataSource.cacheObras(mockObras);
    
    final mockArtistas = await MockDataLoader.loadArtistas();
    await getIt<ArtistaLocalDataSource>().cacheArtistas(mockArtistas);
  }
}
```

---

## 📝 Notas

- Los datos mock son **solo para desarrollo**
- En producción, se reemplazarán con API real
- Las imágenes pueden ser placeholders o URLs de Unsplash
- Los datos deben ser **realistas** para testing adecuado

---

*Documento creado: 12 de Diciembre, 2025*  
*Próximo paso: Crear archivo JSON completo con 20 obras y 8 artistas*
