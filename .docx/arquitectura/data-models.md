# 📊 Modelos de Datos - Graffiti Trails MVP1

## 📋 Especificación Completa de Entidades

Esta documentación especifica los modelos de datos completos para el MVP1, incluyendo todos los campos, tipos, validaciones y relaciones.

---

## 🎨 Entidad: Obra

### Campos Completos

```dart
class Obra {
  final String id;                    // UUID o identificador único
  final String titulo;                // Título de la obra (requerido, max 100 chars)
  final String artistaId;              // ID del artista (FK)
  final String categoria;             // 'graffiti', 'mural', 'escultura', 'performance'
  final Ubicacion ubicacion;          // Objeto Ubicacion (requerido)
  final String imageUrl;               // URL de la imagen principal (requerido)
  final List<String>? imageUrls;      // URLs de imágenes adicionales (opcional)
  final DateTime? fechaCreacion;      // Fecha de creación de la obra (opcional)
  final String? descripcion;          // Descripción detallada (opcional, max 1000 chars)
  final int likes;                     // Contador de likes (default: 0)
  final bool isVerified;               // Si la obra está verificada (default: false)
  final DateTime fechaRegistro;        // Fecha en que se registró en la app
  final DateTime? fechaPublicacion;    // Fecha en que el artista publicó la obra (si aplica)
  final String? tecnica;               // Técnica utilizada (opcional)
  final List<String>? tags;           // Tags adicionales (opcional)
}
```

### Validaciones

- `titulo`: Requerido, 1-100 caracteres
- `artistaId`: Requerido, debe existir en base de artistas
- `categoria`: Requerido, debe ser uno de: 'graffiti', 'mural', 'escultura', 'performance'
- `ubicacion`: Requerido, debe tener lat y lng válidos
- `imageUrl`: Requerido, URL válida
- `descripcion`: Opcional, máximo 1000 caracteres
- `fechaCreacion`: Opcional, no puede ser futura

### Relaciones

- **Artista:** Many-to-One (muchas obras pertenecen a un artista)
- **Ruta:** Many-to-Many (una obra puede estar en múltiples rutas)

---

## 👤 Entidad: Artista

### Campos Completos

```dart
class Artista {
  final String id;                    // UUID o identificador único
  final String nombre;                 // Nombre del artista (requerido, max 100 chars)
  final String? bio;                   // Biografía (opcional, max 500 chars)
  final String? imageUrl;              // URL de foto del artista (opcional)
  final String? instagramHandle;      // Handle de Instagram sin @ (opcional)
  final String? websiteUrl;           // URL del sitio web (opcional)
  final List<String> obrasIds;        // Lista de IDs de obras (calculado, no persistido)
  final int totalObras;               // Contador de obras (calculado)
  final int totalLikes;               // Suma de likes de todas sus obras (calculado)
  final DateTime fechaRegistro;       // Fecha en que se registró en la app
  final bool isVerified;               // Si el artista está verificado (default: false)
}
```

### Validaciones

- `nombre`: Requerido, 1-100 caracteres
- `bio`: Opcional, máximo 500 caracteres
- `instagramHandle`: Opcional, formato válido (sin @, solo letras, números, puntos, guiones bajos)
- `websiteUrl`: Opcional, URL válida si se proporciona
- `imageUrl`: Opcional, URL válida si se proporciona

### Relaciones

- **Obra:** One-to-Many (un artista tiene muchas obras)

---

## 🗺️ Entidad: Ubicacion

### Campos Completos

```dart
class Ubicacion {
  final double latitud;                // Latitud (requerido, -90 a 90)
  final double longitud;               // Longitud (requerido, -180 a 180)
  final String? direccion;             // Dirección completa (opcional, ej: "Av. Corrientes 1234")
  final String? barrio;                // Barrio (opcional, ej: "Palermo")
  final String? ciudad;                // Ciudad (default: "Buenos Aires")
  final String? pais;                  // País (default: "Argentina")
  final String? codigoPostal;         // Código postal (opcional)
}
```

### Validaciones

- `latitud`: Requerido, rango -90.0 a 90.0
- `longitud`: Requerido, rango -180.0 a 180.0
- `direccion`: Opcional, máximo 200 caracteres
- `barrio`: Opcional, máximo 50 caracteres

### Uso

- Usado en `Obra.ubicacion`
- Usado en `Ruta.puntoA` y `Ruta.puntoB`
- Usado en `SalidaGrupal.puntoEncuentro`

---

## 🛣️ Entidad: Ruta

### Campos Completos

