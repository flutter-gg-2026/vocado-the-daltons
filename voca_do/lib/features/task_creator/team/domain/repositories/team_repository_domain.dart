import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/team/domain/entities/team_entity.dart';

abstract class TeamRepositoryDomain {
    Future<Result<TeamEntity, Failure>> getTeam();
}
