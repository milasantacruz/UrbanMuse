# 🛠️ Tech Stack - Graffiti Trails

## 📦 Dependencias Principales

### Framework Base
```yaml
flutter: ^3.16.0
dart: ^3.0.0
```

---

## 🎨 UI y Diseño

### Gestión de Estado
```yaml
flutter_bloc: ^8.1.3
  # BLoC pattern para gestión de estado
  # Alternativa: riverpod (no elegida para mantener consistencia con requerimientos)
```

**Justificación:** BLoC es el patrón requerido, bien documentado y escalable.

---

### Navegación
```yaml
go_router: ^12.1.3
  # Navegación declarativa y type-safe
  # Soporte para deep linking
```

**Justificación:** Mejor que Navigator tradicional, soporta rutas declarativas y deep linking.

---

### Tema y Color Scheme
```yaml
flex_color_scheme: ^7.3.1
  # Sistema de temas y colores flexible
  # Generación automática de temas Material Design 3
  # Soporte para light/dark mode
```

**Justificación:** 
- Facilita la implementación del design system con colores definidos
- Genera automáticamente temas Material Design 3 consistentes
- Soporte nativo para light/dark mode
- Integración fácil con los design tokens definidos

---

### Mapas
```yaml
flutter_map: ^6.1.0
  # Mapa basado en Leaflet, offline-friendly
  # Ligero y customizable

latlong2: ^0.8.1
  # Utilidades para coordenadas (compañero de flutter_map)
```

**Justificación:** 
- Leaflet es preferido según requerimientos (offline-friendly)
- Más ligero que Google Maps
- Mejor control sobre tiles y cache offline
- Gratis sin límites de uso

**Alternativa considerada:** `google_maps_flutter` - descartada por costos y límites de uso.

---

### Inyección de Dependencias
```yaml
get_it: ^7.6.4
  # Service locator para DI
  # Simple y eficiente
```

**Justificación:** Simple, eficiente, ampliamente usado en Flutter.

---

## 💾 Almacenamiento Local

### Base de Datos Local
```yaml
hive: ^2.2.3
hive_flutter: ^1.1.0
  # Base de datos NoSQL local
  # Rápida y fácil de usar
  # Ideal para datos estructurados simples
```

**Justificación:** 
- Más simple que SQLite para este caso de uso
- Rápida y eficiente
- Buen soporte para modelos Dart
- Alternativa: `drift` (SQLite) - más complejo pero más potente

---

### Preferencias
```yaml
shared_preferences: ^2.2.2
  # Almacenamiento de preferencias simples
  # Key-value store
```

**Justificación:** Estándar de Flutter para preferencias simples.

---

### Cache de Imágenes
```yaml
cached_network_image: ^3.3.1
  # Cache automático de imágenes de red
  # Placeholders y error handling
```

**Justificación:** Simplifica el cache de imágenes, maneja placeholders automáticamente.

---

## 🌐 Red y APIs

### Cliente HTTP
```yaml
dio: ^5.4.0
  # Cliente HTTP avanzado
  # Interceptors, timeouts, retry logic
```

**Justificación:** 
- Más potente que `http` package
- Soporte para interceptors, timeouts, retry
- Mejor manejo de errores

---

### Serialización
```yaml
json_annotation: ^4.8.1
json_serializable: ^6.7.1
build_runner: ^2.4.7
  # Generación automática de código para JSON
  # Type-safe parsing
```

**Justificación:** Generación automática de código, type-safe, menos errores manuales.

---

## 🗺️ Utilidades de Mapas y Geocoding

### Geocoding
```yaml
geocoding: ^2.1.1
  # Conversión dirección ↔ coordenadas
  # Búsqueda de direcciones
```

**Justificación:** Necesario para búsqueda de direcciones en creación de rutas.

---

### Cálculo de Rutas
```yaml
# Opción 1: API externa (gratuita limitada)
# Usar API de routing gratuita (OSRM, GraphHopper)

# Opción 2: Cálculo simple
# Calcular distancia euclidiana o usar algoritmo simple
# Para MVP1: cálculo básico es suficiente
```

**Nota:** Para MVP1, cálculo básico de distancia es suficiente. En MVP2 se puede integrar API de routing más sofisticada.

---

## 🎯 Utilidades Generales

### Validación
```yaml
# Validación manual o
formz: ^0.6.0
  # Validación de formularios type-safe
```

**Justificación:** Facilita validación de formularios de manera declarativa.

---

### Manejo de Erros
```yaml
dartz: ^0.10.1
  # Either type para manejo funcional de errores
  # Functional programming utilities
```

