# 🗺️ UX Flows - Graffiti Trails

## 📱 User Flows Principales

### Flow 1: Descubrir Obra en el Mapa

**Usuario:** María (Exploradora Urbana)  
**Objetivo:** Encontrar una obra cercana y ver sus detalles

```
1. Abre app → Pantalla inicial (Mapa)
   ↓
2. Ve pins en el mapa cerca de su ubicación
   ↓
3. Toca un pin de categoría "mural"
   ↓
4. Se abre bottom sheet con preview de la obra
   [Foto, Título, Artista, Categoría, Botón "Ver más"]
   ↓
5. Toca "Ver más"
   ↓
6. Pantalla de detalle de obra
   [Foto grande, Info completa, Botón "Agregar a Top 10", Link a artista]
   ↓
7. Toca "Agregar a Top 10"
   ↓
8. Feedback visual: "Agregado a tu Top 10"
   ↓
9. Toca "Ver perfil del artista"
   ↓
10. Pantalla de perfil del artista
    [Foto, Bio, Grid de obras, Link a Instagram]
```

**Puntos clave:**
- Mapa es la pantalla principal (home)
- Interacción rápida: tap → preview → detalle
- Acciones principales accesibles desde detalle

---

### Flow 2: Crear Ruta Manual (En Bici o a Pie)

**Usuario:** Carlos (Turista Cultural - Visitante)  
**Objetivo:** Planificar un recorrido en bici entre dos puntos con obras en el camino

```
1. Abre app → Mapa
   ↓
2. Toca botón "Crear Ruta" (flotante en mapa)
   ↓
3. Pantalla "Nueva Ruta"
   [Paso 1/6: Seleccionar punto A]
   - Mapa interactivo
   - Botón "Usar mi ubicación"
   - Input de dirección
   - Pin marcador "Punto A" en el mapa
   ↓
4. Selecciona punto A → Toca "Siguiente"
   ↓
5. Paso 2/6: Seleccionar punto B
   [Mapa interactivo con punto A marcado]
   - Input de dirección
   - Pin marcador "Punto B" en el mapa
   - Línea temporal conectando A y B
   ↓
6. Selecciona punto B → Toca "Siguiente"
   ↓
7. Paso 3/6: Mapa muestra obras en el camino
   [Mapa con ruta entre A y B trazada]
   - Pins de obras visibles a lo largo del camino
   - Radio de búsqueda configurable (ej: 200m del camino)
   - Contador: "12 obras encontradas en el camino"
   - Lista de obras encontradas (opcional)
   ↓
8. Paso 4/6: Seleccionar obras deseadas
   [Lista de obras con checkboxes]
   - Vista de mapa con obras seleccionadas destacadas
   - Filtros por categoría y artista
   - Contador: "5 obras seleccionadas"
   - Preview de ruta actualizada en tiempo real
   ↓
9. Selecciona 5 obras → Toca "Siguiente"
   ↓
10. Paso 5/6: Seleccionar medio de transporte
    [Selector de transporte]
    - Opción "En bici" (bicicleta) - **Recomendado/Principal**
    - Opción "A pie" (caminando)
    - Vista previa actualizada:
      * Distancia total: "2.3 km"
      * Tiempo estimado: "12 min en bici" / "45 min caminando"
    ↓
11. Selecciona "En bici" → Toca "Siguiente"
    ↓
12. Paso 6/6: Guardar y configurar ruta
    [Vista previa final de ruta en mapa]
    - Ruta optimizada mostrada
    - Orden de obras (puede reordenar si desea)
    - Input: Nombre de la ruta
    - **Opciones de guardado:**
      * Radio "Privada" (solo para mí)
      * Radio "Pública estática" (compartida, sin fecha)
      * Radio "Pública dinámica" (evento repetitivo)
    - Si selecciona "Pública dinámica":
      * Selector de repetición: Diario/Semanal/Mensual/Anual
      * Date picker: Fecha inicial
      * Time picker: Hora
      * Input: Punto de encuentro
      * Toggle: "Permitir que cualquiera se una" / "Lista exclusiva"
    - Botón "Guardar Ruta"
    ↓
13. Ingresa nombre "Murales de Palermo", selecciona "Pública estática" → Toca "Guardar Ruta"
    ↓
14. Feedback: "Ruta guardada y publicada"
    ↓
15. Vuelve a mapa con ruta trazada
    [Línea conectando puntos A→B con obras, pins numerados]
```