```dart
class Ruta {
  final String id;                     // UUID o identificador único
  final String nombre;                 // Nombre de la ruta (opcional, max 100 chars, auto-generado si vacío)
  final Ubicacion puntoA;             // Punto de inicio (requerido)
  final Ubicacion puntoB;              // Punto de destino (requerido)
  final List<String> obrasIds;         // IDs de obras seleccionadas (requerido, min 1, max 15)
  final List<int> ordenVisita;        // Orden de visita de obras (array de índices, requerido)
  final double distanciaTotal;         // Distancia total en km (calculado)
  final int tiempoEstimadoMinutos;     // Tiempo estimado en minutos (calculado)
  final String modoTransporte;        // 'bici' o 'a_pie' (requerido, default: 'bici')
  final String tipo;                  // 'privada', 'publica_estatica', 'publica_dinamica' (requerido)
  final String? rrule;                 // Regla de repetición (si es dinámica, formato rrule)
  final DateTime? fechaInicial;        // Fecha inicial del evento (si es dinámica)
  final TimeOfDay? hora;               // Hora del evento (si es dinámica)
  final Ubicacion? puntoEncuentro;     // Punto de encuentro (si es dinámica)
  final String? descripcion;           // Descripción del recorrido (opcional, max 500 chars)
  final String tipoListaAsistentes;    // 'libre' o 'exclusiva' (si es dinámica, default: 'libre')
  final List<String> asistentesIds;    // IDs de usuarios asistentes (si es dinámica)
  final String creadorId;              // ID del usuario creador (requerido)
  final DateTime fechaCreacion;       // Fecha de creación (auto-generado)
  final DateTime? fechaUltimaModificacion; // Fecha de última modificación
  final bool isFavorita;               // Si está marcada como favorita (default: false)
}
```

### Validaciones

- `nombre`: Opcional, máximo 100 caracteres. Si vacío, auto-generar: "Ruta [fecha]"
- `puntoA`: Requerido, diferente de puntoB
- `puntoB`: Requerido, diferente de puntoA
- `obrasIds`: Requerido, mínimo 1 obra, máximo 15 obras
- `ordenVisita`: Requerido, debe tener mismo length que obrasIds, valores únicos
- `modoTransporte`: Requerido, debe ser 'bici' o 'a_pie' (default: 'bici')
- `tipo`: Requerido, debe ser 'privada', 'publica_estatica', o 'publica_dinamica'
- `rrule`: Opcional, requerido si `tipo == 'publica_dinamica'`, formato válido rrule
- `fechaInicial`: Opcional, requerido si es dinámica, debe ser fecha futura
- `hora`: Opcional, requerido si es dinámica
- `puntoEncuentro`: Opcional, requerido si es dinámica
- `tipoListaAsistentes`: Opcional, requerido si es dinámica, debe ser 'libre' o 'exclusiva'
- `distanciaTotal`: Calculado automáticamente (no se valida input)
- `tiempoEstimadoMinutos`: Calculado automáticamente según modoTransporte

### Cálculos

- **Distancia Total:** Suma de distancias entre puntos consecutivos (A → obra1 → obra2 → ... → B)
- **Tiempo Estimado:**
  - **En bici (principal):** distanciaTotal (km) × 4 minutos/km (velocidad promedio 15 km/h)
  - **A pie:** distanciaTotal (km) × 12 minutos/km (velocidad promedio 5 km/h)

### Relaciones

- **Obra:** Many-to-Many (una ruta tiene muchas obras, una obra puede estar en muchas rutas)
- **Usuario:** Many-to-One (muchas rutas pertenecen a un usuario creador)
- **Usuario:** Many-to-Many (muchos usuarios pueden asistir a rutas dinámicas)

---

## 👥 Entidad: SalidaGrupal

### Campos Completos

```dart
class SalidaGrupal {
  final String id;                     // UUID o identificador único
  final String rutaId;                 // ID de la ruta asociada (FK, requerido)
  final DateTime fecha;                // Fecha de la salida (requerido, debe ser futura)
  final TimeOfDay horario;             // Hora de inicio (requerido)
  final Ubicacion puntoEncuentro;      // Punto de encuentro (requerido)
  final String? descripcion;          // Descripción del recorrido (opcional, max 500 chars)
  final String codigoInvitacion;       // Código único para unirse (auto-generado)
  final String creadorId;              // ID del usuario creador (requerido)
  final List<String> participantesIds; // IDs de participantes (default: [creadorId])
  final int maxParticipantes;          // Límite de participantes (opcional, default: sin límite)
  final DateTime fechaCreacion;        // Fecha de creación (auto-generado)
  final bool isCancelada;              // Si está cancelada (default: false)
  final String? motivoCancelacion;    // Motivo de cancelación (opcional)
}
```