**Justificación:** 
- Either type para manejo funcional de errores
- Evita excepciones, usa tipos explícitos
- Mejor para testing

---

### Utilidades
```yaml
equatable: ^2.0.5
  # Comparación de objetos
  # Útil para estados de BLoC

uuid: ^4.2.1
  # Generación de IDs únicos
  # Para rutas y salidas grupales
```

**Justificación:** 
- `equatable`: Simplifica comparación de estados
- `uuid`: Generación de IDs únicos para entidades

---

## 🧪 Testing

### Testing
```yaml
flutter_test:
  sdk: flutter

mockito: ^5.4.4
  # Mocks para testing
  # Generación automática de mocks

bloc_test: ^9.1.5
  # Testing de BLoCs
  # Utilities para testear estados y eventos
```

**Justificación:** 
- `mockito`: Estándar para mocks en Flutter
- `bloc_test`: Facilita testing de BLoCs

---

## 🎨 UI Components (Opcional)

### Animaciones
```yaml
flutter_animate: ^4.3.0
  # Animaciones declarativas
  # Simplifica animaciones complejas
```

**Justificación:** Facilita animaciones fluidas sin código complejo.

---

### Drag and Drop
```yaml
flutter_reorderable_list: ^1.3.0
  # Lista reordenable
  # Para Top 10 drag & drop
```

**Justificación:** Simplifica implementación de drag & drop para Top 10.

---

## 📱 Permisos

### Permisos de Sistema
```yaml
permission_handler: ^11.1.0
  # Manejo de permisos (ubicación, etc.)
```

**Justificación:** Necesario para solicitar permisos de ubicación.

---

## 🔧 Desarrollo

### Linting y Formato
```yaml
# En dev_dependencies
flutter_lints: ^3.0.1
  # Reglas de linting recomendadas
```

**Justificación:** Mantiene código consistente y de calidad.

---

### Code Generation
```yaml
# Ya mencionado arriba
build_runner: ^2.4.7
  # Ejecuta generadores de código
```

---

## 📊 Estructura de pubspec.yaml

```yaml
name: graffiti_trails
description: Explorador urbano de arte callejero
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'
  flutter: ">=3.16.0"

dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_bloc: ^8.1.3
  equatable: ^2.0.5
  
  # Navigation
  go_router: ^12.1.3
  
  # Theme
  flex_color_scheme: ^7.3.1
  
  # Maps
  flutter_map: ^6.1.0
  latlong2: ^0.8.1
  geocoding: ^2.1.1
  
  # Dependency Injection
  get_it: ^7.6.4
  
  # Local Storage
  hive: ^2.2.3
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.2
  
  # Network
  dio: ^5.4.0
  
  # Serialization
  json_annotation: ^4.8.1
  
  # Utilities
  dartz: ^0.10.1
  uuid: ^4.2.1
  cached_network_image: ^3.3.1
  permission_handler: ^11.1.0
  
  # UI
  flutter_animate: ^4.3.0
  flutter_reorderable_list: ^1.3.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.1
  build_runner: ^2.4.7
  json_serializable: ^6.7.1
  mockito: ^5.4.4
  bloc_test: ^9.1.5
```

---

## 🔄 Alternativas Consideradas

### State Management
- **Riverpod:** Más moderno, pero BLoC es requerimiento
- **Provider:** Más simple, pero menos escalable

### Maps
- **Google Maps Flutter:** Descartado por costos y límites
- **Mapbox:** Potente pero requiere API key y tiene límites

### Local Storage
- **Drift (SQLite):** Más potente pero más complejo para MVP
- **Isar:** Moderno pero menos maduro

### HTTP Client
- **http package:** Más simple pero menos features
- **Chopper:** Más complejo, overkill para MVP

---

## 📈 Escalabilidad para MVP2

### Preparación para IA
- Arquitectura modular permite agregar módulo de IA sin refactor
- Casos de uso aislados facilitan integración de servicios externos
- Repository pattern permite cambiar fuente de datos fácilmente

### Futuras Integraciones
- **OpenAI API** o similar para generación de rutas
- **Firebase** para backend completo de salidas grupales
- **Analytics** (Firebase Analytics, Mixpanel)

---

## 🚀 Performance Considerations

### Optimizaciones Incluidas
- **Lazy loading** de imágenes
- **Clustering** en mapas
- **Cache** inteligente de datos
- **Code splitting** por módulos

### Monitoreo (Futuro)
- **Firebase Performance Monitoring**
- **Sentry** para error tracking

---

*Documento generado por: Architect*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