**Puntos clave:**
- Flujo paso a paso claro (6 pasos)
- Mapa muestra obras en el camino automáticamente
- Selección de medio de transporte (bici/a pie) afecta tiempo estimado
- **Enfoque principal en bici** (recomendado)
- Vista previa en cada paso
- Validación: mínimo 1 obra seleccionada
- Posibilidad de reordenar obras antes de guardar
- **Opciones de guardado:** Privada, Pública estática, Pública dinámica
- **Rutas dinámicas:** Configuración de repetición con rrule (diario/semanal/mensual/anual)
- **Lista de asistentes:** Libre o exclusiva para rutas dinámicas

---

### Flow 3: Convertir Ruta en Pública Dinámica (Evento Repetitivo)

**Usuario:** Ana (Organizadora de Salidas - Visitante)  
**Objetivo:** Convertir una ruta guardada en un evento repetitivo semanal

```
1. Abre app → Menú → "Mis Rutas"
   ↓
2. Lista de rutas guardadas (privadas y públicas)
   ↓
3. Toca ruta "Murales de Palermo" (pública estática)
   ↓
4. Pantalla de detalle de ruta
   [Mapa con ruta, Lista de obras, Botón "Hacer Dinámica"]
   ↓
5. Toca "Hacer Dinámica" (convertir en evento repetitivo)
   ↓
6. Pantalla "Configurar Evento Repetitivo"
   [Formulario]
   - Ruta pre-seleccionada: "Murales de Palermo"
   - Selector de repetición: Diario / Semanal / Mensual / Anual
   - Fecha inicial: Date picker
   - Hora: Time picker
   - Punto de encuentro: Input + mapa
   - Descripción: Textarea
   - Toggle: "Permitir que cualquiera se una" (ON) / "Lista exclusiva" (OFF)
   ↓
7. Completa formulario:
   - Repetición: "Semanal"
   - Fecha inicial: Sábado 15/03
   - Hora: 10:00 AM
   - Punto: "Plaza Serrano"
   - Descripción: "Recorrido en bici por los mejores murales..."
   - Toggle: "Permitir que cualquiera se una" (ON)
   ↓
8. Toca "Guardar Evento"
   ↓
9. Feedback: "Evento repetitivo creado. Se repetirá cada sábado a las 10:00 AM"
   ↓
10. Pantalla de evento creado
    [Detalles, Link para compartir, Lista de asistentes (vacía)]
    - Muestra: "Próximo evento: Sábado 15/03, 10:00 AM"
    - Badge: "Se repite semanalmente"
    ↓
11. Comparte link
    ↓
12. Otros usuarios se unen al evento
    ↓
13. Ana ve lista actualizada de asistentes
    ↓
14. El evento se repite automáticamente cada sábado (usando rrule)
    - Visitantes reciben notificaciones de eventos próximos
    - Pueden unirse a cualquier instancia del evento
```

**Puntos clave:**
- Flujo desde ruta existente (pública estática o privada)
- Configuración de repetición con rrule (diario/semanal/mensual/anual)
- Formulario simple y claro
- Compartir fácil (link)
- Vista de asistentes en tiempo real
- **Eventos repetitivos:** Se repiten automáticamente según configuración
- **Notificaciones:** Visitantes reciben notificaciones de eventos próximos

---

### Flow 4: Explorar por Artista

**Usuario:** Diego (Artista Local)  
**Objetivo:** Ver todas las obras de un artista específico

```
1. Abre app → Feed
   ↓
2. Ve una obra que le interesa
   ↓
3. Toca en el nombre del artista
   ↓
4. Pantalla de perfil del artista
   [Header con foto y bio, Grid de obras, Link a Instagram]
   ↓
5. Scroll por el grid de obras
   ↓
6. Toca una obra del grid
   ↓
7. Pantalla de detalle de obra
   ↓
8. Toca botón "Ver en mapa"
   ↓
9. Mapa centrado en la ubicación de la obra
   [Pin destacado, Botón "Ver ruta desde aquí"]
```

**Puntos clave:**
- Navegación bidireccional: Feed ↔ Artista ↔ Obra ↔ Mapa
- Grid visual atractivo
- Link a Instagram accesible

---

### Flow 5: Gestionar Top N de Rutas (Máximo 10)

**Usuario:** María (Exploradora Urbana - Visitante)  
**Objetivo:** Agregar y reordenar su Top N de rutas favoritas

