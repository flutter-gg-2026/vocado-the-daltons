import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/features/task_viewer/data/models/task_viewer_model.dart';

abstract class TaskViewerRemoteDataSource {
  Future<List<TaskViewerModel>> getUserTasks(String assigneeId);

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
  Future<List<TaskViewerModel>> getUserTasks(String assigneeId) async {
    final response = await supabaseClient
        .from('tasks')
        .select()
        .eq('assignee_id', assigneeId)
        .order('created_at', ascending: false);

    return response
        .map<TaskViewerModel>((json) => TaskViewerModel.fromJson(json))
        .toList();
  }

  @override
  Future<void> updateTaskStatus({
    required String taskId,
    required String status,
  }) async {
    await supabaseClient
        .from('tasks')
        .update({'status': status})
        .eq('id', taskId);
  }
}