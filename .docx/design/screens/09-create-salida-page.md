# 👥 CreateSalidaPage

## 📋 Descripción
Formulario para crear una salida grupal a partir de una ruta existente. Permite definir fecha, hora, punto de encuentro y descripción para invitar a otros usuarios a recorrer la ruta juntos.

**Persona principal:** Ana (Organizadora de Salidas)

---

## 🖼️ Wireframe ASCII

```
┌─────────────────────────────────┐
│ ✕ Nueva Salida Grupal          │ ← App Bar
├─────────────────────────────────┤
│                                 │
│ 👥 Organiza un recorrido        │
│    grupal                       │
│                                 │
├─────────────────────────────────┤
│ 🛣️ Ruta seleccionada           │
│ ┌─────────────────────────────┐│
││ "Murales de Palermo"          ││
││ 🎨 5 obras • 📏 2.3 km        ││ ← Ruta card (readonly)
││                      [Cambiar]││
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ 📅 Fecha *                      │
│ ┌─────────────────────────────┐│
││ Sábado 15 de marzo, 2024   📅││ ← Date picker
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ ⏰ Hora *                       │
│ ┌─────────────────────────────┐│
││ 10:00 AM                   🕐││ ← Time picker
│└─────────────────────────────┘│
├─────────────────────────────────┤
│ 📍 Punto de encuentro *         │
│ ┌─────────────────────────────┐│
││ 🔍 Buscar lugar...            ││ ← Search/autocomplete
│└─────────────────────────────┘│
│ (Se usará como punto A de la   │
│  ruta si es diferente)          │
├─────────────────────────────────┤
│ 📝 Descripción (opcional)       │
│ ┌─────────────────────────────┐│
││ Recorrido por los mejores    ││
││ murales de Palermo. Traer    ││ ← Textarea
││ cámara y zapatos cómodos...  ││
│└─────────────────────────────┘│
│ 0/500                           │
├─────────────────────────────────┤
│                                 │
│ [       Crear Salida       ]   │ ← CTA principal
│                                 │
└─────────────────────────────────┘
```

---

## 🧩 Componentes Necesarios

### App Bar
| Elemento | Especificación |
|----------|----------------|
| Close button | ✕ 24px |
| Título | "Nueva Salida Grupal" - Body Large, Bold |
| Altura | 56px |

### Header
| Elemento | Especificación |
|----------|----------------|
| Icono | 👥 24px |
| Texto | "Organiza un recorrido grupal" - H3 |
| Subtítulo | (Opcional) Body Small, Neutral 600 |

### Ruta Card (Seleccionada)
| Elemento | Especificación |
|----------|----------------|
| Fondo | Surface 2 |
| Border radius | 12px |
| Padding | 16px |
| Título | Body Medium, Bold |
| Stats | Body Small, icono + valor |
| Botón "Cambiar" | Text button, derecha |
| Tap action (Cambiar) | Abre modal de selección de ruta |

### Form Fields

#### Label
| Elemento | Especificación |
|----------|----------------|
| Estilo | Body Small, Bold |
| Icono | Antes del texto, 16px |
| Requerido | * después del texto (Error color) |
| Margin bottom | 8px |

#### Date Picker
| Elemento | Especificación |
|----------|----------------|
| Input | Readonly, tap abre picker |
| Formato | "Día DD de mes, YYYY" |
| Icono derecho | 📅 calendario |
| Validación | Fecha futura |
| Picker nativo | Modal o inline calendar |

#### Time Picker
| Elemento | Especificación |
|----------|----------------|
| Input | Readonly, tap abre picker |
| Formato | "HH:MM AM/PM" |
| Icono derecho | 🕐 reloj |
| Picker nativo | Modal con hours/minutes |

#### Punto de Encuentro
| Elemento | Especificación |
|----------|----------------|
| Tipo | Search input con autocomplete |
| Placeholder | "Buscar lugar..." |
| Icono izquierdo | 🔍 |
| Autocomplete | Direcciones y lugares |
| Validación | Requerido |

#### Descripción (Textarea)
| Elemento | Especificación |
|----------|----------------|
| Tipo | Textarea multiline |
| Placeholder | "Describe la salida..." |
| Min height | 100px |
| Max chars | 500 |
| Contador | "X/500" abajo derecha |
| Opcional | Indicar en label |

### Botón Crear Salida
| Elemento | Especificación |
|----------|----------------|
| Estilo | Filled, Primary, full width |
| Texto | "Crear Salida" |
| Altura | 48px |
| Margin | 16px |
| Disabled | Si faltan campos requeridos |

---

## 🔄 Estados

### Loading (Creando salida)
```
┌─────────────────────────────────┐
│                                 │
│         ⟳                       │
│    Creando salida...            │
│                                 │
└─────────────────────────────────┘
```
- Botón muestra spinner
- Campos deshabilitados

