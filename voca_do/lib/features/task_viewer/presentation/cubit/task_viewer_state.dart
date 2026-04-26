import 'package:equatable/equatable.dart';
import 'package:voca_do/features/task_viewer/domain/entities/entities/task_viewer_dashboard_entity.dart';

abstract class TaskViewerState extends Equatable {
  const TaskViewerState();

  @override
  List<Object?> get props => [];
}

class TaskViewerInitial extends TaskViewerState {}

class TaskViewerLoading extends TaskViewerState {}

class TaskViewerSuccess extends TaskViewerState {
  final TaskViewerDashboardEntity dashboard;

  const TaskViewerSuccess(this.dashboard);

  @override
  List<Object?> get props => [dashboard];
}

class TaskViewerError extends TaskViewerState {
  final String message;

  const TaskViewerError(this.message);

  @override
  List<Object?> get props => [message];
}
