import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../../core/theme/theme.dart';
import '../../bloc/usuario/usuario_cubit.dart';
import '../../bloc/usuario/usuario_state.dart';
import '../../bloc/topn/topn_cubit.dart';
import '../../bloc/topn/topn_state.dart';
import '../../bloc/artista/artista_cubit.dart';
import '../../bloc/artista/artista_state.dart';
import '../../bloc/ruta/ruta_bloc.dart';
import '../../bloc/ruta/ruta_event.dart';
import '../../bloc/ruta/ruta_state.dart';
import '../../../domain/entities/ruta.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../widgets/avatars/app_avatar.dart';
import '../../widgets/cards/app_topn_item.dart';
import '../../layouts/main_layout.dart';

/// Página de perfil del usuario
class PerfilPage extends StatelessWidget {
  const PerfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.getIt<UsuarioCubit>()..loadUsuarioActual()),
        BlocProvider(create: (_) => di.getIt<TopNCubit>()..loadTopN()),
        BlocProvider(create: (_) => di.getIt<RutaBloc>()..add(const LoadRutas())),
      ],
      child: MainLayout(
        title: 'Perfil',
        currentBottomNavIndex: 0, // Perfil
        appBarActions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // TODO: Navegar a configuración
            },
            tooltip: 'Configuración',
          ),
        ],
        child: BlocBuilder<UsuarioCubit, UsuarioState>(
          builder: (context, state) {
            if (state is UsuarioLoading) {
              return const LoadingIndicator();
            }

            if (state is UsuarioError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<UsuarioCubit>().loadUsuarioActual(),
              );
            }

            if (state is UsuarioLoaded) {
              final usuario = state.usuario;
              final Widget profileContent = SingleChildScrollView(
                padding: EdgeInsets.all(AppSpacing.space4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header con avatar y info
                    Center(
                      child: Column(
                        children: [
                          SizedBox(height: AppSpacing.space2),
                          
                          // Avatar
                          AppAvatar(
                            imageUrl: usuario.foto,
                            initials: usuario.nombre.substring(0, 2).toUpperCase(),
                            size: AvatarSize.large,
                          ),
                          
                          SizedBox(height: AppSpacing.space3),
                          
                          // Nombre
                          Text(
                            usuario.nombre,
                            style: AppTextStyles.headlineMedium,
                          ),
                          
                          SizedBox(height: AppSpacing.space1),
                          
                          // Email
                          Text(
                            usuario.email,
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.onSurfaceVariant,
                            ),
                          ),
                          
                          SizedBox(height: AppSpacing.space2),
                          
                          // Tipo de usuario
                          Container(
                            padding: EdgeInsets.symmetric(
                              horizontal: AppSpacing.space3,
                              vertical: AppSpacing.space1,
                            ),
                            decoration: BoxDecoration(
                              color: usuario.esArtista 
                                  ? AppColors.primaryContainer 
                                  : AppColors.secondaryContainer,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              usuario.esArtista ? 'Artista' : 'Visitante',
                              style: AppTextStyles.labelMedium.copyWith(
                                color: usuario.esArtista 
                                    ? AppColors.onPrimaryContainer 
                                    : AppColors.onSecondaryContainer,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    SizedBox(height: AppSpacing.space6),
                    
                    // Redes sociales (solo para artistas)
                    if (usuario.esArtista && usuario.artistaId != null)
                      BlocProvider(
                        create: (_) => di.getIt<ArtistaCubit>()..loadArtista(usuario.artistaId!),
                        child: BlocBuilder<ArtistaCubit, ArtistaState>(
                          builder: (context, artistaState) {
                            if (artistaState is ArtistaLoaded) {
                              final artista = artistaState.artista;
                              if (artista.instagram != null && artista.instagram!.isNotEmpty) {
                                return _buildSocialLinks(context, artista.instagram!);
                              }
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    
                    // Acciones (solo para artistas)
                    if (usuario.esArtista) ...[
                      SizedBox(height: AppSpacing.space4),
                      _buildActionButton(
                        context,
                        icon: Icons.add_photo_alternate,
                        label: 'Publicar Obra',
                        onTap: () => context.push('/obra/publicar'),
                      ),
                      SizedBox(height: AppSpacing.space2),
                      _buildActionButton(
                        context,
                        icon: Icons.event,
                        label: 'Crear Encuentro',
                        onTap: () => context.push('/encuentro/create'),
                      ),
                    ],
                    
                    SizedBox(height: AppSpacing.space6),
                    
                    // Top N de Rutas
                    _buildTopNRutasSection(context, usuario.id),
                    
                    SizedBox(height: AppSpacing.space6),
                    
                    // Mis Rutas Guardadas
                    _buildMisRutasSection(context),
                    
                    SizedBox(height: AppSpacing.space4),
                    
                    // Información adicional
                    _buildInfoCard(
                      context,
                      icon: Icons.calendar_today,
                      label: 'Fecha de registro',
                      value: _formatDate(usuario.fechaRegistro),
                    ),
                  ],
                ),
              );
              
              return profileContent;
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  Widget _buildInfoCard(
    BuildContext context, {
    required IconData icon,
    required String label,
    required String value,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      padding: EdgeInsets.all(AppSpacing.space4),
      decoration: BoxDecoration(
        color: colorScheme.surfaceVariant,
        borderRadius: AppBorderRadius.medium,
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: AppColors.onSurfaceVariant,
            size: 24,
          ),
          SizedBox(width: AppSpacing.space3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: AppTextStyles.labelSmall.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: AppSpacing.space1),
                Text(
                  value,
                  style: AppTextStyles.bodyLarge,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: onTap,
        icon: Icon(icon),
        label: Text(label),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.all(AppSpacing.space3),
        ),
      ),
    );
  }

  Widget _buildSocialLinks(BuildContext context, String instagram) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.space4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: AppBorderRadius.medium,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Redes Sociales',
            style: AppTextStyles.titleMedium,
          ),
          SizedBox(height: AppSpacing.space3),
          _buildSocialButton(
            context,
            icon: Icons.camera_alt,
            label: instagram.startsWith('@') ? instagram : '@$instagram',
            onTap: () => _openInstagram(instagram),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: AppBorderRadius.small,
      child: Padding(
        padding: EdgeInsets.all(AppSpacing.space2),
        child: Row(
          children: [
            Icon(
              icon,
              color: AppColors.primary,
              size: 24,
            ),
            SizedBox(width: AppSpacing.space3),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
            Icon(
              Icons.open_in_new,
              size: 16,
              color: AppColors.onSurfaceVariant,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopNRutasSection(BuildContext context, String userId) {
    return BlocBuilder<TopNCubit, TopNState>(
      builder: (context, topNState) {
        if (topNState is TopNLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space6),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (topNState is TopNError) {
          return Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: AppBorderRadius.medium,
            ),
            child: Column(
              children: [
                Text(
                  'Top N de Rutas',
                  style: AppTextStyles.titleMedium,
                ),
                SizedBox(height: AppSpacing.space2),
                Text(
                  'Error al cargar rutas',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
              ],
            ),
          );
        }

        if (topNState is TopNLoaded) {
          if (topNState.rutas.isEmpty) {
            return Container(
              padding: EdgeInsets.all(AppSpacing.space4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: AppBorderRadius.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Top N de Rutas',
                        style: AppTextStyles.titleMedium,
                      ),
                      TextButton(
                        onPressed: () => context.push('/rutas'),
                        child: const Text('Agregar'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'No tienes rutas en tu Top N\nAgrega tus rutas favoritas para acceder rápidamente',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Top N de Rutas',
                    style: AppTextStyles.titleMedium,
                  ),
                  TextButton(
                    onPressed: () => context.push('/topn'),
                    child: const Text('Ver todas'),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.space3),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: topNState.rutas.length > 5 ? 5 : topNState.rutas.length,
                  itemBuilder: (context, index) {
                    final ruta = topNState.rutas[index];
                    return Container(
                      width: 160,
                      margin: EdgeInsets.only(
                        right: index < (topNState.rutas.length > 5 ? 5 : topNState.rutas.length) - 1
                            ? AppSpacing.space3
                            : 0,
                      ),
                      child: AppTopNItem(
                        ruta: ruta,
                        ranking: index + 1,
                        onTap: () => context.push('/ruta/${ruta.id}'),
                        showRemoveButton: false,
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Future<void> _openInstagram(String instagram) async {
    // Limpiar el handle de Instagram (remover @ si existe)
    final cleanHandle = instagram.replaceAll('@', '').trim();
    final url = Uri.parse('https://www.instagram.com/$cleanHandle/');
    
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    } else {
      // Si no se puede abrir, intentar con el formato alternativo
      final altUrl = Uri.parse('instagram://user?username=$cleanHandle');
      if (await canLaunchUrl(altUrl)) {
        await launchUrl(altUrl);
      }
    }
  }

  Widget _buildMisRutasSection(BuildContext context) {
    return BlocBuilder<RutaBloc, RutaState>(
      builder: (context, rutaState) {
        if (rutaState is RutaLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.all(AppSpacing.space6),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (rutaState is RutaError) {
          return Container(
            padding: EdgeInsets.all(AppSpacing.space4),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.surfaceVariant,
              borderRadius: AppBorderRadius.medium,
            ),
            child: Column(
              children: [
                Text(
                  'Mis Rutas',
                  style: AppTextStyles.titleMedium,
                ),
                SizedBox(height: AppSpacing.space2),
                Text(
                  'Error al cargar rutas',
                  style: AppTextStyles.bodyMedium.copyWith(
                    color: AppColors.onSurfaceVariant,
                  ),
                ),
                SizedBox(height: AppSpacing.space2),
                TextButton(
                  onPressed: () => context.read<RutaBloc>().add(const LoadRutas()),
                  child: const Text('Reintentar'),
                ),
              ],
            ),
          );
        }

        if (rutaState is RutaLoaded) {
          if (rutaState.rutas.isEmpty) {
            return Container(
              padding: EdgeInsets.all(AppSpacing.space4),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                borderRadius: AppBorderRadius.medium,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Mis Rutas',
                        style: AppTextStyles.titleMedium,
                      ),
                      TextButton(
                        onPressed: () => context.push('/rutas'),
                        child: const Text('Ver todas'),
                      ),
                    ],
                  ),
                  SizedBox(height: AppSpacing.space2),
                  Text(
                    'No tienes rutas guardadas\nCrea tu primera ruta para comenzar',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          }

          // Mostrar máximo 3 rutas recientes
          final rutasRecientes = List<Ruta>.from(rutaState.rutas)
            ..sort((a, b) => b.fechaCreacion.compareTo(a.fechaCreacion));
          final rutasAMostrar = rutasRecientes.take(3).toList();

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mis Rutas',
                    style: AppTextStyles.titleMedium,
                  ),
                  TextButton(
                    onPressed: () => context.push('/rutas'),
                    child: const Text('Ver todas'),
                  ),
                ],
              ),
              SizedBox(height: AppSpacing.space3),
              ...rutasAMostrar.map((ruta) => Padding(
                    padding: EdgeInsets.only(bottom: AppSpacing.space3),
                    child: _buildRutaCard(context, ruta),
                  )),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  Widget _buildRutaCard(BuildContext context, Ruta ruta) {
    return Container(
      padding: EdgeInsets.all(AppSpacing.space4),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: AppBorderRadius.medium,
        boxShadow: AppShadows.small,
      ),
      child: InkWell(
        onTap: () => context.push('/ruta/${ruta.id}'),
        borderRadius: AppBorderRadius.medium,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        ruta.nombre,
                        style: AppTextStyles.titleMedium,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: AppSpacing.space1),
                      Text(
                        '${ruta.obraIds.length} obra${ruta.obraIds.length != 1 ? 's' : ''} • ${ruta.modoTransporte == ModoTransporte.bici ? 'Bicicleta' : 'A pie'}',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(
                  Icons.chevron_right,
                  color: AppColors.onSurfaceVariant,
                ),
              ],
            ),
            if (ruta.distancia > 0 || ruta.tiempoEstimado > 0) ...[
              SizedBox(height: AppSpacing.space2),
              Row(
                children: [
                  if (ruta.distancia > 0) ...[
                    Icon(
                      Icons.straighten,
                      size: 16,
                      color: AppColors.onSurfaceVariant,
                    ),
                    SizedBox(width: AppSpacing.space1),
                    Text(
                      '${(ruta.distancia / 1000).toStringAsFixed(1)} km',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                  if (ruta.distancia > 0 && ruta.tiempoEstimado > 0)
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: AppSpacing.space2),
                      child: Text(
                        '•',
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.onSurfaceVariant,
                        ),
                      ),
                    ),
                  if (ruta.tiempoEstimado > 0) ...[
                    Icon(
                      Icons.access_time,
                      size: 16,
                      color: AppColors.onSurfaceVariant,
                    ),
                    SizedBox(width: AppSpacing.space1),
                    Text(
                      '${ruta.tiempoEstimado.toInt()} min',
                      style: AppTextStyles.bodySmall.copyWith(
                        color: AppColors.onSurfaceVariant,
                      ),
                    ),
                  ],
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _formatDate(DateTime date) {
    final months = [
      'Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio',
      'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'
    ];
    return '${date.day} de ${months[date.month - 1]} de ${date.year}';
  }
}

