import '../../../core/errors/exceptions.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/network/api_endpoints.dart';
import '../../models/obra_model.dart';

/// Data source remoto para obras usando Dio
abstract class ObraRemoteDataSource {
  Future<List<ObraModel>> getObras();
  Future<ObraModel> getObraById(String id);
  Future<List<ObraModel>> searchObras(String query);
  Future<List<ObraModel>> filterObras({
    List<String>? categorias,
    List<String>? artistaIds,
  });
}

class ObraRemoteDataSourceImpl implements ObraRemoteDataSource {
  final DioClient client;

  ObraRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ObraModel>> getObras() async {
    try {
      final response = await client.get(ApiEndpoints.obras);
      final List<dynamic> obrasJson = response.data as List<dynamic>;
      return obrasJson
          .map((json) => ObraModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException('Error al obtener obras: ${e.toString()}');
    }
  }

  @override
  Future<ObraModel> getObraById(String id) async {
    try {
      final response = await client.get(ApiEndpoints.obraById(id));
      return ObraModel.fromJson(response.data as Map<String, dynamic>);
    } catch (e) {
      throw ServerException('Error al obtener obra: ${e.toString()}');
    }
  }

  @override
  Future<List<ObraModel>> searchObras(String query) async {
    try {
      final response = await client.get(
        ApiEndpoints.searchObras,
        queryParameters: {'q': query},
      );
      final List<dynamic> obrasJson = response.data as List<dynamic>;
      return obrasJson
          .map((json) => ObraModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException('Error al buscar obras: ${e.toString()}');
    }
  }

  @override
  Future<List<ObraModel>> filterObras({
    List<String>? categorias,
    List<String>? artistaIds,
  }) async {
    try {
      final queryParams = <String, dynamic>{};
      if (categorias != null && categorias.isNotEmpty) {
        queryParams['categorias'] = categorias.join(',');
      }
      if (artistaIds != null && artistaIds.isNotEmpty) {
        queryParams['artistaIds'] = artistaIds.join(',');
      }
      
      final response = await client.get(
        ApiEndpoints.filterObras,
        queryParameters: queryParams,
      );
      final List<dynamic> obrasJson = response.data as List<dynamic>;
      return obrasJson
          .map((json) => ObraModel.fromJson(json as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw ServerException('Error al filtrar obras: ${e.toString()}');
    }
  }
}

