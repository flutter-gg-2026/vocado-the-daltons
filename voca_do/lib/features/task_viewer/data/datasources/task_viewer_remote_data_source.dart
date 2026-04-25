import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/features/task_viewer/data/models/task_viewer_model.dart';

abstract class BaseTaskViewerRemoteDataSource {
  Future<List<TaskViewerModel>> getUserTasks();
}

@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
  final SupabaseClient supabaseClient;

  TaskViewerRemoteDataSource(this.supabaseClient);

  @override
  Future<List<TaskViewerModel>> getUserTasks() async {
    
    final userId = '76ce4e3a-273d-4ace-afda-5af555288291';

    final response = await supabaseClient
        .from('tasks')
        .select()
        .eq('assignee_id', userId)
        .order('due_date', ascending: true);

    return response
        .map<TaskViewerModel>(
          (json) => TaskViewerModel.fromJson(json),
        )
        .toList();
  }
}