# 🔍 Research - Graffiti Trails

## 📋 Etapa 1: Empatizar (Empathize)

### Contexto del Problema

El arte callejero (grafitis, murales, esculturas, performances) es una expresión cultural vibrante en las ciudades, pero actualmente:

- **No existe un catálogo centralizado** accesible para explorar estas obras
- **La información está dispersa** en redes sociales, blogs y conocimiento local
- **Es difícil planificar rutas** para descubrir arte urbano de manera organizada
- **No hay forma fácil de conectar** con otros entusiastas del arte callejero
- **La experiencia offline es limitada** cuando no hay conexión a internet

### Necesidades Identificadas

1. **Descubrimiento visual:** Los usuarios necesitan ver las obras antes de decidir visitarlas
2. **Navegación geográfica:** Ubicación precisa en mapas para llegar a las obras
3. **Organización personal:** Poder guardar favoritos y crear colecciones
4. **Planificación de rutas:** Crear recorridos personalizados que optimicen el tiempo
5. **Conexión social:** Compartir experiencias y coordinar salidas grupales
6. **Acceso offline:** Funcionalidad básica sin conexión a internet

### Insights del Mercado

- **APIs disponibles:** BA Cultura (GCBA) y BA Data ofrecen datos públicos de arte urbano
- **Tendencias:** El turismo urbano y el interés por el arte callejero está en crecimiento
- **Competencia:** Apps similares suelen ser complejas o requieren IA desde el inicio
- **Oportunidad:** MVP simple, visual y funcional sin dependencia de IA

---

## 🎯 Etapa 2: Definir (Define)

### Problema Principal (Problem Statement)

**Los entusiastas del arte callejero necesitan una forma sencilla y visual de descubrir, mapear y planificar rutas para explorar obras urbanas, sin depender de conexión constante ni herramientas complejas.**

### Objetivos del MVP1

1. **Mapear visualmente** el arte callejero de la ciudad
2. **Facilitar el descubrimiento** de obras por categoría y artista
3. **Permitir planificación manual** de rutas personalizadas
4. **Habilitar conexión social** mediante salidas grupales coordinadas
5. **Funcionar offline** para uso durante caminatas urbanas

### Alcance del MVP1

#### ✅ Incluye:
- Feed visual de obras con información básica
- Mapa interactivo con pins categorizados
- Perfiles de artistas con catálogo de obras
- Sistema de favoritos y Top 10 personal
- Creación manual de rutas
- Sistema de salidas grupales ("Walk Together")
- Almacenamiento local (offline first)

#### ❌ No incluye (MVP2+):
- Generación automática de rutas con IA
- Descripciones generadas por IA
- Agrupación inteligente avanzada
- Optimización inteligente de rutas
- Realidad aumentada
- Audio tours

### Público Objetivo

#### Usuarios Primarios:
1. **Exploradores urbanos:** Personas que disfrutan caminar y descubrir arte en la ciudad
2. **Turistas culturales:** Visitantes que buscan experiencias auténticas y arte local
3. **Artistas y entusiastas:** Personas del mundo del arte que quieren seguir a artistas específicos
4. **Grupos sociales:** Comunidades que organizan salidas culturales

#### Características Comunes:
- Interés por cultura urbana y arte
- Uso de smartphones para navegación
- Valoración de experiencias visuales
- Necesidad de planificación flexible
- Deseo de conexión social alrededor del arte

### Métricas de Éxito (MVP1)

- **Usabilidad:** Usuario puede crear una ruta en menos de 3 pasos
- **Performance:** Mapa carga en menos de 2 segundos
- **Offline:** Funcionalidad core disponible sin conexión
- **Engagement:** Usuario guarda al menos 5 obras en favoritos
- **Social:** Al menos 1 salida grupal creada por semana (objetivo)

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

### 4. Top 10 del Usuario

**Propósito:** Colección personal curada

**Elementos clave:**
- Visualización estética tipo galería
- Reordenamiento por drag & drop
- Compartir colección (opcional)
- Persistencia local

**Consideraciones UX:**
- Feedback visual al agregar/quitar
- Límite claro de 10 obras
- Visualización atractiva tipo "mixtape"

### 5. Crear Ruta Manual

**Propósito:** Planificación personalizada de recorridos

**Elementos clave:**
- Selección de punto inicio/fin
- Selección múltiple de obras intermedias
- Vista previa de ruta en mapa
- Información de distancia/tiempo estimado

**Consideraciones UX:**
- Flujo paso a paso claro
- Posibilidad de reordenar obras
- Validación de ruta factible
- Guardado de rutas favoritas

### 6. Salidas Grupales ("Walk Together")

**Propósito:** Coordinación social para recorridos compartidos

**Elementos clave:**
- Creación desde ruta existente
- Fecha, horario, punto de encuentro
- Descripción del recorrido
- Lista de participantes

**Consideraciones UX:**
- Flujo simple de creación
- Notificaciones (si hay backend)
- Vista de salidas próximas
- Cancelación/edición

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
1. **BA Cultura (GCBA):** Datos de arte público y murales
2. **BA Data:** Datasets abiertos de cultura urbana

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
1. ✅ El problema es real y tiene audiencia definida
2. ✅ Existen datos públicos disponibles
3. ✅ MVP sin IA es viable y valioso
4. ✅ Funcionalidad offline es diferenciador importante
5. ✅ Aspecto social (salidas grupales) agrega valor único

### Próximos Pasos:
1. Definir user personas detalladas
2. Crear user flows y task flows
3. Establecer design system y tokens
4. Validar con usuario antes de pasar a Architect

---

*Documento generado por: Designer/Researcher*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

