# 🎨 Documentación de Diseño - Graffiti Trails

Esta carpeta contiene toda la documentación relacionada con UX/UI y diseño del proyecto.

---

## 📚 Documentos Disponibles

### 1. Research y Fundamentos

#### [`research.md`](./research.md)
**Qué es:** Research completo de Design Thinking (Empatizar + Definir)
- Contexto del problema
- Necesidades identificadas
- Insights del mercado
- Problem statement
- Objetivos MVP1
- Alcance y métricas de éxito

**Cuándo usarlo:** Para entender el problema y el contexto del proyecto

---

#### [`competitive-analysis.md`](./competitive-analysis.md) ⭐
**Qué es:** Análisis de competencia y FODA (SWOT) detallado
- Análisis de apps de street art existentes
- Comparación con Google Arts & Culture
- Análisis FODA completo (Fortalezas, Debilidades, Oportunidades, Amenazas)
- Matriz de comparación competitiva
- Oportunidades de diferenciación
- Recomendaciones estratégicas

**Cuándo usarlo:** Para entender el posicionamiento competitivo y estrategia de diferenciación

---

#### [`personas.md`](./personas.md)
**Qué es:** 4 User Personas detalladas con tipos de usuario
- La Exploradora Urbana (María) - **Visitante**
- El Turista Cultural (Carlos) - **Visitante**
- La Organizadora de Salidas (Ana) - **Visitante**
- El Artista Local (Diego) - **Artista**

**Cuándo usarlo:** Para tomar decisiones de diseño centradas en el usuario  
**Nota:** La app tiene dos tipos de usuario: **Visitante** y **Artista**. Los artistas pueden publicar obras y crear encuentros.

---

#### [`ux-flows.md`](./ux-flows.md)
**Qué es:** User Flows y Task Flows
- 8 Main User Flows (incluye publicación de obras, encuentros, rutas dinámicas)
- Task Flows detallados
- User Journey (primera experiencia)
- Matriz de navegación
- Validaciones y casos edge
- **Nuevos flows:** Publicar obra (Artista), Crear encuentro (Artista), Unirse a encuentro (Visitante)

**Cuándo usarlo:** Para entender cómo navegan los usuarios por la app

---

### 2. Design System

#### [`design-system.md`](./design-system.md) ⭐
**Qué es:** Sistema de diseño completo
- Design Tokens (colores, tipografía, espaciado, bordes, sombras)
- Componentes base
- Especificaciones de UI
- ✅ **Colores sincronizados con Figma**

**Cuándo usarlo:** Como referencia constante durante el diseño y desarrollo

---

#### [`color-sync-report.md`](./color-sync-report.md) ✅
**Qué es:** Reporte de sincronización de colores Figma ↔ Flutter
- Tabla completa de todos los colores
- Origen de cada token (Figma variable)
- Comparación antes/después
- Estado de sincronización

**Cuándo usarlo:** Para verificar que los colores en Figma y código están alineados

---

### 3. Atomic Design e Implementación

#### [`atomic-design-checklist.md`](./atomic-design-checklist.md) 🔬 ⭐⭐⭐
**Qué es:** Checklist completo de Atomic Design
- Estructura de carpetas en Figma
- **Atoms** (8 categorías, ~50 variantes)
- **Molecules** (8 componentes, ~25 variantes)
- **Organisms** (10 componentes, ~20 variantes)
- **Templates** (6 wireframes)
- **Pages** (9 páginas, 25 frames)
- **Plan de implementación** día a día (10-12 días)

**Cuándo usarlo:** **Como guía principal para diseñar en Figma paso a paso** 🎯

---

### 4. Prototipo Figma

#### [`figma-prototype-plan.md`](./figma-prototype-plan.md)
**Qué es:** Plan para crear el prototipo interactivo en Figma
- Uso del Syncfusion Flutter UI Kit - Material 3
- Pantallas a prototipar (priorizadas)
- Design tokens a implementar
- Estructura del prototipo
- Pasos detallados
- Checklist de validación

**Cuándo usarlo:** Antes de empezar el prototipo en Figma, como referencia de alto nivel

---

#### [`figma-variables-structure.md`](./figma-variables-structure.md)
**Qué es:** Explicación de la estructura de variables en Figma (Material 3)
- Colecciones de variables
- Jerarquía de colores
- Modos (Light/Dark)
- Aliases y tokens semánticos
- Conexiones entre variables

