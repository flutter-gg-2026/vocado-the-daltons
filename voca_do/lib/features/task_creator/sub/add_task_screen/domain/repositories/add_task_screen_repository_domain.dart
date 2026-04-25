import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/entities/new_task_entity.dart';

abstract class AddTaskScreenRepositoryDomain {
  Future<Result<NewTaskEntity, Failure>> getAddTask(String task);
}