```
1. Abre app → Bottom Nav → "Top N" (o Menú → "Mi Top N")
   ↓
2. Pantalla "Mi Top N"
   [Grid visual tipo galería de rutas, Contador "7/10 rutas"]
   - Cada item muestra: Preview de mapa, nombre de ruta, obras incluidas, distancia
   ↓
3. Toca botón "+ Agregar Ruta"
   ↓
4. Modal: "Seleccionar ruta"
   [Lista de rutas disponibles]
   - Mis rutas (privadas y públicas)
   - Rutas públicas de otros usuarios
   - Búsqueda de rutas
   ↓
5. Selecciona una ruta "Murales de Palermo" → Toca "Agregar"
   ↓
6. Feedback: "Ruta agregada a tu Top N"
   ↓
7. Vuelve a Top N (ahora 8/10)
   ↓
8. Mantiene presionado una ruta
   ↓
9. Modo edición activado
   [Drag & drop habilitado, Botón "Eliminar" visible]
   ↓
10. Reordena arrastrando rutas
    ↓
11. Toca "Guardar orden"
    ↓
12. Feedback: "Orden guardado"
```

**Puntos clave:**
- **Límite claro de 10 rutas** (no obras)
- Reordenamiento intuitivo (drag & drop)
- Feedback visual constante
- Persistencia local
- **Disponible para Visitantes y Artistas**
- Visualización de preview de ruta (mapa, obras, distancia)

---

### Flow 6: Publicar Obra (Artista)

**Usuario:** Diego (Artista Local - Artista)  
**Objetivo:** Publicar una nueva obra en el mapa de Buenos Aires

```
1. Abre app → Toca botón "Agregar Obra" (visible solo para Artistas)
   ↓
2. Pantalla "Nueva Obra"
   [Formulario paso a paso]
   - Paso 1/4: Tomar/Seleccionar foto
   - Paso 2/4: Información básica
     * Título: Input
     * Categoría: Selector (Graffiti, Mural, Escultura, Performance)
     * Descripción: Textarea (opcional)
   - Paso 3/4: Ubicación
     * Mapa interactivo para seleccionar ubicación
     * Input de dirección
     * Barrio: Auto-completado
   - Paso 4/4: Revisar y publicar
     * Vista previa completa
     * Botón "Publicar"
   ↓
3. Completa todos los pasos
   - Foto: Toma foto del mural
   - Título: "Mural de la Cultura"
   - Categoría: "Mural"
   - Ubicación: Selecciona en mapa (Palermo)
   ↓
4. Toca "Publicar"
   ↓
5. Feedback: "Obra publicada exitosamente"
   ↓
6. Vuelve al mapa
   - Nueva obra aparece como pin en el mapa
   - Aparece en su perfil de artista
   - Visible para todos los visitantes
```

**Puntos clave:**
- Flujo simple paso a paso (4 pasos)
- Sin validación en MVP (cualquiera puede publicar)
- Ubicación precisa en mapa de Buenos Aires
- Aparece inmediatamente en el mapa
- Artista puede editar/eliminar después

---

### Flow 7: Crear Encuentro (Artista)

**Usuario:** Diego (Artista Local - Artista)  
**Objetivo:** Crear un encuentro para anunciar que va a pintar en vivo

```
1. Abre app → Toca botón "Crear Encuentro" (visible solo para Artistas)
   ↓
2. Pantalla "Nuevo Encuentro"
   [Formulario]
   - Ubicación: Input + mapa (donde va a pintar)
   - Fecha: Date picker
   - Hora: Time picker
   - Descripción: Textarea
   - Toggle: "Evento repetitivo" (ON/OFF)
   - Si repetitivo:
     * Selector: Diario / Semanal / Mensual / Anual
   - Toggle: "Permitir que visitantes se unan" (ON/OFF)
   ↓
3. Completa formulario:
   - Ubicación: "Villa Crespo, esquina Corrientes y Scalabrini"
   - Fecha: Sábado 20/03
   - Hora: 14:00 PM
   - Descripción: "Voy a pintar un nuevo mural en vivo"
   - Repetitivo: "Mensual" (ON)
   - Permitir unirse: ON
   ↓
4. Toca "Crear Encuentro"
   ↓
5. Feedback: "Encuentro creado. Los visitantes que te siguen recibirán una notificación"
   ↓
6. Encuentro aparece en:
   - Mapa (pin especial de encuentro)
   - Perfil del artista
   - Feed de encuentros próximos
   ↓
7. Visitantes que siguen al artista reciben notificación
   ↓
8. Visitantes pueden unirse al encuentro
   ↓
9. El encuentro se repite mensualmente (si está configurado)
```

