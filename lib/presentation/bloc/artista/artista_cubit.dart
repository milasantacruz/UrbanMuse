import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/artista/get_artista_by_id.dart';
import '../../../domain/usecases/artista/get_obras_by_artista.dart';
import 'artista_state.dart';

/// Cubit para gestión de estado de artista
class ArtistaCubit extends Cubit<ArtistaState> {
  final GetArtistaById getArtistaById;
  final GetObrasByArtista getObrasByArtista;
  
  ArtistaCubit({
    required this.getArtistaById,
    required this.getObrasByArtista,
  }) : super(const ArtistaInitial());
  
  /// Cargar artista y sus obras
  Future<void> loadArtista(String artistaId) async {
    emit(const ArtistaLoading());
    
    final artistaResult = await getArtistaById(artistaId);
    final obrasResult = await getObrasByArtista(artistaId);
    
    artistaResult.fold(
      (failure) => emit(ArtistaError(failure.message)),
      (artista) {
        obrasResult.fold(
          (failure) => emit(ArtistaError(failure.message)),
          (obras) => emit(ArtistaLoaded(artista: artista, obras: obras)),
        );
      },
    );
  }
}

