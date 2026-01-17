import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRemoteDataSource {
  final SupabaseClient client;
  AuthRemoteDataSource({required this.client});

  Future<AuthResponse> login(String email, String passWord) {
    return client.auth.signInWithPassword(password: passWord, email: email);
  }

  Future<AuthResponse> signUp(String email, String passWord) {
    return client.auth.signUp(password: passWord, email: email);
  }

  Future<void> logOut() => client.auth.signOut();

  Session? currentSession() => client.auth.currentSession;
}
