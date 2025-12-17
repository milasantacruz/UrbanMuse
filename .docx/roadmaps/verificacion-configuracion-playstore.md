# 🔍 Verificación de Configuración Actual vs Plan de Publicación Play Store

**Fecha de verificación:** $(date)  
**Proyecto:** Street Muse (UrbanMuse)  
**Estado:** ⚠️ Requiere acciones antes de publicación

---

## 📊 Resumen Ejecutivo

| Categoría | Estado | Completitud | Acción Requerida |
|-----------|--------|-------------|------------------|
| **Configuración Build** | ⚠️ Parcial | 40% | Alta prioridad |
| **AndroidManifest** | ⚠️ Incompleto | 30% | Alta prioridad |
| **Pubspec.yaml** | ⚠️ Parcial | 60% | Media prioridad |
| **ProGuard/R8** | ❌ No configurado | 0% | Alta prioridad |
| **Signing** | ❌ No configurado | 0% | Alta prioridad |
| **Permisos** | ❌ No declarados | 0% | Alta prioridad |

**Tiempo estimado para completar:** 3-5 días

---

## 🔴 FASE 1: Configuración Técnica - Estado Actual

### ✅ Tarea 1.1: Configuración de Build (`android/app/build.gradle.kts`)

#### Estado Actual:
```kotlin
namespace = "com.example.urbanmuse"
applicationId = "com.example.urbanmuse"  // ❌ NO ÚNICO - Usa com.example
minSdk = flutter.minSdkVersion            // ⚠️ Depende de Flutter
targetSdk = flutter.targetSdkVersion     // ⚠️ Depende de Flutter
versionCode = flutter.versionCode        // ⚠️ Depende de Flutter
versionName = flutter.versionName        // ⚠️ Depende de Flutter
```

#### ❌ Problemas Identificados:

1. **applicationId NO ÚNICO**
   - ❌ Actual: `com.example.urbanmuse`
   - ✅ Requerido: `com.streetmuse.app` o similar único
   - ⚠️ **CRÍTICO:** Google Play rechazará apps con `com.example.*`

2. **namespace NO ÚNICO**
   - ❌ Actual: `com.example.urbanmuse`
   - ✅ Requerido: Debe coincidir con applicationId único

3. **Versiones dependen de Flutter**
   - ⚠️ No están explícitamente definidas
   - ✅ Requerido: Definir valores explícitos

4. **ProGuard/R8 NO HABILITADO**
   - ❌ `minifyEnabled = false` (implícito)
   - ❌ `shrinkResources = false` (implícito)
   - ❌ No hay archivo `proguard-rules.pro`
   - ✅ Requerido: Habilitar para optimización

5. **Signing NO CONFIGURADO**
   - ❌ Usa signing de debug: `signingConfig = signingConfigs.getByName("debug")`
   - ❌ No existe `key.properties`
   - ❌ No existe keystore
   - ⚠️ **CRÍTICO:** No se puede publicar sin signing de release

#### ✅ Acciones Requeridas:

```kotlin
// REQUERIDO: Cambiar applicationId y namespace
namespace = "com.streetmuse.app"
applicationId = "com.streetmuse.app"

// REQUERIDO: Definir versiones explícitas
defaultConfig {
    minSdk = 21  // Android 5.0 (Lollipop)
    targetSdk = 34  // Android 14
    versionCode = 1
    versionName = "1.0.0"
}

// REQUERIDO: Habilitar ProGuard/R8
buildTypes {
    release {
        isMinifyEnabled = true
        isShrinkResources = true
        proguardFiles(
            getDefaultProguardFile("proguard-android-optimize.txt"),
            "proguard-rules.pro"
        )
        signingConfig = signingConfigs.getByName("release")  // REQUERIDO
    }
}
```

---

### ❌ Tarea 1.2: AndroidManifest.xml

#### Estado Actual:
```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android">
    <application
        android:label="urbanmuse"  // ❌ Nombre genérico
        android:icon="@mipmap/ic_launcher">
        <!-- Sin permisos declarados -->
        <!-- Sin configuración de seguridad -->
    </application>
</manifest>
```

#### ❌ Problemas Identificados:

1. **Label incorrecto**
   - ❌ Actual: `"urbanmuse"` (genérico)
   - ✅ Requerido: `"Street Muse"` (nombre oficial)

