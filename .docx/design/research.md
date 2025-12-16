# 🔍 Research - Graffiti Trails

## 📋 Etapa 1: Empatizar (Empathize)

> **📊 Análisis Detallado:** Para un análisis completo de competencia y FODA, consulta [`competitive-analysis.md`](./competitive-analysis.md)

### Contexto del Problema

El arte callejero (grafitis, murales, esculturas, performances) es una expresión cultural vibrante en **Buenos Aires (CABA)**, pero actualmente:

- **No existe un catálogo centralizado** accesible para explorar estas obras en la ciudad
- **La información está dispersa** en redes sociales, blogs y conocimiento local
- **Es difícil planificar rutas en bici** para descubrir arte urbano de manera organizada
- **No hay forma fácil de conectar** artistas con visitantes y entusiastas del arte callejero
- **Los artistas no tienen una plataforma** para publicar y documentar sus obras
- **La experiencia offline es limitada** cuando no hay conexión a internet

### Necesidades Identificadas

**Para Visitantes:**
1. **Descubrimiento visual:** Ver las obras antes de decidir visitarlas
2. **Navegación geográfica:** Ubicación precisa en mapas para llegar a las obras
3. **Planificación de rutas en bici:** Crear recorridos personalizados para andar en bici en grupo
4. **Top N de rutas:** Guardar hasta 10 rutas favoritas para acceso rápido
5. **Unirse a rutas públicas:** Participar en rutas grupales y eventos repetitivos
6. **Seguir encuentros de artistas:** Recibir notificaciones cuando artistas pintan en vivo
7. **Acceso offline:** Funcionalidad básica sin conexión a internet

**Para Artistas:**
1. **Publicar obras:** Documentar y publicar sus creaciones en el mapa
2. **Gestionar portfolio:** Ver todas sus obras en un solo lugar
3. **Crear encuentros:** Anunciar cuando van a pintar en vivo en un lugar específico
4. **Crear rutas:** Diseñar rutas temáticas con sus obras
5. **Top N de rutas:** Guardar hasta 10 rutas favoritas (propias o de otros)
6. **Conectar con visitantes:** Permitir que otros descubran su trabajo

### Insights del Mercado

- **APIs disponibles:** BA Cultura (GCBA) y BA Data ofrecen datos públicos de arte urbano en Buenos Aires
- **Tendencias:** El turismo urbano, ciclismo urbano y el interés por el arte callejero está en crecimiento en CABA
- **Competencia:** Apps similares suelen ser complejas o requieren IA desde el inicio
- **Oportunidad:** MVP simple, visual y funcional sin dependencia de IA, enfocado en Buenos Aires
- **Ciclismo urbano:** Buenos Aires tiene una creciente cultura de ciclismo urbano, ideal para rutas en bici
- **Comunidad artística:** Existe una comunidad activa de artistas callejeros en CABA que necesita visibilidad

### Análisis de Competencia (Resumen)

**Apps de Street Art:**
- Catálogo de obras y mapas
- Limitaciones: complejidad excesiva, dependencia de IA, falta de enfoque social
- Oportunidad: simplicidad y enfoque offline

**Google Arts & Culture:**
- Fortalezas: integración AR en Google Maps, alcance masivo, tecnología avanzada
- Limitaciones: enfoque en landmarks históricos, requiere tecnología AR avanzada
- Lección: integración con mapas mejora UX significativamente

**Lodhi Art District (Case Study):**
- Insights: transformación urbana, conexión comunitaria, turismo cultural
- Aplicación: documentar transformación, fomentar conexión, preservación digital

> **Ver análisis completo:** [`competitive-analysis.md`](./competitive-analysis.md)

---

## 🎯 Etapa 2: Definir (Define)

### Problema Principal (Problem Statement)

**En Buenos Aires (CABA), los visitantes del arte callejero necesitan una forma sencilla y visual de descubrir, mapear y planificar rutas en bici para explorar obras urbanas en grupo, mientras que los artistas necesitan una plataforma para publicar sus obras y crear encuentros. Todo esto sin depender de conexión constante ni herramientas complejas.**

### Objetivos del MVP1

1. **Mapear visualmente** el arte callejero de Buenos Aires (CABA)
2. **Facilitar el descubrimiento** de obras por categoría y artista
3. **Permitir planificación manual** de rutas en bici (o a pie) personalizadas
4. **Habilitar publicación de obras** por parte de artistas
5. **Crear sistema de rutas públicas/dinámicas** con eventos repetitivos (usando rrule)
6. **Permitir encuentros de artistas** para pintar en vivo
7. **Top N de rutas** (máximo 10) para visitantes y artistas
8. **Funcionar offline** para uso durante recorridos urbanos

### Alcance del MVP1

