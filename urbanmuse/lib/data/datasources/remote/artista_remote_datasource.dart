import '../../../core/errors/exceptions.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/artista_model.dart';

/// Data source remoto para artistas usando Dio
abstract class ArtistaRemoteDataSource {
  Future<ArtistaModel> getArtistaById(String id);
  Future<List<ArtistaModel>> getArtistas();
}

class ArtistaRemoteDataSourceImpl implements ArtistaRemoteDataSource {
  final DioClient client;

  ArtistaRemoteDataSourceImpl({required this.client});

  @override
  Future<ArtistaModel> getArtistaById(String id) async {
    try {
      final response = await client.get(ApiEndpoints.artistaById(id));
      return ArtistaModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Error al obtener artista: ${e.toString()}');
    }
  }

  @override
  Future<List<ArtistaModel>> getArtistas() async {
    try {
      final response = await client.get(ApiEndpoints.artistas);
      final List<dynamic> artistasJson = response.data as List<dynamic>;
      return artistasJson
          .map((json) => ArtistaModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException('Error al obtener artistas: ${e.toString()}');
    }
  }
}

