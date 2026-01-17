import 'package:dartz/dartz.dart';
import 'package:day_task_app/feature/auth/data/datasources/auth_remote_data_source.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepository {
  AuthRemoteDataSource remote;
  AuthRepository({required this.remote});
  Future<Either<AuthFailure, Session?>> login(
    String email,
    String passWord,
  ) async {
    try {
      final response = await remote.login(email, passWord);
      return right(response.session);
    } on AuthException catch (e) {
      return left(AuthFailure(e.message));
    } catch (e) {
      return left(AuthFailure('Unexpected error: $e'));
    }
  }

  Future<Either<AuthFailure, Session?>> signUp(
    String email,
    String passWord,
  ) async {
    try {
      final response = await remote.signUp(email, passWord);
      return right(response.session);
    } on AuthException catch (e) {
      return left(AuthFailure(e.message));
    } catch (e) {
      return left(AuthFailure('Unexpected error: $e'));
    }
  }

  Session? currentSession() => remote.currentSession();
  Future<void> logOut() => remote.logOut();
}

class AuthFailure {
  final String message;
  const AuthFailure(this.message);
}
