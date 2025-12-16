# 📋 Requerimientos - Graffiti Trails MVP1

## 🎯 Requerimientos Funcionales

### RF-01: Feed Principal de Obras

**Descripción:** La app debe mostrar un feed visual de obras de arte callejero con información esencial.

**Funcionalidades:**
- RF-01.1: Mostrar lista/grid de obras con imagen, título, artista, categoría y ubicación
- RF-01.2: Implementar scroll infinito o paginación
- RF-01.3: Permitir búsqueda de obras por nombre, artista o barrio
- RF-01.4: Filtrar obras por categoría (graffiti, mural, escultura, performance)
- RF-01.5: Filtrar obras por artista (selección múltiple)
- RF-01.6: Mostrar contador de obras visibles
- RF-01.7: Navegar a detalle de obra desde el feed
- RF-01.8: Navegar a perfil de artista desde el feed

**Criterios de Aceptación:**
- Las imágenes se cargan progresivamente (lazy loading)
- La búsqueda muestra resultados en tiempo real
- Los filtros se pueden combinar (categoría + artista)
- Estados vacíos informativos cuando no hay resultados

---

### RF-02: Mapa de Arte Urbano (CORE)

**Descripción:** La app debe mostrar un mapa interactivo con todas las obras geolocalizadas.

**Funcionalidades:**
- RF-02.1: Mostrar mapa con pins diferenciados por categoría de obra
- RF-02.2: Mostrar ubicación actual del usuario (con permiso)
- RF-02.3: Implementar clustering cuando hay muchas obras cercanas
- RF-02.4: Al tocar un pin, mostrar bottom sheet con preview de la obra
- RF-02.5: Filtrar pins visibles por categoría y artista
- RF-02.6: Mostrar leyenda de categorías en el mapa
- RF-02.7: Funcionar offline con tiles en caché
- RF-02.8: Zoom y pan suaves
- RF-02.9: Mostrar contador de obras visibles en el mapa

**Criterios de Aceptación:**
- El mapa carga en menos de 2 segundos
- Los pins son claramente diferenciables por color/categoría
- El bottom sheet se abre/cierra con animación fluida
- Funciona sin conexión a internet (modo offline)

---

### RF-03: Detalle de Obra

**Descripción:** La app debe mostrar información completa de una obra individual.

**Funcionalidades:**
- RF-03.1: Mostrar imagen grande de la obra
- RF-03.2: Mostrar información completa: título, artista, categoría, ubicación, fecha
- RF-03.3: Navegar a ver obra en el mapa (removido: agregar a Top 10, ahora se agregan rutas al Top N)
- RF-03.4: Navegar a perfil del artista
- RF-03.5: Mostrar obra en el mapa (centrar y destacar)
- RF-03.6: Mostrar contador de likes (si aplica)

**Criterios de Aceptación:**
- La imagen se carga con placeholder mientras carga
- Las acciones tienen feedback visual inmediato
- La navegación es bidireccional (obra ↔ artista ↔ mapa)

---

### RF-04: Perfil de Artista

**Descripción:** La app debe mostrar el perfil completo de un artista con su catálogo de obras.

**Funcionalidades:**
- RF-04.1: Mostrar header con foto del artista y bio
- RF-04.2: Mostrar grid de todas las obras del artista
- RF-04.3: Mostrar link a Instagram del artista (si existe)
- RF-04.4: Mostrar estadísticas básicas (número de obras)
- RF-04.5: Navegar a detalle de obra desde el grid
- RF-04.6: Filtrar obras del artista por categoría (opcional)

**Criterios de Aceptación:**
- El grid es responsive y visualmente atractivo
- El link a Instagram abre en navegador externo
- Maneja casos donde no hay foto o bio del artista

---

### RF-05: Top N de Rutas del Usuario

> **IMPORTANTE:** Cambio fundamental - Ahora se guardan **rutas** (no obras) en el Top N.

**Descripción:** La app debe permitir al usuario crear y gestionar su colección personal de hasta 10 rutas favoritas (Top N).

