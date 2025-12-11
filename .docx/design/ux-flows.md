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

### Flow 2: Crear Ruta Manual

**Usuario:** Carlos (Turista Cultural)  
**Objetivo:** Planificar un recorrido entre dos puntos con obras en el camino

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
    - Opción "A pie" (caminando)
    - Opción "En bici" (bicicleta)
    - Vista previa actualizada:
      * Distancia total: "2.3 km"
      * Tiempo estimado: "45 min caminando" / "12 min en bici"
    ↓
11. Selecciona "A pie" → Toca "Siguiente"
    ↓
12. Paso 6/6: Generar y guardar ruta
    [Vista previa final de ruta en mapa]
    - Ruta optimizada mostrada
    - Orden de obras (puede reordenar si desea)
    - Input: Nombre de la ruta
    - Botón "Generar Ruta"
    ↓
13. Ingresa nombre "Murales de Palermo" → Toca "Generar Ruta"
    ↓
14. Feedback: "Ruta generada y guardada"
    ↓
15. Vuelve a mapa con ruta trazada
    [Línea conectando puntos A→B con obras, pins numerados]
```

**Puntos clave:**
- Flujo paso a paso claro (6 pasos)
- Mapa muestra obras en el camino automáticamente
- Selección de medio de transporte afecta tiempo estimado
- Vista previa en cada paso
- Validación: mínimo 1 obra seleccionada
- Posibilidad de reordenar obras antes de generar

---

### Flow 3: Convertir Ruta en Salida Grupal

**Usuario:** Ana (Organizadora de Salidas)  
**Objetivo:** Organizar una salida grupal para el sábado

```
1. Abre app → Menú → "Mis Rutas"
   ↓
2. Lista de rutas guardadas
   ↓
3. Toca ruta "Murales de Palermo"
   ↓
4. Pantalla de detalle de ruta
   [Mapa con ruta, Lista de obras, Botón "Crear Salida Grupal"]
   ↓
5. Toca "Crear Salida Grupal"
   ↓
6. Pantalla "Nueva Salida"
   [Formulario]
   - Ruta pre-seleccionada: "Murales de Palermo"
   - Fecha: Date picker
   - Hora: Time picker
   - Punto de encuentro: Input + mapa
   - Descripción: Textarea
   ↓
7. Completa formulario:
   - Fecha: Sábado 15/03
   - Hora: 10:00 AM
   - Punto: "Plaza Serrano"
   - Descripción: "Recorrido por los mejores murales..."
   ↓
8. Toca "Crear Salida"
   ↓
9. Pantalla de salida creada
   [Detalles, Código de invitación o link, Lista de participantes (vacía)]
   ↓
10. Comparte link/código
    ↓
11. Otros usuarios se unen
    ↓
12. Ana ve lista actualizada de participantes
```

**Puntos clave:**
- Flujo desde ruta existente (no desde cero)
- Formulario simple y claro
- Compartir fácil (link o código)
- Vista de participantes en tiempo real (si hay backend)

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

### Flow 5: Gestionar Top 10

**Usuario:** María (Exploradora Urbana)  
**Objetivo:** Agregar y reordenar su Top 10 personal

```
1. Abre app → Menú → "Mi Top 10"
   ↓
2. Pantalla "Mi Top 10"
   [Grid visual tipo galería, Contador "7/10 obras"]
   ↓
3. Toca botón "+ Agregar Obra"
   ↓
4. Modal: "Seleccionar obra"
   [Lista de obras favoritas o búsqueda]
   ↓
5. Selecciona una obra → Toca "Agregar"
   ↓
6. Feedback: "Agregada a tu Top 10"
   ↓
7. Vuelve a Top 10 (ahora 8/10)
   ↓
8. Mantiene presionado una obra
   ↓
9. Modo edición activado
   [Drag & drop habilitado, Botón "Eliminar" visible]
   ↓
10. Reordena arrastrando obras
    ↓
11. Toca "Guardar orden"
    ↓
12. Feedback: "Orden guardado"
```

**Puntos clave:**
- Límite claro de 10 obras
- Reordenamiento intuitivo (drag & drop)
- Feedback visual constante
- Persistencia local

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
| **Mapa (Home)** | App launch, Menú | Detalle obra, Crear ruta, Filtros |
| **Feed** | Menú, Tab bar | Detalle obra, Perfil artista |
| **Detalle Obra** | Mapa, Feed, Perfil artista | Perfil artista, Mapa, Top 10 |
| **Perfil Artista** | Detalle obra, Feed | Detalle obra, Instagram |
| **Top 10** | Menú | Detalle obra, Editar orden |
| **Crear Ruta** | Mapa, Menú | Mapa (con ruta), Salida grupal |
| **Mis Rutas** | Menú | Detalle ruta, Crear salida |
| **Salidas Grupales** | Menú, Desde ruta | Detalle salida, Compartir |

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
- **Top 10:** Máximo 10 obras, no duplicados
- **Filtros:** Al menos una categoría o artista debe estar seleccionado

---

*Documento generado por: Designer/Researcher*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

