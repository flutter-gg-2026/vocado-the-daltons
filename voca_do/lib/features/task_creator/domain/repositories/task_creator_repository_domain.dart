import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/domain/entities/task_creator_entity.dart';

abstract class TaskCreatorRepositoryDomain {
    Future<Result<TaskCreatorEntity, Failure>> getTaskCreator();
}
