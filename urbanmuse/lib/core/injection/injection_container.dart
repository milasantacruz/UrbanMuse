import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/network_info.dart' as network_impl;

/// Service locator para inyección de dependencias
final getIt = GetIt.instance;

/// Inicializar todas las dependencias
Future<void> init() async {
  // ============================================
  // External - Hive
  // ============================================
  
  await Hive.initFlutter();
  
  // Registrar adapters de Hive aquí cuando se creen los modelos
  
  // ============================================
  // Core - Network
  // ============================================
  
  // Dio Client
  getIt.registerLazySingleton<DioClient>(() => DioClient());
  
  // Network Info
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
  getIt.registerLazySingleton<NetworkInfo>(
    () => network_impl.NetworkInfoImpl(getIt()),
  );
  
  // ============================================
  // Data Sources - Local
  // ============================================
  
  // TODO: Registrar data sources locales cuando se implementen
  // getIt.registerLazySingleton<ObraLocalDataSource>(
  //   () => ObraLocalDataSourceImpl(hiveBox: getIt()),
  // );
  
  // ============================================
  // Data Sources - Remote
  // ============================================
  
  // TODO: Registrar data sources remotos cuando se implementen
  // getIt.registerLazySingleton<ObraRemoteDataSource>(
  //   () => ObraRemoteDataSourceImpl(client: getIt()),
  // );
  
  // ============================================
  // Repositories
  // ============================================
  
  // TODO: Registrar repositorios cuando se implementen
  // getIt.registerLazySingleton<ObraRepository>(
  //   () => ObraRepositoryImpl(
  //     remoteDataSource: getIt(),
  //     localDataSource: getIt(),
  //     networkInfo: getIt(),
  //   ),
  // );
  
  // ============================================
  // Use Cases
  // ============================================
  
  // TODO: Registrar use cases cuando se implementen
  // getIt.registerLazySingleton(() => GetObras(getIt()));
  
  // ============================================
  // BLoCs
  // ============================================
  
  // TODO: Registrar BLoCs cuando se implementen
  // getIt.registerFactory(() => ObraBloc(getObras: getIt()));
}

