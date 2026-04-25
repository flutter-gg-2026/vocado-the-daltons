import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
// <<<<<<< HEAD:voca_do/lib/features/task_creator/sub/add_task_screen/data/datasources/add_task_screen_remote_data_source.dart
import 'package:voca_do/core/network/dio_client.dart';
import 'package:voca_do/core/network/gemini_methods.dart';
// =======
// import 'package:voca_do/features/task_creator/home/sub/add_task_screen/data/models/add_task_screen_model.dart';
// >>>>>>> develop:voca_do/lib/features/task_creator/home/sub/add_task_screen/data/datasources/add_task_screen_remote_data_source.dart
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/data/models/new_task_model.dart';

abstract class BaseAddTaskScreenRemoteDataSource {
  Future<NewTaskModel> getAddTask(String task);
}

@LazySingleton(as: BaseAddTaskScreenRemoteDataSource)
class AddTaskScreenRemoteDataSource
    implements BaseAddTaskScreenRemoteDataSource {
  final SupabaseClient _supabase;
  final DioClient _dioClient;

  AddTaskScreenRemoteDataSource(this._supabase, this._dioClient);

  @override
  Future<NewTaskModel> getAddTask(String task) async {
    try {
      // TODO: remove prints later

      print("========== STARTING TASK FLOW ==========");
      print("1. Contacting Gemini API...");
      //@ ==========================================================
      final generatedJson = await _dioClient.getJson(task);
      final newTaskModel = NewTaskModel.fromJson(generatedJson);
      //@ ==========================================================

      print("✅ Gemini Success! Found Assignee: ${newTaskModel.assignee}");

      // Query the 'users' table to find the assigneeId
      // Using .ilike() for search
      // Using .maybeSingle() prevents a crash if the user doesn't exist
      print("2. Searching Supabase 'users' table...");

      //@ ==========================================================

      final userRecord = await _supabase
          .from('users')
          .select('id')
          .ilike('name', newTaskModel.assignee)
          .maybeSingle();

      //@ ==========================================================

      // Handles the case where the user isn't in the database
      if (userRecord == null) {
        final String assigneeName = newTaskModel.assignee;
        final String errorMessage =
            "User '$assigneeName' could not be found in the system.";
        throw Exception(errorMessage);
      }
      final assigneeId = userRecord['id'];

      //@ ==========================================================

      print("✅ Supabase Read Success! User ID: $assigneeId");

      print("3. Saving to Supabase 'tasks' table...");

      //@ ==========================================================

      // Insert the new task into the 'tasks' table
      await _supabase.from('tasks').insert({
        'task': newTaskModel.task,
        'assignee_id': assigneeId,
        'due_date': newTaskModel.dueDate.toIso8601String(),
        //TODO: add 'created_by' to insert the current user ID
      });

      //@ ==========================================================

      print("✅ Supabase Insert Success!");
      print("========== FLOW COMPLETED ==========");

      return newTaskModel;
    } catch (error) {
      print("❌ ERROR CAUGHT: $error");
      throw FailureExceptions.getException(error);
    }
  }
}
