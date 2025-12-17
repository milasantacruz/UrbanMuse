# 📱 Plan de Preparación para Publicación en Google Play Store

## 🎯 Objetivo

Preparar la aplicación **Street Muse** (UrbanMuse) para su publicación en Google Play Store, cumpliendo con todos los requisitos técnicos, legales y de calidad de Google.

## 📊 Estado Actual del Proyecto

**Última actualización:** $(date)  
**Progreso general:** ~15% completado  
**Fase actual:** Fase 1 - Configuración Técnica (85% completada)

### ✅ Completado
- Configuración de Build (applicationId, versiones, SDKs)
- AndroidManifest.xml (permisos, label, seguridad)
- ProGuard/R8 configurado
- Descripción actualizada en pubspec.yaml

### ⚠️ Pendiente (Acciones Manuales)
- Generar keystore y configurar key.properties
- Probar build de release con ProGuard
- Assets para Play Store
- Contenido para Play Store

---

## 📋 Fase 1: Configuración Técnica de la App (3-5 días) ✅ **85% COMPLETADA**

### Tarea 1.1: Actualizar Configuración de Build ✅ **COMPLETADA**
**Prioridad:** Alta  
**Tiempo estimado:** 2-3 horas
**Estado:** ✅ Completada

#### Archivo: `android/app/build.gradle.kts`

**Cambios requeridos:**
- [x] ✅ Configurar `applicationId` único → `com.streetmuse.app`
- [x] ✅ Definir `versionCode` → `1`
- [x] ✅ Definir `versionName` → `"1.0.0"`
- [x] ✅ Configurar `minSdkVersion` → `21` (Android 5.0)
- [x] ✅ Configurar `targetSdkVersion` → `34` (Android 14)
- [x] ✅ Configurar `compileSdkVersion` → `34`
- [x] ✅ Habilitar ProGuard/R8 para optimización de código
- [x] ✅ Configurar signing configs para release builds (requiere keystore manual)

**Código implementado:**
```kotlin
android {
    namespace = "com.streetmuse.app"
    compileSdk = 34

    defaultConfig {
        applicationId = "com.streetmuse.app"
        minSdk = 21
        targetSdk = 34
        versionCode = 1
        versionName = "1.0.0"
    }

    signingConfigs {
        if (keystorePropertiesFile.exists()) {
            create("release") {
                keyAlias = keystoreProperties["keyAlias"] as String
                keyPassword = keystoreProperties["keyPassword"] as String
                storeFile = file(keystoreProperties["storeFile"] as String)
                storePassword = keystoreProperties["storePassword"] as String
            }
        }
    }

    buildTypes {
        release {
            signingConfig = if (keystorePropertiesFile.exists()) {
                signingConfigs.getByName("release")
            } else {
                signingConfigs.getByName("debug")
            }
            isMinifyEnabled = true
            isShrinkResources = true
            proguardFiles(
                getDefaultProguardFile("proguard-android-optimize.txt"),
                "proguard-rules.pro"
            )
        }
    }
}
```

**Nota:** El proyecto usa Kotlin DSL (`.kts`) en lugar de Groovy.

#### Archivo: `pubspec.yaml`

**Cambios requeridos:**
- [x] ✅ Actualizar `version` a formato correcto → `1.0.0+1`
- [x] ✅ Actualizar `description` con descripción completa de la app
- [x] ✅ Agregar `homepage` (comentado, listo para cuando esté disponible)
- [x] ✅ Agregar `repository` (comentado, listo para cuando esté disponible)
- [x] ✅ Verificar que todas las dependencias estén actualizadas

**Implementado:**
```yaml
name: urbanmuse
description: "Street Muse - Explora y descubre arte urbano en tu ciudad. Encuentra grafitis, murales, esculturas y más."
version: 1.0.0+1
# homepage: https://streetmuse.app  # Descomentar cuando esté disponible
# repository: https://github.com/tu-usuario/street-muse  # Descomentar cuando esté disponible
```

---

### Tarea 1.2: Configurar AndroidManifest.xml ✅ **COMPLETADA**
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 horas
**Estado:** ✅ Completada

#### Archivo: `android/app/src/main/AndroidManifest.xml`

