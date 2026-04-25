import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class BaseSignUpRemoteDataSource {
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  });
}

@LazySingleton(as: BaseSignUpRemoteDataSource)
class SignUpRemoteDataSource implements BaseSignUpRemoteDataSource {
  final SupabaseClient _supabase;
  SignUpRemoteDataSource(this._supabase);

  @override
  Future<bool> getSignUp({
    required String name,
    required String email,
    required String password,
  }) async {
    final authResponse = await _supabase.auth.signUp(
      password: password,
      email: email,
    );

    await _supabase.from('users').insert({
      "id": authResponse.user!.id,
      "name": name,
      "email": email,
    });

    return true;
  }
}
