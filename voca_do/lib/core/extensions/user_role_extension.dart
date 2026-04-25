import 'package:voca_do/core/constants/app_enums.dart';

extension UserRoleSelector on String {
  UserRole toUserRole() {
    switch (toLowerCase().trim()) {
      case 'admin':
        return UserRole.admin;
      default:
        return UserRole.user;
    }
  }
}