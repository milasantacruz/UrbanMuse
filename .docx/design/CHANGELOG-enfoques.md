# 📋 Changelog - Actualización de Enfoques del Proyecto

**Fecha:** Diciembre 2025  
**Versión:** 2.0 - Refinamiento de Alcance y Funcionalidades

---

## 🎯 Cambios Principales Implementados

### 1. **Enfoque Geográfico Específico**
- ✅ **Antes:** Ciudad genérica
- ✅ **Ahora:** **Buenos Aires (CABA - Ciudad Autónoma de Buenos Aires)**
- ✅ **Alcance:** Área metropolitana completa
- ✅ **Impacto:** Todos los mapas, ubicaciones y referencias ahora son específicas de Buenos Aires

### 2. **Modo de Transporte Principal**
- ✅ **Antes:** Principalmente caminando
- ✅ **Ahora:** **Principalmente en bici** (también disponible a pie)
- ✅ **Impacto:** 
  - Rutas optimizadas para ciclismo urbano
  - Cálculo de tiempo estimado según modo de transporte
  - Enfoque en grupos que andan en bici juntos

### 3. **Tipos de Usuario: Artista y Visitante**
- ✅ **Antes:** Usuario genérico
- ✅ **Ahora:** **Dos tipos de usuario:**
  - **Visitante:** Explora obras, crea rutas, se une a rutas públicas, sigue artistas, se une a encuentros
  - **Artista:** Todas las funcionalidades de Visitante + puede publicar obras, crear encuentros
- ✅ **Registro:** Usuario elige su tipo al registrarse (no puede cambiarlo en MVP)
- ✅ **Vistas:** Muy similares, pero Artistas tienen botones adicionales: "Agregar Obra", "Crear Encuentro"

### 4. **Top N de Rutas (Reemplaza Top 10 de Obras)**
- ✅ **Antes:** Top 10 de obras favoritas
- ✅ **Ahora:** **Top N de rutas favoritas** (máximo 10)
- ✅ **Disponible para:** Visitantes y Artistas
- ✅ **Cada item muestra:**
  - Preview de mapa de la ruta
  - Nombre de la ruta
  - Número de obras incluidas
  - Distancia total
  - Modo de transporte (bici/a pie)
- ✅ **Impacto:** Cambio fundamental en la funcionalidad de favoritos

### 5. **Rutas: Privadas, Públicas Estáticas y Dinámicas**
- ✅ **Antes:** Rutas privadas y salidas grupales separadas
- ✅ **Ahora:** **Sistema unificado de rutas:**
  - **Privada:** Solo para el usuario
  - **Pública estática:** Compartida, sin fecha/horario (otros pueden verla y usarla)
  - **Pública dinámica:** Evento repetitivo con rrule
    - Repetición: Diario / Semanal / Mensual / Anual
    - Configuración: Fecha inicial, hora, punto de encuentro
    - Lista de asistentes: Libre o exclusiva
- ✅ **Tecnología:** Usar librería `rrule` para manejo de fechas/calendario
- ✅ **Impacto:** CreateSalidaPage ahora es obsoleto (reemplazado por Paso 6 de CreateRutaPage)

### 6. **Encuentros de Artistas (NUEVO)**
- ✅ **Funcionalidad nueva:** Artistas pueden crear "encuentros"
- ✅ **Propósito:** Anunciar cuando van a pintar en vivo en un lugar específico
- ✅ **Características:**
  - Solo Artistas pueden crear
  - Ubicación específica donde pintará
  - Fecha y horario
  - Pueden ser repetitivos (usando rrule)
  - Visitantes pueden unirse y recibir notificaciones
  - Lista de asistentes
- ✅ **Pin especial:** En el mapa para diferenciar de obras normales

