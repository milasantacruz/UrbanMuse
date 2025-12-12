# 🗺️ MapaPage (Home)

## 📋 Descripción
Pantalla principal de la app. Muestra un mapa interactivo con pins de obras de arte urbano. Es el punto de entrada principal y la navegación central de la experiencia.

**Persona principal:** María (Exploradora Urbana), Carlos (Turista Cultural)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ◀ Graffiti Trails    🔍  ≡     │ ← App Bar
├─────────────────────────────────┤
│ [🎨 Graffiti] [🖼️ Mural] [🗿]  │ ← Filter Chips (horizontal scroll)
├─────────────────────────────────┤
│                                 │
│         🔴    🔵               │
│     🔴         🟠              │ ← Mapa con Pins
│           🟣       🔴          │    (colores por categoría)
│     🔵                🔵       │
│               📍               │ ← Ubicación usuario
│         🟠         🔴          │
│                                 │
│                         [+ ]   │ ← FAB "Crear Ruta"
│                                 │
├─────────────────────────────────┤
│  🗺️     📱     ⭐     👤      │ ← Bottom Navigation
│  Mapa   Feed   Top10  Perfil   │
└─────────────────────────────────┘
```

### Bottom Sheet (al tocar un pin)
```
┌─────────────────────────────────┐
│         ━━━━━━━━━━             │ ← Handle
├─────────────────────────────────┤
│ ┌─────────┐  Mural "Colores    │
│ │         │  de la Ciudad"     │
│ │ [FOTO]  │  Por: @ArtistaNom  │
│ │         │  [Badge: Mural]    │
│ └─────────┘  📍 Palermo        │
│                                 │
│ [ Ver más detalles →       ]   │ ← Botón principal
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### Header (App Bar)
| Elemento | Especificación |
|----------|----------------|
| Título | "Graffiti Trails" - Body Medium, Bold |
| Icono búsqueda | 24px, outline, tappable |
| Icono menú | 24px, hamburger/drawer |
| Fondo | Surface (#FEF7FF) |
| Altura | 56px |

### Filter Chips (Categorías)
| Elemento | Especificación |
|----------|----------------|
| Layout | Horizontal scroll |
| Chip style | Outlined o Filled según selección |
| Chips | Graffiti (#E74C3C), Mural (#3498DB), Escultura (#F39C12), Performance (#9B59B6) |
| Tamaño | Height 32px, padding 12px horizontal |
| Icono | 16px a la izquierda del texto |
| Selección | Multiple (toggle) |

### Mapa
| Elemento | Especificación |
|----------|----------------|
| Provider | Placeholder o mockup estático |
| Zoom inicial | Nivel de barrio |
| Centro | Ubicación del usuario o Buenos Aires centro |
| Padding inferior | 80px (para bottom nav) |

### Pins de Mapa
| Elemento | Especificación |
|----------|----------------|
| Tamaño | 32x32px |
| Forma | Círculo con punto inferior (típico pin) |
| Borde | 2px blanco |
| Sombra | shadow-md |
| Colores | Por categoría (ver palette) |
| Estado activo | Scale 1.3x + elevación |
| Icono interior | Icono de categoría 16px, blanco |

### Pin de Ubicación del Usuario
| Elemento | Especificación |
|----------|----------------|
| Tamaño | 24x24px |
| Color | Primary (#6BA034) |
| Efecto | Pulso animado (círculo expandiéndose) |
| Centro | Punto sólido 8px |

### FAB (Floating Action Button)
| Elemento | Especificación |
|----------|----------------|
| Posición | Bottom-right, 16px margin |
| Tamaño | 56x56px |
| Color | Primary (#6BA034) |
| Icono | "route" o "+" - 24px, blanco |
| Sombra | shadow-lg |
| Label (opcional) | "Crear Ruta" |

### Bottom Sheet (Preview de Obra)
| Elemento | Especificación |
|----------|----------------|
| Handle | 4x40px, Neutral 300, centrado |
| Border radius | 16px top |
| Padding | 16px |
| Sombra | shadow-xl |
| Imagen | 100x100px, radius 8px |
| Título obra | H3 (20px), max 2 líneas |
| Nombre artista | Body Small, Neutral 600, clickable |
| Badge categoría | Chip con color de categoría |
| Ubicación | Body Small, icono 📍 16px |
| Botón | Outlined, "Ver más detalles" |
| Animación | Slide up desde bottom |

### Bottom Navigation
| Elemento | Especificación |
|----------|----------------|
| Items | Mapa, Feed, Top 10, Perfil |
| Altura | 56-80px (incluir safe area) |
| Item activo | Primary (#6BA034), filled icon |
| Item inactivo | Neutral 600, outline icon |
| Labels | Caption (12px) |
| Fondo | Surface (#FEF7FF) |
| Elevación | shadow-sm o border-top |

---

## 🔄 Estados

### Loading
```
┌─────────────────────────────────┐
│ App Bar                         │
├─────────────────────────────────┤
│ [Skeleton chips ━━━ ━━━ ━━━]   │
├─────────────────────────────────┤
│                                 │
│     [Mapa cargando...]         │
│     ⟳ Spinner central          │
│                                 │
├─────────────────────────────────┤
│ Bottom Navigation               │
└─────────────────────────────────┘
```

### Empty (Sin obras cercanas)
```
┌─────────────────────────────────┐
│ [Mapa sin pins]                 │
│                                 │
│  ┌─────────────────────────┐   │
│  │  🎨                      │   │
│  │  No hay obras cercanas   │   │
│  │  Explora otras zonas     │   │
│  │  [Ampliar búsqueda]      │   │
│  └─────────────────────────┘   │
└─────────────────────────────────┘
```

### Error (Sin conexión)
```
┌─────────────────────────────────┐
│  ⚠️ Sin conexión               │
│  Mostrando datos guardados     │
│  [Reintentar]                   │
└─────────────────────────────────┘
```

### Permiso de ubicación denegado
```
┌─────────────────────────────────┐
│  📍 Activa tu ubicación        │
│  Para ver obras cercanas        │
│  [Ir a Configuración]           │
│  [Continuar sin ubicación]      │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en pin | Abre Bottom Sheet con preview |
| Tap en "Ver más" (bottom sheet) | Navega a ObraDetailPage |
| Tap en nombre artista (bottom sheet) | Navega a ArtistaProfilePage |
| Tap en FAB | Navega a CreateRutaPage (paso 1) |
| Tap en Filter Chip | Toggle filtro, actualiza pins |
| Swipe down en Bottom Sheet | Cierra preview |
| Pinch en mapa | Zoom in/out |
| Drag en mapa | Pan/navegar |
| Tap en icono búsqueda | Abre modal de búsqueda |
| Tap en Bottom Nav item | Cambia de pantalla |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **Safe area top:** 44px (notch)
- **Safe area bottom:** 34px (home indicator)
- **App Bar height:** 56px
- **Filter chips height:** 48px
- **Bottom Nav height:** 56px + safe area
- **Mapa:** Ocupa todo el espacio restante

### Espaciado
- **Padding lateral:** 16px
- **Gap entre chips:** 8px
- **FAB margin:** 16px desde bordes

### Colores específicos
- **Fondo mapa:** Usar estilo de mapa claro
- **App Bar:** Surface (#FEF7FF)
- **Bottom Nav:** Surface (#FEF7FF)

---

## 🔗 Navegación

### Llega desde:
- App launch (pantalla inicial)
- Bottom Navigation desde cualquier pantalla
- "Ver en mapa" desde ObraDetailPage

### Navega hacia:
- **ObraDetailPage:** Tap en "Ver más" del Bottom Sheet
- **ArtistaProfilePage:** Tap en nombre de artista
- **CreateRutaPage:** Tap en FAB
- **FeedPage:** Bottom Nav "Feed"
- **Top10Page:** Bottom Nav "Top 10"
- **PerfilPage:** Bottom Nav "Perfil"
- **SearchModal:** Tap en icono búsqueda

---

## 💡 Notas de Diseño

1. **El mapa es el protagonista:** Maximizar espacio visible
2. **Pins agrupados:** Considerar clusters cuando hay muchos pins juntos
3. **Bottom Sheet parcial:** No cubrir todo el mapa, dejar contexto visible
4. **Transiciones suaves:** Animaciones de 250-350ms
5. **Colores vibrantes en pins:** Destacar sobre el mapa
6. **FAB siempre visible:** No ocultar al hacer scroll/pan

---

## ✅ Checklist de Diseño

- [ ] App Bar con búsqueda y menú
- [ ] Filter Chips horizontales (4 categorías)
- [ ] Mapa placeholder/mockup
- [ ] Pins por categoría (4 colores)
- [ ] Pin de ubicación del usuario
- [ ] FAB "Crear Ruta"
- [ ] Bottom Sheet preview de obra
- [ ] Bottom Navigation (4 items)
- [ ] Estado Loading
- [ ] Estado Empty
- [ ] Estado Error
- [ ] Estado sin permiso de ubicación

---

*Relacionado con:* `ux-flows.md` > Flow 1: Descubrir Obra
