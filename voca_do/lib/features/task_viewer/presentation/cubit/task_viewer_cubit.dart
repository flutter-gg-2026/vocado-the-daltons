import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
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

  Future<void> getUserTasks(String assigneeId) async {
    emit(TaskViewerLoading());

    final result = await getUserTasksUseCase(assigneeId);

    result.when(
      (tasks) {
        emit(TaskViewerSuccess(tasks));
      },
      (failure) {
        emit(TaskViewerError(failure.message));
      },
    );
  }

  Future<void> completeTask({
    required String taskId,
    required String assigneeId,
  }) async {
    final result = await updateTaskStatusUseCase(
      taskId: taskId,
      status: 'completed',
    );

    result.when(
      (_) {
        getUserTasks(assigneeId);
      },
      (failure) {
        emit(TaskViewerError(failure.message));
      },
    );
  }
}