#### ✅ Incluye:
- Feed visual de obras con información básica
- Mapa interactivo con pins categorizados (Buenos Aires - CABA)
- **Dos tipos de usuario:** Artista y Visitante
- **Perfiles de artistas** con catálogo de obras publicadas
- **Publicación de obras** por parte de artistas (sin validación en MVP)
- **Top N de rutas** (máximo 10) para visitantes y artistas
- **Creación manual de rutas** en bici o a pie
- **Rutas privadas, públicas (estáticas) y dinámicas** (eventos repetitivos con rrule)
- **Sistema de unión a rutas públicas** y listas de asistentes
- **Encuentros de artistas** para pintar en vivo (pueden ser repetitivos)
- **Notificaciones** para encuentros de artistas
- Almacenamiento local (offline first)

#### ❌ No incluye (MVP2+):
- Generación automática de rutas con IA
- Descripciones generadas por IA
- Agrupación inteligente avanzada
- Optimización inteligente de rutas
- Realidad aumentada
- Audio tours

### Público Objetivo

#### Tipos de Usuario:

**1. Visitante:**
- Exploradores urbanos que disfrutan andar en bici y descubrir arte en Buenos Aires
- Turistas culturales que buscan experiencias auténticas y arte local
- Ciclistas urbanos que quieren combinar ejercicio con cultura
- Grupos que organizan salidas en bici para ver arte
- Características: Interés por cultura urbana, uso de bici, valoración de experiencias visuales

**2. Artista:**
- Artistas callejeros que quieren publicar y documentar sus obras
- Necesitan visibilidad para su trabajo
- Quieren crear encuentros para pintar en vivo
- Buscan conectar con visitantes y otros artistas
- Características: Necesidad de plataforma de publicación, gestión de portfolio, conexión con audiencia

#### Características Comunes:
- Interés por cultura urbana y arte en Buenos Aires
- Uso de smartphones para navegación
- Valoración de experiencias visuales
- Necesidad de planificación flexible
- Deseo de conexión social alrededor del arte
- Enfoque en ciclismo urbano (principalmente)

### Métricas de Éxito (MVP1)

- **Usabilidad:** Usuario puede crear una ruta en menos de 6 pasos
- **Performance:** Mapa carga en menos de 2 segundos
- **Offline:** Funcionalidad core disponible sin conexión
- **Engagement Visitantes:** Usuario guarda al menos 5 rutas en su Top N
- **Engagement Artistas:** Artista publica al menos 3 obras
- **Social:** Al menos 1 ruta pública/dinámica creada por semana (objetivo)
- **Encuentros:** Al menos 1 encuentro de artista creado por mes (objetivo)

---

## 🔬 Análisis de Funcionalidades Core

### 1. Feed Principal de Obras

**Propósito:** Primer punto de contacto visual con el catálogo

**Elementos clave:**
- Imagen destacada de alta calidad
- Información esencial visible (artista, ubicación, categoría)
- Sistema de likes/favoritos accesible
- Filtros rápidos por categoría

**Consideraciones UX:**
- Scroll infinito o paginación clara
- Carga progresiva de imágenes
- Estados vacíos informativos
- Búsqueda rápida

### 2. Mapa de Arte Urbano (CORE)

**Propósito:** Navegación geográfica y descubrimiento espacial

**Elementos clave:**
- Pins diferenciados visualmente por categoría
- Clustering cuando hay muchas obras cercanas
- Interacción táctil fluida
- Información contextual al tocar pin

**Consideraciones UX:**
- Zoom y pan suaves
- Leyenda de categorías visible
- Filtros de categoría en el mapa
- Indicador de ubicación del usuario
- Modo offline con tiles descargados

### 3. Perfil del Artista

**Propósito:** Profundizar en el trabajo de un artista específico

**Elementos clave:**
- Header visual con foto y bio
- Grid de obras del artista
- Links a redes sociales (IG principalmente)
- Estadísticas básicas (número de obras)

**Consideraciones UX:**
- Navegación clara desde obra → artista
- Transiciones suaves
- Estados de carga
- Manejo de artistas sin foto/bio

### 4. Top N de Rutas (Máximo 10)

**Propósito:** Colección personal de rutas favoritas (reemplaza Top 10 de obras)

**Elementos clave:**
- Visualización estética tipo galería de rutas
- Reordenamiento por drag & drop
- Compartir colección (opcional)
- Persistencia local
- Disponible para Visitantes y Artistas

**Consideraciones UX:**
- Feedback visual al agregar/quitar rutas
- Límite claro de 10 rutas
- Visualización atractiva tipo "mixtape"
- Mostrar preview de ruta (mapa, obras incluidas, distancia)

### 5. Crear Ruta Manual (En Bici o a Pie)

**Propósito:** Planificación personalizada de recorridos en bici (principalmente) o a pie