**Cambios requeridos:**
- [x] ✅ Agregar `android:label` con nombre de la app → `"Street Muse"`
- [x] ✅ Agregar `android:icon` apuntando al icono de la app → `@mipmap/ic_launcher`
- [x] ✅ Configurar permisos necesarios:
  - [x] ✅ `INTERNET`
  - [x] ✅ `ACCESS_FINE_LOCATION` (para mapas)
  - [x] ✅ `ACCESS_COARSE_LOCATION` (para mapas)
  - [x] ✅ `CAMERA` (para publicar obras)
  - [x] ✅ `READ_EXTERNAL_STORAGE` (para Android ≤ 32)
  - [x] ✅ `READ_MEDIA_IMAGES` (para Android ≥ 33)
- [x] ✅ Agregar `android:usesCleartextTraffic="false"` para seguridad
- [x] ✅ Configurar `android:theme` correcto (ya estaba configurado)
- [x] ✅ Agregar `android:hardwareAccelerated="true"` para mejor rendimiento

**Implementado:**
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.streetmuse.app">
    
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"
        android:maxSdkVersion="32"/>
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"
        android:minSdkVersion="33"/>
    
    <application
        android:label="Street Muse"
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="false"
        android:hardwareAccelerated="true">
        
        <activity
            android:name=".MainActivity"
            android:exported="true"
            android:launchMode="singleTop"
            android:theme="@style/LaunchTheme"
            android:configChanges="orientation|keyboardHidden|keyboard|screenSize|smallestScreenSize|locale|layoutDirection|fontScale|screenLayout|density|uiMode"
            android:hardwareAccelerated="true"
            android:windowSoftInputMode="adjustResize">
            
            <meta-data
              android:name="io.flutter.embedding.android.NormalTheme"
              android:resource="@style/NormalTheme"
              />
            
            <intent-filter>
                <action android:name="android.intent.action.MAIN"/>
                <category android:name="android.intent.category.LAUNCHER"/>
            </intent-filter>
        </activity>
        
        <meta-data
            android:name="flutterEmbedding"
            android:value="2" />
    </application>
</manifest>
```

---

### Tarea 1.3: Configurar ProGuard/R8 ✅ **COMPLETADA**
**Prioridad:** Media  
**Tiempo estimado:** 2-3 horas
**Estado:** ✅ Completada

#### Archivo: `android/app/proguard-rules.pro`

**Cambios requeridos:**
- [x] ✅ Agregar reglas para Flutter
- [x] ✅ Agregar reglas para dependencias (Hive, Dio, etc.)
- [x] ✅ Agregar reglas para Google Fonts
- [x] ✅ Agregar reglas para mapas (flutter_map, latlong2)
- [x] ✅ Agregar reglas para Geolocator, Permission Handler, Image Picker, etc.
- [ ] ⚠️ Probar que la app funcione correctamente con ProGuard habilitado (pendiente de testing)

**Implementado:**
- ✅ Archivo `proguard-rules.pro` creado con reglas completas para:
  - Flutter y plugins
  - Hive (base de datos local)
  - Dio (cliente HTTP)
  - Google Fonts
  - Mapas (flutter_map, latlong2)
  - Geolocator y Permission Handler
  - Image Picker y Cached Network Image
  - URL Launcher y Share Plus
  - Connectivity Plus
  - JSON Serialization
  - Clases nativas, enums, Parcelable, recursos

**Nota:** Se requiere testing del build de release para verificar que ProGuard no elimine clases necesarias.

---

### Tarea 1.4: Configurar Signing para Release ⚠️ **PARCIALMENTE COMPLETADA**
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 horas
**Estado:** ⚠️ Configuración lista, requiere keystore manual

**Pasos:**
1. [ ] ⚠️ **PENDIENTE:** Generar keystore para firma de la app:
   ```bash
   cd urbanmuse/android
   keytool -genkey -v -keystore upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
2. [x] ✅ Crear template `android/key.properties.template` con instrucciones
3. [ ] ⚠️ **PENDIENTE:** Copiar template y completar con valores reales:
   ```properties
   storePassword=<password>
   keyPassword=<password>
   keyAlias=upload
   storeFile=../upload-keystore.jks
   ```
4. [x] ✅ `key.properties` ya está en `.gitignore` (verificado)
5. [x] ✅ Configurar `android/app/build.gradle.kts` para usar el keystore (configuración lista)
6. [ ] ⚠️ **PENDIENTE:** Probar que el build de release funcione correctamente

