import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/features/task_creator/team/data/models/team_model.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';

abstract class BaseTeamRemoteDataSource {
  Future<List<TeamModel>> getTeam();
}

@LazySingleton(as: BaseTeamRemoteDataSource)
class TeamRemoteDataSource implements BaseTeamRemoteDataSource {
  final SupabaseClient _supabase;

  TeamRemoteDataSource(this._supabase);

  @override
  Future<List<TeamModel>> getTeam() async {
    try {
      final response = await _supabase.from('users').select();

      return (response as List).map((e) => TeamModel.fromJson(e)).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
