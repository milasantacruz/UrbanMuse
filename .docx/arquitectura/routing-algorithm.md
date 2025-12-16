# 🛣️ Algoritmo de Cálculo de Rutas - Graffiti Trails MVP1

## 📋 Objetivo

Especificar el algoritmo para encontrar obras de arte urbano que están "en el camino" entre dos puntos (A y B) y calcular la ruta optimizada.

---

## 🎯 Requerimiento

**RF-06.3:** Calcular y mostrar obras que están en el camino entre punto A y punto B.

---

## 🔍 Algoritmo: Encontrar Obras en el Camino

### Estrategia: Radio de Búsqueda desde la Línea A→B

Para MVP1, usaremos un algoritmo simple y eficiente:

#### Paso 1: Definir Línea Base A→B
```
Línea base: Segmento recto desde punto A (latA, lngA) hasta punto B (latB, lngB)
```

#### Paso 2: Calcular Distancia de Cada Obra a la Línea

Para cada obra con ubicación `(latObra, lngObra)`:

1. **Calcular distancia perpendicular** desde la obra hasta la línea A→B
2. **Calcular distancia a lo largo de la línea** (proyección en el segmento)
3. **Filtrar obras:**
   - Distancia perpendicular ≤ radio (ej: 200m)
   - Proyección está dentro del segmento A→B (no antes de A ni después de B)

#### Paso 3: Ordenar Obras por Distancia a lo Largo de la Ruta

Ordenar obras encontradas por su posición proyectada en el segmento A→B (de A hacia B).

---

## 📐 Fórmulas de Cálculo

### Distancia entre Dos Puntos (Haversine)

```dart
double calcularDistancia(
  double lat1, double lng1,
  double lat2, double lng2
) {
  const double radioTierra = 6371.0; // km
  
  double dLat = _toRadians(lat2 - lat1);
  double dLng = _toRadians(lng2 - lng1);
  
  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(_toRadians(lat1)) * cos(_toRadians(lat2)) *
      sin(dLng / 2) * sin(dLng / 2);
  
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));
  
  return radioTierra * c; // distancia en km
}
```

### Distancia Perpendicular desde Punto a Línea

```dart
double distanciaPerpendicular(
  double latA, double lngA,  // Punto A
  double latB, double lngB,  // Punto B
  double latObra, double lngObra  // Punto Obra
) {
  // Vector AB
  double vecABLat = latB - latA;
  double vecABLng = lngB - lngA;
  
  // Vector AO (desde A hasta Obra)
  double vecAOLat = latObra - latA;
  double vecAOLng = lngObra - lngA;
  
  // Producto cruzado para área del paralelogramo
  double area = abs(vecABLat * vecAOLng - vecABLng * vecAOLat);
  
  // Longitud del segmento AB
  double longitudAB = calcularDistancia(latA, lngA, latB, lngB);
  
  // Distancia perpendicular = área / longitud
  return (area / longitudAB) * 111.0; // Convertir a km aproximado
}
```

### Proyección en el Segmento

```dart
double calcularProyeccion(
  double latA, double lngA,
  double latB, double lngB,
  double latObra, double lngObra
) {
  // Vector AB
  double vecABLat = latB - latA;
  double vecABLng = lngB - lngA;
  
  // Vector AO
  double vecAOLat = latObra - latA;
  double vecAOLng = lngObra - lngA;
  
  // Producto punto
  double productoPunto = vecABLat * vecAOLat + vecABLng * vecAOLng;
  
  // Longitud al cuadrado de AB
  double longitudAB2 = vecABLat * vecABLat + vecABLng * vecABLng;
  
  // Factor de proyección (0 = A, 1 = B)
  double factor = productoPunto / longitudAB2;
  
  return factor; // 0.0 a 1.0 si está en el segmento
}
```

---

## ⚙️ Parámetros Configurables

### Radio de Búsqueda

```dart
class RutaConfig {
  static const double radioBusquedaMetros = 200.0; // Radio por defecto: 200m
  static const double radioMinimo = 100.0;          // Mínimo: 100m
  static const double radioMaximo = 500.0;          // Máximo: 500m
}
```

**Justificación:**
- 200m es un balance entre encontrar obras relevantes y no saturar
- Usuario puede ajustar en el slider (Paso 3 de CreateRutaPage)

---

## 🧮 Cálculo de Distancia Total de Ruta

### Algoritmo: Suma de Segmentos

```
Distancia Total = 
  distancia(A → obra1) + 
  distancia(obra1 → obra2) + 
  distancia(obra2 → obra3) + 
  ... + 
  distancia(obraN → B)
```

**Optimización Simple (MVP1):**
- Ordenar obras por proyección en segmento A→B
- Calcular distancia sumando segmentos consecutivos
- **No se optimiza para minimizar distancia total** (eso sería TSP, muy complejo)

**Para MVP2:** Considerar algoritmo de optimización de ruta (TSP aproximado).

---

## ⏱️ Cálculo de Tiempo Estimado

### Fórmulas por Medio de Transporte

#### A Pie (Caminando)
```
tiempoMinutos = distanciaTotalKm × 12 minutos/km

Velocidad promedio: 5 km/h
Factor: 60 min / 5 km = 12 min/km
```

#### En Bici
```
tiempoMinutos = distanciaTotalKm × 4 minutos/km

Velocidad promedio: 15 km/h
Factor: 60 min / 15 km = 4 min/km
```

### Ejemplo

```
Ruta: 2.3 km
- A pie: 2.3 × 12 = 27.6 minutos ≈ 28 minutos
- En bici: 2.3 × 4 = 9.2 minutos ≈ 9 minutos
```

---

## 📍 Optimización de Orden de Visita

### Algoritmo Simple (MVP1)