**⚠️ IMPORTANTE:** Guardar el keystore y las contraseñas en un lugar seguro. Sin ellos, no se podrán actualizar la app en Play Store.

**Estado actual:**
- ✅ Configuración de signing en `build.gradle.kts` lista
- ✅ Template `key.properties.template` creado con instrucciones
- ✅ Build configurado para usar signing de release cuando `key.properties` exista
- ⚠️ Falta generar keystore manualmente (acción del desarrollador)

---

## 📋 Fase 2: Assets y Recursos Visuales (5-7 días)

### Tarea 2.1: Crear Icono de la App
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 días

**Requisitos de Google Play:**
- [ ] Icono principal: 512x512 px (PNG, sin transparencia)
- [ ] Iconos adaptativos para Android:
  - [ ] `mipmap-mdpi`: 48x48 px
  - [ ] `mipmap-hdpi`: 72x72 px
  - [ ] `mipmap-xhdpi`: 96x96 px
  - [ ] `mipmap-xxhdpi`: 144x144 px
  - [ ] `mipmap-xxxhdpi`: 192x192 px
- [ ] Icono debe ser único y representativo de la app
- [ ] No usar iconos de Material Design genéricos
- [ ] Verificar que el icono se vea bien en diferentes fondos

**Herramientas recomendadas:**
- Android Asset Studio: https://romannurik.github.io/AndroidAssetStudio/
- Flutter Launcher Icons: https://pub.dev/packages/flutter_launcher_icons

---

### Tarea 2.2: Crear Screenshots para Play Store
**Prioridad:** Alta  
**Tiempo estimado:** 2-3 días

**Requisitos:**
- [ ] Mínimo 2 screenshots (máximo 8)
- [ ] Resolución mínima: 320px
- [ ] Resolución máxima: 3840px
- [ ] Aspecto: 16:9 o 9:16
- [ ] Formato: PNG o JPEG (24 bits)
- [ ] Tamaño máximo por imagen: 8MB

**Screenshots recomendados:**
1. [ ] Pantalla principal (Mapa)
2. [ ] Feed de obras
3. [ ] Detalle de obra
4. [ ] Creación de ruta
5. [ ] Perfil de artista
6. [ ] Top N de rutas
7. [ ] Encuentros/Eventos
8. [ ] Filtros y búsqueda

**Herramientas:**
- Usar emulador o dispositivo real
- Flutter Screenshot package
- Herramientas de edición (Figma, Photoshop)

---

### Tarea 2.3: Crear Feature Graphic
**Prioridad:** Alta  
**Tiempo estimado:** 1 día

**Requisitos:**
- [ ] Tamaño: 1024x500 px
- [ ] Formato: PNG o JPEG (24 bits)
- [ ] Sin texto (o mínimo)
- [ ] Representativo de la app
- [ ] Atractivo visualmente

---

### Tarea 2.4: Crear Video Promocional (Opcional pero recomendado)
**Prioridad:** Baja  
**Tiempo estimado:** 2-3 días

**Requisitos:**
- [ ] Duración: 30 segundos a 2 minutos
- [ ] Resolución: 1080p o superior
- [ ] Formato: MP4, 3GP, o WebM
- [ ] Mostrar funcionalidades principales
- [ ] Incluir música de fondo (con licencia)

---

## 📋 Fase 3: Contenido y Metadatos (2-3 días)

### Tarea 3.1: Preparar Descripción de la App
**Prioridad:** Alta  
**Tiempo estimado:** 1 día

**Requisitos:**
- [ ] Título: Máximo 50 caracteres
- [ ] Descripción corta: Máximo 80 caracteres
- [ ] Descripción completa: Máximo 4000 caracteres
- [ ] Incluir palabras clave relevantes
- [ ] Describir funcionalidades principales
- [ ] Incluir información de contacto/soporte

**Ejemplo de descripción corta:**
```
Explora arte urbano en tu ciudad. Encuentra grafitis, murales y esculturas.
```

