# 🎨 Design System - Graffiti Trails

## 🎯 Filosofía de Diseño

**Estética:** Urbana, vibrante, auténtica  
**Personalidad:** Street culture, moderna, accesible  
**Principio rector:** "El arte es el protagonista, la UI es el escenario"

---

## 🎨 Design Tokens

### Colores

#### Paleta Principal

> **✅ SINCRONIZADO con Syncfusion Flutter UI Kit - Material 3 Theme (Figma)**
> Link: https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-

```css
/* ============================================ */
/* Colores Primarios (desde Figma: primary) */
/* ============================================ */
--primary: #6BA034;                  /* Verde principal - CTA principal */
--primary-container: #ECFFDD;        /* Primary Container */
--on-primary: #FFFFFF;               /* Texto sobre primary */
--on-primary-container: #79F500;     /* Texto sobre primary container */
--primary-fixed-dim: #E8FFBC;        /* Primary Fixed Dim (dark mode) */

/* Variantes para compatibilidad */
--primary-600: #5A8A2A;              /* Más oscuro */
--primary-400: #85B84D;              /* Más claro */

/* ============================================ */
/* Colores Secundarios (desde Figma: secondary) */
/* ============================================ */
--secondary: #66715B;                /* Verde oscuro secundario */
--secondary-container: #E8F8DE;      /* Secondary Container */
--on-secondary: #FFFFFF;             /* Texto sobre secondary */
--on-secondary-container: #1F2B19;   /* Texto sobre secondary container */

/* Variantes para compatibilidad */
--secondary-600: #4F5947;            /* Más oscuro */
--secondary-400: #7F8A74;            /* Más claro */

/* ============================================ */
/* Colores Terciarios (desde Figma: tertiary) */
/* ============================================ */
--tertiary: #5D7D52;                 /* Verde terciario */

/* ============================================ */
/* Colores Adicionales del Sistema (desde Figma) */
/* ============================================ */
--gray-secondary: #253341;           /* Gray (Secondary Color) */
--black-color: #1D1617;              /* Black-color */
--gray-1: #7B6F72;                   /* Gray 1 */
--dark: #15202B;                     /* Dark */
--white: #F5F8FA;                    /* White */

/* ============================================ */
/* Colores de Acento (Custom) */
/* ============================================ */
--accent-blue: #4A90E2;              /* Links, información */
--accent-purple: #9B59B6;            /* Categorías especiales */
--accent-green: #27AE60;             /* Éxito, confirmación */

/* ============================================ */
/* Colores de Categorías (Custom) */
/* ============================================ */
--category-graffiti: #E74C3C;        /* Rojo - Grafitis */
--category-mural: #3498DB;           /* Azul - Murales */
--category-escultura: #F39C12;       /* Naranja - Esculturas */
--category-performance: #9B59B6;     /* Morado - Performances */

/* ============================================ */
/* Colores Neutros */
/* ============================================ */
--neutral-50: #FAFAFA;               /* Fondo claro */
--neutral-100: #F5F5F5;
--neutral-200: #EEEEEE;
--neutral-300: #E0E0E0;
--neutral-400: #BDBDBD;
--neutral-500: #9E9E9E;
--neutral-600: #757575;
--neutral-700: #616161;
--neutral-800: #424242;
--neutral-900: #212121;

/* ============================================ */
/* Estados */
/* ============================================ */
--success: #27AE60;
--warning: #F39C12;
--error: #E74C3C;
--info: #3498DB;

/* ============================================ */
/* Fondos */
/* ============================================ */
--bg-primary: #F5F8FA;               /* Fondo principal (White de Figma) */
--bg-secondary: #E8F8DE;             /* Fondo secundario (Secondary Container) */
--bg-dark: #15202B;                  /* Fondo oscuro (Dark de Figma) */
--bg-overlay: rgba(0, 0, 0, 0.6);    /* Overlay para modales */

/* ============================================ */
/* Surface Colors (desde Figma variables) */
/* ============================================ */
--surface: #FEF7FF;
--surface-1: #F7F2FB;
--surface-2: #F3EDF7;
--surface-5: #E4ECE0;
--on-surface: #1D1617;               /* Black-color de Figma */
--on-surface-variant: #4A4F45;

/* ============================================ */
/* Outline */
/* ============================================ */
--outline-variant: #CAC4D0;
--border-color: #CAC4D0;
--border-color-dark: #7B6F72;        /* Gray 1 de Figma */
```

