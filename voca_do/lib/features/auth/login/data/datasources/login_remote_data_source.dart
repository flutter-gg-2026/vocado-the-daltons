import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/constants/app_enums.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/extensions/user_role_extension.dart';

abstract class BaseLoginRemoteDataSource {
  Future<UserRole> getLogin({required String email, required String password});
}

@LazySingleton(as: BaseLoginRemoteDataSource)
class LoginRemoteDataSource implements BaseLoginRemoteDataSource {
  final SupabaseClient _supabase;

  LoginRemoteDataSource(this._supabase);

  @override
  Future<UserRole> getLogin({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _supabase.auth.signInWithPassword(
        email: email,
        password: password,
      );

      final data = await _supabase
          .from('users')
          .select('role')
          .eq('id', response.user!.id)
          .single();

      return (data['role'] as String).toUserRole();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