**Ejemplo de descripción completa:**
```
Street Muse es tu guía definitiva para descubrir arte urbano en Buenos Aires y más allá.

🎨 EXPLORA ARTE URBANO
Navega por un mapa interactivo y descubre cientos de obras de arte urbano cerca de ti. Desde grafitis coloridos hasta murales impresionantes y esculturas únicas.

📍 RUTAS PERSONALIZADAS
Crea rutas personalizadas para explorar múltiples obras. Elige tu modo de transporte (a pie o en bicicleta) y descubre la mejor ruta para ti.

👨‍🎨 CONOCE A LOS ARTISTAS
Descubre quién creó cada obra y conoce más sobre los artistas locales. Sigue a tus favoritos y mantente al día con sus nuevas creaciones.

📅 ENCUENTROS Y EVENTOS
Únete a encuentros donde los artistas pintan en vivo. Recibe notificaciones de eventos próximos y no te pierdas ninguna oportunidad.

⭐ TOP N DE RUTAS
Guarda tus rutas favoritas en tu Top N para acceso rápido. Organiza y personaliza tu experiencia de exploración.

CARACTERÍSTICAS:
• Mapa interactivo con todas las obras
• Búsqueda y filtros avanzados
• Rutas personalizadas con cálculo de distancia y tiempo
• Perfiles de artistas con biografías
• Sistema de encuentros y eventos
• Modo offline para explorar sin conexión
• Compartir obras y rutas con amigos

Street Muse hace que sea fácil descubrir y apreciar el arte urbano que te rodea. ¡Descarga ahora y comienza tu aventura artística!
```

---

### Tarea 3.2: Preparar Categoría y Clasificación
**Prioridad:** Alta  
**Tiempo estimado:** 1 hora

**Configuración:**
- [ ] Categoría: Viajes y guías locales / Entretenimiento
- [ ] Clasificación de contenido: PEGI 3 / Everyone
- [ ] Etiquetas: Arte, Cultura, Turismo, Mapa, Exploración

---

### Tarea 3.3: Preparar Política de Privacidad
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 días

**Requisitos:**
- [ ] URL pública accesible
- [ ] Debe incluir:
  - [ ] Qué datos se recopilan
  - [ ] Cómo se usan los datos
  - [ ] Cómo se comparten los datos
  - [ ] Derechos del usuario
  - [ ] Información de contacto

**Herramientas:**
- Generadores de políticas de privacidad
- Revisión legal profesional (recomendado)

---

### Tarea 3.4: Preparar Términos de Servicio
**Prioridad:** Media  
**Tiempo estimado:** 1 día

**Requisitos:**
- [ ] URL pública accesible
- [ ] Términos de uso de la app
- [ ] Responsabilidades del usuario
- [ ] Limitaciones de responsabilidad

---

## 📋 Fase 4: Testing y Optimización (5-7 días)

### Tarea 4.1: Testing en Dispositivos Reales
**Prioridad:** Alta  
**Tiempo estimado:** 2-3 días

**Dispositivos a probar:**
- [ ] Android 5.0 (Lollipop) - mínimo
- [ ] Android 7.0 (Nougat)
- [ ] Android 10
- [ ] Android 12
- [ ] Android 13/14 (última versión)
- [ ] Diferentes tamaños de pantalla (phone, tablet)
- [ ] Diferentes resoluciones (HD, Full HD, 4K)

**Funcionalidades a probar:**
- [ ] Inicio de sesión/registro
- [ ] Navegación entre pantallas
- [ ] Mapa y geolocalización
- [ ] Búsqueda y filtros
- [ ] Creación de rutas
- [ ] Publicación de obras
- [ ] Modo offline
- [ ] Rendimiento general
- [ ] Manejo de errores
- [ ] Permisos de ubicación y cámara

---

### Tarea 4.2: Testing de Rendimiento
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 días

**Métricas a verificar:**
- [ ] Tiempo de inicio de la app (< 3 segundos)
- [ ] Uso de memoria (< 200MB en promedio)
- [ ] Uso de batería (optimizar si es necesario)
- [ ] Tamaño del APK/AAB (< 100MB recomendado)
- [ ] Rendimiento del mapa (60 FPS)
- [ ] Carga de imágenes (optimización de caché)

**Herramientas:**
- Flutter DevTools
- Android Studio Profiler
- Firebase Performance Monitoring

---

### Tarea 4.3: Testing de Seguridad
**Prioridad:** Alta  
**Tiempo estimado:** 1 día

**Verificaciones:**
- [ ] No hay datos sensibles en logs
- [ ] API keys no están hardcodeadas
- [ ] Comunicaciones HTTPS
- [ ] Validación de inputs del usuario
- [ ] Manejo seguro de permisos
- [ ] No hay vulnerabilidades conocidas en dependencias