**Puntos clave:**
- Solo disponible para Artistas
- Puede ser repetitivo (usando rrule)
- Notificaciones para visitantes que siguen al artista
- Pin especial en el mapa
- Lista de asistentes (si permiten unirse)

---

### Flow 8: Unirse a Encuentro (Visitante)

**Usuario:** María (Exploradora Urbana - Visitante)  
**Objetivo:** Ver un encuentro de artista y unirse para asistir

```
1. Abre app → Feed o Mapa
   ↓
2. Ve notificación: "Diego va a pintar en vivo - Sábado 20/03, 14:00"
   ↓
3. Toca la notificación
   ↓
4. Pantalla de detalle del encuentro
   [Información completa]
   - Artista: Foto y nombre (link a perfil)
   - Ubicación: Mapa + dirección
   - Fecha y hora
   - Descripción
   - Lista de asistentes (si está habilitada)
   - Botón "Unirme al encuentro"
   ↓
5. Toca "Unirme al encuentro"
   ↓
6. Feedback: "Te has unido al encuentro. Recibirás recordatorios"
   ↓
7. Aparece en "Mis Encuentros" (sección en perfil)
   ↓
8. Recibe recordatorio 1 día antes y 1 hora antes
   ↓
9. El día del encuentro, puede ver la ubicación en el mapa
   ↓
10. Si el encuentro es repetitivo, se une a todas las instancias futuras
```

**Puntos clave:**
- Notificaciones push (si hay backend)
- Vista de encuentros próximos
- Recordatorios automáticos
- Integración con mapa para navegación
- Soporte para encuentros repetitivos

---

## 🔄 Task Flows Detallados

### Task Flow 1: Filtrar Obras en el Mapa

```
Estado inicial: Mapa con todas las obras visibles
   ↓
Usuario toca botón "Filtros" (barra superior)
   ↓
Modal de filtros se abre
   [Tabs: Categoría | Artista]
   
   Tab "Categoría":
   - Checkboxes: Graffiti, Mural, Escultura, Performance
   - Todos seleccionados por defecto
   
   Tab "Artista":
   - Búsqueda de artista
   - Lista de artistas con checkboxes
   - Opción "Todos los artistas" (por defecto)
   ↓
Usuario va a tab "Categoría"
   ↓
Desmarca "Escultura" y "Performance"
   ↓
Cambia a tab "Artista"
   ↓
Busca "Banksy" y lo selecciona
   ↓
Toca "Aplicar"
   ↓
Modal se cierra
   ↓
Mapa se actualiza mostrando solo:
   - Obras de categoría Graffiti y Mural
   - Obras del artista "Banksy"
   [Pins de otras categorías/artistas se ocultan]
   ↓
Contador visible: "5 obras mostradas"
   [Badge de filtros activos visible]
```

---

### Task Flow 1b: Filtrar por Artista en el Feed

```
Estado inicial: Feed con todas las obras visibles
   ↓
Usuario toca botón "Filtros" (barra superior)
   ↓
Modal de filtros se abre
   [Tabs: Categoría | Artista]
   ↓
Usuario va a tab "Artista"
   ↓
Ve lista de artistas o busca uno específico
   ↓
Selecciona "Banksy" y "Jaz" (múltiple selección)
   ↓
Toca "Aplicar"
   ↓
Modal se cierra
   ↓
Feed se actualiza mostrando solo obras de esos artistas
   ↓
Contador visible: "8 obras mostradas"
   [Badge de filtros activos: "2 artistas seleccionados"]
```

---

### Task Flow 2: Buscar Obra por Nombre

```
Estado inicial: Feed o Mapa
   ↓
Usuario toca barra de búsqueda
   ↓
Input de búsqueda se activa
   [Placeholder: "Buscar obra, artista, barrio..."]
   ↓
Usuario escribe "futurista"
   ↓
Resultados se muestran en tiempo real
   [Lista de obras que coinciden]
   ↓
Usuario toca una obra de los resultados
   ↓
Navega a pantalla de detalle
```

---

### Task Flow 3: Compartir Salida Grupal

```
Estado inicial: Pantalla de salida grupal creada
   ↓
Usuario toca botón "Compartir"
   ↓
Modal de compartir se abre
   [Opciones: WhatsApp, Instagram, Link, Código]
   ↓
Usuario selecciona "WhatsApp"
   ↓
App genera mensaje pre-formateado:
   "¡Únete a esta salida de arte urbano! [Link]"
   ↓
Se abre WhatsApp con mensaje listo
   ↓
Usuario envía mensaje
```

---

## 🎯 User Journey: Primera Experiencia

