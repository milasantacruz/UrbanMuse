import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/usuario.dart';
import '../../../domain/repositories/usuario_repository.dart';
import '../../../domain/usecases/usuario/get_usuario_by_id.dart';
import '../../../domain/usecases/usuario/registrar_usuario.dart';
import '../../../domain/usecases/usuario/update_usuario.dart';
import 'usuario_state.dart';

/// Cubit para gestión de estado de usuarios
class UsuarioCubit extends Cubit<UsuarioState> {
  final GetUsuarioById getUsuarioById;
  final RegistrarUsuario registrarUsuario;
  final UpdateUsuario updateUsuario;
  final UsuarioRepository usuarioRepository;
  
  UsuarioCubit({
    required this.getUsuarioById,
    required this.registrarUsuario,
    required this.updateUsuario,
    required this.usuarioRepository,
  }) : super(const UsuarioInitial());
  
  /// Cargar usuario actual (sesión activa)
  Future<void> loadUsuarioActual() async {
    emit(const UsuarioLoading());
    final result = await usuarioRepository.getUsuarioActual();
    result.fold(
      (failure) => emit(UsuarioError(failure.message)),
      (usuario) {
        if (usuario == null) {
          emit(const UsuarioError('No hay usuario autenticado'));
        } else {
          emit(UsuarioLoaded(usuario));
        }
      },
    );
  }
  
  /// Cargar usuario por ID
  Future<void> loadUsuario(String id) async {
    emit(const UsuarioLoading());
    final result = await getUsuarioById(id);
    result.fold(
      (failure) => emit(UsuarioError(failure.message)),
      (usuario) => emit(UsuarioLoaded(usuario)),
    );
  }
  
  /// Registrar nuevo usuario
  Future<void> register({
    required String nombre,
    required String email,
    required String tipoUsuario, // 'artista' o 'visitante'
    String? foto,
  }) async {
    emit(const UsuarioLoading());
    final result = await registrarUsuario(
      nombre: nombre,
      email: email,
      tipoUsuario: tipoUsuario,
      foto: foto,
    );
    result.fold(
      (failure) => emit(UsuarioError(failure.message)),
      (usuario) => emit(UsuarioRegistered(usuario)),
    );
  }
  
  /// Actualizar usuario
  Future<void> update(Usuario usuario) async {
    emit(const UsuarioLoading());
    final result = await updateUsuario(usuario);
    result.fold(
      (failure) => emit(UsuarioError(failure.message)),
      (usuario) => emit(UsuarioUpdated(usuario)),
    );
  }
}

