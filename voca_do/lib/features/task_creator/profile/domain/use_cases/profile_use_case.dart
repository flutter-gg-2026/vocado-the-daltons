import 'package:multiple_result/multiple_result.dart';
import 'package:injectable/injectable.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/profile/domain/entities/profile_entity.dart';
import 'package:voca_do/features/task_creator/profile/domain/repositories/profile_repository_domain.dart';


@lazySingleton
class ProfileUseCase {
  final ProfileRepositoryDomain _repositoryData;

  ProfileUseCase(this._repositoryData);

   Future<Result<ProfileEntity, Failure>> getProfile() async {
    return _repositoryData.getProfile();
  }
}