### 7. **Publicación de Obras por Artistas (NUEVO)**
- ✅ **Funcionalidad nueva:** Artistas pueden publicar sus obras
- ✅ **Proceso:** 4 pasos (Foto, Información, Ubicación, Revisar)
- ✅ **Sin validación en MVP:** Cualquier artista puede publicar sin aprobación
- ✅ **Ubicación:** Buenos Aires (CABA) específicamente
- ✅ **Gestión:** Artista puede editar/eliminar sus obras después de publicarlas

---

## 📄 Documentos Actualizados

### ✅ Completamente Actualizados:

1. **`research.md`**
   - Contexto del problema actualizado a Buenos Aires
   - Necesidades separadas por tipo de usuario (Visitante/Artista)
   - Objetivos MVP1 actualizados
   - Alcance actualizado con nuevas funcionalidades
   - Métricas de éxito ajustadas

2. **`personas.md`**
   - Todas las personas actualizadas con tipo de usuario
   - Escenarios actualizados con rutas en bici
   - Diego (Artista) ahora incluye publicación de obras y encuentros
   - Priorización de funcionalidades actualizada

3. **`ux-flows.md`**
   - Flow 2: Actualizado con modo de transporte (bici/a pie)
   - Flow 3: Actualizado a rutas públicas/dinámicas con rrule
   - Flow 5: Cambiado de "Top 10 obras" a "Top N de rutas"
   - **Flow 6 (NUEVO):** Publicar Obra (Artista)
   - **Flow 7 (NUEVO):** Crear Encuentro (Artista)
   - **Flow 8 (NUEVO):** Unirse a Encuentro (Visitante)
   - Matriz de navegación actualizada

4. **`atomic-design-checklist.md`**
   - Sección de notas importantes agregada al inicio
   - Top 10 Grid Item → Top N Grid Item (Rutas)
   - Top10Page → TopNPage (Top N de Rutas)
   - CreateRutaPage: Paso 5 y 6 actualizados con nuevas opciones
   - CreateSalidaPage marcado como OBSOLETO
   - **PublicarObraPage (NUEVO):** 4 pasos, solo Artistas
   - **CrearEncuentroPage (NUEVO):** Solo Artistas
   - **EncuentroDetailPage (NUEVO):** Detalle de encuentro

5. **`competitive-analysis.md`**
   - Fortalezas actualizadas con nuevos enfoques
   - Oportunidades actualizadas con ciclismo urbano
   - Diferenciación actualizada con dos tipos de usuario

6. **`screens/06-top10-page.md`**
   - Completamente reescrito para Top N de rutas
   - Wireframes actualizados
   - Componentes actualizados

7. **`screens/05-create-ruta-page.md`**
   - Paso 5: Modo de transporte (bici principal)
   - Paso 6: Opciones de guardado (privada/pública estática/pública dinámica)
   - Configuración de repetición con rrule

8. **`screens/03-obra-detail-page.md`**
   - Botón "Agregar a Top 10" removido (ya no aplica)
   - Actualizado para reflejar que no se agregan obras al Top N

9. **`screens/01-mapa-page.md` y `02-feed-page.md`**
   - Referencias a Top 10 actualizadas a Top N

10. **`screens/README.md`**
    - Índice actualizado con nuevas páginas
    - CreateSalidaPage marcado como OBSOLETO
    - Nuevas páginas agregadas

11. **`README.md` (principal)**
    - Referencias a tipos de usuario actualizadas
    - Nuevos flows documentados

---

## 🔄 Cambios en Funcionalidades Existentes

### Funcionalidades Modificadas:

1. **Top 10 → Top N de Rutas**
   - **Antes:** Guardar hasta 10 obras favoritas
   - **Ahora:** Guardar hasta 10 rutas favoritas
   - **Impacto:** Cambio fundamental en la experiencia de favoritos

2. **Crear Ruta**
   - **Antes:** Solo privada, luego convertir en salida grupal
   - **Ahora:** Privada, pública estática, o pública dinámica (evento repetitivo)
   - **Nuevo:** Modo de transporte (bici/a pie)
   - **Nuevo:** Configuración de repetición con rrule

