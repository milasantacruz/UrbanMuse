# 🎯 Directrices Principales - Graffiti Trails

## 📋 Resumen del Proyecto

**Nombre:** Graffiti Trails — Explorador urbano de arte callejero  
**Tipo:** App MVP móvil  
**Plataforma:** Flutter/Dart  
**Objetivo:** App sencilla, visual y útil para mapear y explorar arte callejero urbano

---

## 🎯 Valor Principal del MVP

Una app que permite:
- Mapear grafitis, murales, esculturas y performances callejeras
- Mostrar el catálogo por artista
- Crear rutas manuales
- Ver rutas sugeridas por cercanía
- Coordinar salidas grupales en horario para recorrerlas
- **Sin IA en la primera versión (MVP1)**

---

## 🟦 MVP1 - Funcionalidades Core (48hs)

### 1. Feed Principal de Obras
- Lista de grafitis/murales con:
  - Foto
  - Ubicación
  - Artista
  - Categoría (graffiti, mural, escultura, performance callejera)
  - Likes / favoritos
- **Datos:** API de BA Cultura (GCBA) o BA Data, o datos propios en JSON

### 2. Mapa de Arte Urbano (CORE)
- Muestra obras en mapa con pins diferenciados por categoría
- Al tocar un pin → abre ficha de la obra
- **Tecnología:** Leaflet (offline friendly) o Maps JS API gratuita limitada

### 3. Perfil del Artista
- Foto + bio
- Lista de sus obras
- Links (IG del artista)
- **Enfoque:** Component-driven design + buena UI

### 4. Top 10 del Usuario
- Usuario arma su "Top Ten de arte callejero"
- Guardado localmente (offline first)
- Visualización como colección estética

### 5. Crear Ruta Manual
- Usuario elige:
  - Punto de partida
  - Punto de llegada
  - Obras que quiere ver en el camino
- App traza la ruta con puntos seleccionados
- **Sin IA, solo UX limpia**

### 6. Salidas Grupales ("Walk Together")
- Cuando usuario crea ruta manual, puede:
  - Definir fecha
  - Definir horario de salida
  - Descripción del recorrido
  - Punto de encuentro
- Otros usuarios pueden unirse como mini-evento
- **Implementación:** Endpoint mockeado, BD mínima (Railway/Supabase), o almacenamiento local simulado

---

## 🟣 MVP2 - Con IA Generativa (Futuro)

- Generación automática de rutas
- Descripciones generadas por IA
- Agrupación inteligente (estilo, colores, época, artista, barrio)
- Optimización inteligente de rutas

---

## 🏗️ Sistema Multi-Agente

### Workflow Iterativo
```
Designer → Architect → Coder
```

### Rol 1: Designer/Researcher
**Responsabilidad:** UX/UI, Design Thinking, Research  
**Outputs:**
- `research.md` - Documentación completa del research
- `design-system.md` - Tokens, estilos, reglas y componentes
- `ux-flows.md` - User flow y task flows
- `personas.md` - User personas con objetivos y frustraciones

**Comportamiento:**
- Preguntar antes de avanzar
- No asumir información
- Validar cada paso con el usuario

### Rol 2: Architect
**Responsabilidad:** Arquitectura de software, Clean Architecture, BLoC  
**Outputs:**
- `requirements.md` - Requerimientos funcionales y técnicos
- `architecture.md` - Arquitectura general + explicación de capas
- `tech-stack.md` - Librerías, herramientas y justificación
- `tasks_coder.md` - Roadmap atómico para el Coder

**Comportamiento:**
- Validar cada decisión arquitectónica
- Propiciar claridad y mantenibilidad
- Explicar decisiones y sugerir alternativas

### Rol 3: Coder
**Responsabilidad:** Implementación Flutter/Dart  
**Enfoque:**
- Basarse estrictamente en documentos del Architect
- Código limpio, comentado y escalable
- Solicitar confirmación antes de cambios masivos
- Respetar arquitectura definida

---

## 📐 Metodología

- **Design Thinking:** Solo etapa de Research (Empatizar → Definir)
- **Prototipado:** Figma MCP para user personas, user flows, task flows, design tokens
- **Documentación:** Spec Driven Development + archivos .md
- **Arquitectura:** Clean Architecture + Flutter + BLoC
- **Enfoque:** MVP rápido con estándar profesional

---

## 🔧 Stack Tecnológico (Preliminar)

- **Framework:** Flutter/Dart
- **Arquitectura:** Clean Architecture + BLoC/Cubit
- **Mapas:** Leaflet (preferido) o Maps JS API
- **Almacenamiento:** Local (offline first) + opcional BD mínima (Supabase/Railway)
- **APIs:** BA Cultura (GCBA), BA Data, o datos propios JSON
- **Patrones:** Factory, Singleton, Repository, Adapter, Strategy

---

## 📝 Reglas de Comunicación

- ✅ **Siempre responder en español**
- ✅ Documentación clara, concisa y orientada a producto MVP
- ✅ Archivos versionables y consistentes
- ✅ Validación en cada etapa antes de avanzar

---

## 🎯 Principios del Proyecto

1. **Offline First:** Funcionalidad principal sin conexión
2. **Simple y Visual:** UI limpia, componente-driven
3. **Sin IA en MVP1:** Solo funciones básicas, UX limpia
4. **Datos Reales:** APIs públicas cuando sea posible
5. **Escalable:** Arquitectura preparada para MVP2 y MVP3

---

*Última actualización: Inicio del proyecto*

