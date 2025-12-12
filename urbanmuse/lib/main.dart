import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'core/injection/injection_container.dart' as di;
import 'presentation/routes/app_router.dart';

void main() async {
  // Asegurar que los bindings de Flutter estén inicializados
  WidgetsFlutterBinding.ensureInitialized();
  
  // Inicializar inyección de dependencias
  await di.init();
  
  runApp(const GraffitiTrailsApp());
}

/// Aplicación principal - Graffiti Trails
class GraffitiTrailsApp extends StatelessWidget {
  const GraffitiTrailsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      // ============================================
      // Configuración General
      // ============================================
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      
      // ============================================
      // Tema
      // ============================================
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system, // Seguir preferencia del sistema
      
      // ============================================
      // Navegación
      // ============================================
      routerConfig: appRouter,
    );
  }
}
