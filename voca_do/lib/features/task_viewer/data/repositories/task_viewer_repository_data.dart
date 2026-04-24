import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

import 'package:voca_do/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart';
import 'package:voca_do/features/task_viewer/data/models/task_viewer_model.dart';
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@LazySingleton(as: TaskViewerRepositoryDomain)
class TaskViewerRepositoryData implements TaskViewerRepositoryDomain {
  final BaseTaskViewerRemoteDataSource remoteDataSource;

  TaskViewerRepositoryData(this.remoteDataSource);
  @override
  Future<Result<List<TaskViewerEntity>, Failure>> getTaskViewer(
    String assigneeId,
  ) async {
    try {
      final tasks = await remoteDataSource.getUserTasks(assigneeId);

      return Success(tasks.map((task) => task.toEntity()).toList());
    } catch (error) {
      return Error(ServerFailure(error.toString()));
    }
  }
}
