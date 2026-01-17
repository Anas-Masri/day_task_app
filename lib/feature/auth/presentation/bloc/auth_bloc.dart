import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../data/repositories/auth_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository repo;

  AuthBloc({required this.repo}) : super(AuthInitial()) {
    on<AuthLogin>(_onLogin);
    on<AuthSingUp>(_onSignUp);
    on<AuthLogoutRequested>(_onLogout);
  }

  Future<void> _onLogin(AuthLogin event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await repo.login(event.email, event.password);

    result.fold((failure) => emit(AuthError(failure.message)), (session) {
      if (session != null) {
        emit(AuthSuccsess(session));
      } else {
        emit(const AuthError('No session returned'));
      }
    });
  }

  Future<void> _onSignUp(AuthSingUp event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await repo.signUp(event.email, event.password);

    result.fold((failure) => emit(AuthError(failure.message)), (session) {
      if (session != null) {
        emit(AuthSuccsess(session));
      } else {
        emit(AuthNeedsEmailConfirmation());
      }
    });
  }

  Future<void> _onLogout(
    AuthLogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    await repo.logOut();
    emit(AuthInitial());
  }
}
