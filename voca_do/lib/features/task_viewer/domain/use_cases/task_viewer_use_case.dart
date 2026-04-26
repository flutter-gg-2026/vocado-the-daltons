import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/entities/entities/task_viewer_dashboard_entity.dart';
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@lazySingleton
class GetUserTasksUseCase {
  final TaskViewerRepository repository;

  GetUserTasksUseCase(this.repository);

  Future<Result<TaskViewerDashboardEntity, Failure>> call() {
    return repository.getCurrentUserTasks();
  }
}