**Funcionalidades:**
- RF-05.1: Mostrar grid visual tipo galería de las rutas del Top N
- RF-05.2: Mostrar contador "X/10 rutas"
- RF-05.3: Permitir agregar ruta al Top N (máximo 10 rutas)
- RF-05.4: Permitir eliminar ruta del Top N
- RF-05.5: Permitir reordenar rutas por drag & drop
- RF-05.6: Persistir Top N localmente (offline)
- RF-05.7: Validar que no se agreguen rutas duplicadas
- RF-05.8: Mostrar feedback visual al agregar/eliminar/reordenar
- RF-05.9: Cada item muestra: preview de mapa, nombre de ruta, número de obras incluidas, distancia, modo de transporte

**Criterios de Aceptación:**
- El límite de 10 rutas es claro y se valida
- El drag & drop es intuitivo y fluido
- Los datos persisten después de cerrar la app
- Funciona completamente offline
- Disponible para Visitantes y Artistas

---

### RF-06: Crear Ruta Manual

**Descripción:** La app debe permitir crear rutas personalizadas entre dos puntos con obras seleccionadas.

**Funcionalidades:**
- RF-06.1: Permitir seleccionar punto A (inicio) en el mapa
- RF-06.2: Permitir seleccionar punto B (destino) en el mapa
- RF-06.3: Calcular y mostrar obras que están en el camino entre A y B
- RF-06.4: Permitir seleccionar obras deseadas de las encontradas (mínimo 1, máximo 15)
- RF-06.5: Filtrar obras por categoría y artista durante la selección
- RF-06.6: Permitir seleccionar medio de transporte (bici o a pie) - **Bici es el modo principal**
- RF-06.7: Calcular distancia total y tiempo estimado según transporte
- RF-06.8: Mostrar vista previa de la ruta en el mapa
- RF-06.9: Permitir reordenar obras antes de generar la ruta
- RF-06.10: Permitir nombrar la ruta (opcional, nombre automático si no se ingresa)
- RF-06.11: Permitir seleccionar tipo de ruta: Privada, Pública estática, o Pública dinámica (evento repetitivo)
- RF-06.12: Si es pública dinámica: Configurar repetición (diario/semanal/mensual/anual con rrule), fecha inicial, hora, punto de encuentro, tipo de lista de asistentes (libre/exclusiva)
- RF-06.13: Generar y guardar la ruta
- RF-06.14: Mostrar ruta guardada en el mapa con línea conectando puntos y pins numerados

**Criterios de Aceptación:**
- El flujo es claro y guiado (6 pasos)
- La búsqueda de obras en el camino usa un radio configurable (ej: 200m)
- El cálculo de tiempo es aproximado pero útil (bici: 4 min/km, a pie: 12 min/km)
- El modo bici es el recomendado y aparece como opción principal
- La ruta se puede guardar como privada, pública estática, o pública dinámica
- Las rutas dinámicas se repiten automáticamente según configuración (rrule)
- La ruta se puede guardar y recuperar después
- Funciona offline para rutas ya creadas

---

### RF-07: Gestión de Rutas

**Descripción:** La app debe permitir ver, editar y eliminar rutas guardadas (privadas, públicas estáticas y dinámicas).

**Funcionalidades:**
- RF-07.1: Mostrar lista de rutas guardadas del usuario (privadas y públicas)
- RF-07.2: Mostrar detalle de ruta con mapa, lista de obras y estadísticas
- RF-07.3: Permitir editar nombre de la ruta
- RF-07.4: Permitir eliminar ruta
- RF-07.5: Permitir abrir ruta en el mapa
- RF-07.6: Si es pública dinámica: Ver próximos eventos, lista de asistentes, convertir a estática
- RF-07.7: Si es pública estática: Convertir a dinámica (evento repetitivo)
- RF-07.8: Persistir rutas localmente

**Criterios de Aceptación:**
- Las rutas se guardan localmente y persisten
- La edición es simple e intuitiva
- La eliminación requiere confirmación
- Las rutas públicas pueden ser vistas por otros usuarios
- Las rutas dinámicas muestran próximos eventos según rrule

