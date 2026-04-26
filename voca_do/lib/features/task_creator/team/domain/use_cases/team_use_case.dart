import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/team/domain/entities/team_entity.dart';
import 'package:voca_do/features/task_creator/team/domain/repositories/team_repository_domain.dart';

@lazySingleton
class TeamUseCase {
  final TeamRepositoryDomain _repositoryData;

  TeamUseCase(this._repositoryData);

  Future<Result<List<TeamEntity>, Failure>> getTeam() async {
    return _repositoryData.getTeam();
  }
}
