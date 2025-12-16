# 💾 Estrategia Offline/Online - Graffiti Trails MVP1

## 📋 Objetivo

Definir la estrategia de funcionamiento offline y sincronización de datos para MVP1.

---

## 🎯 Principio: Offline-First

**MVP1 funciona principalmente offline**, con capacidad de actualizar datos cuando hay conexión.

---

## 📦 Datos que se Cachean Localmente

### ✅ Siempre Disponibles Offline

1. **Obras:**
   - Todas las obras descargadas
   - Imágenes (con caché de imágenes)
   - Información completa (título, artista, ubicación, etc.)

2. **Artistas:**
   - Perfiles de artistas
   - Fotos de artistas
   - Links a Instagram/Web

3. **Rutas del Usuario:**
   - Todas las rutas creadas por el usuario
   - Obras seleccionadas en cada ruta
   - Configuración (transporte, orden, etc.)

4. **Top N del Usuario:**
   - Lista completa de hasta 10 rutas favoritas (CAMBIO: ahora rutas, no obras)
   - Orden personalizado
   - Preview de mapa, nombre, obras incluidas, distancia, modo de transporte

5. **Encuentros:**
   - Encuentros creados por el usuario (solo artistas)
   - Encuentros a los que se unió (visitantes)
   - Información de asistentes (si está disponible)

### ⚠️ Requieren Conexión

1. **Búsqueda de nuevas obras:**
   - Descargar obras nuevas desde API
   - Actualizar catálogo

2. **Sincronización:**
   - Actualizar datos existentes
   - Obtener nuevos artistas

3. **Rutas Públicas Dinámicas (si hay backend):**
   - Ver asistentes en tiempo real
   - Unirse a rutas dinámicas de otros usuarios
   - Ver próximos eventos repetitivos

4. **Encuentros (si hay backend):**
   - Ver asistentes en tiempo real
   - Unirse a encuentros de artistas
   - Recibir notificaciones de encuentros próximos

---

## 🔄 Estrategia de Sincronización

### Modelo: Cache-Then-Network

```
1. App inicia
   ↓
2. Cargar datos desde caché local (Hive)
   ↓
3. Mostrar datos cached inmediatamente
   ↓
4. En background (si hay conexión):
   - Verificar si hay actualizaciones
   - Descargar datos nuevos
   - Actualizar caché local
   - Notificar a UI si hay cambios
```

### Frecuencia de Sincronización

- **Al abrir app:** Intentar sincronizar en background
- **Pull-to-refresh:** Sincronización manual forzada
- **Cada 24 horas:** Sincronización automática (si hay conexión)

---

## 💾 Almacenamiento Local

### Hive Boxes

1. **`obras_box`**
   - Key: `obra.id`
   - Value: `ObraModel` completo
   - TTL: Sin expiración (persiste hasta actualización)

2. **`artistas_box`**
   - Key: `artista.id`
   - Value: `ArtistaModel` completo
   - TTL: Sin expiración

3. **`rutas_box`**
   - Key: `ruta.id`
   - Value: `RutaModel` completo
   - TTL: Sin expiración (datos del usuario)

4. **`topn_box`** (CAMBIO: ahora rutas, no obras)
   - Key: `posicion` (1-10)
   - Value: `rutaId`
   - TTL: Sin expiración (datos del usuario)

5. **`encuentros_box`**
   - Key: `encuentro.id`
   - Value: `EncuentroModel` completo
   - TTL: Sin expiración

### Caché de Imágenes

- **Librería:** `cached_network_image` o `flutter_cache_manager`
- **Estrategia:** Cachear imágenes automáticamente
- **Tamaño máximo:** 100MB de imágenes
- **Limpieza:** LRU (Least Recently Used) cuando se alcanza límite

---

## 🔌 Detección de Conexión

### Network Info

```dart
// lib/core/network/network_info.dart

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  @override
  Future<bool> get isConnected async {
    // Usar connectivity_plus package
    final result = await Connectivity().checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
```

### Uso en Repositorios

```dart
// lib/data/repositories/obra_repository_impl.dart

@override
Future<Either<Failure, List<Obra>>> getObras() async {
  try {
    // 1. Siempre intentar cargar desde caché primero
    final obrasCached = await localDataSource.getObras();
    
    // 2. Si hay conexión, intentar actualizar
    if (await networkInfo.isConnected) {
      try {
        final obrasRemote = await remoteDataSource.getObras();
        // Actualizar caché
        await localDataSource.cacheObras(obrasRemote);
        return Right(obrasRemote);
      } catch (e) {
        // Si falla red, retornar caché
        return Right(obrasCached);
      }
    }
    
    // 3. Sin conexión, retornar caché
    return Right(obrasCached);
  } catch (e) {
    return Left(CacheFailure());
  }
}
```

