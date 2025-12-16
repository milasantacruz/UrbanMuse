# 🗺️ Roadmap de Implementación Incremental - Graffiti Trails MVP1

**Versión:** 2.0 - Actualizado con nuevos enfoques  
**Fecha:** Diciembre 2025  
**Alcance:** Buenos Aires (CABA), Rutas en Bici, Artistas/Visitantes, Top N de Rutas

---

## 📊 Resumen Ejecutivo

### Objetivo General
Implementar MVP1 de Graffiti Trails con enfoque en Buenos Aires, rutas en bici, dos tipos de usuario (Artista/Visitante), Top N de rutas, rutas públicas/dinámicas, publicación de obras y encuentros de artistas.

### Estrategia de Implementación
**Enfoque incremental por fases**, priorizando funcionalidades core y luego agregando features avanzadas. Cada fase es funcional y testeable.

### Estimación Total
- **Fase 1-3 (Core):** ~40-50 horas
- **Fase 4-5 (Rutas):** ~30-40 horas
- **Fase 6-7 (Artistas):** ~25-35 horas
- **Fase 8 (Polish):** ~15-20 horas
- **Total:** ~110-145 horas (~3-4 semanas full-time)

---

## 🎯 Fases de Implementación

### **FASE 1: Fundación y Setup** ⏱️ ~8-10 horas ✅ **COMPLETADA**
**Objetivo:** Configurar proyecto base, arquitectura, design tokens y estructura.

**Entregables:**
- ✅ Proyecto Flutter configurado
- ✅ Arquitectura Clean + BLoC establecida
- ✅ Design Tokens implementados
- ✅ Routing básico configurado (actualizado con nuevas rutas)
- ✅ Inyección de dependencias funcionando
- ✅ Dependencia `rrule` agregada e instalada
- ✅ Constantes actualizadas (Buenos Aires, tipos de usuario, Top N)
- ✅ Helper de rrule implementado
- ✅ Validadores actualizados

**Prioridad:** 🔴 Crítica  
**Estado:** ✅ Completada - Diciembre 2025

---

### **FASE 2: Modelos de Datos y Core** ⏱️ ~12-15 horas ✅ **COMPLETADA**
**Objetivo:** Implementar entidades, modelos y repositorios base con nuevos campos.

**Entregables:**
- ✅ Manejo de errores completo (Failures, Exceptions, ExceptionMapper)
- ✅ Configuración de red (DioClient, NetworkInfo, ApiEndpoints)
- ✅ Utilidades generales (rrule_helper, validators, distance_calculator, date_formatter)
- ✅ ApiEndpoints actualizados con nuevos endpoints (rutas, encuentros, publicar obra, topn)

**Prioridad:** 🔴 Crítica  
**Estado:** ✅ Completada - Diciembre 2025

---

### **FASE 3: Autenticación y Tipos de Usuario** ⏱️ ~8-10 horas
**Objetivo:** Sistema de registro/login con selección de tipo de usuario.

**Entregables:**
- ✅ Registro con selección Artista/Visitante
- ✅ Login funcional
- ✅ Gestión de sesión
- ✅ Persistencia de tipo de usuario
- ✅ UI diferenciada según tipo (botones adicionales para Artistas)

**Prioridad:** 🔴 Crítica

---

### **FASE 4: Mapa y Feed Base** ⏱️ ~12-15 horas
**Objetivo:** Implementar visualización de obras en mapa y feed.

**Entregables:**
- ✅ MapaPage con pins de obras
- ✅ FeedPage con grid de obras
- ✅ ObraDetailPage
- ✅ ArtistaProfilePage
- ✅ Filtros básicos

**Prioridad:** 🔴 Crítica

---

### **FASE 5: Sistema de Rutas (Core)** ⏱️ ~20-25 horas
**Objetivo:** Implementar creación y gestión de rutas con nuevas funcionalidades.

**Entregables:**
- ✅ CreateRutaPage (6 pasos) con modo transporte (bici/a pie)
- ✅ Opciones de guardado: Privada, Pública estática, Pública dinámica
- ✅ Integración con rrule para eventos repetitivos
- ✅ RutaListPage
- ✅ RutaDetailPage
- ✅ TopNPage (mostrando rutas, no obras)
- ✅ Navegación de rutas

**Prioridad:** 🔴 Crítica

---

### **FASE 6: Rutas Públicas y Dinámicas** ⏱️ ~10-15 horas
**Objetivo:** Implementar sistema de rutas públicas y eventos repetitivos.

**Entregables:**
- ✅ Lista de rutas públicas disponibles
- ✅ Sistema de unión a rutas públicas
- ✅ Configuración de eventos repetitivos (rrule)
- ✅ Lista de asistentes (libre/exclusiva)
- ✅ Notificaciones de eventos próximos (básico)

**Prioridad:** 🟡 Alta

---

### **FASE 7: Funcionalidades de Artistas** ⏱️ ~15-20 horas
**Objetivo:** Implementar publicación de obras y encuentros de artistas.

