import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/services/local_keys_service.dart';
import 'package:voca_do/features/task_viewer/data/models/task_viewer_model.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';


abstract class BaseTaskViewerRemoteDataSource {
Future<List<TaskViewerModel>> getUserTasks(String assigneeId);
}


@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   TaskViewerRemoteDataSource(this._localKeysService, this._supabase);



    @override
 Future<List<TaskViewerModel>> getTaskViewer(String assigneeId) async {
    final response = await _supabaseClient
        .from('tasks')
        .select()
        .eq('assignee_id', assigneeId)
        .order('due_date', ascending: true);

    return response
        .map<TaskViewerModel>(
          (json) => TaskViewerModel.fromJson(json),
        )
        .toList();
  }
}