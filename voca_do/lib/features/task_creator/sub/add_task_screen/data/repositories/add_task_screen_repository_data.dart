
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/entities/add_task_screen_entity.dart';

import 'package:voca_do/features/task_creator/sub/add_task_screen/data/datasources/add_task_screen_remote_data_source.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/data/models/add_task_screen_model.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart';

@LazySingleton(as: AddTaskScreenRepositoryDomain)
class AddTaskScreenRepositoryData implements AddTaskScreenRepositoryDomain{
  final BaseAddTaskScreenRemoteDataSource remoteDataSource;


  AddTaskScreenRepositoryData(this.remoteDataSource);

@override
  Future<Result<AddTaskScreenEntity, Failure>> getAddTaskScreen() async {
    try {
      final response = await remoteDataSource.getAddTaskScreen();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
