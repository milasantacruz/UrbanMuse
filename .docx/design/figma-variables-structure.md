# 🎨 Estructura de Variables de Figma - Material Design 3

## 📋 Análisis del UI Kit: Syncfusion Flutter UI Kit - Material 3 Theme

**Referencia:** [Syncfusion Flutter UI Kit - Material 3 Theme](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-?node-id=3917-829&m=dev&t=y1ykPsJ878ZyRkH5-1)

> **📍 NOTA:** Este documento explica la **estructura conceptual** de las variables de Figma en Material Design 3.  
> Para los **valores específicos sincronizados** del proyecto UrbanMuse, consulta [`color-sync-report.md`](./color-sync-report.md)

---

## 🏗️ Estructura de Variables en Material Design 3

### 1. Colecciones de Variables (Variable Collections)

En Material Design 3, las variables se organizan en **colecciones** que representan diferentes aspectos del sistema de diseño:

#### Colección: **Colors (Colores)**
- **Tipo:** Color
- **Modos:** Light, Dark (y opcionalmente High Contrast)
- **Organización:**
  - Primary Colors
  - Secondary Colors
  - Tertiary Colors
  - Error Colors
  - Neutral Colors
  - Surface Colors

#### Colección: **Typography (Tipografía)**
- **Tipo:** String (para nombres de fuentes)
- **Tipo:** Number (para tamaños, line-heights, letter-spacing)
- **Organización:**
  - Font Families
  - Font Sizes
  - Line Heights
  - Letter Spacing
  - Font Weights

#### Colección: **Spacing (Espaciado)**
- **Tipo:** Number
- **Organización:**
  - Base spacing (4px en Material 3)
  - Scale: 4, 8, 12, 16, 24, 32, 40, 48, 64, 80, 96, 128, 160, 192, 224, 256

#### Colección: **Border Radius**
- **Tipo:** Number
- **Organización:**
  - Small, Medium, Large, Extra Large
  - Full (para círculos)

#### Colección: **Elevation (Sombras)**
- **Tipo:** Number (para opacidades)
- **Tipo:** Color (para colores de sombra)
- **Organización:**
  - Levels: 0, 1, 2, 3, 4, 5

---

## 🎨 Estructura Detallada de Variables de Color

### Jerarquía de Variables

```
Colors Collection
├── Primary
│   ├── Primary (Base)
│   ├── Primary Container
│   ├── On Primary
│   └── On Primary Container
│
├── Secondary
│   ├── Secondary (Base)
│   ├── Secondary Container
│   ├── On Secondary
│   └── On Secondary Container
│
├── Tertiary
│   ├── Tertiary (Base)
│   ├── Tertiary Container
│   ├── On Tertiary
│   └── On Tertiary Container
│
├── Error
│   ├── Error (Base)
│   ├── Error Container
│   ├── On Error
│   └── On Error Container
│
├── Neutral
│   ├── Neutral 0-100 (escala completa)
│   ├── Neutral Variant 0-100
│   ├── Outline
│   └── Outline Variant
│
└── Surface
    ├── Surface
    ├── Surface Variant
    ├── Surface Container Highest
    ├── Surface Container High
    ├── Surface Container
    ├── Surface Container Low
    ├── Surface Container Lowest
    ├── On Surface
    ├── On Surface Variant
    └── Inverse Surface / On Inverse Surface
```

### Modos de Color (Modes)

Cada variable de color tiene **modos** que representan diferentes temas:

- **Light Mode:** Colores para tema claro
- **Dark Mode:** Colores para tema oscuro
- **High Contrast (opcional):** Para accesibilidad

### Alias y Referencias

Las variables pueden hacer referencia a otras variables usando **aliases**:

```
Primary → referencia a: Primary/Primary (Light)
Primary Container → referencia a: Primary/Primary Container (Light)
On Primary → referencia a: Primary/On Primary (Light)
```

---

## 📝 Estructura de Variables de Tipografía

### Font Families
```
Typography Collection
├── Font Family
│   ├── Display Font (Roboto)
│   ├── Body Font (Roboto)
│   └── Mono Font (Roboto Mono)
```

### Font Sizes (Material 3 Scale)
```
Font Sizes
├── Display Large: 57px
├── Display Medium: 45px
├── Display Small: 36px
├── Headline Large: 32px
├── Headline Medium: 28px
├── Headline Small: 24px
├── Title Large: 22px
├── Title Medium: 16px
├── Title Small: 14px
├── Label Large: 14px
├── Label Medium: 12px
├── Label Small: 11px
├── Body Large: 16px
├── Body Medium: 14px
└── Body Small: 12px
```

### Line Heights
- Cada tamaño de fuente tiene un line-height asociado
- Ratio típico: 1.2-1.5x el font-size

### Font Weights
```
Font Weights
├── Regular: 400
├── Medium: 500
├── SemiBold: 600
└── Bold: 700
```

---

## 📏 Estructura de Variables de Espaciado

### Spacing Scale (Material 3 usa base de 4px)
```
Spacing Collection
├── 0: 0px
├── 1: 4px
├── 2: 8px
├── 3: 12px
├── 4: 16px
├── 5: 24px
├── 6: 32px
├── 7: 40px
├── 8: 48px
├── 9: 64px
├── 10: 80px
└── ... (continúa la escala)
```

### Uso en Componentes
- **Padding:** Usa valores de spacing
- **Gap:** Usa valores de spacing
- **Margin:** Usa valores de spacing

