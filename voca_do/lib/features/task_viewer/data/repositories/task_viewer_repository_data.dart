import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart';
import 'package:voca_do/features/task_viewer/domain/entities/entities/task_viewer_dashboard_entity.dart';
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@LazySingleton(as: TaskViewerRepository)
class TaskViewerRepositoryImpl implements TaskViewerRepository {
  final TaskViewerRemoteDataSource remoteDataSource;

  TaskViewerRepositoryImpl(this.remoteDataSource);

  @override
  Future<Result<TaskViewerDashboardEntity, Failure>> getCurrentUserTasks() async {
    try {
      final userName = await remoteDataSource.getCurrentUserName();
      final tasks = await remoteDataSource.getCurrentUserTasks();

      return Success(
        TaskViewerDashboardEntity(
          userName: userName,
          tasks: tasks.map((task) => task.toEntity()).toList(),
        ),
      );
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }

  @override
  Future<Result<void, Failure>> updateTaskStatus({
    required String taskId,
    required String status,
  }) async {
    try {
      await remoteDataSource.updateTaskStatus(
        taskId: taskId,
        status: status,
      );

      return const Success(null);
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
