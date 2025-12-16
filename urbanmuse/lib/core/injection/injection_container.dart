import 'package:get_it/get_it.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../network/dio_client.dart';
import '../network/network_info.dart';
import '../network/network_info.dart' as network_impl;
import '../../data/datasources/local/hive_service.dart';
import '../../data/datasources/local/obra_local_datasource.dart';
import '../../data/datasources/local/artista_local_datasource.dart';
import '../../data/datasources/local/ruta_local_datasource.dart';
import '../../data/datasources/local/topn_local_datasource.dart';
import '../../data/datasources/local/encuentro_local_datasource.dart';
import '../../data/datasources/local/usuario_local_datasource.dart';
import '../../data/datasources/local/publicar_obra_local_datasource.dart';
import '../../data/datasources/remote/obra_remote_datasource.dart';
import '../../data/datasources/remote/artista_remote_datasource.dart';
import '../../domain/repositories/obra_repository.dart';
import '../../domain/repositories/artista_repository.dart';
import '../../domain/repositories/ruta_repository.dart';
import '../../domain/repositories/topn_repository.dart';
import '../../domain/repositories/encuentro_repository.dart';
import '../../domain/repositories/publicar_obra_repository.dart';
import '../../domain/repositories/usuario_repository.dart';
import '../../data/repositories/obra_repository_impl.dart';
import '../../data/repositories/artista_repository_impl.dart';
import '../../data/repositories/ruta_repository_impl.dart';
import '../../data/repositories/topn_repository_impl.dart';
import '../../data/repositories/encuentro_repository_impl.dart';
import '../../data/repositories/publicar_obra_repository_impl.dart';
import '../../data/repositories/usuario_repository_impl.dart';
import '../../domain/usecases/obra/get_obras.dart';
import '../../domain/usecases/obra/get_obra_by_id.dart';
import '../../domain/usecases/obra/search_obras.dart';
import '../../domain/usecases/obra/filter_obras.dart';
import '../../domain/usecases/artista/get_artista_by_id.dart';
import '../../domain/usecases/artista/get_obras_by_artista.dart';
import '../../domain/usecases/ruta/create_ruta.dart';
import '../../domain/usecases/ruta/get_rutas.dart';
import '../../domain/usecases/ruta/get_rutas_publicas.dart';
import '../../domain/usecases/ruta/get_rutas_publicas_dinamicas.dart';
import '../../domain/usecases/ruta/get_ruta_by_id.dart';
import '../../domain/usecases/ruta/delete_ruta.dart';
import '../../domain/usecases/ruta/calculate_ruta.dart';
import '../../domain/usecases/ruta/convertir_a_dinamica.dart';
import '../../domain/usecases/ruta/join_ruta_dinamica.dart';
import '../../domain/usecases/ruta/leave_ruta_dinamica.dart';
import '../../domain/usecases/topn/get_topn.dart';
import '../../domain/usecases/topn/add_ruta_to_topn.dart';
import '../../domain/usecases/topn/remove_ruta_from_topn.dart';
import '../../domain/usecases/topn/reorder_topn.dart';
import '../../domain/usecases/encuentro/create_encuentro.dart';
import '../../domain/usecases/encuentro/get_encuentros.dart';
import '../../domain/usecases/encuentro/get_encuentros_proximos.dart';
import '../../domain/usecases/encuentro/get_encuentro_by_id.dart';
import '../../domain/usecases/encuentro/join_encuentro.dart';
import '../../domain/usecases/encuentro/cancel_encuentro.dart';
import '../../domain/usecases/publicar_obra/publicar_obra.dart';
import '../../domain/usecases/publicar_obra/get_obras_publicadas.dart';
import '../../domain/usecases/publicar_obra/editar_obra.dart';
import '../../domain/usecases/publicar_obra/eliminar_obra.dart';
import '../../domain/usecases/usuario/get_usuario_by_id.dart';
import '../../domain/usecases/usuario/registrar_usuario.dart';
import '../../domain/usecases/usuario/update_usuario.dart';
import '../../presentation/bloc/obra/obra_bloc.dart';
import '../../presentation/bloc/artista/artista_cubit.dart';
import '../../presentation/bloc/ruta/ruta_bloc.dart';
import '../../presentation/bloc/topn/topn_cubit.dart';
import '../../presentation/bloc/encuentro/encuentro_cubit.dart';
import '../../presentation/bloc/publicar_obra/publicar_obra_cubit.dart';
import '../../presentation/bloc/usuario/usuario_cubit.dart';

