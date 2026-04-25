import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/tasks_board/domain/entities/tasks_board_entity.dart';

abstract class TasksBoardRepositoryDomain {
    Future<Result<TasksBoardEntity, Failure>> getTasksBoard();
}
