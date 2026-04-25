import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/data/models/add_task_screen_model.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';

abstract class BaseAddTaskScreenRemoteDataSource {
  Future<AddTaskScreenModel> getAddTaskScreen();
}

@LazySingleton(as: BaseAddTaskScreenRemoteDataSource)
class AddTaskScreenRemoteDataSource
    implements BaseAddTaskScreenRemoteDataSource {
  final SupabaseClient _supabase;

  AddTaskScreenRemoteDataSource(this._supabase);

  @override
  Future<AddTaskScreenModel> getAddTaskScreen() async {
    try {
      return AddTaskScreenModel(
        id: 1,
        firstName: "Last Name",
        lastName: "First Name",
      );
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
