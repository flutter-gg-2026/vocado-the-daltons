import 'package:voca_do/features/task_creator/team/domain/entities/team_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'team_model.freezed.dart';
part 'team_model.g.dart';

@freezed
abstract class TeamModel with _$TeamModel {
  @JsonSerializable(fieldRename: .snake)
  const factory TeamModel({
    required String id,
    required String authId,
    required String name,
    required String email,
    required String role,
    required DateTime createdAt,
  }) = _TeamModel;
 
  factory TeamModel.fromJson(Map<String, dynamic> json) {
  return TeamModel(
    id: json['id']?.toString() ?? '',
    authId: json['auth_id']?.toString() ?? 'unknown',
    name: json['name']?.toString() ?? 'no name',
    email: json['email']?.toString() ?? '',
    role: json['role']?.toString() ?? 'user',
    createdAt: DateTime.tryParse(json['created_at'] ?? '') ?? DateTime.now(),
  );
}
}

extension TeamModelMapper on TeamModel {
  TeamEntity toEntity() {
    return TeamEntity(
      id: id,
      authId: authId,
      name: name,
      email: email,
      role: role,
      createdAt: createdAt,
    );
  }
}
