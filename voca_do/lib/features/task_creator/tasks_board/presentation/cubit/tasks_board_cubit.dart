import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/tasks_board/domain/use_cases/tasks_board_use_case.dart';
import 'package:voca_do/features/task_creator/tasks_board/presentation/cubit/tasks_board_state.dart';

class TasksBoardCubit extends Cubit<TasksBoardState> {
  final TasksBoardUseCase _tasksBoardUseCase;

  TasksBoardCubit(this._tasksBoardUseCase) : super(TasksBoardInitialState());

  Future<void> getTasksBoardMethod() async {
    final result = await _tasksBoardUseCase.getTasksBoard();
    result.when(
      (success) {
        //here is when success result
      },
      (whenError) {
       //here is when error result
      },
    );
  }

  @override
  Future<void> close() {
    //here is when close cubit
    return super.close();
  }
}
