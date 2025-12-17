import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/theme.dart';
import '../../../domain/entities/obra.dart';
import '../../../domain/entities/ubicacion.dart';
import '../../bloc/obra/obra_bloc.dart';
import '../../bloc/obra/obra_event.dart';
import '../../bloc/obra/obra_state.dart';
import '../../widgets/mapa/custom_map.dart';
import '../../widgets/modals/app_obra_preview_bottom_sheet.dart';
import '../../widgets/modals/create_ruta_modal.dart';
import '../../widgets/app_bars/app_map_bar.dart';
import '../../widgets/app_bars/app_bottom_nav.dart';
import '../../widgets/modals/app_filter_modal.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/buttons/app_fab.dart';
import '../../widgets/buttons/app_button.dart';

/// Página principal - Mapa de arte urbano
class MapaPage extends StatefulWidget {
  const MapaPage({super.key});

  @override
  State<MapaPage> createState() => _MapaPageState();
}

class _MapaPageState extends State<MapaPage> {
  LatLng? _userLocation;
  List<String>? _filteredCategories;
  List<String>? _filteredArtistas;
  final TextEditingController _searchController = TextEditingController();
  
  // Estado para creación de ruta desde el mapa
  bool _isCreatingRoute = false;
  Ubicacion? _puntoA;
  Ubicacion? _puntoB;
  final TextEditingController _puntoAController = TextEditingController();
  final TextEditingController _puntoBController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _requestLocationPermission();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _puntoAController.dispose();
    _puntoBController.dispose();
    super.dispose();
  }

  Future<void> _requestLocationPermission() async {
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return;
      }

      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return;
        }
      }

      if (permission == LocationPermission.whileInUse ||
          permission == LocationPermission.always) {
        final position = await Geolocator.getCurrentPosition();
        setState(() {
          _userLocation = LatLng(position.latitude, position.longitude);
        });
      }
    } catch (e) {
      // Silently fail - mapa funciona sin ubicación del usuario
    }
  }

  void _showFilterModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
            builder: (context) => AppFilterModal(
              selectedCategories: _filteredCategories ?? [],
              selectedArtists: _filteredArtistas ?? [],
              onCategoriesChanged: (categories) {
                setState(() {
                  _filteredCategories = categories.isNotEmpty ? categories : null;
                });
              },
              onArtistsChanged: (artistas) {
                setState(() {
                  _filteredArtistas = artistas.isNotEmpty ? artistas : null;
                });
              },
              onApply: () {
                Navigator.of(context).pop();
              },
            ),
    );
  }

  void _showObraPreview(Obra obra) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => AppObraPreviewBottomSheet(
        imageUrl: obra.foto,
        titulo: obra.titulo,
        artista: obra.artistaNombre,
        categoria: obra.categoria,
        onVerDetalles: () {
          Navigator.of(context).pop();
          context.push('/obra/${obra.id}');
        },
      ),
    );
  }

  void _showCreateRutaModal() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      isDismissible: false,
      enableDrag: false,
      builder: (context) => CreateRutaModal(
        puntoA: _puntoA!,
        puntoB: _puntoB!,
        onClose: () {
          Navigator.of(context).pop();
          // Resetear estado al cerrar
          setState(() {
            _isCreatingRoute = false;
            _puntoA = null;
            _puntoB = null;
            _puntoAController.clear();
            _puntoBController.clear();
          });
        },
        onRutaCreated: () {
          Navigator.of(context).pop();
          // Resetear estado después de crear ruta
          setState(() {
            _isCreatingRoute = false;
            _puntoA = null;
            _puntoB = null;
            _puntoAController.clear();
            _puntoBController.clear();
          });
        },
      ),
    );
  }

  void _onMapTapForRoute(LatLng point) {
    if (!_isCreatingRoute) return;

    setState(() {
      if (_puntoA == null) {
        // Seleccionar punto A
        _puntoA = Ubicacion(
          lat: point.latitude,
          lng: point.longitude,
        );
      } else if (_puntoB == null) {
        // Seleccionar punto B
        _puntoB = Ubicacion(
          lat: point.latitude,
          lng: point.longitude,
        );
        // Cuando se tienen ambos puntos, abrir modal de creación de ruta
        Future.delayed(const Duration(milliseconds: 300), () {
          if (mounted) {
            _showCreateRutaModal();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<ObraBloc>()..add(LoadObras()),
      child: Scaffold(
        body: Stack(
          children: [
            // Mapa
            BlocBuilder<ObraBloc, ObraState>(
              builder: (context, state) {
                if (state is ObraLoading) {
                  return const LoadingIndicator();
                }

                if (state is ObraError) {
                  return ErrorDisplay(
                    message: state.message,
                    onRetry: () => context.read<ObraBloc>().add(LoadObras()),
                  );
                }

                if (state is ObraLoaded) {
                  return CustomMap(
                    obras: state.obras,
                    userLocation: _userLocation,
                    initialCenter: const LatLng(
                      AppConstants.buenosAiresCenterLat,
                      AppConstants.buenosAiresCenterLng,
                    ),
                    initialZoom: 13.0,
                    onObraTap: _isCreatingRoute ? null : _showObraPreview,
                    onMapTap: _isCreatingRoute ? _onMapTapForRoute : null,
                    showUserLocation: true, // Siempre mostrar si está disponible
                    filteredCategories: _filteredCategories,
                    filteredArtistas: _filteredArtistas,
                    puntoA: _puntoA != null ? LatLng(_puntoA!.lat, _puntoA!.lng) : null,
                    puntoB: _puntoB != null ? LatLng(_puntoB!.lat, _puntoB!.lng) : null,
                  );
                }

                return const SizedBox.shrink();
              },
            ),

            // App Bar del mapa con búsqueda y acciones
            AppMapBar(
              searchController: _isCreatingRoute ? null : _searchController,
              searchHint: 'Buscar obras...',
              onSearchChanged: (query) {
                if (query.trim().isNotEmpty) {
                  context.read<ObraBloc>().add(SearchObras(query.trim()));
                } else {
                  context.read<ObraBloc>().add(LoadObras());
                }
              },
              onSearchTap: () {
                context.push('/feed');
              },
              onFilterTap: _isCreatingRoute ? null : _showFilterModal,
              onLocationTap: _requestLocationPermission,
              onPreviewTap: () => context.push('/preview'),
              puntoA: _puntoA,
              puntoB: _puntoB,
              puntoAController: _isCreatingRoute ? _puntoAController : null,
              puntoBController: _isCreatingRoute ? _puntoBController : null,
              onPuntoAChanged: (value) {
                // Aquí se podría hacer geocodificación inversa o búsqueda de direcciones
                // Por ahora solo actualizamos el estado
              },
              onPuntoBChanged: (value) {
                // Aquí se podría hacer geocodificación inversa o búsqueda de direcciones
                // Por ahora solo actualizamos el estado
              },
              onPuntoAClear: () {
                setState(() {
                  _puntoA = null;
                  _puntoAController.clear();
                });
              },
              onPuntoBClear: () {
                setState(() {
                  _puntoB = null;
                  _puntoBController.clear();
                });
              },
            ),

            // Indicador de modo creación de ruta
            if (_isCreatingRoute)
              Positioned(
                top: 120,
                left: 16,
                right: 16,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: AppSpacing.space3,
                    vertical: AppSpacing.space2,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.primaryContainer,
                    borderRadius: AppBorderRadius.medium,
                    boxShadow: AppShadows.medium,
                  ),
                  child: Row(
                    children: [
                      Icon(
                        _puntoA == null
                            ? Icons.location_on
                            : _puntoB == null
                                ? Icons.location_on
                                : Icons.check_circle,
                        color: AppColors.onPrimaryContainer,
                        size: 20,
                      ),
                      SizedBox(width: AppSpacing.space2),
                      Expanded(
                        child: Text(
                          _puntoA == null
                              ? 'Toca el mapa para seleccionar Punto A'
                              : _puntoB == null
                                  ? 'Toca el mapa para seleccionar Punto B'
                                  : 'Ambos puntos seleccionados',
                          style: AppTextStyles.bodyMedium.copyWith(
                            color: AppColors.onPrimaryContainer,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      if (_puntoA != null || _puntoB != null)
                        AppButton.text(
                          label: 'Cancelar',
                          onPressed: () {
                            setState(() {
                              _isCreatingRoute = false;
                              _puntoA = null;
                              _puntoB = null;
                            });
                          },
                        ),
                    ],
                  ),
                ),
              ),

            // Contador de obras
            BlocBuilder<ObraBloc, ObraState>(
              builder: (context, state) {
                if (state is ObraLoaded && !_isCreatingRoute) {
                  final count = state.obras.length;
                  return Positioned(
                    bottom: 100,
                    left: 16,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        '$count obras',
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ],
        ),
        floatingActionButton: _isCreatingRoute
            ? null // Ocultar FAB cuando se está creando ruta
            : AppFAB.extended(
                icon: const Icon(Icons.add_road),
                label: 'Crear Ruta',
                onPressed: () {
                  setState(() {
                    _isCreatingRoute = true;
                    _puntoA = null;
                    _puntoB = null;
                    _puntoAController.clear();
                    _puntoBController.clear();
                  });
                },
              ),
        bottomNavigationBar: AppBottomNav(
          currentIndex: 1, // Explorar (el mapa está dentro de explorar)
          onTap: (index) {
            switch (index) {
              case 0:
                context.go('/perfil');
                break;
              case 1:
                // Ya estamos en el mapa/explorar
                break;
              case 2:
                context.go('/rutas');
                break;
              case 3:
                context.go('/topn');
                break;
            }
          },
        ),
      ),
    );
  }
}