**Herramientas:**
- `flutter pub outdated` para verificar dependencias
- OWASP Mobile Security Testing Guide

---

### Tarea 4.4: Optimización del APK/AAB
**Prioridad:** Media  
**Tiempo estimado:** 1 día

**Optimizaciones:**
- [ ] Habilitar ProGuard/R8
- [ ] Reducir tamaño de assets
- [ ] Optimizar imágenes (WebP cuando sea posible)
- [ ] Eliminar código no utilizado
- [ ] Usar App Bundle (AAB) en lugar de APK
- [ ] Verificar que el tamaño final sea razonable

**Comando para generar AAB:**
```bash
flutter build appbundle --release
```

---

## 📋 Fase 5: Configuración de Google Play Console (2-3 días)

### Tarea 5.1: Crear Cuenta de Desarrollador
**Prioridad:** Alta  
**Tiempo estimado:** 1 día

**Pasos:**
1. [ ] Crear cuenta de Google Play Console
2. [ ] Pagar tarifa única de $25 USD (si es primera vez)
3. [ ] Completar perfil de desarrollador
4. [ ] Verificar identidad (si es requerido)

---

### Tarea 5.2: Crear Aplicación en Play Console
**Prioridad:** Alta  
**Tiempo estimado:** 2-3 horas

**Pasos:**
1. [ ] Crear nueva aplicación
2. [ ] Seleccionar idioma predeterminado
3. [ ] Seleccionar tipo de app (App o Juego)
4. [ ] Indicar si es app gratuita o de pago
5. [ ] Indicar si contiene anuncios

---

### Tarea 5.3: Configurar Store Listing
**Prioridad:** Alta  
**Tiempo estimado:** 1 día

**Información requerida:**
- [ ] Título de la app
- [ ] Descripción corta
- [ ] Descripción completa
- [ ] Screenshots (mínimo 2)
- [ ] Feature graphic
- [ ] Icono de la app (512x512)
- [ ] Video promocional (opcional)
- [ ] Categoría
- [ ] Clasificación de contenido
- [ ] Información de contacto
- [ ] URL de política de privacidad

---

### Tarea 5.4: Configurar Contenido de la App
**Prioridad:** Alta  
**Tiempo estimado:** 1 día

**Secciones a completar:**
- [ ] Información de la app
- [ ] Store listing (ya completado)
- [ ] Precios y distribución
- [ ] Contenido de la app
- [ ] Accesibilidad
- [ ] Familias y niños (si aplica)

---

## 📋 Fase 6: Build y Subida (1-2 días)

### Tarea 6.1: Generar App Bundle (AAB)
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 horas

**Pasos:**
1. [ ] Verificar que todas las configuraciones estén correctas
2. [ ] Ejecutar `flutter clean`
3. [ ] Ejecutar `flutter pub get`
4. [ ] Generar AAB: `flutter build appbundle --release`
5. [ ] Verificar que el AAB se generó correctamente
6. [ ] Probar el AAB en un dispositivo (usando `bundletool`)

**Ubicación del AAB:**
```
build/app/outputs/bundle/release/app-release.aab
```

---

### Tarea 6.2: Subir AAB a Play Console
**Prioridad:** Alta  
**Tiempo estimado:** 1-2 horas

**Pasos:**
1. [ ] Ir a Play Console > Tu app > Producción (o Internal testing)
2. [ ] Crear nueva versión
3. [ ] Subir el archivo AAB
4. [ ] Completar notas de la versión
5. [ ] Revisar y confirmar

---

### Tarea 6.3: Configurar Testing Interno (Recomendado)
**Prioridad:** Media  
**Tiempo estimado:** 1 hora

**Pasos:**
1. [ ] Crear lista de testers internos
2. [ ] Subir AAB a Internal testing
3. [ ] Compartir enlace de testing con el equipo
4. [ ] Recopilar feedback
5. [ ] Corregir issues encontrados

---

### Tarea 6.4: Revisión de Google
**Prioridad:** Alta  
**Tiempo estimado:** 1-7 días (tiempo de Google)

**Proceso:**
- [ ] Google revisará la app automáticamente
- [ ] Puede tomar de 1 a 7 días
- [ ] Revisar estado en Play Console
- [ ] Responder a cualquier pregunta de Google
- [ ] Corregir cualquier problema reportado

