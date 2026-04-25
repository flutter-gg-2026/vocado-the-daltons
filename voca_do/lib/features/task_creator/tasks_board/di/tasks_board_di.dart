import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'tasks_board_di.config.dart'; 

@InjectableInit(
  initializerName: 'initTasksBoard',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/task_creator/tasks_board'],
)
void configureTasksBoard(GetIt getIt) {
  getIt.initTasksBoard();
}
