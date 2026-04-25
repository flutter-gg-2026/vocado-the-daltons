import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/profile/domain/entities/profile_entity.dart';

abstract class ProfileRepositoryDomain {
    Future<Result<ProfileEntity, Failure>> getProfile();
}
