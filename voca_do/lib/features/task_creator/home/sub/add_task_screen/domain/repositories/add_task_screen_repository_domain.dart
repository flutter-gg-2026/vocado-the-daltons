import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/new_task_entity.dart';
// <<<<<<< HEAD:voca_do/lib/features/task_creator/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart
// import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/entities/new_task_entity.dart';
// =======
// import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/add_task_screen_entity.dart';
// >>>>>>> develop:voca_do/lib/features/task_creator/home/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart

abstract class AddTaskScreenRepositoryDomain {
  Future<Result<NewTaskEntity, Failure>> getAddTask(String task);
}
