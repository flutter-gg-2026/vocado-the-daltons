import 'package:voca_do/features/task_creator/tasks_board/domain/entities/tasks_board_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'tasks_board_model.freezed.dart';
part 'tasks_board_model.g.dart';

@freezed
abstract class TasksBoardModel with _$TasksBoardModel {
  const factory TasksBoardModel({
    required int id,
    required String firstName,
    required String lastName,
    
  }) = _TasksBoardModel;

  factory TasksBoardModel.fromJson(Map<String, Object?> json) => _$TasksBoardModelFromJson(json);
}



extension TasksBoardModelMapper on TasksBoardModel {
  TasksBoardEntity toEntity() {
    return TasksBoardEntity(id: id, firstName: firstName, lastName: lastName);
  }
  }