**Elementos clave:**
- Selección de punto inicio/fin
- Selección múltiple de obras intermedias
- **Selección de modo de transporte:** Bici o a pie
- Vista previa de ruta en mapa
- Información de distancia/tiempo estimado según transporte
- **Opciones de guardado:**
  - Privada (solo para el usuario)
  - Pública estática (compartida, sin fecha)
  - Pública dinámica (evento repetitivo con rrule)

**Consideraciones UX:**
- Flujo paso a paso claro (6 pasos)
- Posibilidad de reordenar obras
- Validación de ruta factible
- Guardado de rutas en Top N
- **Configuración de repetición:** Diario, semanal, mensual, anual (usando rrule)
- **Lista de asistentes:** Para rutas dinámicas, permitir unirse o lista exclusiva

### 6. Rutas Públicas y Dinámicas

**Propósito:** Rutas compartidas y eventos repetitivos para andar en bici en grupo

**Elementos clave:**
- **Rutas públicas estáticas:** Compartidas, sin fecha/horario
- **Rutas dinámicas:** Eventos repetitivos con rrule (diario/semanal/mensual/anual)
- Fecha, horario, punto de encuentro (para dinámicas)
- Descripción del recorrido
- Lista de asistentes (unirse libremente o lista exclusiva)
- Modo de transporte: Bici o a pie

**Consideraciones UX:**
- Flujo simple de creación desde ruta existente
- Configuración de repetición con rrule
- Notificaciones para eventos próximos
- Vista de rutas públicas disponibles
- Vista de eventos próximos
- Cancelación/edición

### 7. Encuentros de Artistas

**Propósito:** Artistas anuncian cuando van a pintar en vivo en un lugar específico

**Elementos clave:**
- Creación por parte de artistas
- Ubicación específica donde pintará
- Fecha y horario
- Pueden ser repetitivos (usando rrule)
- Notificaciones para visitantes que siguen al artista
- Lista de asistentes (visitantes pueden unirse)

**Consideraciones UX:**
- Flujo simple de creación
- Vista de encuentros próximos
- Notificaciones push (si hay backend)
- Integración con perfil del artista

---

## 🎨 Principios de Diseño

### Visual
- **Estética urbana:** Colores vibrantes, tipografía moderna, estilo street culture
- **Fotografía destacada:** Las imágenes de las obras son el elemento principal
- **Jerarquía clara:** Información esencial siempre visible
- **Contraste adecuado:** Legibilidad en diferentes condiciones de luz

### Interacción
- **Gestos intuitivos:** Tap, swipe, drag & drop donde corresponda
- **Feedback inmediato:** Animaciones sutiles, estados de carga claros
- **Navegación predecible:** Patrones estándar de mobile apps
- **Accesibilidad:** Tamaños de toque adecuados, contraste WCAG AA

### Performance
- **Carga progresiva:** Imágenes optimizadas, lazy loading
- **Offline first:** Datos esenciales disponibles sin conexión
- **Optimización de mapas:** Tiles en caché, clustering eficiente

---

## 📊 Fuentes de Datos

### APIs Públicas Identificadas:
1. **BA Cultura (GCBA):** Datos de arte público y murales en Buenos Aires
2. **BA Data:** Datasets abiertos de cultura urbana de CABA

### Tecnologías Adicionales:
- **rrule:** Para manejo de eventos repetitivos (diario, semanal, mensual, anual) en rutas dinámicas y encuentros

### Datos Propios:
- JSON con estructura de obras (fallback si APIs no disponibles)
- Mock data para desarrollo y testing

### Estructura de Datos Mínima:
```json
{
  "obra": {
    "id": "string",
    "titulo": "string",
    "artista": "string",
    "categoria": "graffiti|mural|escultura|performance",
    "ubicacion": {
      "lat": "number",
      "lng": "number",
      "direccion": "string",
      "barrio": "string"
    },
    "foto": "url",
    "fecha": "date",
    "likes": "number"
  },
  "artista": {
    "id": "string",
    "nombre": "string",
    "bio": "string",
    "foto": "url",
    "instagram": "url",
    "obras": ["obra_id"]
  }
}
```

---

## ✅ Conclusiones del Research

### Validaciones Clave:
1. ✅ El problema es real y tiene audiencia definida en Buenos Aires
2. ✅ Existen datos públicos disponibles de CABA
3. ✅ MVP sin IA es viable y valioso
4. ✅ Funcionalidad offline es diferenciador importante
5. ✅ Aspecto social (rutas públicas/dinámicas) agrega valor único
6. ✅ Enfoque en ciclismo urbano se alinea con tendencias de CABA
7. ✅ Dos tipos de usuario (Artista/Visitante) cubre necesidades diferentes
8. ✅ Sistema de encuentros conecta artistas con visitantes de forma única

### Próximos Pasos:
1. Definir user personas detalladas
2. Crear user flows y task flows
3. Establecer design system y tokens
4. Validar con usuario antes de pasar a Architect

---

*Documento generado por: Designer/Researcher*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

