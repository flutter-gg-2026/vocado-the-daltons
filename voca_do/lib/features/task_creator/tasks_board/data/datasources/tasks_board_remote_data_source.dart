import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:voca_do/core/services/local_keys_service.dart';
import 'package:voca_do/features/task_creator/tasks_board/data/models/tasks_board_model.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';


abstract class BaseTasksBoardRemoteDataSource {
  Future<TasksBoardModel> getTasksBoard();
}


@LazySingleton(as: BaseTasksBoardRemoteDataSource)
class TasksBoardRemoteDataSource implements BaseTasksBoardRemoteDataSource {
 
  final SupabaseClient _supabase;
  final LocalKeysService _localKeysService;
  
  

   TasksBoardRemoteDataSource(this._localKeysService, this._supabase);



    @override
  Future<TasksBoardModel> getTasksBoard() async {
    try {
      return TasksBoardModel(id: 1, firstName: "Last Name", lastName: "First Name");
    } catch (error) {
     throw FailureExceptions.getException(error);
    }
  }
}
