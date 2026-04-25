import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/use_cases/add_task_screen_use_case.dart';
import 'package:voca_do/features/task_creator/sub/add_task_screen/presentation/cubit/add_task_screen_state.dart';

class AddTaskScreenCubit extends Cubit<AddTaskScreenState> {
  final AddTaskScreenUseCase _addTaskScreenUseCase;

  AddTaskScreenCubit(this._addTaskScreenUseCase) : super(AddTaskScreenInitialState());

  Future<void> getAddTaskScreenMethod() async {
    final result = await _addTaskScreenUseCase.getAddTaskScreen();
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