**Entregables:**
- ✅ PublicarObraPage (4 pasos)
- ✅ CrearEncuentroPage
- ✅ EncuentroDetailPage
- ✅ Sistema de notificaciones de encuentros
- ✅ Gestión de obras publicadas (editar/eliminar)

**Prioridad:** 🟡 Alta

---

### **FASE 8: Polish y Optimizaciones** ⏱️ ~15-20 horas
**Objetivo:** Mejorar UX, performance, offline y testing.

**Entregables:**
- ✅ Modo offline robusto
- ✅ Caché de imágenes
- ✅ Optimizaciones de performance
- ✅ Testing básico
- ✅ Manejo de errores mejorado
- ✅ Estados de carga y error

**Prioridad:** 🟢 Media

---

## 📅 Timeline Sugerido

### Semana 1: Fundación
- **Día 1-2:** Fase 1 (Setup) ✅ **COMPLETADA**
- **Día 3-4:** Fase 2 (Core) ✅ **COMPLETADA**
- **Día 5:** Fase 3 (Domain Entities) ✅ **COMPLETADA**
- **Día 6:** Fase 4 (Domain Repos) ✅ **COMPLETADA**

### Semana 2: Core Features
- **Día 1-2:** Fase 4 (Mapa/Feed)
- **Día 3-5:** Fase 5 (Rutas Core)

### Semana 3: Features Avanzadas
- **Día 1-2:** Fase 6 (Rutas Dinámicas)
- **Día 3-5:** Fase 7 (Artistas)

### Semana 4: Polish
- **Día 1-3:** Fase 8 (Polish)
- **Día 4-5:** Testing y ajustes finales

---

## 🔄 Dependencias entre Fases

```
Fase 1 (Setup)
    ↓
Fase 2 (Modelos)
    ↓
Fase 3 (Auth) ──┐
    ↓            │
Fase 4 (Mapa)    │
    ↓            │
Fase 5 (Rutas) ←─┘
    ↓
Fase 6 (Rutas Dinámicas)
    ↓
Fase 7 (Artistas)
    ↓
Fase 8 (Polish)
```

---

## 📦 Dependencias Nuevas Requeridas

### Agregar a `pubspec.yaml`:

```yaml
dependencies:
  # ... dependencias existentes ...
  
  # Para eventos repetitivos
  rrule: ^2.0.0
  
  # Para manejo de fechas/horas
  intl: ^0.19.0
  
  # Para cálculos de distancia/rutas
  geolocator: ^10.1.0
  google_maps_flutter: ^2.5.0  # o mapbox según preferencia
```

---

## 🎯 Criterios de Éxito por Fase

### Fase 1-3: ✅ Fundación Sólida
- Proyecto compila sin errores
- Arquitectura establecida
- Usuarios pueden registrarse y elegir tipo

### Fase 4: ✅ Visualización Básica
- Mapa muestra obras
- Feed muestra obras
- Navegación básica funciona

### Fase 5: ✅ Rutas Funcionales
- Usuario puede crear ruta (6 pasos)
- Puede guardar como privada/pública estática
- Top N muestra rutas guardadas

### Fase 6: ✅ Rutas Sociales
- Rutas públicas visibles para otros
- Eventos repetitivos funcionan
- Usuarios pueden unirse

### Fase 7: ✅ Artistas Activos
- Artistas pueden publicar obras
- Artistas pueden crear encuentros
- Visitantes pueden unirse a encuentros

### Fase 8: ✅ MVP Completo
- App funcional end-to-end
- Performance aceptable
- Modo offline básico
- Testing básico

---

## 🚨 Riesgos y Mitigaciones

### Riesgo 1: Complejidad de rrule
**Mitigación:** Usar librería probada, documentación clara, tests unitarios

### Riesgo 2: Performance del mapa con muchas obras
**Mitigación:** Clustering, lazy loading, caché de tiles

### Riesgo 3: Sincronización offline/online
**Mitigación:** Estrategia offline-first, sync en background

### Riesgo 4: Validación de datos de artistas
**Mitigación:** MVP sin validación, agregar en v2

---

## 📝 Notas Importantes

1. **Buenos Aires específico:** Todos los mapas y ubicaciones deben ser de CABA
2. **Modo transporte:** Bici es principal, pero también soportar a pie
3. **Tipos de usuario:** No se puede cambiar de tipo en MVP
4. **Top N:** Máximo 10 rutas (no obras)
5. **rrule:** Usar para eventos repetitivos (diario/semanal/mensual/anual)
6. **Sin validación:** Artistas pueden publicar sin aprobación en MVP

---

---

## 📊 Estado de Implementación

### Fases Completadas:
- ✅ **Fase 1: Fundación y Setup** - Completada el 12 de Diciembre, 2025
  - T1.1: Configuración inicial ✅
  - T1.2: Inyección de dependencias ✅
  - T1.3: Tema y Design Tokens ✅
  - T1.4: Configuración de rutas ✅
  - T2.3: Utilidades generales ✅

- ✅ **Fase 2: Core y Utilidades** - Completada el 12 de Diciembre, 2025
  - T2.1: Manejo de errores ✅
  - T2.2: Configuración de red ✅
  - T2.3: Utilidades generales ✅

