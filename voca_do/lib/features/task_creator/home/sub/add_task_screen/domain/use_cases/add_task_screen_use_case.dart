import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/new_task_entity.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart';
// <<<<<<< HEAD:voca_do/lib/features/task_creator/sub/add_task_screen/domain/use_cases/add_task_screen_use_case.dart
// import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/entities/new_task_entity.dart';
// import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart';
// =======
// import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/add_task_screen_entity.dart';
// import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart';
// >>>>>>> develop:voca_do/lib/features/task_creator/home/sub/add_task_screen/domain/use_cases/add_task_screen_use_case.dart

@lazySingleton
class AddTaskScreenUseCase {
  final AddTaskScreenRepositoryDomain _repositoryData;

  AddTaskScreenUseCase(this._repositoryData);

  Future<Result<NewTaskEntity, Failure>> getAddTask(String task) async {
    return _repositoryData.getAddTask(task);
  }
}