---

### RF-08: Rutas Públicas Dinámicas (Eventos Repetitivos)

> **NOTA:** Las "Salidas Grupales" ahora son parte de las rutas públicas dinámicas (RF-06.11-12) y encuentros de artistas (RF-09).

**Descripción:** La app debe permitir gestionar rutas públicas dinámicas que se repiten automáticamente según configuración.

**Funcionalidades:**
- RF-08.1: Ver rutas públicas dinámicas disponibles (de otros usuarios)
- RF-08.2: Unirse a rutas dinámicas (si lista es libre)
- RF-08.3: Ver próximos eventos de rutas dinámicas según rrule
- RF-08.4: Ver lista de asistentes a eventos próximos
- RF-08.5: Recibir notificaciones de eventos próximos (si hay backend)
- RF-08.6: Cancelar asistencia a evento
- RF-08.7: Compartir ruta dinámica por WhatsApp, Instagram, link o código

**Criterios de Aceptación:**
- Las rutas dinámicas se repiten automáticamente según configuración (rrule)
- Los eventos futuros se calculan correctamente
- La lista de asistentes se actualiza en tiempo real (si hay backend)
- El compartir funciona con las opciones disponibles
- Si no hay backend, simular asistentes localmente

---

### RF-09: Encuentros de Artistas

> **NUEVO:** Solo artistas pueden crear encuentros.

**Descripción:** La app debe permitir a artistas crear encuentros para anunciar cuando van a pintar en vivo en un lugar específico.

**Funcionalidades:**
- RF-09.1: Artistas pueden crear encuentro con ubicación, fecha, hora y descripción
- RF-09.2: Los encuentros pueden ser repetitivos (usando rrule: diario/semanal/mensual/anual)
- RF-09.3: Visitantes pueden ver encuentros próximos en el mapa (pin especial)
- RF-09.4: Visitantes pueden unirse a encuentros y recibir notificaciones
- RF-09.5: Mostrar lista de asistentes al encuentro
- RF-09.6: Compartir encuentro por WhatsApp, Instagram, link o código
- RF-09.7: Artista puede cancelar o editar encuentro (solo creador)
- RF-09.8: Si es repetitivo: Mostrar próximos eventos según rrule

**Criterios de Aceptación:**
- Solo usuarios tipo 'artista' pueden crear encuentros
- El formulario valida fecha futura y hora válida
- La ubicación es requerida y debe estar en Buenos Aires (CABA)
- Los encuentros repetitivos se calculan correctamente
- El compartir funciona con las opciones disponibles
- Si no hay backend, simular asistentes localmente

---

### RF-09: Búsqueda y Filtros

**Descripción:** La app debe permitir buscar y filtrar obras de manera eficiente.

**Funcionalidades:**
- RF-09.1: Búsqueda por texto (obra, artista, barrio)
- RF-09.2: Filtro por categoría (múltiple selección)
- RF-09.3: Filtro por artista (múltiple selección con búsqueda)
- RF-09.4: Combinar filtros (categoría + artista)
- RF-09.5: Mostrar badges de filtros activos
- RF-09.6: Limpiar filtros fácilmente
- RF-09.7: Aplicar filtros en Feed y Mapa

**Criterios de Aceptación:**
- La búsqueda es en tiempo real
- Los filtros se pueden combinar
- Los badges muestran claramente qué está filtrado
- Los filtros funcionan en todas las pantallas relevantes

---

### RF-12: Tipos de Usuario

> **NUEVO:** Sistema de tipos de usuario (Visitante y Artista).

**Descripción:** La app debe soportar dos tipos de usuario con permisos diferenciados.

**Funcionalidades:**
- RF-12.1: Usuario selecciona tipo al registrarse: 'visitante' o 'artista'
- RF-12.2: El tipo de usuario no puede cambiarse en MVP1
- RF-12.3: Visitantes: Pueden explorar, crear rutas, unirse a rutas dinámicas, unirse a encuentros
- RF-12.4: Artistas: Todas las funcionalidades de visitante + publicar obras + crear encuentros
- RF-12.5: La UI muestra botones adicionales para artistas ("Agregar Obra", "Crear Encuentro")
- RF-12.6: Validar permisos antes de permitir acciones restringidas

