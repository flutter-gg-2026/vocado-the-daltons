import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/admin_home_screen/domain/entities/admin_home_screen_entity.dart';

abstract class AdminHomeScreenRepositoryDomain {
    Future<Result<AdminHomeScreenEntity, Failure>> getAdminHomeScreen();
}
