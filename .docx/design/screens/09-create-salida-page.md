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
**Widget Implementado:** `AppTopBar.create` ✅  
**Ubicación:** `lib/presentation/widgets/app_bars/app_top_bar.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Close button | ✕ 24px | `AppTopBar.create(onClose: ..., title: "Nueva Salida Grupal")` |
| Título | "Nueva Salida Grupal" - Body Large, Bold | `title: "Nueva Salida Grupal"` con `AppTextStyles.bodyLarge` |
| Altura | 56px | Material 3 standard |

### Header
**Widget:** `Column` con `AppTextStyles` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Icono | 👥 24px | `AppIcon` con `AppIconSize.medium` |
| Texto | "Organiza un recorrido grupal" - H3 | `AppTextStyles.h3` |
| Subtítulo | (Opcional) Body Small, Neutral 600 | `AppTextStyles.bodySmall` con `AppColors.neutral600` |

### Ruta Card (Seleccionada)
**Widget Implementado:** `AppRutaCard.compact` ✅  
**Ubicación:** `lib/presentation/widgets/cards/app_ruta_card.dart`

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Fondo | Surface 2 | `AppColors.surface2` |
| Border radius | 12px | `AppBorderRadius.radiusLg` |
| Padding | 16px | `AppSpacing.space4` |
| Título | Body Medium, Bold | `AppTextStyles.bodyMedium` con `fontWeight: FontWeight.bold` |
| Stats | Body Small, icono + valor | `AppTextStyles.bodySmall` con iconos |
| Botón "Cambiar" | Text button, derecha | `AppButton.text(label: "Cambiar")` |
| Tap action (Cambiar) | Abre modal de selección de ruta | `onTap` callback |

### Form Fields

#### Label
**Widget:** `Row` con `AppTextStyles` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Body Small, Bold | `AppTextStyles.bodySmall` con `fontWeight: FontWeight.bold` |
| Icono | Antes del texto, 16px | `AppIcon` con `AppIconSize.small` |
| Requerido | * después del texto (Error color) | `Text` con `AppColors.error` para "*" |
| Margin bottom | 8px | `AppSpacing.space2` |

#### Date Picker
**Widget:** `AppTextField` con `readOnly: true` + Date picker modal ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Input | Readonly, tap abre picker | `AppTextField(readOnly: true, onTap: () => showDatePicker(...))` |
| Formato | "Día DD de mes, YYYY" | Formatear con `DateFormat` |
| Icono derecho | 📅 calendario | `suffixIcon: AppIcon(Icons.calendar_today)` |
| Validación | Fecha futura | Validar en `onDateSelected` |
| Picker nativo | Modal o inline calendar | `showDatePicker` de Flutter |

#### Time Picker
**Widget:** `AppTextField` con `readOnly: true` + Time picker modal ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Input | Readonly, tap abre picker | `AppTextField(readOnly: true, onTap: () => showTimePicker(...))` |
| Formato | "HH:MM AM/PM" | Formatear con `DateFormat` |
| Icono derecho | 🕐 reloj | `suffixIcon: AppIcon(Icons.access_time)` |
| Picker nativo | Modal con hours/minutes | `showTimePicker` de Flutter |

#### Punto de Encuentro
**Widget Implementado:** `AppSearchBar` o `AppTextField` con autocomplete ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tipo | Search input con autocomplete | `AppSearchBar` o `AppTextField` con `onChanged` |
| Placeholder | "Buscar lugar..." | `placeholder: "Buscar lugar..."` |
| Icono izquierdo | 🔍 | Integrado en `AppSearchBar` |
| Autocomplete | Direcciones y lugares | Implementar con API de geocoding |
| Validación | Requerido | Validar en `onSubmit` |

#### Descripción (Textarea)
**Widget Implementado:** `AppTextField` con `maxLines` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Tipo | Textarea multiline | `AppTextField(maxLines: 4, minLines: 3)` |
| Placeholder | "Describe la salida..." | `placeholder: "Describe la salida..."` |
| Min height | 100px | `minLines: 3` (aproximado) |
| Max chars | 500 | Validar con `maxLength: 500` |
| Contador | "X/500" abajo derecha | `helperText` o `Text` debajo |
| Opcional | Indicar en label | Label sin "*" |

### Botón Crear Salida
**Widget Implementado:** `AppButton.primary` ✅

| Elemento | Especificación | Widget |
|----------|----------------|--------|
| Estilo | Filled, Primary, full width | `AppButton.primary(label: "Crear Salida")` con `Expanded` |
| Texto | "Crear Salida" | `label: "Crear Salida"` |
| Altura | 48px | `AppButton` standard height |
| Margin | 16px | `AppSpacing.space4` |
| Disabled | Si faltan campos requeridos | `enabled: _isFormValid` |

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
