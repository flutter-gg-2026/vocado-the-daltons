import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/add_task_screen/domain/entities/add_task_screen_entity.dart';
import 'package:voca_do/features/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart';


@lazySingleton
class AddTaskScreenUseCase {
  final AddTaskScreenRepositoryDomain _repositoryData;

  AddTaskScreenUseCase(this._repositoryData);

   Future<Result<AddTaskScreenEntity, Failure>> getAddTaskScreen() async {
    return _repositoryData.getAddTaskScreen();
  }
}