2. **Permisos NO DECLARADOS**
   - ❌ Falta `INTERNET` (aunque puede estar implícito)
   - ❌ Falta `ACCESS_FINE_LOCATION` (para mapas)
   - ❌ Falta `ACCESS_COARSE_LOCATION` (para mapas)
   - ❌ Falta `CAMERA` (si se usa para publicar obras)
   - ❌ Falta `READ_EXTERNAL_STORAGE` (si se usa para imágenes)
   - ⚠️ **CRÍTICO:** La app usa geolocalización pero no declara permisos

3. **Configuración de seguridad faltante**
   - ❌ Falta `android:usesCleartextTraffic="false"`
   - ✅ Requerido para cumplir políticas de Google

4. **Package no declarado**
   - ⚠️ No hay atributo `package` en manifest (puede estar en namespace)

#### ✅ Acciones Requeridas:

```xml
<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="com.streetmuse.app">
    
    <!-- REQUERIDO: Permisos -->
    <uses-permission android:name="android.permission.INTERNET"/>
    <uses-permission android:name="android.permission.ACCESS_FINE_LOCATION"/>
    <uses-permission android:name="android.permission.ACCESS_COARSE_LOCATION"/>
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.READ_EXTERNAL_STORAGE"
        android:maxSdkVersion="32"/>
    <uses-permission android:name="android.permission.READ_MEDIA_IMAGES"
        android:minSdkVersion="33"/>
    
    <application
        android:label="Street Muse"  // REQUERIDO
        android:name="${applicationName}"
        android:icon="@mipmap/ic_launcher"
        android:usesCleartextTraffic="false"  // REQUERIDO
        android:hardwareAccelerated="true">
        <!-- ... resto de configuración ... -->
    </application>
</manifest>
```

---

### ⚠️ Tarea 1.3: Pubspec.yaml

#### Estado Actual:
```yaml
name: urbanmuse
description: "Graffiti Trails - Aplicación MVP para explorar arte urbano"
version: 1.0.0+1
publish_to: 'none'
```

#### ⚠️ Problemas Identificados:

1. **Descripción desactualizada**
   - ❌ Actual: "Graffiti Trails" (nombre antiguo)
   - ✅ Requerido: "Street Muse" y descripción actualizada

2. **Falta información adicional**
   - ❌ No hay `homepage`
   - ❌ No hay `repository`
   - ⚠️ No crítico pero recomendado

#### ✅ Acciones Requeridas:

```yaml
name: urbanmuse
description: "Street Muse - Explora y descubre arte urbano en tu ciudad. Encuentra grafitis, murales, esculturas y más."
version: 1.0.0+1
homepage: https://streetmuse.app  # Si existe
repository: https://github.com/tu-usuario/street-muse  # Si existe
publish_to: 'none'
```

---

### ❌ Tarea 1.4: ProGuard/R8

#### Estado Actual:
- ❌ No existe archivo `android/app/proguard-rules.pro`
- ❌ ProGuard no está habilitado en build.gradle.kts

#### ✅ Acciones Requeridas:

1. **Crear archivo `android/app/proguard-rules.pro`** con reglas para:
   - Flutter
   - Hive
   - Dio
   - Google Fonts
   - Mapas (flutter_map, latlong2)
   - Geolocator

2. **Habilitar en build.gradle.kts** (ver Tarea 1.1)

---

### ❌ Tarea 1.5: Signing para Release

#### Estado Actual:
- ❌ No existe keystore
- ❌ No existe `android/key.properties`
- ❌ Build de release usa signing de debug

#### ✅ Acciones Requeridas:

1. **Generar keystore:**
   ```bash
   keytool -genkey -v -keystore ~/upload-keystore.jks \
     -keyalg RSA -keysize 2048 -validity 10000 -alias upload
   ```

2. **Crear `android/key.properties`:**
   ```properties
   storePassword=<password>
   keyPassword=<password>
   keyAlias=upload
   storeFile=<path-to-keystore>
   ```

3. **Agregar a `.gitignore`**

4. **Configurar en `build.gradle.kts`**

---

## 📋 Checklist de Verificación

