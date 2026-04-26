import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/team/domain/entities/team_entity.dart';

import 'package:voca_do/features/task_creator/team/data/datasources/team_remote_data_source.dart';
import 'package:voca_do/features/task_creator/team/data/models/team_model.dart';
import 'package:voca_do/features/task_creator/team/domain/repositories/team_repository_domain.dart';

@LazySingleton(as: TeamRepositoryDomain)
class TeamRepositoryData implements TeamRepositoryDomain {
  final BaseTeamRemoteDataSource remoteDataSource;

  TeamRepositoryData(this.remoteDataSource);

  @override
  Future<Result<List<TeamEntity>, Failure>> getTeam() async {
    try {
      final response = await remoteDataSource.getTeam();

    final entities = response.map((e) => e.toEntity()).toList();

    return Success(entities);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