---

## 🔄 Conexión entre Variables (Aliases)

### Sistema de Referencias

Las variables pueden hacer referencia a otras variables creando una **jerarquía**:

```
Ejemplo de conexión:
┌─────────────────────────────────┐
│ Button/Primary/Background       │
│ → Alias de: Colors/Primary     │
└─────────────────────────────────┘
         ↓
┌─────────────────────────────────┐
│ Colors/Primary                  │
│ → Modo Light: #6750A4           │
│ → Modo Dark: #D0BCFF            │
└─────────────────────────────────┘
```

### Tipos de Conexiones

1. **Direct Reference (Referencia Directa):**
   - Variable A → Variable B
   - Ejemplo: `Button Background` → `Primary Color`

2. **Nested Reference (Referencia Anidada):**
   - Variable A → Variable B → Variable C
   - Ejemplo: `Card Background` → `Surface Container` → `Neutral 10`

3. **Mode-Specific (Específico por Modo):**
   - Diferentes referencias según el modo (Light/Dark)
   - Ejemplo: En Light mode usa `Neutral 10`, en Dark mode usa `Neutral 90`

---

## 🎯 Organización por Componentes

### Variables de Componente

Cada componente puede tener sus propias variables que referencian las variables base:

```
Component Variables
├── Button
│   ├── Background → Colors/Primary
│   ├── Text Color → Colors/On Primary
│   ├── Border Radius → Border Radius/Medium
│   └── Padding → Spacing/4
│
├── Card
│   ├── Background → Colors/Surface Container
│   ├── Border → Colors/Outline
│   ├── Border Radius → Border Radius/Large
│   └── Elevation → Elevation/1
│
└── Input
    ├── Background → Colors/Surface
    ├── Border → Colors/Outline
    ├── Text Color → Colors/On Surface
    └── Border Radius → Border Radius/Small
```

---

## 🔗 Sistema de Tokens Compuestos

### Tokens Semánticos

Material Design 3 usa un sistema de **tokens semánticos** que referencian tokens base:

```
Semantic Tokens
├── Interactive/Default
│   ├── Background → Primary
│   ├── Foreground → On Primary
│   └── Border → Primary
│
├── Interactive/Hover
│   ├── Background → Primary (con opacidad)
│   └── Foreground → On Primary
│
└── Interactive/Pressed
    ├── Background → Primary (más oscuro)
    └── Foreground → On Primary
```

---

## 📊 Estructura para Graffiti Trails

### Adaptación del Material 3

Basándonos en el UI Kit de Syncfusion, nuestra estructura debería ser:

```
Graffiti Trails Variables
├── Colors
│   ├── Primary (Personalizado: #FF6B35)
│   │   ├── Primary (Light: #FF6B35, Dark: #FF8C5A)
│   │   ├── Primary Container
│   │   ├── On Primary
│   │   └── On Primary Container
│   │
│   ├── Secondary (Personalizado: #2D3142)
│   │   ├── Secondary (Light: #2D3142, Dark: #4A5068)
│   │   ├── Secondary Container
│   │   ├── On Secondary
│   │   └── On Secondary Container
│   │
│   ├── Categories (Custom)
│   │   ├── Graffiti: #E74C3C
│   │   ├── Mural: #3498DB
│   │   ├── Escultura: #F39C12
│   │   └── Performance: #9B59B6
│   │
│   └── Neutral (Material 3 adaptado)
│       └── Neutral 0-100 (ajustado a nuestra escala)
│
├── Typography
│   ├── Font Families (Roboto del Material 3)
│   ├── Font Sizes (ajustados a nuestro sistema)
│   ├── Line Heights
│   └── Font Weights
│
├── Spacing
│   └── Scale 8px base (adaptado de Material 3 4px)
│
├── Border Radius
│   └── Material 3 values (Small, Medium, Large, XL, Full)
│
└── Elevation
    └── Material 3 levels (0-5)
```

---

## 🛠️ Mejores Prácticas

### 1. Nomenclatura
- Usar nombres descriptivos y consistentes
- Seguir convenciones de Material Design 3
- Usar camelCase o kebab-case consistentemente

### 2. Organización
- Agrupar variables relacionadas en colecciones
- Usar jerarquía clara (Base → Semantic → Component)
- Documentar variables complejas

### 3. Modos
- Definir valores para cada modo (Light/Dark)
- Usar aliases para mantener consistencia
- Probar ambos modos regularmente

### 4. Referencias
- Preferir aliases sobre valores hardcodeados
- Crear tokens semánticos que referencien tokens base
- Evitar referencias circulares

---

## ✅ Checklist de Implementación

Para implementar las variables en nuestro prototipo:

- [ ] Duplicar colección de Colors del UI Kit
- [ ] Personalizar Primary y Secondary colors
- [ ] Agregar colección custom de Categories
- [ ] Duplicar colección de Typography
- [ ] Ajustar font sizes a nuestro sistema
- [ ] Duplicar colección de Spacing
- [ ] Adaptar spacing scale a 8px base
- [ ] Duplicar colección de Border Radius
- [ ] Duplicar colección de Elevation
- [ ] Crear variables de componente (Button, Card, Input)
- [ ] Configurar modos Light y Dark
- [ ] Probar todas las referencias y aliases
- [ ] Documentar estructura final

---

*Documento generado basado en Material Design 3 y UI Kit de Syncfusion*  
*Fecha: Inicio del proyecto*  
*Estado: Guía para implementación en Figma*

