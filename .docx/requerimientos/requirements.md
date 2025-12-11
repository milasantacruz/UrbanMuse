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
- RF-03.3: Permitir agregar/quitar obra del Top 10
- RF-03.4: Navegar a perfil del artista
- RF-03.5: Mostrar obra en el mapa (centrar y destacar)
- RF-03.6: Mostrar contador de likes (si aplica)

**Criterios de Aceptación:**
- La imagen se carga con placeholder mientras carga
- Las acciones (agregar a Top 10) tienen feedback visual inmediato
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

### RF-05: Top 10 del Usuario

**Descripción:** La app debe permitir al usuario crear y gestionar su colección personal de 10 obras favoritas.

**Funcionalidades:**
- RF-05.1: Mostrar grid visual tipo galería de las obras del Top 10
- RF-05.2: Mostrar contador "X/10 obras"
- RF-05.3: Permitir agregar obra al Top 10 (máximo 10)
- RF-05.4: Permitir eliminar obra del Top 10
- RF-05.5: Permitir reordenar obras por drag & drop
- RF-05.6: Persistir Top 10 localmente (offline)
- RF-05.7: Validar que no se agreguen obras duplicadas
- RF-05.8: Mostrar feedback visual al agregar/eliminar/reordenar

**Criterios de Aceptación:**
- El límite de 10 obras es claro y se valida
- El drag & drop es intuitivo y fluido
- Los datos persisten después de cerrar la app
- Funciona completamente offline

---

### RF-06: Crear Ruta Manual

**Descripción:** La app debe permitir crear rutas personalizadas entre dos puntos con obras seleccionadas.

**Funcionalidades:**
- RF-06.1: Permitir seleccionar punto A (inicio) en el mapa
- RF-06.2: Permitir seleccionar punto B (destino) en el mapa
- RF-06.3: Calcular y mostrar obras que están en el camino entre A y B
- RF-06.4: Permitir seleccionar obras deseadas de las encontradas (mínimo 1, máximo 15)
- RF-06.5: Filtrar obras por categoría y artista durante la selección
- RF-06.6: Permitir seleccionar medio de transporte (a pie o en bici)
- RF-06.7: Calcular distancia total y tiempo estimado según transporte
- RF-06.8: Mostrar vista previa de la ruta en el mapa
- RF-06.9: Permitir reordenar obras antes de generar la ruta
- RF-06.10: Permitir nombrar la ruta (opcional, nombre automático si no se ingresa)
- RF-06.11: Generar y guardar la ruta
- RF-06.12: Mostrar ruta guardada en el mapa con línea conectando puntos y pins numerados

**Criterios de Aceptación:**
- El flujo es claro y guiado (6 pasos)
- La búsqueda de obras en el camino usa un radio configurable (ej: 200m)
- El cálculo de tiempo es aproximado pero útil
- La ruta se puede guardar y recuperar después
- Funciona offline para rutas ya creadas

---

### RF-07: Gestión de Rutas

**Descripción:** La app debe permitir ver, editar y eliminar rutas guardadas.

**Funcionalidades:**
- RF-07.1: Mostrar lista de rutas guardadas del usuario
- RF-07.2: Mostrar detalle de ruta con mapa, lista de obras y estadísticas
- RF-07.3: Permitir editar nombre de la ruta
- RF-07.4: Permitir eliminar ruta
- RF-07.5: Permitir abrir ruta en el mapa
- RF-07.6: Persistir rutas localmente

**Criterios de Aceptación:**
- Las rutas se guardan localmente y persisten
- La edición es simple e intuitiva
- La eliminación requiere confirmación

---

### RF-08: Salidas Grupales ("Walk Together")

**Descripción:** La app debe permitir crear y gestionar salidas grupales basadas en rutas.

**Funcionalidades:**
- RF-08.1: Crear salida grupal desde una ruta existente
- RF-08.2: Definir fecha de la salida (date picker)
- RF-08.3: Definir horario de salida (time picker)
- RF-08.4: Definir punto de encuentro (input + mapa)
- RF-08.5: Agregar descripción del recorrido (textarea)
- RF-08.6: Generar código de invitación o link compartible
- RF-08.7: Mostrar lista de participantes (si hay backend)
- RF-08.8: Compartir salida por WhatsApp, Instagram, link o código
- RF-08.9: Ver salidas próximas del usuario
- RF-08.10: Cancelar o editar salida (solo creador)

**Criterios de Aceptación:**
- El formulario valida fecha futura y hora válida
- El punto de encuentro es requerido
- El compartir funciona con las opciones disponibles
- Si no hay backend, simular participantes localmente

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

### RF-10: Modo Offline

**Descripción:** La app debe funcionar sin conexión a internet para funcionalidades core.

**Funcionalidades:**
- RF-10.1: Descargar y cachear datos de obras localmente
- RF-10.2: Cachear tiles del mapa para uso offline
- RF-10.3: Funcionar sin conexión: ver obras, mapas, rutas guardadas, Top 10
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
- RT-04.1: Almacenar Top 10 del usuario
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
- Backend completo para salidas grupales (mock o básico)
- Notificaciones push (opcional básico)

---

*Documento generado por: Architect*  
*Basado en: research.md, personas.md, ux-flows.md, design-system.md*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

