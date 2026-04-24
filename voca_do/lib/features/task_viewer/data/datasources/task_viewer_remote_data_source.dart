import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/services/local_keys_service.dart';
import 'package:voca_do/features/task_viewer/data/models/task_viewer_model.dart';

abstract class BaseTaskViewerRemoteDataSource {
  Future<List<TaskViewerModel>> getUserTasks(String assigneeId);
}

@LazySingleton(as: BaseTaskViewerRemoteDataSource)
class TaskViewerRemoteDataSource implements BaseTaskViewerRemoteDataSource {
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;

  TaskViewerRemoteDataSource(this._localKeysService, this._supabase);

  @override
  Future<List<TaskViewerModel>> getUserTasks(String assigneeId) async {
    try {
      final response = await _supabase
          .from('tasks')
          .select('id, title, assignee_id, due_date, status')
          .eq('assignee_id', assigneeId);

      return response
          .map<TaskViewerModel>(
            (task) =>
                TaskViewerModel.fromJson(Map<String, dynamic>.from(task as Map)),
          )
          .toList(growable: false);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
