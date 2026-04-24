import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_viewer/domain/use_cases/task_viewer_use_case.dart';
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_state.dart';

class TaskViewerCubit extends Cubit<TaskViewerState> {
  final TaskViewerUseCase _taskViewerUseCase;

  TaskViewerCubit(this._taskViewerUseCase) : super(TaskViewerInitialState());

  Future<void> getTaskViewerMethod(String assigneeId) async {
     final result = await _taskViewerUseCase(assigneeId);
    result.when(
      (success) {
         emit(TaskViewerSuccessState(tasks: success));
      },
      (whenError) {
        emit(TaskViewerErrorState(message: whenError.message));
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
