import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/features/task_viewer/data/models/task_viewer_model.dart';

abstract class TaskViewerRemoteDataSource {
  Future<List<TaskViewerModel>> getCurrentUserTasks();
  Future<String> getCurrentUserName();

  Future<void> updateTaskStatus({
    required String taskId,
    required String status,
  });
}

@LazySingleton(as: TaskViewerRemoteDataSource)
class TaskViewerRemoteDataSourceImpl implements TaskViewerRemoteDataSource {
  final SupabaseClient supabaseClient;

  TaskViewerRemoteDataSourceImpl(this.supabaseClient);

  @override
  Future<List<TaskViewerModel>> getCurrentUserTasks() async {
    try {
      final userId = supabaseClient.auth.currentUser?.id;

      if (userId == null) {
        throw AuthException('User is not logged in');
      }

      final response = await supabaseClient
          .from('tasks')
          .select()
          .eq('assignee_id', userId)
          .order('created_at', ascending: false);

      return response
          .map<TaskViewerModel>((json) => TaskViewerModel.fromJson(json))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<String> getCurrentUserName() async {
    try {
      final userId = supabaseClient.auth.currentUser?.id;

      if (userId == null) {
        throw AuthException('User is not logged in');
      }

      final response = await supabaseClient
          .from('users')
          .select('name, email')
          .eq('id', userId)
          .maybeSingle();

      return response?['name']?.toString() ??
          response?['email']?.toString() ??
          'User';
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> updateTaskStatus({
    required String taskId,
    required String status,
  }) async {
    try {
      await supabaseClient
          .from('tasks')
          .update({'status': status})
          .eq('id', taskId);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