### Configuración Técnica
- [ ] ❌ `applicationId` único configurado (actual: `com.example.urbanmuse`)
- [ ] ❌ `namespace` único configurado (actual: `com.example.urbanmuse`)
- [ ] ⚠️ `versionCode` y `versionName` explícitos (dependen de Flutter)
- [ ] ⚠️ `minSdkVersion` explícito (depende de Flutter)
- [ ] ⚠️ `targetSdkVersion` explícito (depende de Flutter)
- [ ] ❌ ProGuard/R8 habilitado
- [ ] ❌ Signing configurado correctamente
- [ ] ❌ AndroidManifest.xml completo
- [ ] ❌ Permisos justificados y documentados

### Assets
- [ ] ⚠️ Icono de la app (512x512) - Verificar si existe
- [ ] ✅ Iconos adaptativos para todas las densidades (existen)
- [ ] ❌ Screenshots para Play Store
- [ ] ❌ Feature graphic (1024x500)
- [ ] ❌ Video promocional (opcional)

### Contenido
- [ ] ⚠️ Título de la app actualizado (actual: "urbanmuse")
- [ ] ⚠️ Descripción actualizada (actual: "Graffiti Trails")
- [ ] ❌ Descripción corta para Play Store
- [ ] ❌ Descripción completa para Play Store
- [ ] ❌ Categoría seleccionada
- [ ] ❌ Clasificación de contenido
- [ ] ❌ Política de privacidad publicada (URL)
- [ ] ❌ Términos de servicio publicados (URL)

---

## 🚨 Problemas Críticos (Bloquean Publicación)

1. **❌ applicationId usa `com.example.*`**
   - Google Play rechazará automáticamente
   - **Acción:** Cambiar a `com.streetmuse.app` o similar único

2. **❌ No hay signing configurado para release**
   - No se puede generar AAB firmado
   - **Acción:** Generar keystore y configurar signing

3. **❌ Permisos no declarados en AndroidManifest**
   - La app usa geolocalización pero no declara permisos
   - **Acción:** Agregar todos los permisos necesarios

4. **❌ ProGuard no configurado**
   - El AAB será más grande de lo necesario
   - **Acción:** Crear proguard-rules.pro y habilitar

---

## 📝 Plan de Acción Inmediato

### Prioridad ALTA (Día 1-2):
1. ✅ Cambiar `applicationId` y `namespace` a valor único
2. ✅ Definir versiones explícitas en build.gradle.kts
3. ✅ Agregar permisos en AndroidManifest.xml
4. ✅ Actualizar label en AndroidManifest.xml
5. ✅ Generar keystore y configurar signing
6. ✅ Crear proguard-rules.pro y habilitar ProGuard

### Prioridad MEDIA (Día 3):
1. ✅ Actualizar descripción en pubspec.yaml
2. ✅ Agregar configuración de seguridad en AndroidManifest
3. ✅ Probar build de release con ProGuard

### Prioridad BAJA (Día 4-5):
1. ⚠️ Verificar iconos (ya existen pero verificar calidad)
2. ⚠️ Preparar screenshots
3. ⚠️ Preparar feature graphic

---

## 📊 Comparación: Actual vs Requerido

| Configuración | Actual | Requerido | Estado |
|---------------|--------|-----------|--------|
| applicationId | `com.example.urbanmuse` | `com.streetmuse.app` | ❌ |
| namespace | `com.example.urbanmuse` | `com.streetmuse.app` | ❌ |
| versionCode | Flutter default | `1` | ⚠️ |
| versionName | Flutter default | `"1.0.0"` | ⚠️ |
| minSdk | Flutter default | `21` | ⚠️ |
| targetSdk | Flutter default | `34` | ⚠️ |
| ProGuard | No habilitado | Habilitado | ❌ |
| Signing | Debug | Release | ❌ |
| Permisos | No declarados | Declarados | ❌ |
| Label | `"urbanmuse"` | `"Street Muse"` | ❌ |
| Descripción | "Graffiti Trails" | "Street Muse..." | ⚠️ |

---

## ✅ Próximos Pasos Recomendados

1. **Inmediato:** Corregir problemas críticos (applicationId, signing, permisos)
2. **Corto plazo:** Completar configuración técnica (ProGuard, versiones)
3. **Medio plazo:** Preparar assets y contenido para Play Store
4. **Largo plazo:** Testing exhaustivo y optimización

---

**Última actualización:** $(date)  
**Próxima revisión:** Después de corregir problemas críticos
