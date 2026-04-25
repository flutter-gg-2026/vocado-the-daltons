import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/sub/admin_home_screen/domain/entities/admin_home_screen_entity.dart';
import 'package:voca_do/features/task_creator/sub/admin_home_screen/domain/repositories/admin_home_screen_repository_domain.dart';


@lazySingleton
class AdminHomeScreenUseCase {
  final AdminHomeScreenRepositoryDomain _repositoryData;

  AdminHomeScreenUseCase(this._repositoryData);

   Future<Result<AdminHomeScreenEntity, Failure>> getAdminHomeScreen() async {
    return _repositoryData.getAdminHomeScreen();
  }
}
