part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccsess extends AuthState {
  final Session session;
  const AuthSuccsess(this.session);

  @override
  List<Object?> get props => [session];
}

class AuthNeedsEmailConfirmation extends AuthState {}

class AuthError extends AuthState {
  final String message;
  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}
