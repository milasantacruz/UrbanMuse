import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../core/injection/injection_container.dart' as di;
import '../../bloc/artista/artista_cubit.dart';
import '../../bloc/artista/artista_state.dart';
import '../../widgets/app_bars/app_top_bar.dart';
import '../../widgets/cards/app_artist_card.dart';
import '../../widgets/cards/app_obra_card.dart';
import '../../widgets/common/loading_indicator.dart';
import '../../widgets/common/error_widget.dart';
import '../../../core/theme/theme.dart';

/// Página de perfil de artista
class ArtistaProfilePage extends StatelessWidget {
  final String artistaId;

  const ArtistaProfilePage({
    super.key,
    required this.artistaId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => di.getIt<ArtistaCubit>()..loadArtista(artistaId),
      child: Scaffold(
        appBar: AppTopBar.detail(
          title: 'Artista',
          onBack: () => context.pop(),
        ),
        body: BlocBuilder<ArtistaCubit, ArtistaState>(
          builder: (context, state) {
            if (state is ArtistaLoading) {
              return const LoadingIndicator();
            }

            if (state is ArtistaError) {
              return ErrorDisplay(
                message: state.message,
                onRetry: () => context.read<ArtistaCubit>().loadArtista(artistaId),
              );
            }

            if (state is ArtistaLoaded) {
              final artista = state.artista;
              final obras = state.obras;

              return CustomScrollView(
                slivers: [
                  // Header del artista
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.all(AppSpacing.space4),
                      child: AppArtistCard(
                        artistName: artista.nombre,
                        bio: artista.bio,
                        avatarUrl: artista.foto,
                        obrasCount: obras.length,
                        showButton: false,
                      ),
                    ),
                  ),

                  // Grid de obras
                  if (obras.isNotEmpty)
                    SliverPadding(
                      padding: EdgeInsets.all(AppSpacing.space4),
                      sliver: SliverGrid(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio: 0.75,
                        ),
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            final obra = obras[index];
                            return AppObraCard.grid(
                              imageUrl: obra.foto,
                              titulo: obra.titulo,
                              artista: obra.artistaNombre,
                              categoria: obra.categoria,
                              ubicacion: obra.ubicacion.barrio,
                              likes: obra.likes,
                              onTap: () => context.push('/obra/${obra.id}'),
                            );
                          },
                          childCount: obras.length,
                        ),
                      ),
                    )
                  else
                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.image_not_supported,
                              size: 64,
                              color: Theme.of(context).colorScheme.onSurfaceVariant,
                            ),
                            SizedBox(height: AppSpacing.space4),
                            Text(
                              'Este artista aún no tiene obras publicadas',
                              style: AppTextStyles.bodyLarge.copyWith(
                                color: Theme.of(context).colorScheme.onSurfaceVariant,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
