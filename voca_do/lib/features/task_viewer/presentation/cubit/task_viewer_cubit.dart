import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';

@injectable
class TaskViewerCubit extends Cubit<TaskViewerState> {
  final GetUserTasksUseCase getUserTasksUseCase;

  TaskViewerCubit(this.getUserTasksUseCase) : super(TaskViewerInitial());

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
}