**Criterios de Aceptación:**
- La selección de tipo es clara y se hace al registrarse
- Los permisos se validan correctamente
- La UI refleja el tipo de usuario apropiadamente
- No se puede cambiar el tipo después del registro en MVP1

---

### RF-13: Modo Offline

**Descripción:** La app debe funcionar sin conexión a internet para funcionalidades core.

**Funcionalidades:**
- RF-10.1: Descargar y cachear datos de obras localmente
- RF-10.2: Cachear tiles del mapa para uso offline
- RF-13.3: Funcionar sin conexión: ver obras, mapas, rutas guardadas, Top N de rutas, encuentros guardados
- RF-10.4: Sincronizar datos cuando hay conexión (si aplica)
- RF-10.5: Mostrar indicador de estado offline
- RF-10.6: Guardar cambios localmente y sincronizar después

**Criterios de Aceptación:**
- Las funcionalidades core funcionan sin internet
- Los datos se cachean automáticamente
- El usuario puede usar la app durante caminatas sin señal
- La sincronización es transparente cuando hay conexión

---

## 🔧 Requerimientos Técnicos

### RT-01: Arquitectura

**Descripción:** La app debe seguir Clean Architecture con BLoC pattern.

**Requisitos:**
- RT-01.1: Separación en capas: Presentation, Domain, Data
- RT-01.2: Uso de BLoC/Cubit para gestión de estado
- RT-01.3: Inyección de dependencias (get_it o similar)
- RT-01.4: Repositorios como abstracción de fuentes de datos
- RT-01.5: Casos de uso para lógica de negocio
- RT-01.6: Modelos de datos separados por capa

---

### RT-02: Plataforma y Versiones

**Descripción:** La app debe funcionar en iOS y Android.

**Requisitos:**
- RT-02.1: Flutter SDK 3.16 o superior
- RT-02.2: Dart 3.0 o superior
- RT-02.3: iOS 12.0 o superior
- RT-02.4: Android API 21 (Android 5.0) o superior
- RT-02.5: Soporte para tablets (responsive)

---

### RT-03: Performance

**Descripción:** La app debe tener buen rendimiento y tiempos de carga aceptables.

**Requisitos:**
- RT-03.1: Mapa carga en menos de 2 segundos
- RT-03.2: Imágenes optimizadas y lazy loading
- RT-03.3: Clustering eficiente en mapas con muchas obras
- RT-03.4: Scroll fluido (60 FPS)
- RT-03.5: Uso eficiente de memoria
- RT-03.6: Cache inteligente de datos e imágenes

---

### RT-04: Almacenamiento Local

**Descripción:** La app debe persistir datos localmente de manera eficiente.

**Requisitos:**
- RT-04.1: Almacenar Top N de rutas del usuario (máximo 10 rutas)
- RT-04.2: Almacenar rutas creadas
- RT-04.3: Cachear datos de obras
- RT-04.4: Cachear imágenes
- RT-04.5: Cachear tiles del mapa
- RT-04.6: Usar base de datos local (SQLite/Hive) para datos estructurados
- RT-04.7: Usar SharedPreferences o similar para preferencias simples

---

### RT-05: Integración con APIs

**Descripción:** La app debe integrarse con APIs públicas para obtener datos.

**Requisitos:**
- RT-05.1: Integración con API de BA Cultura (GCBA) o BA Data
- RT-05.2: Fallback a datos JSON propios si API no disponible
- RT-05.3: Manejo de errores de red
- RT-05.4: Retry logic para requests fallidos
- RT-05.5: Timeout configurable
- RT-05.6: Parsing robusto de datos

---

### RT-06: Mapas

**Descripción:** La app debe mostrar mapas interactivos con buen rendimiento.

**Requisitos:**
- RT-06.1: Usar Leaflet (preferido) o Maps JS API
- RT-06.2: Soporte offline con tiles en caché
- RT-06.3: Clustering de markers
- RT-06.4: Custom markers por categoría
- RT-06.5: Dibujo de rutas en el mapa
- RT-06.6: Geocoding para búsqueda de direcciones

