import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

abstract class TaskViewerRepositoryDomain {
Future<Result<List<TaskViewerEntity>, Failure>> getUserTasks();
   
}