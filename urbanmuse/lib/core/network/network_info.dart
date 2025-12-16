import 'package:connectivity_plus/connectivity_plus.dart';

/// Interfaz para verificar estado de conectividad
abstract class NetworkInfo {
  Future<bool> get isConnected;
}

/// Implementación de NetworkInfo
class NetworkInfoImpl implements NetworkInfo {
  final Connectivity connectivity;
  
  NetworkInfoImpl(this.connectivity);
  
  @override
  Future<bool> get isConnected async {
    try {
      final results = await connectivity.checkConnectivity();
      // checkConnectivity() retorna List<ConnectivityResult>
      // Verificar que haya al menos una conexión activa
      return results.any((result) => result != ConnectivityResult.none);
    } catch (e) {
      // Si hay error, asumir que no hay conexión
      return false;
    }
  }
}

