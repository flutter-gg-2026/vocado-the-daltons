import 'package:equatable/equatable.dart';

class TeamEntity extends Equatable {
  final String id;
  final String authId;
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  const TeamEntity({
    required this.id,
    required this.authId,
    required this.name,
    required this.email,
    required this.role,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, authId, name, email, role, createdAt];
}
