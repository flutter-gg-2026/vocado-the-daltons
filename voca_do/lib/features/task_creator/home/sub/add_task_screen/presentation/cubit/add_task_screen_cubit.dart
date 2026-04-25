import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/use_cases/add_task_screen_use_case.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/presentation/cubit/add_task_screen_state.dart';

class AddTaskScreenCubit extends Cubit<AddTaskScreenState> {
  final AddTaskScreenUseCase _addTaskScreenUseCase;

  AddTaskScreenCubit(this._addTaskScreenUseCase)
    : super(AddTaskScreenInitialState());

  // ============================================================
  // ============================================================

  Future<void> getAddTaskMethod({required String task}) async {
    emit(AddTaskScreenLoadingState());

    final result = await _addTaskScreenUseCase.getAddTask(task);

    result.when(
      (success) {
        emit(AddTaskScreenSuccessState(taskEntity: success));
      },
      (whenError) {
        emit(AddTaskScreenErrorState(message: whenError.message));
      },
    );
  }
}
