import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/features/task_creator/profile/data/models/profile_model.dart';

abstract class BaseProfileRemoteDataSource {
  Future<ProfileModel> getProfile();
}

@LazySingleton(as: BaseProfileRemoteDataSource)
class ProfileRemoteDataSource implements BaseProfileRemoteDataSource {
  final SupabaseClient _supabase;

  ProfileRemoteDataSource(this._supabase);

  @override
  Future<ProfileModel> getProfile() async {
    try {
      final session = _supabase.auth.currentSession;
      if (session == null || session.isExpired) {
        throw const UnauthorizedFailure("Session expired or not logged in");
      }
      final response = await _supabase
          .from('users')
          .select()
          .eq('id', session.user.id)
          .single();
      return ProfileModel.fromJson(response);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
