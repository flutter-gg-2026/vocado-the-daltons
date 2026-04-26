import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/features/task_creator/tasks_board/data/models/tasks_board_model.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';

abstract class BaseTasksBoardRemoteDataSource {
  Future<List<TasksBoardModel>> getTasksBoard();
}

@LazySingleton(as: BaseTasksBoardRemoteDataSource)
class TasksBoardRemoteDataSource implements BaseTasksBoardRemoteDataSource {
  final SupabaseClient _supabase;

  TasksBoardRemoteDataSource( this._supabase);

  @override
  Future<List<TasksBoardModel>> getTasksBoard() async {
    try {
      final response = await _supabase.from('tasks').select();

      return (response as List)
          .map((e) => TasksBoardModel.fromJson(e))
          .toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