### Éxito
```
┌─────────────────────────────────┐
│                                 │
│         ✅                      │
│    ¡Salida creada!              │
│                                 │
│    Comparte el link para        │
│    invitar participantes        │
│                                 │
│ ┌─────────────────────────────┐│
││ 🔗 graffiti.app/salida/abc   ││ ← Link copiable
││                      [Copiar] ││
│└─────────────────────────────┘│
│                                 │
│ [Compartir]    [Ver Salida]     │
│                                 │
└─────────────────────────────────┘
```

### Error de Validación
```
┌─────────────────────────────────┐
│ 📅 Fecha *                      │
│ ┌─────────────────────────────┐│
││ [Campo vacío]                 ││
│└─────────────────────────────┘│
│ ⚠️ Este campo es requerido     │ ← Error message
├─────────────────────────────────┤
│ 📅 Fecha *                      │
│ ┌─────────────────────────────┐│
││ Ayer                          ││
│└─────────────────────────────┘│
│ ⚠️ La fecha debe ser futura    │ ← Error específico
└─────────────────────────────────┘
```

### Error de Red
```
┌─────────────────────────────────┐
│                                 │
│         ⚠️                     │
│    Error al crear la salida     │
│    Verifica tu conexión         │
│                                 │
│    [Reintentar]                 │
│                                 │
└─────────────────────────────────┘
```

---

## 📋 Modal: Seleccionar Ruta

```
┌─────────────────────────────────┐
│         ━━━━━━━━━━             │
├─────────────────────────────────┤
│                                 │
│ Seleccionar Ruta                │
│                                 │
│ ┌─────────────────────────────┐│
││ ○ "Murales de Palermo"       ││
││   🎨 5 obras • 📏 2.3 km     ││
│├─────────────────────────────┤│
││ ○ "Arte en La Boca"          ││
││   🎨 8 obras • 📏 3.1 km     ││ ← Radio buttons
│├─────────────────────────────┤│
││ ○ "Graffitis Centro"         ││
││   🎨 6 obras • 📏 1.8 km     ││
│└─────────────────────────────┘│
│                                 │
│ [        Confirmar        ]     │
│                                 │
└─────────────────────────────────┘
```

---

## 👆 Interacciones

| Acción | Resultado |
|--------|-----------|
| Tap en ✕ | Cierra formulario (confirmación si hay datos) |
| Tap en "Cambiar" ruta | Abre modal de selección |
| Tap en Date field | Abre date picker |
| Tap en Time field | Abre time picker |
| Escribir en Punto de encuentro | Muestra autocomplete |
| Escribir en Descripción | Actualiza contador |
| Tap en "Crear Salida" | Valida y envía |
| Tap en "Copiar" (éxito) | Copia link al clipboard |
| Tap en "Compartir" (éxito) | Abre share sheet |
| Tap en "Ver Salida" (éxito) | Navega a SalidaDetailPage |

---

## 📐 Especificaciones Técnicas

### Layout
- **Frame:** 375x812px
- **App Bar:** 56px
- **Contenido:** Scroll vertical
- **Padding:** 16px horizontal
- **Gap entre campos:** 16px

### Campos
- **Input height:** 48px
- **Textarea min-height:** 100px
- **Border radius:** 8px

### Validación
- **Fecha:** Futura, requerida
- **Hora:** Requerida
- **Punto de encuentro:** Requerido
- **Descripción:** Máximo 500 chars, opcional

---

## 🔗 Navegación

### Llega desde:
- RutaDetailPage (tap en "Crear Salida")
- RutaListPage (tap en "Crear Salida" de una ruta)
- Menú (si hay acceso directo)

### Navega hacia:
- **SalidaDetailPage:** Después de crear (opción "Ver Salida")
- **ShareSheet:** Tap en "Compartir"
- **RutaListPage:** Al cancelar/cerrar

### Pre-filled data:
- Si viene de RutaDetailPage, la ruta ya está seleccionada

---

## 💡 Notas de Diseño

1. **Formulario simple:** Mínimos campos necesarios
2. **Ruta pre-seleccionada:** Si viene de una ruta específica
3. **Validación en tiempo real:** Feedback inmediato
4. **Link compartible:** Fácil de copiar y compartir
5. **Confirmación al cerrar:** Si hay datos ingresados

---

## ✅ Checklist de Diseño

- [ ] App Bar con close
- [ ] Header con icono y texto
- [ ] Ruta card seleccionada
- [ ] Botón "Cambiar" ruta
- [ ] Date picker field
- [ ] Time picker field
- [ ] Punto de encuentro (autocomplete)
- [ ] Descripción (textarea con contador)
- [ ] Botón "Crear Salida"
- [ ] Estados de validación (error por campo)
- [ ] Estado Loading
- [ ] Estado Éxito con link
- [ ] Modal selección de ruta
- [ ] Confirmación al cerrar con datos

---

*Relacionado con:* `ux-flows.md` > Flow 3: Convertir Ruta en Salida Grupal