### Escenario: Usuario nuevo descarga la app

```
1. Descarga e instala app
   ↓
2. Abre app por primera vez
   [Onboarding: 3 pantallas explicativas]
   - Pantalla 1: "Descubre arte urbano"
   - Pantalla 2: "Crea tus rutas"
   - Pantalla 3: "Únete a salidas grupales"
   ↓
3. Toca "Comenzar"
   ↓
4. Solicita permisos (opcional):
   - Ubicación (para mapa)
   - Notificaciones (para salidas)
   ↓
5. Pantalla principal: Mapa
   [Mapa centrado en ubicación del usuario]
   [Pins visibles alrededor]
   ↓
6. Usuario explora tocando pins
   [Aprende la interacción básica]
   ↓
7. Toca un pin → Ve preview
   [Descubre que puede ver detalles]
   ↓
8. Toca "Ver más" → Ve detalle completo
   [Aprende sobre obras y artistas]
   ↓
9. Toca "Agregar a Top 10"
   [Primera acción de guardado]
   ↓
10. Feedback positivo: "¡Primera obra guardada!"
    [Refuerzo positivo]
    ↓
11. Usuario explora más
    [Gana confianza]
    ↓
12. Toca botón "Crear Ruta"
    [Descubre funcionalidad avanzada]
    ↓
13. Completa creación de ruta
    [Logro: primera ruta creada]
```

**Momentos clave:**
- Onboarding no intrusivo (skip disponible)
- Permisos opcionales (funciona sin ellos)
- Feedback positivo en primeras acciones
- Descubrimiento progresivo de funcionalidades

---

## 📊 Matriz de Navegación

### Pantallas Principales:

| Pantalla | Acceso desde | Navega a |
|----------|--------------|----------|
| **Mapa (Home)** | App launch, Bottom Nav | Detalle obra, Crear ruta, Filtros, Encuentros |
| **Feed** | Bottom Nav | Detalle obra, Perfil artista |
| **Top N de Rutas** | Bottom Nav | Detalle ruta, Editar orden |
| **Detalle Obra** | Mapa, Feed, Perfil artista | Perfil artista, Mapa, Agregar a Top N |
| **Perfil Artista** | Detalle obra, Feed | Detalle obra, Instagram, Seguir |
| **Crear Ruta** | Mapa, FAB | Mapa (con ruta), Guardar/Publicar |
| **Mis Rutas** | Menú | Detalle ruta, Hacer dinámica |
| **Detalle Ruta** | Mis Rutas, Top N, Feed | Iniciar recorrido, Hacer dinámica, Agregar a Top N |
| **Publicar Obra** | Botón "Agregar Obra" (Artistas) | Mapa, Perfil artista |
| **Crear Encuentro** | Botón "Crear Encuentro" (Artistas) | Mapa, Perfil artista |
| **Detalle Encuentro** | Notificación, Mapa, Feed | Unirse, Ver artista |

### Patrones de Navegación:
- **Bottom Sheet:** Para previews rápidos (obra desde mapa)
- **Stack Navigation:** Para flujos lineales (crear ruta)
- **Tab Bar:** Para navegación principal (Mapa, Feed, Top 10, Menú)
- **Modal:** Para acciones secundarias (filtros, compartir)

---

## ✅ Validaciones y Estados

### Estados de Pantalla:
- **Loading:** Skeleton screens o spinners contextuales
- **Empty:** Mensajes informativos con CTAs
- **Error:** Mensajes claros con opción de reintentar
- **Success:** Feedback visual breve (toasts, badges)

### Validaciones de Formularios:
- **Crear Ruta:** 
  - Punto A y B requeridos
  - Mínimo 1 obra seleccionada, máximo 15 obras
  - Medio de transporte requerido (a pie o en bici)
  - Nombre de ruta opcional (si no se ingresa, nombre automático)
- **Salida Grupal:** Fecha futura, hora válida, punto de encuentro requerido
- **Top N de Rutas:** Máximo 10 rutas, no duplicados (Visitantes y Artistas)
- **Rutas:** Pueden ser privadas, públicas estáticas, o públicas dinámicas (eventos repetitivos)
- **Encuentros:** Solo Artistas pueden crear, Visitantes pueden unirse
- **Publicación de Obras:** Solo Artistas, sin validación en MVP
- **Repetición:** Usar rrule para eventos repetitivos (diario/semanal/mensual/anual)
- **Filtros:** Al menos una categoría o artista debe estar seleccionado

---

*Documento generado por: Designer/Researcher*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

