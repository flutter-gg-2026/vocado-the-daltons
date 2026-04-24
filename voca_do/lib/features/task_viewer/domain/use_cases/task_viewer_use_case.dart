import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart';


@lazySingleton
class TaskViewerUseCase {
  final TaskViewerRepositoryDomain _repositoryData;

  TaskViewerUseCase(this._repositoryData);

 
  Future<Result<List<TaskViewerEntity>, Failure>> call(
    String assigneeId,
  )async {
    return _repositoryData.getTaskViewer(assigneeId);
  }
}
