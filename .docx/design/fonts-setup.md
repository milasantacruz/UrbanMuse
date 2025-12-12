# 🔤 Configuración de Fonts - Graffiti Trails

**Fecha:** 11 de Diciembre, 2025  
**Estado:** ✅ Configurado y sincronizado con Figma

---

## 📚 Fonts Utilizadas

El proyecto utiliza las fonts exactas del **Syncfusion Flutter UI Kit - Material 3 Theme** de Figma:

### 1. **Expletus Sans** (Display/Headline/Title)

**Uso:** Títulos, encabezados y textos destacados

**Variantes:**
- **Bold (700):** Display Large, Display Medium, Display Small, Title Large
- **SemiBold (600):** Headline Large, Headline Medium, Headline Small
- **Medium (500):** Title Medium, Title Small

**Estilos:**
- Display Large: 57px / 64px line-height / -0.25 letter-spacing
- Display Medium: 45px / 52px line-height
- Display Small: 36px / 44px line-height
- Headline Large: 32px / 40px line-height
- Headline Medium: 28px / 36px line-height
- Headline Small: 24px / 32px line-height
- Title Large: 22px / 28px line-height
- Title Medium: 16px / 24px line-height / 0.15 letter-spacing
- Title Small: 14px / 20px line-height / 0.1 letter-spacing

### 2. **Exo 2** (Label/Body)

**Uso:** Contenido, etiquetas, botones

**Variantes:**
- **SemiBold (600):** Label Large, Label Medium
- **Medium (500):** Label Small, Button
- **Regular (400):** Body Large, Body Medium, Body Small

**Estilos:**
- Label Large: 14px / 20px line-height / 0.1 letter-spacing
- Label Medium: 12px / 16px line-height / 0.5 letter-spacing
- Label Small: 11px / 16px line-height / 0.5 letter-spacing
- Body Large: 16px / 24px line-height / 0.5 letter-spacing
- Body Medium: 14px / 20px line-height / 0.25 letter-spacing
- Body Small: 12px / 16px line-height
- Button: 14px / 20px line-height / 0.1 letter-spacing

---

## 🛠️ Implementación Técnica

### 1. **Dependencia: `google_fonts`**

```yaml
# pubspec.yaml
dependencies:
  google_fonts: ^6.2.1
```

### 2. **Uso en el código**

```dart
import 'package:google_fonts/google_fonts.dart';

// Expletus Sans para títulos
TextStyle displayStyle = GoogleFonts.expletusSans(
  fontSize: 57,
  fontWeight: FontWeight.w700,
  height: 64 / 57,
  letterSpacing: -0.25,
);

// Exo 2 para body
TextStyle bodyStyle = GoogleFonts.exo2(
  fontSize: 14,
  fontWeight: FontWeight.w400,
  height: 20 / 14,
  letterSpacing: 0.25,
);
```

### 3. **Archivo central: `app_text_styles.dart`**

Todos los estilos tipográficos están definidos en:
```
lib/core/theme/app_text_styles.dart
```

**Importación:**
```dart
import '../../../core/theme/theme.dart';

// Uso directo
Text('Título', style: AppTextStyles.h1)
Text('Contenido', style: AppTextStyles.body)
Text('Botón', style: AppTextStyles.button)
```

### 4. **Integración con Theme**

El `app_theme.dart` aplica automáticamente estos estilos a través del `TextTheme`:

```dart
// app_theme.dart
static TextTheme _buildTextTheme(ColorScheme colorScheme) {
  return TextTheme(
    displayLarge: AppTextStyles.displayLarge.copyWith(
      color: colorScheme.onSurface,
    ),
    headlineLarge: AppTextStyles.headlineLarge.copyWith(
      color: colorScheme.onSurface,
    ),
    bodyLarge: AppTextStyles.bodyLarge.copyWith(
      color: colorScheme.onSurface,
    ),
    // ... etc
  );
}
```

---

## 📊 Mapeo de Estilos

### Material 3 ↔ Figma ↔ App

