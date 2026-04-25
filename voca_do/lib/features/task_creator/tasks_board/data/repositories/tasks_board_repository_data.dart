
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/tasks_board/domain/entities/tasks_board_entity.dart';

import 'package:voca_do/features/task_creator/tasks_board/data/datasources/tasks_board_remote_data_source.dart';
import 'package:voca_do/features/task_creator/tasks_board/data/models/tasks_board_model.dart';
import 'package:voca_do/features/task_creator/tasks_board/domain/repositories/tasks_board_repository_domain.dart';

@LazySingleton(as: TasksBoardRepositoryDomain)
class TasksBoardRepositoryData implements TasksBoardRepositoryDomain{
  final BaseTasksBoardRemoteDataSource remoteDataSource;


  TasksBoardRepositoryData(this.remoteDataSource);

@override
  Future<Result<TasksBoardEntity, Failure>> getTasksBoard() async {
    try {
      final response = await remoteDataSource.getTasksBoard();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