**Cuándo usarlo:** Para entender cómo funcionan las variables en Figma

---

#### [`figma-mcp-setup.md`](./figma-mcp-setup.md)
**Qué es:** Guía de configuración del servidor MCP de Figma
- Pasos para abrir Figma Desktop
- Activar plugin MCP
- Verificar servidor

**Cuándo usarlo:** Cuando necesites conectar Figma con herramientas externas

---

## 🎯 Flujo de Trabajo Sugerido

### Para Diseñadores que van a prototipar en Figma:

```
1. Leer research.md y personas.md
   ↓
2. Revisar ux-flows.md (entender flujos)
   ↓
3. Estudiar design-system.md (conocer tokens)
   ↓
4. Verificar color-sync-report.md (colores correctos)
   ↓
5. ⭐ USAR atomic-design-checklist.md COMO GUÍA PRINCIPAL ⭐
   ↓
6. Consultar figma-prototype-plan.md para contexto adicional
   ↓
7. Diseñar en Figma siguiendo el checklist paso a paso
```

---

## 📊 Orden de Lectura Recomendado

### Para entender el proyecto (Onboarding):
1. `research.md` (15 min)
2. `competitive-analysis.md` (20 min) ⭐
3. `personas.md` (10 min)
4. `ux-flows.md` (15 min)
5. `design-system.md` (20 min)

**Total:** ~1.5 horas

### Para diseñar en Figma:
1. `color-sync-report.md` (5 min) - Verificar colores
2. **`atomic-design-checklist.md`** (30 min) - **Documento principal** 🎯
3. `figma-prototype-plan.md` (10 min) - Contexto adicional
4. Empezar a diseñar siguiendo el checklist

**Total:** ~45 min de lectura + diseño

---

## 🔑 Documentos Clave por Tarea

| Tarea | Documentos a Consultar |
|-------|------------------------|
| **Entender el problema** | `research.md` |
| **Análisis competitivo y estrategia** | `competitive-analysis.md` ⭐ |
| **Conocer a los usuarios** | `personas.md` |
| **Entender la navegación** | `ux-flows.md` |
| **Conocer el design system** | `design-system.md`, `color-sync-report.md` |
| **Diseñar componentes** | ⭐ **`atomic-design-checklist.md`** (Atoms, Molecules, Organisms) |
| **Diseñar pantallas** | ⭐ **`atomic-design-checklist.md`** (Pages) + `ux-flows.md` |
| **Crear prototipo interactivo** | `atomic-design-checklist.md` (Fase 5) + `figma-prototype-plan.md` |
| **Verificar colores** | `color-sync-report.md` |
| **Entender variables Figma** | `figma-variables-structure.md` |

---

## ⭐ Documento Más Importante

**Para diseñar en Figma:** 

👉 **[`atomic-design-checklist.md`](./atomic-design-checklist.md)** 👈

Este documento contiene:
- ✅ **Checklist completo** de todos los componentes a crear
- ✅ **Estructura de carpetas** clara para organizar en Figma
- ✅ **Especificaciones detalladas** de cada átomo, molécula y organismo
- ✅ **Detalles de cada pantalla** (9 páginas principales)
- ✅ **Plan de implementación** día a día (10-12 días)
- ✅ **Tips y mejores prácticas** para Figma
- ✅ **Checklist de validación** final

**Es tu guía paso a paso para todo el diseño en Figma.**

---

## 📝 Notas Importantes

### Colores ✅ Sincronizados
Los colores del proyecto están **100% sincronizados** con el Syncfusion Flutter UI Kit - Material 3 Theme de Figma. Usa los componentes del UI Kit directamente, ya tienen los colores correctos.

**Solo necesitas agregar colores custom de categorías:**
- Graffiti: #E74C3C
- Mural: #3498DB
- Escultura: #F39C12
- Performance: #9B59B6

### UI Kit Base
Proyecto basado en: [Syncfusion Flutter UI Kit - Material 3 Theme](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-)

Usa los componentes del UI Kit como base y personaliza solo lo necesario.

---

## 📞 Ayuda

Si tienes dudas sobre algún documento:
1. Revisa el [`INDEX.md`](../) principal del proyecto
2. Consulta el documento específico
3. Usa el `atomic-design-checklist.md` como referencia principal

---

*Documentación de diseño actualizada: 11 de Diciembre, 2025*  
*Estado: Completa y lista para implementación en Figma* ✅