---

## 📋 Fase 7: Post-Lanzamiento (Ongoing)

### Tarea 7.1: Monitoreo y Analytics
**Prioridad:** Alta  
**Tiempo estimado:** Configuración inicial 1 día

**Configuración:**
- [ ] Integrar Firebase Analytics (si no está)
- [ ] Configurar eventos personalizados
- [ ] Monitorear crashes con Firebase Crashlytics
- [ ] Configurar alertas de errores críticos

---

### Tarea 7.2: Responder a Reviews
**Prioridad:** Alta  
**Tiempo estimado:** Ongoing

**Prácticas:**
- [ ] Revisar reviews diariamente
- [ ] Responder a reviews (especialmente negativas)
- [ ] Tomar en cuenta feedback para futuras actualizaciones
- [ ] Agradecer reviews positivas

---

### Tarea 7.3: Plan de Actualizaciones
**Prioridad:** Media  
**Tiempo estimado:** Planning

**Consideraciones:**
- [ ] Planificar actualizaciones regulares
- [ ] Corregir bugs reportados
- [ ] Agregar nuevas funcionalidades
- [ ] Mantener compatibilidad con nuevas versiones de Android

---

## ✅ Checklist Final Antes de Publicar

### Configuración Técnica
- [x] ✅ `applicationId` único configurado → `com.streetmuse.app`
- [x] ✅ `versionCode` y `versionName` correctos → `1` y `"1.0.0"`
- [x] ✅ `minSdkVersion` y `targetSdkVersion` configurados → `21` y `34`
- [x] ✅ ProGuard/R8 habilitado y configurado (pendiente testing)
- [ ] ⚠️ Signing configurado correctamente (requiere keystore manual)
- [x] ✅ AndroidManifest.xml completo
- [x] ✅ Permisos justificados y documentados

### Assets
- [ ] Icono de la app (512x512) creado
- [ ] Iconos adaptativos para todas las densidades
- [ ] Mínimo 2 screenshots subidos
- [ ] Feature graphic (1024x500) creado
- [ ] Video promocional (opcional) creado

### Contenido
- [x] ✅ Título de la app actualizado en AndroidManifest → `"Street Muse"`
- [x] ✅ Descripción actualizada en pubspec.yaml
- [ ] ⚠️ Descripción corta para Play Store (máx. 80 caracteres) - pendiente
- [ ] ⚠️ Descripción completa para Play Store (máx. 4000 caracteres) - pendiente
- [ ] ⚠️ Categoría seleccionada - pendiente
- [ ] ⚠️ Clasificación de contenido completada - pendiente
- [ ] ⚠️ Política de privacidad publicada (URL) - pendiente
- [ ] ⚠️ Términos de servicio publicados (URL) - pendiente

### Testing
- [ ] App probada en múltiples dispositivos
- [ ] App probada en múltiples versiones de Android
- [ ] Rendimiento verificado
- [ ] Seguridad verificada
- [ ] Sin crashes conocidos
- [ ] Modo offline funcionando

### Build
- [ ] ⚠️ AAB generado correctamente - pendiente (requiere keystore)
- [ ] ⚠️ Tamaño del AAB razonable - pendiente testing
- [ ] ⚠️ AAB probado en dispositivo real - pendiente
- [ ] ⚠️ Notas de versión preparadas - pendiente

### Play Console
- [ ] Cuenta de desarrollador creada
- [ ] App creada en Play Console
- [ ] Store listing completo
- [ ] Contenido de la app configurado
- [ ] AAB subido a producción o testing

---

## 📅 Cronograma Estimado

| Fase | Tareas | Duración | Estado | Progreso |
|------|--------|----------|--------|----------|
| **Fase 1** | Configuración Técnica | 3-5 días | ✅ En progreso | 85% |
| **Fase 2** | Assets y Recursos Visuales | 5-7 días | ⏸️ Pendiente | 0% |
| **Fase 3** | Contenido y Metadatos | 2-3 días | ⏸️ Pendiente | 0% |
| **Fase 4** | Testing y Optimización | 5-7 días | ⏸️ Pendiente | 0% |
| **Fase 5** | Configuración Play Console | 2-3 días | ⏸️ Pendiente | 0% |
| **Fase 6** | Build y Subida | 1-2 días | ⏸️ Pendiente | 0% |
| **Fase 7** | Post-Lanzamiento | Ongoing | ⏸️ Pendiente | 0% |
| **TOTAL** | | **18-27 días** | | **~15%** |

