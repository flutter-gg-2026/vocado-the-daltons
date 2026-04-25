import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';

@lazySingleton
class UpdateTaskStatusUseCase {
  final TaskViewerRepository repository;

  UpdateTaskStatusUseCase(this.repository);

  Future<Result<void, Failure>> call({
    required String taskId,
    required String status,
  }) {
    return repository.updateTaskStatus(
      taskId: taskId,
      status: status,
    );
  }
}