### Validaciones

- `rutaId`: Requerido, debe existir en base de rutas
- `fecha`: Requerido, debe ser fecha futura
- `horario`: Requerido, formato HH:MM
- `puntoEncuentro`: Requerido
- `descripcion`: Opcional, máximo 500 caracteres
- `codigoInvitacion`: Auto-generado, formato: "SAL-[6 caracteres alfanuméricos]"
- `creadorId`: Requerido
- `maxParticipantes`: Opcional, mínimo 2 si se especifica

### Relaciones

- **Ruta:** Many-to-One (muchas salidas pueden usar la misma ruta)
- **Usuario:** Many-to-Many (muchos usuarios pueden participar en una salida)

---

## ⭐ Entidad: Top10Item

### Campos Completos

```dart
class Top10Item {
  final String obraId;                 // ID de la obra (FK, requerido)
  final int posicion;                  // Posición en el ranking (1-10, requerido)
  final DateTime fechaAgregado;        // Fecha en que se agregó (auto-generado)
}
```

### Validaciones

- `obraId`: Requerido, debe existir en base de obras
- `posicion`: Requerido, rango 1-10
- No se permiten duplicados (misma obraId)

### Colección

- El Top 10 del usuario es una lista de `Top10Item` ordenada por `posicion`
- Máximo 10 items
- Al agregar, si ya hay 10, se debe eliminar el último o pedir confirmación

---

## 📱 Entidad: Usuario (Simplificado para MVP1)

### Campos Completos

```dart
class Usuario {
  final String id;                     // UUID o identificador único
  final String tipoUsuario;            // 'visitante' o 'artista' (requerido, no cambiable en MVP)
  final String? nombre;                // Nombre del usuario (opcional)
  final String? email;                 // Email (opcional, para futuro login)
  final String? fotoUrl;               // URL de foto de perfil (opcional)
  final List<String> topNRutasIds;     // IDs de rutas en Top N (máximo 10) - CAMBIO: ahora rutas, no obras
  final List<String> rutasIds;         // IDs de rutas creadas
  final List<String> rutasAsistidasIds; // IDs de rutas dinámicas a las que se unió
  final List<String> encuentrosIds;     // IDs de encuentros a los que se unió (solo visitantes)
  final List<String> encuentrosCreadosIds; // IDs de encuentros creados (solo artistas)
  final List<String> obrasPublicadasIds;  // IDs de obras publicadas (solo artistas)
  final DateTime fechaRegistro;        // Fecha de registro (auto-generado)
}
```

### Validaciones

- `tipoUsuario`: Requerido, debe ser 'visitante' o 'artista'
- `tipoUsuario`: No puede cambiarse después del registro en MVP1
- `topNRutasIds`: Máximo 10 rutas
- `obrasPublicadasIds`: Solo disponible si `tipoUsuario == 'artista'`
- `encuentrosCreadosIds`: Solo disponible si `tipoUsuario == 'artista'`

### Nota MVP1

- En MVP1, el usuario puede ser anónimo (sin registro)
- Los datos se guardan localmente asociados a un `deviceId`
- No hay autenticación en MVP1
- El tipo de usuario se selecciona al registrarse y no puede cambiarse

---

## 🔄 Relaciones entre Entidades

### Diagrama de Relaciones

```
Usuario
  ├── 1:N → Top10Item (máximo 10)
  ├── 1:N → Ruta (rutas creadas)
  └── M:N → SalidaGrupal (creadas + participando)

Artista
  └── 1:N → Obra (obras del artista)

Obra
  ├── N:1 → Artista (artista de la obra)
  ├── N:1 → Ubicacion (ubicación de la obra)
  └── M:N → Ruta (obras en rutas)

Ruta
  ├── 1:1 → Ubicacion (puntoA)
  ├── 1:1 → Ubicacion (puntoB)
  ├── M:N → Obra (obras seleccionadas)
  └── 1:N → SalidaGrupal (salidas basadas en la ruta)

SalidaGrupal
  ├── N:1 → Ruta (ruta asociada)
  ├── 1:1 → Ubicacion (puntoEncuentro)
  └── M:N → Usuario (participantes)
```

---

## 📦 Estructura JSON (Mock Data)

### Ejemplo: Obra