| Material 3 | Figma | App Alias | Font | Size |
|-----------|-------|-----------|------|------|
| displayLarge | Flutter/DisplayLarge | displayLarge | Expletus Sans Bold | 57px |
| displayMedium | Flutter/DisplayMedium | displayMedium | Expletus Sans Bold | 45px |
| displaySmall | Flutter/DisplaySmall | display | Expletus Sans Bold | 36px |
| headlineLarge | Flutter/HeadlineLarge | headlineLarge | Expletus Sans SemiBold | 32px |
| headlineMedium | Flutter/HeadlineMedium | h1 | Expletus Sans SemiBold | 28px |
| headlineSmall | Flutter/HeadlineSmall | h2 | Expletus Sans SemiBold | 24px |
| titleLarge | Flutter/TitleLarge | h3 | Expletus Sans Bold | 22px |
| titleMedium | Flutter/TitleMedium | titleMedium | Expletus Sans Medium | 16px |
| titleSmall | Flutter/TitleSmall | titleSmall | Expletus Sans Medium | 14px |
| labelLarge | Flutter/LabelLarge | label | Exo 2 SemiBold | 14px |
| labelMedium | Flutter/LabelMedium | labelMedium | Exo 2 SemiBold | 12px |
| labelSmall | Flutter/LabelSmall | labelSmall | Exo 2 Medium | 11px |
| bodyLarge | Flutter/BodyLarge | bodyLarge | Exo 2 Regular | 16px |
| bodyMedium | Flutter/BodyMedium | body | Exo 2 Regular | 14px |
| bodySmall | Flutter/BodySmall | caption | Exo 2 Regular | 12px |
| - | Button Text | button | Exo 2 Medium | 14px |

---

## 🎨 Guía de Uso

### ¿Cuándo usar cada estilo?

#### **Display Styles** (Expletus Sans Bold)
- **Display Large (57px):** Hero section, splash screen
- **Display Medium (45px):** Títulos de páginas principales
- **Display Small (36px):** Títulos destacados en secciones importantes

#### **Headline Styles** (Expletus Sans SemiBold)
- **Headline Large (32px):** Títulos de páginas internas
- **Headline Medium (28px):** Secciones principales (h1)
- **Headline Small (24px):** Subsecciones (h2)

#### **Title Styles** (Expletus Sans Bold/Medium)
- **Title Large (22px):** Títulos de tarjetas o listas (h3)
- **Title Medium (16px):** Títulos de componentes
- **Title Small (14px):** Etiquetas de secciones pequeñas

#### **Label Styles** (Exo 2 SemiBold/Medium)
- **Label Large (14px):** Etiquetas principales, nombres
- **Label Medium (12px):** Etiquetas secundarias, categorías
- **Label Small (11px):** Metadatos, timestamps
- **Button (14px):** Texto de botones

#### **Body Styles** (Exo 2 Regular)
- **Body Large (16px):** Descripciones principales
- **Body Medium (14px):** Contenido estándar de párrafos
- **Body Small (12px):** Información secundaria, captions

---

## ✅ Checklist de Validación

- [x] `google_fonts` instalado en `pubspec.yaml`
- [x] Todos los estilos definidos en `app_text_styles.dart`
- [x] Estilos usando `GoogleFonts.expletusSans()` y `GoogleFonts.exo2()`
- [x] `app_theme.dart` usando los nuevos estilos en `TextTheme`
- [x] Botones usando `GoogleFonts.exo2()` para texto
- [x] FAB usando `GoogleFonts.exo2()` para texto
- [x] Preview page actualizada con especificaciones correctas
- [x] Sin errores de linter
- [x] Sincronizado con Figma UI Kit ✅

---

## 🔗 Referencias

- **Figma UI Kit:** [Syncfusion Flutter UI Kit - Material 3 Theme](https://www.figma.com/design/cxkiJjAyXUVKmjwvj3GY0g/Syncfusion-Flutter-UI-Kit---Material-3-Theme--Community-)
- **Node Texts:** `2024-1516`
- **Google Fonts - Expletus Sans:** [fonts.google.com/specimen/Expletus+Sans](https://fonts.google.com/specimen/Expletus+Sans)
- **Google Fonts - Exo 2:** [fonts.google.com/specimen/Exo+2](https://fonts.google.com/specimen/Exo+2)
- **Material 3 Typography:** [m3.material.io/styles/typography](https://m3.material.io/styles/typography)

---

*Documento creado: 11 de Diciembre, 2025*  
*Fonts 100% sincronizadas con Figma* ✅