3. **Salidas Grupales**
   - **Antes:** CreateSalidaPage separada
   - **Ahora:** Integrada en CreateRutaPage como "Rutas Públicas Dinámicas"
   - **Nuevo:** Eventos repetitivos (diario/semanal/mensual/anual)

### Funcionalidades Nuevas:

1. **Publicar Obra (Artistas)**
   - 4 pasos: Foto, Información, Ubicación, Revisar
   - Sin validación en MVP
   - Aparece inmediatamente en el mapa

2. **Crear Encuentro (Artistas)**
   - Anunciar pintar en vivo
   - Puede ser repetitivo
   - Notificaciones para visitantes

3. **Unirse a Encuentro (Visitantes)**
   - Ver encuentros próximos
   - Unirse y recibir notificaciones
   - Navegación al lugar

---

## 📊 Impacto en Arquitectura y Desarrollo

### Nuevas Dependencias Necesarias:

1. **`rrule`** - Para manejo de eventos repetitivos
   - Repetición diaria, semanal, mensual, anual
   - Cálculo de fechas futuras
   - Integración con calendario

### Cambios en Modelos de Datos:

1. **Usuario:**
   - Campo `tipoUsuario`: `'visitante' | 'artista'`
   - No puede cambiarse en MVP

2. **Ruta:**
   - Campo `tipo`: `'privada' | 'publica_estatica' | 'publica_dinamica'`
   - Campo `modoTransporte`: `'bici' | 'a_pie'`
   - Campo `rrule` (si es dinámica): String con regla de repetición
   - Campo `fechaInicial` (si es dinámica): DateTime
   - Campo `hora` (si es dinámica): TimeOfDay
   - Campo `puntoEncuentro` (si es dinámica): String
   - Campo `listaAsistentes`: Lista de usuarios
   - Campo `tipoListaAsistentes`: `'libre' | 'exclusiva'`

3. **Obra:**
   - Campo `artistaId`: ID del artista que la publicó
   - Campo `fechaPublicacion`: DateTime
   - Campo `puedeEliminar`: Boolean (solo si es del artista)

4. **Encuentro (NUEVO):**
   - `id`: String
   - `artistaId`: String
   - `ubicacion`: LatLng
   - `direccion`: String
   - `fecha`: DateTime
   - `hora`: TimeOfDay
   - `descripcion`: String
   - `esRepetitivo`: Boolean
   - `rrule`: String? (si es repetitivo)
   - `permitirUnirse`: Boolean
   - `asistentes`: List<String>

5. **TopN (Reemplaza Top10):**
   - Campo `rutas`: List<String> (IDs de rutas, máximo 10)
   - Campo `orden`: List<int> (orden de las rutas)

---

## 🎯 Próximos Pasos Recomendados

### Para Desarrollo:

1. **Actualizar modelos de datos** con nuevos campos
2. **Implementar rrule** para eventos repetitivos
3. **Crear PublicarObraPage** (4 pasos)
4. **Crear CrearEncuentroPage**
5. **Crear EncuentroDetailPage**
6. **Actualizar TopNPage** para mostrar rutas en lugar de obras
7. **Actualizar CreateRutaPage** con nuevas opciones de guardado
8. **Remover CreateSalidaPage** (obsoleto)

### Para Diseño (Figma):

1. **Actualizar wireframes** de TopNPage
2. **Actualizar wireframes** de CreateRutaPage (pasos 5 y 6)
3. **Crear wireframes** de PublicarObraPage
4. **Crear wireframes** de CrearEncuentroPage
5. **Crear wireframes** de EncuentroDetailPage
6. **Actualizar flujos** de navegación

---

## ✅ Validaciones Realizadas

- ✅ Todos los documentos principales actualizados
- ✅ Referencias cruzadas corregidas
- ✅ Consistencia en terminología
- ✅ Flujos de usuario actualizados
- ✅ Personas actualizadas con nuevos roles
- ✅ Screens actualizados con nuevas funcionalidades

---

*Documento generado: Diciembre 2025*  
*Estado: Completo y listo para implementación* ✅