---

## 🚫 Funcionalidades Offline vs Online

### ✅ Funciona Completamente Offline

- Ver feed de obras (datos cached)
- Ver mapa con pins (datos cached)
- Ver detalle de obra
- Ver perfil de artista
- Crear rutas
- Gestionar Top 10
- Ver rutas guardadas
- Ver encuentros guardados
- Ver Top N de rutas

### ⚠️ Funciona Parcialmente Offline

- **Búsqueda:** Solo busca en datos cached
- **Filtros:** Solo filtra datos cached
- **Nuevas obras:** No se pueden descargar sin conexión

### ❌ Requiere Conexión

- Descargar nuevas obras desde API
- Actualizar catálogo de obras
- Sincronizar rutas públicas dinámicas (si hay backend)
- Sincronizar encuentros (si hay backend)
- Compartir rutas/encuentros (requiere generar link)

---

## 🔄 Sincronización de Datos

### Estrategia: Optimistic Updates

1. **Cambios del usuario (rutas, topN, encuentros):**
   - Se guardan inmediatamente en local
   - No requieren conexión
   - Persisten offline

2. **Datos del servidor (obras, artistas):**
   - Se descargan cuando hay conexión
   - Se actualizan en caché
   - Se muestran versiones cached cuando no hay conexión

### Manejo de Conflictos

**MVP1:** No hay conflictos porque:
- Obras y artistas son de solo lectura (no se editan)
- Rutas y Top 10 son locales al usuario
- Salidas grupales: Si hay backend, usar timestamps para resolver conflictos

---

## 📱 Estados de Conexión en UI

### Indicadores Visuales

1. **Sin conexión:**
   - Badge discreto: "Modo offline"
   - Mensaje en pull-to-refresh: "Sin conexión - Mostrando datos guardados"

2. **Con conexión:**
   - Sincronización silenciosa en background
   - Badge opcional: "Actualizado hace X minutos"

3. **Sincronizando:**
   - Spinner discreto en App Bar
   - No bloquea UI

---

## 🗄️ Estructura de Caché

### Orden de Prioridad

1. **Datos del usuario (rutas, topN, encuentros):** Siempre disponibles, nunca se eliminan
2. **Obras favoritas:** Prioridad alta, no se eliminan
3. **Obras vistas recientemente:** Prioridad media, se pueden limpiar
4. **Obras no vistas:** Prioridad baja, se pueden limpiar primero

### Política de Limpieza

- **Máximo tamaño caché:** 50MB de datos (sin contar imágenes)
- **Limpieza:** Eliminar obras no vistas en últimos 30 días
- **Mantener siempre:** Rutas en Top N, obras en rutas guardadas, encuentros del usuario

---

## 🧪 Casos de Prueba

### Caso 1: App Offline desde Inicio
- Usuario abre app sin conexión
- Debe mostrar datos cached (si existen)
- Debe mostrar mensaje "Modo offline" si no hay datos

### Caso 2: Perder Conexión Durante Uso
- Usuario está navegando con conexión
- Pierde conexión
- App continúa funcionando con datos cached
- Muestra indicador de modo offline

### Caso 3: Recuperar Conexión
- Usuario está en modo offline
- Recupera conexión
- App sincroniza en background
- Actualiza datos sin interrumpir uso

---

## 📊 Métricas de Caché

### Tamaños Estimados

- **Obra:** ~2KB (sin imágenes)
- **Artista:** ~1KB (sin foto)
- **Ruta:** ~500 bytes
- **Top N:** ~200 bytes
- **Encuentro:** ~1KB

**Total estimado para 100 obras:** ~300KB (sin imágenes)

### Imágenes

- **Imagen obra:** ~200KB promedio
- **100 obras:** ~20MB
- **Límite recomendado:** 100MB total

---

## ✅ Criterios de Aceptación

- [ ] App funciona completamente offline con datos cached
- [ ] Sincronización automática cuando hay conexión
- [ ] Indicadores claros de estado de conexión
- [ ] No se pierden datos del usuario (rutas, topN, encuentros)
- [ ] Caché se limpia automáticamente cuando es necesario
- [ ] Performance aceptable con 100+ obras cached

---

*Documento creado: 12 de Diciembre, 2025*  
*Última actualización: 12 de Diciembre, 2025*  
*Cambios principales:*
- ✅ Top 10 de obras → Top N de rutas
- ✅ Salidas grupales → Rutas públicas dinámicas y Encuentros
- ✅ Actualización de boxes de Hive
- ✅ Referencias actualizadas según nuevos modelos
