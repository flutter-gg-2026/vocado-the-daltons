import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/add_task_screen_entity.dart';

abstract class AddTaskScreenRepositoryDomain {
    Future<Result<AddTaskScreenEntity, Failure>> getAddTaskScreen();
}
