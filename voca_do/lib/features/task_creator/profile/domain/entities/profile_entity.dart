import 'package:equatable/equatable.dart';

class ProfileEntity extends Equatable {
  final String name;
  final String email;
  final String role;
  final DateTime createdAt;

  const ProfileEntity({required this.name, required this.email, required this.role,required this.createdAt});

  @override
  List<Object?> get props => [name, email, role, createdAt];
}
