import 'package:dartz/dartz.dart';
import '../../domain/entities/usuario.dart';
import '../../domain/repositories/usuario_repository.dart';
import '../../core/errors/failures.dart';
import '../../core/errors/exceptions.dart';
import '../../core/errors/exception_mapper.dart';
import '../datasources/local/usuario_local_datasource.dart';
import '../models/usuario_model.dart';

/// Implementación del repositorio de usuarios
/// 
/// Para MVP1, solo usa local data source
class UsuarioRepositoryImpl implements UsuarioRepository {
  final UsuarioLocalDataSource localDataSource;

  UsuarioRepositoryImpl({
    required this.localDataSource,
  });

  @override
  Future<Either<Failure, Usuario>> getUsuarioById(String id) async {
    try {
      final usuario = await localDataSource.getUsuario();
      if (usuario == null || usuario.id != id) {
        return const Left(CacheFailure('Usuario no encontrado'));
      }
      return Right(usuario.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener usuario: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Usuario?>> getUsuarioActual() async {
    try {
      final usuario = await localDataSource.getUsuario();
      return Right(usuario?.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al obtener usuario actual: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Usuario>> registrarUsuario({
    required String nombre,
    required String email,
    required String tipoUsuario,
    String? foto,
  }) async {
    try {
      final usuarioModel = UsuarioModel(
        id: DateTime.now().millisecondsSinceEpoch.toString(), // Temporal para MVP1
        nombre: nombre,
        email: email,
        foto: foto,
        tipoUsuario: tipoUsuario == 'artista' ? TipoUsuario.artista : TipoUsuario.visitante,
        fechaRegistro: DateTime.now(),
        artistaId: tipoUsuario == 'artista' 
            ? DateTime.now().millisecondsSinceEpoch.toString() 
            : null,
      );
      
      final usuarioGuardado = await localDataSource.saveUsuario(usuarioModel);
      return Right(usuarioGuardado.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al registrar usuario: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, Usuario>> updateUsuario(Usuario usuario) async {
    try {
      final usuarioModel = UsuarioModel.fromEntity(usuario);
      final usuarioActualizado = await localDataSource.updateUsuario(usuarioModel);
      return Right(usuarioActualizado.toEntity());
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al actualizar usuario: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> esArtista(String userId) async {
    try {
      final usuario = await localDataSource.getUsuario();
      if (usuario == null || usuario.id != userId) {
        return const Right(false);
      }
      return Right(usuario.esArtista);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al verificar tipo de usuario: ${e.toString()}'));
    }
  }

  @override
  Future<Either<Failure, bool>> esVisitante(String userId) async {
    try {
      final usuario = await localDataSource.getUsuario();
      if (usuario == null || usuario.id != userId) {
        return const Right(false);
      }
      return Right(usuario.esVisitante);
    } on CacheException catch (e) {
      return Left(ExceptionMapper.cacheFailure(e));
    } catch (e) {
      return Left(CacheFailure('Error al verificar tipo de usuario: ${e.toString()}'));
    }
  }
}

