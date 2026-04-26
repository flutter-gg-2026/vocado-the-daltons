import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/task_viewer/domain/entities/task_viewer_entity.dart';
import 'package:voca_do/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:voca_do/features/task_viewer/domain/use_cases/update_task_status_use_case.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';

@injectable
class TaskViewerCubit extends Cubit<TaskViewerState> {
  final GetUserTasksUseCase getUserTasksUseCase;
  final UpdateTaskStatusUseCase updateTaskStatusUseCase;

  TaskViewerCubit(
    this.getUserTasksUseCase,
    this.updateTaskStatusUseCase,
  ) : super(TaskViewerInitial());

  Future<void> getUserTasks() async {
    emit(TaskViewerLoading());

    final result = await getUserTasksUseCase();

    result.when(
      (dashboard) {
        emit(TaskViewerSuccess(dashboard));
      },
      (failure) {
        emit(TaskViewerError(failure.message));
      },
    );
  }

  Future<void> completeTask({required String taskId}) async {
    final result = await updateTaskStatusUseCase(
      taskId: taskId,
      status: 'completed',
    );

    result.when(
      (_) {
        getUserTasks();
      },
      (failure) {
        emit(TaskViewerError(failure.message));
      },
    );
  }

  List<TaskViewerEntity> getTasksByStatus(String status) {
    final currentState = state;

    if (currentState is! TaskViewerSuccess) {
      return const [];
    }

    return currentState.dashboard.tasks
        .where((task) => task.status.toLowerCase() == status.toLowerCase())
        .toList();
  }
}
