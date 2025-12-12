# 📚 Documentación - Graffiti Trails

## 📁 Estructura de Documentación

Esta carpeta contiene toda la documentación del proyecto organizada por categorías:

### 🏗️ [arquitectura/](./arquitectura/)
Documentación técnica y arquitectónica del proyecto:
- `architecture.md` - Arquitectura Clean + BLoC, estructura de carpetas, flujo de datos
- `tech-stack.md` - Stack tecnológico, dependencias, librerías y justificaciones

### 🎨 [design/](./design/)
Documentación de diseño, UX/UI y prototipado:

**📖 Ver [design/README.md](./design/README.md) para guía completa de la carpeta**

**Fundamentos:**
- `research.md` - Research completo (empatizar y definir), análisis de funcionalidades
- `personas.md` - User personas con objetivos, frustraciones y escenarios
- `ux-flows.md` - User flows, task flows, user journey y matriz de navegación

**Design System:**
- `design-system.md` - Design tokens, colores, tipografía, componentes, espaciado
- `color-sync-report.md` - ✅ Reporte de sincronización Figma ↔ Flutter

**Implementación en Figma:**
- ⭐ `atomic-design-checklist.md` - **Checklist completo Atomic Design + Plan paso a paso**
- `figma-prototype-plan.md` - Plan para crear prototipo en Figma usando UI Kit
- `figma-variables-structure.md` - Estructura de variables de Figma, colecciones, aliases
- `figma-mcp-setup.md` - Guía de configuración del servidor MCP de Figma

### 🗺️ [roadmaps/](./roadmaps/)
Roadmaps y planes de implementación:
- `tasks_coder.md` - Roadmap atómico de implementación con 66 tareas organizadas en 14 fases

### 📋 [requerimientos/](./requerimientos/)
Requerimientos funcionales y técnicos:
- `requirements.md` - Requerimientos funcionales (RF-01 a RF-10), técnicos (RT-01 a RT-10) y no funcionales

### 📖 [directrices/](./directrices/)
Documentación general y directrices del proyecto:
- `Descripcion-general.md` - Descripción general del MVP, funcionalidades core, MVP2, MVP3
- `directrices-proyecto.md` - Directrices principales, resumen del proyecto, sistema multi-agente

---

## 🔄 Workflow de Documentación

### Flujo de Trabajo:
1. **Designer** → Genera documentación en `design/`
2. **Architect** → Genera documentación en `arquitectura/` y `requerimientos/`
3. **Architect** → Genera roadmap en `roadmaps/`
4. **Coder** → Implementa siguiendo roadmap y documentación

### Archivos de Referencia:
- `.ia/system.agent.xml` - Configuración del sistema multi-agente
- `.ia/directrices-proyecto.md` - Directrices principales (movido a `directrices/`)

---

## 📝 Notas

- Todos los documentos están en formato Markdown (.md)
- La documentación sigue el flujo: Designer → Architect → Coder
- Cada documento incluye fecha y estado al final
- Los documentos están versionados y son consistentes entre sí

---

## 🎯 Documento Destacado para Diseño

👉 **[design/atomic-design-checklist.md](./design/atomic-design-checklist.md)** 👈

Checklist completo de Atomic Design con plan de implementación día a día para Figma.
- 41 componentes detallados (Atoms → Organisms)
- 9 páginas completas especificadas
- Plan de 10-12 días de implementación
- Tips y mejores prácticas

**Ideal para seguir paso a paso al diseñar en Figma.**

---

*Última actualización: 11 de Diciembre, 2025*  
*Agregado: Atomic Design Checklist y Color Sync Report*