**Nota:** El tiempo de revisión de Google (1-7 días) no está incluido en el cronograma.

### Detalle de Fase 1:
- ✅ **Tarea 1.1:** Configuración de Build - **COMPLETADA** (2-3 horas)
- ✅ **Tarea 1.2:** AndroidManifest.xml - **COMPLETADA** (1-2 horas)
- ✅ **Tarea 1.3:** ProGuard/R8 - **COMPLETADA** (2-3 horas)
- ⚠️ **Tarea 1.4:** Signing - **PARCIAL** (requiere keystore manual, ~15 min)

**Tiempo invertido en Fase 1:** ~5-8 horas  
**Tiempo restante estimado:** ~0.5-1 hora (solo keystore manual)

---

## 🚨 Consideraciones Importantes

### Seguridad
- ⚠️ **NUNCA** subir el keystore al repositorio
- ⚠️ Guardar keystore y contraseñas en lugar seguro
- ⚠️ No hardcodear API keys en el código
- ⚠️ Usar variables de entorno o archivos de configuración seguros

### Legal
- ⚠️ Asegurar que se tienen derechos sobre todas las imágenes usadas
- ⚠️ Política de privacidad debe ser accesible y completa
- ⚠️ Cumplir con GDPR si hay usuarios en Europa
- ⚠️ Verificar licencias de todas las dependencias

### Calidad
- ⚠️ La app debe funcionar correctamente en el 95% de los casos
- ⚠️ No publicar con bugs críticos conocidos
- ⚠️ Probar exhaustivamente antes de publicar
- ⚠️ Tener un plan de respuesta rápida para bugs post-lanzamiento

---

## 📚 Recursos Útiles

### Documentación Oficial
- [Flutter - Build and release an Android app](https://docs.flutter.dev/deployment/android)
- [Google Play Console Help](https://support.google.com/googleplay/android-developer)
- [Android App Bundle](https://developer.android.com/guide/app-bundle)

### Herramientas
- [Android Asset Studio](https://romannurik.github.io/AndroidAssetStudio/)
- [Flutter Launcher Icons](https://pub.dev/packages/flutter_launcher_icons)
- [Bundletool](https://developer.android.com/tools/bundletool)
- [Firebase Console](https://console.firebase.google.com/)

### Generadores
- [Privacy Policy Generator](https://www.privacypolicygenerator.info/)
- [Terms of Service Generator](https://www.termsofservicegenerator.net/)

---

## 🎯 Próximos Pasos Inmediatos

### ✅ Completado
1. ✅ **Revisar configuración actual** de `build.gradle.kts` y `AndroidManifest.xml` - **COMPLETADO**
2. ✅ **Configurar ProGuard** - **COMPLETADO** (pendiente testing)
3. ✅ **Actualizar descripción** en pubspec.yaml - **COMPLETADO**

### ⚠️ Pendiente (Acciones Manuales - Prioridad Alta)
1. ⚠️ **Generar keystore** para firma de la app (15 minutos)
   ```bash
   cd urbanmuse/android
   keytool -genkey -v -keystore upload-keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```
   - Completar `key.properties` con valores reales (usar `key.properties.template` como guía)

2. ⚠️ **Probar build de release** con ProGuard (30 minutos)
   ```bash
   flutter clean
   flutter pub get
   flutter build appbundle --release
   ```
   - Verificar que no haya errores
   - Verificar que el AAB se genere correctamente
   - Probar en dispositivo real si es posible

### 📋 Próximas Fases
3. ⚠️ **Crear icono de la app** (512x512) para Play Store - **Fase 2**
4. ⚠️ **Preparar descripción** completa para Play Store - **Fase 3**
5. ⚠️ **Testing exhaustivo** en dispositivos reales - **Fase 4**

---

**Última actualización:** $(date)  
**Responsable:** Equipo de desarrollo  
**Estado:** ✅ Fase 1 en progreso (85% completada)

### 📝 Documentación Relacionada
- ✅ `.docx/roadmaps/verificacion-configuracion-playstore.md` - Análisis detallado inicial
- ✅ `.docx/roadmaps/correcciones-aplicadas-playstore.md` - Resumen de cambios aplicados