/// Service locator para inyección de dependencias
final getIt = GetIt.instance;

/// Inicializar todas las dependencias
Future<void> init() async {
  // ============================================
  // External - Hive
  // ============================================
  
  // Inicializar Hive y abrir boxes
  await HiveService.init();
  
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
  
  getIt.registerLazySingleton<ObraLocalDataSource>(
    () => ObraLocalDataSourceImpl(),
  );
  
  getIt.registerLazySingleton<ArtistaLocalDataSource>(
    () => ArtistaLocalDataSourceImpl(),
  );
  
  getIt.registerLazySingleton<RutaLocalDataSource>(
    () => RutaLocalDataSourceImpl(),
  );
  
  getIt.registerLazySingleton<TopNLocalDataSource>(
    () => TopNLocalDataSourceImpl(),
  );
  
  getIt.registerLazySingleton<EncuentroLocalDataSource>(
    () => EncuentroLocalDataSourceImpl(),
  );
  
  getIt.registerLazySingleton<UsuarioLocalDataSource>(
    () => UsuarioLocalDataSourceImpl(),
  );
  
  getIt.registerLazySingleton<PublicarObraLocalDataSource>(
    () => PublicarObraLocalDataSourceImpl(),
  );
  
  // ============================================
  // Data Sources - Remote
  // ============================================
  
  getIt.registerLazySingleton<ObraRemoteDataSource>(
    () => ObraRemoteDataSourceImpl(client: getIt()),
  );
  
  getIt.registerLazySingleton<ArtistaRemoteDataSource>(
    () => ArtistaRemoteDataSourceImpl(client: getIt()),
  );
  
  // ============================================
  // Repositories
  // ============================================
  
  getIt.registerLazySingleton<ObraRepository>(
    () => ObraRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<ArtistaRepository>(
    () => ArtistaRepositoryImpl(
      remoteDataSource: getIt(),
      localDataSource: getIt(),
      obraLocalDataSource: getIt(),
      networkInfo: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<RutaRepository>(
    () => RutaRepositoryImpl(
      localDataSource: getIt(),
      obraLocalDataSource: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<TopNRepository>(
    () => TopNRepositoryImpl(
      localDataSource: getIt(),
      rutaLocalDataSource: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<EncuentroRepository>(
    () => EncuentroRepositoryImpl(
      localDataSource: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<PublicarObraRepository>(
    () => PublicarObraRepositoryImpl(
      localDataSource: getIt(),
    ),
  );
  
  getIt.registerLazySingleton<UsuarioRepository>(
    () => UsuarioRepositoryImpl(
      localDataSource: getIt(),
    ),
  );
  
  // ============================================
  // Use Cases - Obra
  // ============================================
  
  getIt.registerLazySingleton(() => GetObras(getIt()));
  getIt.registerLazySingleton(() => GetObraById(getIt()));
  getIt.registerLazySingleton(() => SearchObras(getIt()));
  getIt.registerLazySingleton(() => FilterObras(getIt()));
  
  // ============================================
  // Use Cases - Artista
  // ============================================
  
  getIt.registerLazySingleton(() => GetArtistaById(getIt()));
  getIt.registerLazySingleton(() => GetObrasByArtista(getIt()));
  
  // ============================================
  // Use Cases - Ruta
  // ============================================
  
  getIt.registerLazySingleton(() => CreateRuta(getIt()));
  getIt.registerLazySingleton(() => GetRutas(getIt()));
  getIt.registerLazySingleton(() => GetRutasPublicas(getIt()));
  getIt.registerLazySingleton(() => GetRutasPublicasDinamicas(getIt()));
  getIt.registerLazySingleton(() => GetRutaById(getIt()));
  getIt.registerLazySingleton(() => DeleteRuta(getIt()));
  getIt.registerLazySingleton(() => CalculateRuta(getIt()));
  getIt.registerLazySingleton(() => ConvertirADinamica(getIt()));
  getIt.registerLazySingleton(() => JoinRutaDinamica(getIt()));
  getIt.registerLazySingleton(() => LeaveRutaDinamica(getIt()));
  
  // ============================================
  // Use Cases - Top N
  // ============================================
  
  getIt.registerLazySingleton(() => GetTopN(getIt()));
  getIt.registerLazySingleton(() => AddRutaToTopN(getIt()));
  getIt.registerLazySingleton(() => RemoveRutaFromTopN(getIt()));
  getIt.registerLazySingleton(() => ReorderTopN(getIt()));
  
  // ============================================
  // Use Cases - Encuentro
  // ============================================
  
  getIt.registerLazySingleton(() => CreateEncuentro(getIt()));
  getIt.registerLazySingleton(() => GetEncuentros(getIt()));
  getIt.registerLazySingleton(() => GetEncuentrosProximos(getIt()));
  getIt.registerLazySingleton(() => GetEncuentroById(getIt()));
  getIt.registerLazySingleton(() => JoinEncuentro(getIt()));
  getIt.registerLazySingleton(() => CancelEncuentro(getIt()));
  
  // ============================================
  // Use Cases - Publicar Obra
  // ============================================
  
  getIt.registerLazySingleton(() => PublicarObra(getIt()));
  getIt.registerLazySingleton(() => GetObrasPublicadas(getIt()));
  getIt.registerLazySingleton(() => EditarObra(getIt()));
  getIt.registerLazySingleton(() => EliminarObra(getIt()));
  
  // ============================================
  // Use Cases - Usuario
  // ============================================
  
  getIt.registerLazySingleton(() => GetUsuarioById(getIt()));
  getIt.registerLazySingleton(() => RegistrarUsuario(getIt()));
  getIt.registerLazySingleton(() => UpdateUsuario(getIt()));
  
  // ============================================
  // BLoCs
  // ============================================
  
  getIt.registerFactory(() => ObraBloc(
    getObras: getIt(),
    getObraById: getIt(),
    searchObras: getIt(),
    filterObras: getIt(),
  ));
  
  getIt.registerFactory(() => ArtistaCubit(
    getArtistaById: getIt(),
    getObrasByArtista: getIt(),
  ));
  
  getIt.registerFactory(() => RutaBloc(
    createRuta: getIt(),
    getRutas: getIt(),
    getRutasPublicas: getIt(),
    getRutasPublicasDinamicas: getIt(),
    getRutaById: getIt(),
    deleteRuta: getIt(),
    calculateRuta: getIt(),
    convertirADinamica: getIt(),
    joinRutaDinamica: getIt(),
    leaveRutaDinamica: getIt(),
  ));
  
  getIt.registerFactory(() => TopNCubit(
    getTopN: getIt(),
    addRutaToTopN: getIt(),
    removeRutaFromTopN: getIt(),
    reorderTopN: getIt(),
  ));
  
  getIt.registerFactory(() => EncuentroCubit(
    createEncuentro: getIt(),
    getEncuentros: getIt(),
    getEncuentrosProximos: getIt(),
    getEncuentroById: getIt(),
    joinEncuentro: getIt(),
    cancelEncuentro: getIt(),
  ));
  
  getIt.registerFactory(() => PublicarObraCubit(
    publicarObra: getIt(),
    getObrasPublicadas: getIt(),
    editarObra: getIt(),
    eliminarObra: getIt(),
    repository: getIt(),
  ));
  
  getIt.registerFactory(() => UsuarioCubit(
    getUsuarioById: getIt(),
    registrarUsuario: getIt(),
    updateUsuario: getIt(),
    usuarioRepository: getIt(),
  ));
}

