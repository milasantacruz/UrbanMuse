import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/theme/theme.dart';

/// AppBottomNav
/// 
/// Bottom Navigation Bar personalizado siguiendo Material 3 y Figma.
/// 
/// **Características:**
/// - Height: 80px (Material 3 standard)
/// - 4 items: Perfil, Explorar, Rutas, Favoritos/Top Rutas
/// - Selected color: Primary (#6BA034)
/// - Unselected color: OnSurfaceVariant
/// - Icons: 24px
/// - Labels: Roboto Medium 12px
/// 
/// **Figma Reference:**
/// https://www.figma.com/design/.../node-id=2044-571
class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;

  const AppBottomNav({
    super.key,
    required this.currentIndex,
    required this.onTap,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    final effectiveSelectedColor = selectedColor ?? AppColors.primary;
    final effectiveUnselectedColor = unselectedColor ?? AppColors.onSurfaceVariant;

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(
                context: context,
                icon: Icons.person_outline,
                selectedIcon: Icons.person,
                label: 'Perfil',
                index: 0,
                isSelected: currentIndex == 0,
                selectedColor: effectiveSelectedColor,
                unselectedColor: effectiveUnselectedColor,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.home_outlined,
                selectedIcon: Icons.home,
                label: 'Explorar',
                index: 1,
                isSelected: currentIndex == 1,
                selectedColor: effectiveSelectedColor,
                unselectedColor: effectiveUnselectedColor,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.route_outlined,
                selectedIcon: Icons.route,
                label: 'Rutas',
                index: 2,
                isSelected: currentIndex == 2,
                selectedColor: effectiveSelectedColor,
                unselectedColor: effectiveUnselectedColor,
              ),
              _buildNavItem(
                context: context,
                icon: Icons.favorite_border,
                selectedIcon: Icons.favorite,
                label: 'Favoritos',
                index: 3,
                isSelected: currentIndex == 3,
                selectedColor: effectiveSelectedColor,
                unselectedColor: effectiveUnselectedColor,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem({
    required BuildContext context,
    required IconData icon,
    required IconData selectedIcon,
    required String label,
    required int index,
    required bool isSelected,
    required Color selectedColor,
    required Color unselectedColor,
  }) {
    return Expanded(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => onTap(index),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Icon
              Icon(
                isSelected ? selectedIcon : icon,
                size: 24,
                color: isSelected ? selectedColor : unselectedColor,
              ),

              SizedBox(height: AppSpacing.space1), // 4px

              // Label
              Text(
                label,
                style: GoogleFonts.roboto(
                  fontSize: 12,
                  fontWeight: FontWeight.w500, // Medium
                  color: isSelected ? selectedColor : unselectedColor,
                  height: 16 / 12, // line-height 16px
                  letterSpacing: 0.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// BottomNavItem
/// 
/// Enum para los items del bottom navigation.
/// Facilita la navegación y el manejo de estados.
enum BottomNavItem {
  perfil(0, 'Perfil', Icons.person_outline, Icons.person),
  explorar(1, 'Explorar', Icons.home_outlined, Icons.home),
  rutas(2, 'Rutas', Icons.route_outlined, Icons.route),
  favoritos(3, 'Favoritos', Icons.favorite_border, Icons.favorite);

  const BottomNavItem(this.itemIndex, this.label, this.icon, this.selectedIcon);

  final int itemIndex;
  final String label;
  final IconData icon;
  final IconData selectedIcon;

  static BottomNavItem fromIndex(int index) {
    return BottomNavItem.values.firstWhere((item) => item.itemIndex == index);
  }
}

/// AppBottomNavWithFAB
/// 
/// Bottom Navigation Bar con FAB integrado.
/// El FAB se superpone en el centro del bottom nav.
class AppBottomNavWithFAB extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onNavTap;
  final VoidCallback onFABTap;
  final String fabLabel;
  final IconData fabIcon;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? unselectedColor;

  const AppBottomNavWithFAB({
    super.key,
    required this.currentIndex,
    required this.onNavTap,
    required this.onFABTap,
    this.fabLabel = 'Crear Ruta',
    this.fabIcon = Icons.add,
    this.backgroundColor,
    this.selectedColor,
    this.unselectedColor,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomCenter,
      children: [
        // Bottom Navigation
        AppBottomNav(
          currentIndex: currentIndex,
          onTap: onNavTap,
          backgroundColor: backgroundColor,
          selectedColor: selectedColor,
          unselectedColor: unselectedColor,
        ),

        // FAB posicionado encima
        Positioned(
          bottom: 32, // 80px - 48px = 32px para centrarlo
          child: FloatingActionButton.extended(
            onPressed: onFABTap,
            icon: Icon(fabIcon),
            label: Text(fabLabel),
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.onPrimary,
            elevation: 4,
          ),
        ),
      ],
    );
  }
}

