# ProGuard rules para Street Muse
# Este archivo contiene reglas para mantener clases necesarias durante la ofuscación

# ============================================
# Flutter
# ============================================
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# ============================================
# Hive (Base de datos local)
# ============================================
-keep class hive.** { *; }
-keep class * extends hive.TypeAdapter
-keep class * implements hive.TypeAdapter
-keepclassmembers class * extends hive.TypeAdapter {
    <init>(...);
}

# ============================================
# Dio (Cliente HTTP)
# ============================================
-keep class dio.** { *; }
-dontwarn dio.**
-keep class okhttp3.** { *; }
-keep interface okhttp3.** { *; }
-dontwarn okhttp3.**
-keep class okio.** { *; }
-dontwarn okio.**

# ============================================
# Google Fonts
# ============================================
-keep class com.google.** { *; }
-dontwarn com.google.**

# ============================================
# Mapas (flutter_map, latlong2)
# ============================================
-keep class org.davidmoten.** { *; }
-dontwarn org.davidmoten.**
-keep class com.fleaflet.** { *; }
-dontwarn com.fleaflet.**

# ============================================
# Geolocator
# ============================================
-keep class com.baseflow.geolocator.** { *; }
-dontwarn com.baseflow.geolocator.**

# ============================================
# Permission Handler
# ============================================
-keep class com.baseflow.permissionhandler.** { *; }
-dontwarn com.baseflow.permissionhandler.**

# ============================================
# Image Picker
# ============================================
-keep class io.flutter.plugins.imagepicker.** { *; }
-dontwarn io.flutter.plugins.imagepicker.**

# ============================================
# Cached Network Image
# ============================================
-keep class flutter.plugins.cachednetworkimage.** { *; }
-dontwarn flutter.plugins.cachednetworkimage.**

# ============================================
# URL Launcher
# ============================================
-keep class io.flutter.plugins.urllauncher.** { *; }
-dontwarn io.flutter.plugins.urllauncher.**

# ============================================
# Share Plus
# ============================================
-keep class dev.fluttercommunity.plus.share.** { *; }
-dontwarn dev.fluttercommunity.plus.share.**

# ============================================
# Connectivity Plus
# ============================================
-keep class dev.fluttercommunity.plus.connectivity.** { *; }
-dontwarn dev.fluttercommunity.plus.connectivity.**

# ============================================
# JSON Serialization
# ============================================
-keepattributes Signature
-keepattributes *Annotation*
-keep class com.google.gson.** { *; }
-keep class * implements com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer

# ============================================
# Modelos de datos (mantener para serialización)
# ============================================
-keep class * implements java.io.Serializable { *; }
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# ============================================
# Mantener nombres de clases nativas
# ============================================
-keepclasseswithmembernames class * {
    native <methods>;
}

# ============================================
# Mantener clases de enums
# ============================================
-keepclassmembers enum * {
    public static **[] values();
    public static ** valueOf(java.lang.String);
}

# ============================================
# Mantener clases Parcelable
# ============================================
-keep class * implements android.os.Parcelable {
    public static final android.os.Parcelable$Creator *;
}

# ============================================
# Mantener clases R (recursos)
# ============================================
-keepclassmembers class **.R$* {
    public static <fields>;
}

# ============================================
# Reglas generales
# ============================================
-dontwarn javax.annotation.**
-dontwarn javax.inject.**
-dontwarn kotlin.**
-dontwarn kotlinx.**
-keepattributes EnclosingMethod
-keepattributes InnerClasses
