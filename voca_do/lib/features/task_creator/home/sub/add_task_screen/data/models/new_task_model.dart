import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/entities/new_task_entity.dart';
// import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/entities/new_task_entity.dart';
part 'new_task_model.freezed.dart';
part 'new_task_model.g.dart';

@freezed
abstract class NewTaskModel with _$NewTaskModel {
  @JsonSerializable(fieldRename: .snake)
  const factory NewTaskModel({
    required String task,
    required String assignee,
    required DateTime dueDate,
  }) = _NewTaskModel;

  factory NewTaskModel.fromJson(Map<String, Object?> json) =>
      _$NewTaskModelFromJson(json);
}

// ====================================================================
// ====================================================================

extension NewTaskModelMapper on NewTaskModel {
  NewTaskEntity toEntity() {
    return NewTaskEntity(task: task, assignee: assignee, dueDate: dueDate);
  }
}
