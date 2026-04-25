import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@lazySingleton
class GetUserTasksUseCase {
  final TaskViewerRepository repository;

  GetUserTasksUseCase(this.repository);

  Future<Result<List<TaskViewerEntity>, Failure>> call(
    String assigneeId,
  ) {
    return repository.getUserTasks(assigneeId);
  }
}