---

### RT-07: Navegación

**Descripción:** La app debe tener navegación clara y predecible.

**Requisitos:**
- RT-07.1: Stack navigation para flujos lineales
- RT-07.2: Tab navigation para secciones principales
- RT-07.3: Bottom sheets para previews rápidos
- RT-07.4: Modales para acciones secundarias
- RT-07.5: Deep linking (opcional para MVP1)

---

### RT-08: Testing

**Descripción:** La app debe tener tests básicos para funcionalidades críticas.

**Requisitos:**
- RT-08.1: Unit tests para casos de uso y lógica de negocio
- RT-08.2: Widget tests para componentes críticos
- RT-08.3: Integration tests para flujos principales (opcional MVP1)

---

### RT-09: Accesibilidad

**Descripción:** La app debe ser accesible según estándares WCAG AA.

**Requisitos:**
- RT-09.1: Contraste mínimo 4.5:1 para textos
- RT-09.2: Tamaños de toque mínimos (44x44px iOS, 48x48px Android)
- RT-09.3: Labels semánticos para screen readers
- RT-09.4: Estados de foco visibles

---

### RT-10: Internacionalización

**Descripción:** La app debe estar preparada para múltiples idiomas (MVP1: Español).

**Requisitos:**
- RT-10.1: Strings externalizados
- RT-10.2: Estructura para agregar más idiomas en el futuro
- RT-10.3: Formato de fechas y números localizado

---

## 📊 Requerimientos No Funcionales

### RNF-01: Usabilidad

- La app debe ser intuitiva sin necesidad de tutorial extenso
- Los flujos principales deben completarse en menos de 3 pasos
- Feedback visual inmediato en todas las acciones
- Estados de carga claros y no bloqueantes

### RNF-02: Escalabilidad

- La arquitectura debe permitir agregar funcionalidades fácilmente
- El código debe ser modular y mantenible
- Preparado para MVP2 (IA generativa) sin refactor masivo

### RNF-03: Seguridad

- Datos del usuario almacenados localmente de forma segura
- Validación de inputs del usuario
- Manejo seguro de URLs y links externos

### RNF-04: Mantenibilidad

- Código limpio y bien documentado
- Estructura de carpetas clara
- Separación de responsabilidades
- Uso de patrones de diseño apropiados

---

## 🚫 Fuera de Alcance (MVP1)

- Generación automática de rutas con IA
- Descripciones generadas por IA
- Agrupación inteligente avanzada
- Optimización inteligente de rutas
- Realidad aumentada
- Audio tours
- Sistema de autenticación completo (opcional básico)
- Backend completo para rutas públicas dinámicas y encuentros (mock o básico)
- Notificaciones push (opcional básico)

---

---

## 📝 Notas de Actualización

**Última actualización:** 12 de Diciembre, 2025

**Cambios principales:**
- ✅ RF-05: Top 10 de obras → Top N de rutas (máximo 10 rutas)
- ✅ RF-06: Agregadas opciones de guardado (privada/pública estática/pública dinámica con rrule)
- ✅ RF-06: Modo de transporte actualizado (bici principal, a pie secundario)
- ✅ RF-08: Reemplazado "Salidas Grupales" por "Rutas Públicas Dinámicas"
- ✅ RF-09: Nuevo - Encuentros de Artistas
- ✅ RF-10: Nuevo - Publicar Obra (solo artistas)
- ✅ RF-12: Nuevo - Tipos de Usuario (Visitante/Artista)
- ✅ RF-03.3: Removido "agregar a Top 10" (ahora se agregan rutas al Top N)

---

*Documento generado por: Architect*  
*Basado en: research.md, personas.md, ux-flows.md, design-system.md, CHANGELOG-enfoques.md*  
*Fecha: Inicio del proyecto*  
*Última actualización: 12 de Diciembre, 2025*  
*Estado: Actualizado según CHANGELOG-enfoques.md*