1. **Ordenar por proyección:** Obras ordenadas por posición en segmento A→B
2. **Calcular distancia total** con ese orden
3. **Permitir reordenamiento manual** en Paso 6

### Algoritmo Avanzado (MVP2 - Futuro)

- **TSP (Traveling Salesman Problem):** Encontrar orden que minimice distancia total
- **Algoritmo:** Nearest Neighbor o 2-opt
- **Consideraciones:** Tiempo de cálculo vs optimización

---

## 🗺️ Implementación Técnica

### Librería Recomendada

**Para MVP1:** Implementación propia con fórmulas Haversine
- Simple
- Sin dependencias externas
- Suficiente para MVP1

**Para MVP2 (Futuro):** Considerar:
- `osrm` (Open Source Routing Machine) - Para rutas reales de calles
- `google_maps_services` - Para rutas reales (requiere API key)

### Estructura de Código

```dart
// lib/core/utils/routing_calculator.dart

class RoutingCalculator {
  static List<Obra> encontrarObrasEnCamino({
    required Ubicacion puntoA,
    required Ubicacion puntoB,
    required List<Obra> todasLasObras,
    double radioMetros = 200.0,
  }) {
    // 1. Filtrar obras dentro del radio
    // 2. Calcular proyección en segmento
    // 3. Filtrar obras dentro del segmento
    // 4. Ordenar por proyección
    // 5. Retornar lista ordenada
  }
  
  static double calcularDistanciaTotal({
    required Ubicacion puntoA,
    required Ubicacion puntoB,
    required List<Obra> obras,
    required List<int> ordenVisita,
  }) {
    // Calcular suma de distancias entre puntos consecutivos
  }
  
  static int calcularTiempoEstimado({
    required double distanciaKm,
    required String transporte, // 'a_pie' o 'en_bici'
  }) {
    // Aplicar fórmula según transporte
  }
}
```

---

## 🧪 Casos de Prueba

### Caso 1: Ruta Simple
- **A:** (-34.6037, -58.4370) - Av. Corrientes 1234
- **B:** (-34.5889, -58.3977) - Plaza Italia
- **Radio:** 200m
- **Obras esperadas:** 5-8 obras típicamente

### Caso 2: Ruta Larga
- **A:** (-34.6037, -58.4370) - Centro
- **B:** (-34.5889, -58.3977) - Palermo
- **Radio:** 300m
- **Obras esperadas:** 15-20 obras

### Caso 3: Sin Obras en el Camino
- **A:** Zona sin obras
- **B:** Otra zona sin obras
- **Resultado:** Lista vacía, mostrar mensaje "No hay obras en este recorrido"

---

## ⚡ Optimizaciones de Performance

### Para Mapa con Muchas Obras

1. **Filtrado Precoz:**
   - Primero filtrar obras dentro de bounding box A→B (extendido por radio)
   - Luego calcular distancias solo para esas obras

2. **Caché de Cálculos:**
   - Cachear distancias calculadas
   - Invalidar solo cuando cambian A o B

3. **Límite de Resultados:**
   - Máximo 50 obras encontradas inicialmente
   - Usuario puede aumentar radio si necesita más

---

## 📊 Ejemplo de Uso

```dart
// En CreateRutaPage, Paso 3

final obrasEnCamino = RoutingCalculator.encontrarObrasEnCamino(
  puntoA: ruta.puntoA,
  puntoB: ruta.puntoB,
  todasLasObras: todasLasObras,
  radioMetros: radioSeleccionado, // 200m por defecto
);

// Mostrar: "12 obras encontradas en el camino"
```

---

## 🔄 Flujo Completo

```
1. Usuario selecciona punto A
   ↓
2. Usuario selecciona punto B
   ↓
3. Sistema calcula línea A→B
   ↓
4. Sistema busca todas las obras en base de datos
   ↓
5. Para cada obra:
   - Calcula distancia perpendicular a línea A→B
   - Calcula proyección en segmento
   - Si distancia ≤ radio Y proyección entre 0 y 1:
     → Agregar a lista de obras encontradas
   ↓
6. Ordenar obras por proyección (de A hacia B)
   ↓
7. Mostrar lista al usuario (Paso 4)
   ↓
8. Usuario selecciona obras deseadas
   ↓
9. Sistema calcula distancia total y tiempo estimado
   ↓
10. Usuario puede reordenar obras (Paso 6)
    ↓
11. Sistema recalcula distancia total con nuevo orden
```

---

## ✅ Criterios de Aceptación

- [ ] El algoritmo encuentra obras dentro del radio especificado
- [ ] Las obras están ordenadas de A hacia B
- [ ] El cálculo de distancia es preciso (±5% de error aceptable)
- [ ] El tiempo estimado es razonable (basado en velocidades promedio)
- [ ] Funciona con 0 obras encontradas (muestra mensaje apropiado)
- [ ] Funciona con muchas obras (50+ sin problemas de performance)
- [ ] El radio es configurable por el usuario (100m - 500m)

---

## 🚀 Implementación MVP1

### Fase 1: Algoritmo Básico
- Implementar fórmulas Haversine
- Implementar filtrado por radio
- Ordenamiento simple por proyección

### Fase 2: Optimizaciones
- Bounding box pre-filtrado
- Caché de cálculos
- Límite de resultados

### Fase 3 (MVP2): Rutas Reales
- Integración con OSRM o Google Maps
- Rutas por calles reales (no línea recta)
- Considerar tráfico y caminos peatonales

---

*Documento creado: 12 de Diciembre, 2025*  
*Última actualización: 12 de Diciembre, 2025*  
*Cambios principales:*
- ✅ Modo principal actualizado a bici (aunque a pie sigue disponible)
- ✅ Velocidades y tiempos ajustados según nuevo enfoque
