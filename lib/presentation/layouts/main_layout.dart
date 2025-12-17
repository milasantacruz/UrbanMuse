import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widgets/app_bars/app_top_bar.dart';
import '../widgets/app_bars/app_bottom_nav.dart';

/// MainLayout
/// 
/// Layout principal que envuelve las páginas principales de la app.
/// Incluye:
/// - AppBar con botón de volver (si no es la página principal)
/// - BottomNav siempre visible
/// - Navegación automática entre secciones principales
class MainLayout extends StatelessWidget {
  final Widget child;
  final String? title;
  final List<Widget>? appBarActions;
  final int currentBottomNavIndex;
  final bool showBackButton;
  final VoidCallback? onBack;

  const MainLayout({
    super.key,
    required this.child,
    this.title,
    this.appBarActions,
    required this.currentBottomNavIndex,
    this.showBackButton = false,
    this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: child,
      bottomNavigationBar: AppBottomNav(
        currentIndex: currentBottomNavIndex,
        onTap: (index) => _handleBottomNavTap(context, index),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar(BuildContext context) {
    // Si no hay título y no necesita botón de volver, no mostrar AppBar
    if (title == null && !showBackButton) {
      return null;
    }

    // Si es una página de detalle o necesita botón de volver
    if (showBackButton) {
      return AppTopBar.detail(
        title: title ?? '',
        onBack: onBack ?? () => context.pop(),
        actions: appBarActions,
      );
    }

    // Página principal con título
    return AppTopBar.home(
      title: title ?? '',
      actions: appBarActions,
    );
  }

  void _handleBottomNavTap(BuildContext context, int index) {
    // Si ya estamos en esa sección, no hacer nada
    if (index == currentBottomNavIndex) {
      return;
    }

    // Navegar a la sección correspondiente
    switch (index) {
      case 0: // Perfil
        context.go('/perfil');
        break;
      case 1: // Explorar (Mapa)
        context.go('/');
        break;
      case 2: // Rutas
        context.go('/rutas');
        break;
      case 3: // Favoritos/Top Rutas
        context.go('/topn');
        break;
    }
  }
}