- ✅ **Fase 3: Domain Layer - Entidades** - Completada el 12 de Diciembre, 2025
  - T3.1: Entidad Obra ✅
  - T3.2: Entidad Artista ✅
  - T3.3: Entidad Ruta ✅
  - T3.4: Entidad Encuentro ✅
  - T3.5: Entidad Usuario ✅

- ✅ **Fase 4: Domain Layer - Repositorios** - Completada el 12 de Diciembre, 2025
  - T4.1: ObraRepository ✅
  - T4.2: ArtistaRepository ✅
  - T4.3: RutaRepository ✅
  - T4.4: TopNRepository ✅
  - T4.5: EncuentroRepository ✅
  - T4.6: PublicarObraRepository ✅
  - T4.7: UsuarioRepository ✅

- ✅ **Fase 5: Domain Layer - Use Cases** - Completada el 12 de Diciembre, 2025
  - T5.1: Use Cases de Obra ✅
  - T5.2: Use Cases de Artista ✅
  - T5.3: Use Cases de Ruta ✅
  - T5.4: Use Cases de Top N ✅
  - T5.5: Use Cases de Encuentro ✅
  - T5.6: Use Cases de Publicar Obra ✅
  - T5.7: Use Cases de Usuario ✅

- ✅ **Fase 6: Data Layer - Models** - Completada el 12 de Diciembre, 2025
  - T6.1: Model Obra ✅
  - T6.2: Model Artista ✅
  - T6.3: Model Ruta ✅
  - T6.4: Model Encuentro ✅
  - T6.5: Model Usuario ✅
  - T6.6: Model TopN ✅
  - T6.7: Model Ubicacion ✅

- ✅ **Fase 7: Data Layer - Data Sources** - Completada el 12 de Diciembre, 2025
  - T7.1: Configuración de Hive ✅
  - T7.2: ObraLocalDataSource ✅
  - T7.3: ObraRemoteDataSource ✅
  - T7.4: ArtistaLocalDataSource y RemoteDataSource ✅
  - T7.5: RutaLocalDataSource ✅
  - T7.6: TopNLocalDataSource ✅
  - T7.7: EncuentroLocalDataSource ✅
  - T7.8: UsuarioLocalDataSource ✅
  - T7.9: PublicarObraLocalDataSource ✅

- ✅ **Fase 8: Data Layer - Repositories (Implementación)** - Completada el 12 de Diciembre, 2025
  - T8.1: ObraRepositoryImpl ✅
  - T8.2: ArtistaRepositoryImpl ✅
  - T8.3: RutaRepositoryImpl ✅
  - T8.4: TopNRepositoryImpl ✅
  - T8.5: EncuentroRepositoryImpl ✅
  - T8.6: PublicarObraRepositoryImpl ✅
  - T8.7: UsuarioRepositoryImpl ✅

- ✅ **Fase 9: Presentation Layer - BLoCs** - Completada el 12 de Diciembre, 2025
  - T9.1: ObraBloc ✅
  - T9.2: ArtistaCubit ✅
  - T9.3: RutaBloc ✅
  - T9.4: TopNCubit ✅
  - T9.5: EncuentroCubit ✅
  - T9.6: PublicarObraCubit ✅
  - T9.7: UsuarioCubit ✅

- ✅ **Fase 10: Presentation Layer - Widgets** - Completada el 12 de Diciembre, 2025
  - T10.1: CustomMap ✅
  - T10.2: ObraMarker y EncuentroMarker ✅
  - T10.3: RutaPolyline ✅
  - T10.4: RRuleSelector ✅
  - T10.5: StepIndicator ✅
  - T10.6: FotoUploader ✅
  - T10.7: InformacionForm ✅
  - T10.8: UbicacionSelector ✅

- ✅ **Fase 11: Presentation Layer - Páginas** - Completada el 12 de Diciembre, 2025
  - T11.1: MapaPage ✅
  - T11.2: FeedPage ✅
  - T11.3: ObraDetailPage ✅
  - T11.4: ArtistaProfilePage ✅
  - T11.5: CreateRutaPage (multi-step) ✅
  - T11.6: RutaListPage y RutaDetailPage ✅
  - T11.7: TopNPage ✅
  - T11.8: EncuentroPages ✅
  - T11.9: PublicarObraPage (multi-step) ✅

- ✅ **Fase 12: Integración y Datos Mock** - Completada el 12 de Diciembre, 2025
  - T12.1: Datos Mock ✅
  - T12.2: Integración Completa ✅
  - T12.3: Permisos ✅

### Fase Actual:
- 🔄 **Fase 13: Testing Básico** - Próxima

### Próximas Fases:
- ⏳ Fase 3: Autenticación y Tipos de Usuario
- ⏳ Fase 4: Mapa y Feed Base
- ⏳ Fase 5: Sistema de Rutas (Core)

---

*Roadmap actualizado: Diciembre 2025*  
*Última actualización: 12 de Diciembre, 2025 - Fase 11 completada*  
*Próxima revisión: Al completar Fase 12*

