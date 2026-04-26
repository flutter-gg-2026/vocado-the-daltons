import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/entities/entities/task_viewer_dashboard_entity.dart';

abstract class TaskViewerRepository {
  Future<Result<TaskViewerDashboardEntity, Failure>> getCurrentUserTasks();

  Future<Result<void, Failure>> updateTaskStatus({
    required String taskId,
    required String status,
  });
}