#### Uso de Colores

- **Primario (#6BA034 - Verde):** Botones principales, CTAs, elementos interactivos destacados, FloatingActionButtons
- **Secundario (#66715B - Verde oscuro):** Fondos de secciones, barras de navegación, elementos de soporte
- **Terciario (#5D7D52):** Elementos de acento adicionales, variaciones
- **Categorías (Custom):** Pins en mapa, badges de categoría, filtros de obras
- **Neutros:** Textos secundarios, bordes, separadores, fondos neutros
- **Surface & Background:** Superficies de contenido, fondos de pantalla

**Nota:** Los colores están sincronizados con el Syncfusion Flutter UI Kit - Material 3 Theme de Figma, garantizando consistencia total entre diseño y desarrollo.

---

### Tipografía

#### Familias de Fuente

```css
/* Fuente Principal - Moderna y legible */
--font-primary: 'Inter', 'SF Pro Display', -apple-system, sans-serif;

/* Fuente Display - Para títulos grandes */
--font-display: 'Poppins', 'SF Pro Display', sans-serif;

/* Fuente Mono - Para datos técnicos (opcional) */
--font-mono: 'SF Mono', 'Menlo', monospace;
```

#### Escala Tipográfica

```css
/* Display - Títulos hero */
--text-display: 32px / 40px (font-size / line-height)
--font-weight: 700

/* H1 - Títulos principales */
--text-h1: 28px / 36px
--font-weight: 700

/* H2 - Subtítulos */
--text-h2: 24px / 32px
--font-weight: 600

/* H3 - Secciones */
--text-h3: 20px / 28px
--font-weight: 600

/* Body Large - Texto destacado */
--text-body-lg: 18px / 26px
--font-weight: 400

/* Body - Texto estándar */
--text-body: 16px / 24px
--font-weight: 400

/* Body Small - Texto secundario */
--text-body-sm: 14px / 20px
--font-weight: 400

/* Caption - Texto pequeño */
--text-caption: 12px / 16px
--font-weight: 400

/* Label - Etiquetas, botones */
--text-label: 14px / 20px
--font-weight: 600

/* Button - Texto en botones */
--text-button: 16px / 24px
--font-weight: 600
```

---

### Espaciado

#### Sistema de Espaciado (8px base)

```css
--space-1: 4px;    /* 0.5x */
--space-2: 8px;    /* 1x - Base */
--space-3: 12px;   /* 1.5x */
--space-4: 16px;   /* 2x */
--space-5: 24px;   /* 3x */
--space-6: 32px;   /* 4x */
--space-7: 40px;   /* 5x */
--space-8: 48px;   /* 6x */
--space-9: 64px;   /* 8x */
--space-10: 80px;  /* 10x */
```

#### Uso:
- **Padding de componentes:** space-2, space-4, space-5
- **Márgenes entre elementos:** space-3, space-4, space-5
- **Márgenes de sección:** space-6, space-8

---

### Bordes y Radio

```css
/* Radio de Bordes */
--radius-sm: 4px;      /* Inputs pequeños, badges */
--radius-md: 8px;      /* Botones, cards estándar */
--radius-lg: 12px;     /* Cards grandes, modales */
--radius-xl: 16px;     /* Imágenes, hero sections */
--radius-full: 9999px; /* Pills, avatares */

/* Bordes */
--border-width: 1px;
--border-color: var(--neutral-300);
--border-color-dark: var(--neutral-600);
```

---

### Sombras

```css
/* Elevación - Material Design inspired */
--shadow-sm: 0 1px 2px rgba(0, 0, 0, 0.05);
--shadow-md: 0 4px 6px rgba(0, 0, 0, 0.1);
--shadow-lg: 0 10px 15px rgba(0, 0, 0, 0.1);
--shadow-xl: 0 20px 25px rgba(0, 0, 0, 0.15);

/* Uso */
/* Cards: shadow-md */
/* Modales: shadow-xl */
/* Botones elevados: shadow-sm */
/* Bottom sheets: shadow-lg */
```

---

### Iconografía

#### Tamaños de Iconos

```css
--icon-xs: 12px;
--icon-sm: 16px;
--icon-md: 24px;  /* Estándar */
--icon-lg: 32px;
--icon-xl: 48px;
```

#### Estilo:
- **Línea delgada** (stroke: 1.5-2px)
- **Relleno sólido** para iconos de acción
- **Consistencia visual** en toda la app

---

## 🧩 Componentes Base

### Botones

#### Botón Primario
```css
/* Estado Normal */
background: var(--primary-500);
color: white;
padding: 12px 24px;
border-radius: var(--radius-md);
font: var(--text-button);
box-shadow: var(--shadow-sm);

/* Estado Hover/Active */
background: var(--primary-600);

/* Estado Disabled */
opacity: 0.5;
pointer-events: none;
```

#### Botón Secundario
```css
background: transparent;
color: var(--primary-500);
border: 1px solid var(--primary-500);
padding: 12px 24px;
border-radius: var(--radius-md);
```

#### Botón Texto
```css
background: transparent;
color: var(--primary-500);
padding: 8px 16px;
```

#### Tamaños:
- **Small:** padding: 8px 16px, font: 14px
- **Medium:** padding: 12px 24px, font: 16px (default)
- **Large:** padding: 16px 32px, font: 18px

---

### Cards

#### Card de Obra (Feed)
```css
background: var(--bg-primary);
border-radius: var(--radius-lg);
box-shadow: var(--shadow-md);
overflow: hidden;

/* Estructura */
- Imagen: 100% width, aspect-ratio 4:3
- Padding contenido: var(--space-4)
- Espaciado entre elementos: var(--space-3)
```

#### Card de Artista
```css
background: var(--bg-primary);
border-radius: var(--radius-lg);
box-shadow: var(--shadow-sm);
padding: var(--space-5);

/* Estructura */
- Avatar: 64px, circular
- Nombre: var(--text-h3)
- Bio: var(--text-body-sm), color: var(--neutral-600)
```

---

### Inputs

#### Input Estándar
```css
background: var(--bg-primary);
border: 1px solid var(--border-color);
border-radius: var(--radius-md);
padding: 12px 16px;
font: var(--text-body);
color: var(--neutral-900);

/* Focus */
border-color: var(--primary-500);
outline: 2px solid var(--primary-500) (opacity 0.2);

/* Error */
border-color: var(--error);
```

#### Textarea
```css
/* Mismo estilo que input */
min-height: 100px;
resize: vertical;
```

---

### Badges

#### Badge de Categoría
```css
display: inline-flex;
padding: 4px 12px;
border-radius: var(--radius-full);
font: var(--text-caption);
font-weight: 600;
background: [color de categoría];
color: white;
```

#### Badge de Estado
```css
/* Similar a categoría pero con colores de estado */
background: var(--success); /* o warning, error, info */
```

---

### Bottom Sheet

```css
background: var(--bg-primary);
border-radius: var(--radius-lg) var(--radius-lg) 0 0;
box-shadow: var(--shadow-xl);
max-height: 80vh;

/* Handle */
- Barra superior: 4px height, 40px width
- Color: var(--neutral-300)
- Border-radius: var(--radius-full)
- Centrado, margin: var(--space-2) auto
```

---

### Modales

```css
/* Overlay */
background: var(--bg-overlay);
backdrop-filter: blur(4px);

/* Modal */
background: var(--bg-primary);
border-radius: var(--radius-lg);
padding: var(--space-6);
max-width: 90vw;
max-height: 80vh;
box-shadow: var(--shadow-xl);
```

---

## 📐 Layout y Grid

### Breakpoints (si aplica para responsive)

```css
--breakpoint-sm: 360px;  /* Móvil pequeño */
--breakpoint-md: 768px;  /* Tablet */
--breakpoint-lg: 1024px; /* Desktop (futuro) */
```

### Grid System

```css
/* Para listas y grids */
--grid-columns: 2;        /* Feed en móvil: 2 columnas */
--grid-gap: var(--space-4);

/* Para tablet */
--grid-columns-tablet: 3;
```

### Contenedores

```css
/* Padding de pantalla */
--container-padding: var(--space-4);

/* Max width de contenido */
--container-max-width: 1200px; /* Para futuro desktop */
```

---

## 🎭 Estados y Animaciones

### Transiciones

```css
--transition-fast: 150ms ease;
--transition-base: 250ms ease;
--transition-slow: 350ms ease;
```

### Animaciones Comunes

#### Fade In
```css
@keyframes fadeIn {
  from { opacity: 0; }
  to { opacity: 1; }
}
duration: var(--transition-base);
```

#### Slide Up (Bottom Sheet)
```css
@keyframes slideUp {
  from { transform: translateY(100%); }
  to { transform: translateY(0); }
}
duration: var(--transition-slow);
```

#### Scale (Botones, Cards)
```css
/* Hover */
transform: scale(1.02);
transition: var(--transition-fast);

/* Active */
transform: scale(0.98);
```

---

## 🗺️ Componentes Específicos de la App

### Pin de Mapa

```css
/* Tamaño base */
width: 32px;
height: 32px;

/* Forma */
border-radius: var(--radius-full);
border: 2px solid white;
box-shadow: var(--shadow-md);

/* Color por categoría */
background: var(--category-[tipo]);

/* Animación al tocar */
scale: 1.2;
transition: var(--transition-fast);
```

### Card de Obra en Feed

**Estructura:**
```
┌─────────────────────┐
│   [Imagen Obra]     │
│   Aspect 4:3        │
├─────────────────────┤
│ Título Obra         │
│ Artista             │
│ [Badge Categoría]   │
│ ❤️ 42  📍 Palermo   │
└─────────────────────┘
```

### Vista de Ruta en Mapa

```css
/* Línea de ruta */
stroke: var(--primary-500);
stroke-width: 4px;
stroke-dasharray: 8px 4px; /* Línea punteada */
opacity: 0.8;

/* Pins numerados */
background: var(--primary-500);
color: white;
border-radius: var(--radius-full);
width: 32px;
height: 32px;
display: flex;
align-items: center;
justify-content: center;
font: var(--text-label);
```

---

## 📱 Patrones de UI Específicos

### Top 10 - Vista de Galería

```css
/* Grid tipo "mixtape" */
display: grid;
grid-template-columns: repeat(2, 1fr);
gap: var(--space-3);

/* Cada item */
aspect-ratio: 1:1;
border-radius: var(--radius-lg);
overflow: hidden;
position: relative;

/* Número de posición */
position: absolute;
top: var(--space-2);
left: var(--space-2);
background: var(--bg-overlay);
color: white;
padding: 4px 8px;
border-radius: var(--radius-sm);
font: var(--text-label);
```

### Perfil de Artista - Header

```css
/* Layout */
display: flex;
flex-direction: column;
align-items: center;
padding: var(--space-6) var(--space-4);

/* Avatar */
width: 120px;
height: 120px;
border-radius: var(--radius-full);
border: 4px solid var(--primary-500);
margin-bottom: var(--space-4);

/* Nombre */
font: var(--text-h2);
margin-bottom: var(--space-2);

/* Bio */
font: var(--text-body);
color: var(--neutral-600);
text-align: center;
max-width: 300px;
```

---

## ♿ Accesibilidad

### Contraste
- **Texto sobre fondo claro:** Mínimo 4.5:1 (WCAG AA)
- **Texto sobre fondo oscuro:** Mínimo 4.5:1
- **CTAs y elementos interactivos:** Mínimo 3:1

### Tamaños de Toque
- **Mínimo:** 44x44px (iOS) / 48x48px (Android)
- **Área de toque:** Incluir padding invisible si el elemento visual es más pequeño

### Estados de Foco
- **Visible:** Outline de 2px, color: var(--primary-500)
- **En todos los elementos interactivos**

---

## 📋 UI Inventory (Checklist de Componentes)

### Componentes Base
- [ ] Botones (Primary, Secondary, Text)
- [ ] Inputs (Text, Textarea, Search)
- [ ] Cards (Obra, Artista, Ruta)
- [ ] Badges (Categoría, Estado)
- [ ] Modales
- [ ] Bottom Sheets
- [ ] Toasts/Notificaciones

### Componentes de Navegación
- [ ] Tab Bar
- [ ] Menú/Drawer
- [ ] Breadcrumbs (si aplica)

### Componentes Específicos
- [ ] Pin de Mapa (con variantes por categoría)
- [ ] Card de Obra (Feed)
- [ ] Card de Obra (Detalle)
- [ ] Perfil de Artista (Header)
- [ ] Grid de Obras
- [ ] Vista de Ruta (Mapa)
- [ ] Formulario de Ruta (Multi-step)
- [ ] Formulario de Salida Grupal
- [ ] Top 10 (Vista galería)
- [ ] Lista de Participantes

### Estados
- [ ] Loading (Skeleton, Spinner)
- [ ] Empty States
- [ ] Error States
- [ ] Success States

---

*Documento generado por: Designer/Researcher*  
*Fecha: Inicio del proyecto*  
*Estado: Pendiente validación del usuario*