```json
{
  "id": "obra-001",
  "titulo": "Colores de la Ciudad",
  "artistaId": "artista-001",
  "categoria": "mural",
  "ubicacion": {
    "latitud": -34.6037,
    "longitud": -58.4370,
    "direccion": "Av. Corrientes 1234",
    "barrio": "Palermo",
    "ciudad": "Buenos Aires",
    "pais": "Argentina"
  },
  "imageUrl": "https://example.com/obra-001.jpg",
  "imageUrls": [
    "https://example.com/obra-001-1.jpg",
    "https://example.com/obra-001-2.jpg"
  ],
  "fechaCreacion": "2023-03-15T00:00:00Z",
  "descripcion": "Mural creado durante el festival de arte urbano de Buenos Aires...",
  "likes": 142,
  "isVerified": true,
  "fechaRegistro": "2024-01-10T00:00:00Z",
  "tecnica": "Aerosol y pincel",
  "tags": ["festival", "colorido", "centro"]
}
```

### Ejemplo: Artista

```json
{
  "id": "artista-001",
  "nombre": "Diego Mural",
  "bio": "Artista urbano argentino especializado en murales de gran formato...",
  "imageUrl": "https://example.com/artista-001.jpg",
  "instagramHandle": "diego_mural",
  "websiteUrl": "https://diegomural.com",
  "totalObras": 24,
  "totalLikes": 1250,
  "fechaRegistro": "2023-01-01T00:00:00Z",
  "isVerified": true
}
```

### Ejemplo: Ruta

```json
{
  "id": "ruta-001",
  "nombre": "Murales de Palermo",
  "puntoA": {
    "latitud": -34.6037,
    "longitud": -58.4370,
    "direccion": "Av. Corrientes 1234",
    "barrio": "Palermo"
  },
  "puntoB": {
    "latitud": -34.5889,
    "longitud": -58.3977,
    "direccion": "Plaza Italia",
    "barrio": "Palermo"
  },
  "obrasIds": ["obra-001", "obra-002", "obra-003", "obra-004", "obra-005"],
  "ordenVisita": [0, 1, 2, 3, 4],
  "distanciaTotal": 2.3,
  "tiempoEstimadoMinutos": 12,
  "modoTransporte": "bici",
  "tipo": "publica_estatica",
  "creadorId": "usuario-001",
  "fechaCreacion": "2024-12-10T10:00:00Z",
  "isFavorita": false
}
```

---

## 🗄️ Persistencia Local (Hive)

### Boxes Necesarios

1. **`obras_box`** - Almacena `ObraModel`
2. **`artistas_box`** - Almacena `ArtistaModel`
3. **`rutas_box`** - Almacena `RutaModel`
4. **`salidas_box`** - Almacena `SalidaModel`
5. **`top10_box`** - Almacena `Top10ItemModel` (key: posicion, value: obraId)
6. **`usuario_box`** - Almacena `UsuarioModel` (solo 1 registro)
7. **`encuentros_box`** - Almacena `EncuentroModel` (key: encuentro.id)

### Índices para Búsqueda Rápida

- Obras por categoría
- Obras por artista
- Rutas por usuario
- Salidas por fecha

---

## ✅ Validaciones de Negocio

### Obra
- No puede haber dos obras con mismo título y misma ubicación (radio 10m)
- Categoría debe ser válida
- Ubicación debe estar en Buenos Aires, CABA (lat: -34.7 a -34.5, lng: -58.6 a -58.3)
- `artistaId`: Debe ser usuario tipo 'artista' si fue publicada por artista
- `fechaPublicacion`: Auto-generada cuando artista publica la obra

### Ruta
- Mínimo 1 obra, máximo 15 obras
- Punto A y B deben ser diferentes
- Distancia mínima entre A y B: 100 metros
- Orden de visita debe incluir todas las obras seleccionadas

### Encuentro
- Solo artistas pueden crear encuentros
- Fecha debe ser futura
- Ubicación debe estar en Buenos Aires (CABA)
- Si es repetitivo: `rrule` es requerido
- Artista creador se agrega automáticamente a `asistentesIds`

### Top N (Rutas)
- Máximo 10 rutas
- No se permiten duplicados (misma rutaId)
- Posiciones deben ser 1-10 sin gaps
- Solo se pueden agregar rutas (no obras)

---

*Documento creado: 12 de Diciembre, 2025*  
*Última actualización: 12 de Diciembre, 2025*  
*Cambios principales:*
- ✅ Top 10 de obras → Top N de rutas
- ✅ Rutas con tipos (privada/pública estática/pública dinámica)
- ✅ Modo de transporte (bici principal, a pie secundario)
- ✅ Entidad Encuentro agregada
- ✅ Tipo de usuario (visitante/artista)
- ✅ Campos de publicación de obras para artistas
