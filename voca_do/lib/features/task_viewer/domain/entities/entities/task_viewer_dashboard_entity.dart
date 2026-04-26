import 'package:equatable/equatable.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';

class TaskViewerDashboardEntity extends Equatable {
  final String userName;
  final List<TaskViewerEntity> tasks;

  const TaskViewerDashboardEntity({
    required this.userName,
    required this.tasks,
  });

  @override
  List<Object?> get props => [userName, tasks];
}
