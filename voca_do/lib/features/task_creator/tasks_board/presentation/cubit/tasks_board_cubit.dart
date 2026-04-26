import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/features/task_creator/tasks_board/domain/use_cases/tasks_board_use_case.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_state.dart';

@injectable
class TasksBoardCubit extends Cubit<TasksBoardState> {
  final TasksBoardUseCase _tasksBoardUseCase;

  TasksBoardCubit(this._tasksBoardUseCase) : super(TasksBoardInitialState());

  Future<void> getTasksBoardMethod() async {
    final result = await _tasksBoardUseCase.getTasksBoard();
    result.when(
      (success) {
        emit(TasksBoardSuccessState(success));
      },
      (whenError) {
        emit(TasksBoardErrorState(message: whenError.message));
      },
    );
  }
}
