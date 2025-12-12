# 🎬 Onboarding

## 📋 Descripción
Secuencia de 3 pantallas de introducción que se muestran al abrir la app por primera vez. Explica las funcionalidades principales de Graffiti Trails de forma visual y concisa.

**Persona principal:** Todos los usuarios nuevos

---

## 🖼️ Pantalla 1: Descubre Arte Urbano

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│     ┌───────────────────────┐  │
│     │                       │  │
│     │    [ILUSTRACIÓN]      │  │
│     │    Mapa con pins      │  │
│     │    de obras           │  │
│     │                       │  │
│     └───────────────────────┘  │
│                                 │
│                                 │
│         🗺️ Descubre            │ ← Título
│       Arte Urbano               │
│                                 │
│    Explora grafitis, murales    │
│    y esculturas cerca de ti     │ ← Subtítulo
│    o en cualquier ciudad        │
│                                 │
│                                 │
│         ● ○ ○                   │ ← Page indicator
│                                 │
│                                 │
│                     [Siguiente] │ ← Botón
│        [Omitir]                 │
│                                 │
└─────────────────────────────────┘
```

---

## 🖼️ Pantalla 2: Crea tus Rutas

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│     ┌───────────────────────┐  │
│     │                       │  │
│     │    [ILUSTRACIÓN]      │  │
│     │    Ruta con pins      │  │
│     │    conectados A→B     │  │
│     │                       │  │
│     └───────────────────────┘  │
│                                 │
│                                 │
│        🛣️ Crea tus             │
│          Rutas                  │
│                                 │
│    Planifica recorridos con     │
│    las obras que más te         │
│    interesen                    │
│                                 │
│                                 │
│         ○ ● ○                   │
│                                 │
│                                 │
│ [Anterior]          [Siguiente] │
│        [Omitir]                 │
│                                 │
└─────────────────────────────────┘
```

---

## 🖼️ Pantalla 3: Explora en Grupo

```
┌─────────────────────────────────┐
│                                 │
│                                 │
│     ┌───────────────────────┐  │
│     │                       │  │
│     │    [ILUSTRACIÓN]      │  │
│     │    Grupo de personas  │  │
│     │    mirando arte       │  │
│     │                       │  │
│     └───────────────────────┘  │
│                                 │
│                                 │
│      👥 Explora en              │
│          Grupo                  │
│                                 │
│    Organiza salidas grupales    │
│    y comparte la experiencia    │
│    con otros amantes del arte   │
│                                 │
│                                 │
│         ○ ○ ●                   │
│                                 │
│                                 │
│ [Anterior]          [Comenzar!] │ ← CTA final
│                                 │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### Ilustración/Imagen
| Elemento | Especificación |
|----------|----------------|
| Tamaño | ~280x280px o 60% del ancho |
| Posición | Centro-superior |
| Estilo | Ilustración vectorial o imagen |
| Colores | Palette de la app (Primary, categorías) |
| Animación | (Opcional) Lottie o entrada sutil |

### Título
| Elemento | Especificación |
|----------|----------------|
| Estilo | Headline Large (28px) |
| Weight | Bold (700) |
| Color | OnSurface (#1D1617) |
| Icono | Emoji 24px antes del texto |
| Alignment | Center |

### Subtítulo
| Elemento | Especificación |
|----------|----------------|
| Estilo | Body Medium (16px) |
| Color | OnSurface Variant (#4A4F45) |
| Alignment | Center |
| Max width | 280px |
| Max líneas | 3 |

### Page Indicator (Dots)
| Elemento | Especificación |
|----------|----------------|
| Dots | 3 círculos |
| Tamaño | 8px cada uno |
| Gap | 12px |
| Activo | Primary (#6BA034), filled |
| Inactivo | Neutral 300, outlined o filled gris |
| Posición | Centro, debajo del subtítulo |

### Botón "Siguiente"
| Elemento | Especificación |
|----------|----------------|
| Estilo | Filled, Primary |
| Texto | "Siguiente" (pantallas 1-2) |
| Posición | Bottom-right |
| Ancho | Auto o 50% |
| Altura | 48px |

### Botón "Anterior"
| Elemento | Especificación |
|----------|----------------|
| Estilo | Text button |
| Texto | "Anterior" |
| Posición | Bottom-left |
| Visibilidad | Solo pantallas 2-3 |

### Botón "Omitir"
| Elemento | Especificación |
|----------|----------------|
| Estilo | Text button, Neutral 600 |
| Texto | "Omitir" |
| Posición | Centro-bottom o top-right |
| Visibilidad | Pantallas 1-2 |

### Botón "Comenzar" (Pantalla final)
| Elemento | Especificación |
|----------|----------------|
| Estilo | Filled, Primary, más grande |
| Texto | "¡Comenzar!" |
| Posición | Bottom-right o full width |
| Ancho | 50% o 100% |
| Altura | 56px |

---

## 🔄 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap "Siguiente" | Avanza a siguiente pantalla |
| Tap "Anterior" | Vuelve a pantalla anterior |
| Tap "Omitir" | Salta a pantalla principal (Mapa) |
| Tap "Comenzar" | Va a pantalla principal (Mapa) |
| Swipe left | Avanza a siguiente pantalla |
| Swipe right | Vuelve a pantalla anterior |
| Tap en dot | (Opcional) Salta a esa pantalla |

---

## 🎨 Contenido por Pantalla

### Pantalla 1: Descubre
| Elemento | Contenido |
|----------|-----------|
| Icono | 🗺️ |
| Título | "Descubre Arte Urbano" |
| Subtítulo | "Explora grafitis, murales y esculturas cerca de ti o en cualquier ciudad" |
| Ilustración | Mapa con pins de colores (categorías) |

### Pantalla 2: Rutas
| Elemento | Contenido |
|----------|-----------|
| Icono | 🛣️ |
| Título | "Crea tus Rutas" |
| Subtítulo | "Planifica recorridos con las obras que más te interesen" |
| Ilustración | Ruta conectando puntos A→B con obras |

### Pantalla 3: Grupo
| Elemento | Contenido |
|----------|-----------|
| Icono | 👥 |
| Título | "Explora en Grupo" |
| Subtítulo | "Organiza salidas grupales y comparte la experiencia con otros amantes del arte" |
| Ilustración | Personas explorando arte juntas |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **Safe area:** Respetar notch y home indicator
- **Ilustración area:** ~50% superior
- **Texto area:** ~30% centro
- **Navigation area:** ~20% inferior

### Espaciado
- **Padding horizontal:** 32px (más amplio que otras pantallas)
- **Gap entre título y subtítulo:** 16px
- **Gap entre subtítulo y dots:** 32px
- **Gap entre dots y botones:** 48px

### Animaciones
- **Transición entre pantallas:** Slide horizontal, 300ms
- **Ilustraciones:** Fade in o scale up, 400ms
- **Dots:** Morphing suave entre estados

---

## 🔗 Navegación

### Condiciones de aparición:
- Primera vez que se abre la app
- Flag en storage local: `hasSeenOnboarding = false`

### Después del onboarding:
- Navega a MapaPage (Home)
- Guarda flag: `hasSeenOnboarding = true`

### Si se omite:
- Navega directamente a MapaPage
- Guarda flag igualmente

---

## 💡 Notas de Diseño

1. **No intrusivo:** Siempre opción de omitir
2. **Visual primero:** Ilustraciones grandes, texto mínimo
3. **Progresión clara:** Dots indican posición
4. **Swipeable:** Gesto natural para navegar
5. **Memorable:** Colores y estilo coherentes con la app
6. **No repetir:** Solo se muestra una vez

---

## 🎨 Ideas para Ilustraciones

### Pantalla 1 - Descubre
- Mapa estilizado de una ciudad
- Pins de colores (rojo, azul, naranja, morado) dispersos
- Icono de ubicación del usuario
- Estilo: flat design, colores vibrantes

### Pantalla 2 - Rutas
- Línea conectando punto A a punto B
- Pins numerados (1, 2, 3) en el camino
- Persona caminando o en bici
- Estilo: ilustración vectorial

### Pantalla 3 - Grupo
- Grupo de 3-4 personas mirando un mural
- Mural colorido de fondo
- Personas con teléfonos/cámaras
- Estilo: friendly, diverso

---

## ✅ Checklist de Diseño

### General
- [ ] Container full screen
- [ ] Safe area respetada
- [ ] Page indicator (3 dots)
- [ ] Animación de transición

### Pantalla 1
- [ ] Ilustración "Mapa con pins"
- [ ] Título con emoji 🗺️
- [ ] Subtítulo "Explora..."
- [ ] Botón "Siguiente"
- [ ] Botón "Omitir"

### Pantalla 2
- [ ] Ilustración "Ruta A→B"
- [ ] Título con emoji 🛣️
- [ ] Subtítulo "Planifica..."
- [ ] Botón "Anterior"
- [ ] Botón "Siguiente"
- [ ] Botón "Omitir"

### Pantalla 3
- [ ] Ilustración "Grupo explorando"
- [ ] Título con emoji 👥
- [ ] Subtítulo "Organiza..."
- [ ] Botón "Anterior"
- [ ] Botón "¡Comenzar!"
- [ ] Sin "Omitir" (ya es la última)

---

*Relacionado con:* `ux-flows.md` > User Journey: Primera Experiencia
