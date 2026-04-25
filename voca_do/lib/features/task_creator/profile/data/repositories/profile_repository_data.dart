
// import 'package:injectable/injectable.dart';
// import 'package:multiple_result/multiple_result.dart';
// import 'package:voca_do/core/errors/network_exceptions.dart';
// import 'package:voca_do/core/errors/failure.dart';
// import 'package:voca_do/features/task_creator/profile/domain/entities/profile_entity.dart';

// import 'package:voca_do/features/task_creator/profile/data/datasources/profile_remote_data_source.dart';
// import 'package:voca_do/features/task_creator/profile/data/models/profile_model.dart';
// import 'package:voca_do/features/task_creator/profile/domain/repositories/profile_repository_domain.dart';

// @LazySingleton(as: ProfileRepositoryDomain)
// class ProfileRepositoryData implements ProfileRepositoryDomain{
//   final BaseProfileRemoteDataSource remoteDataSource;


//   ProfileRepositoryData(this.remoteDataSource);

// @override
//   Future<Result<ProfileEntity, Failure>> getProfile() async {
//     try {
//       final response = await remoteDataSource.getProfile();
//       return Success(response.toEntity());
//     } catch (error) {
//       return Error(FailureExceptions.getException(error));
//     }
//   }
// }
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';

import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/features/task_creator/profile/data/datasources/profile_remote_data_source.dart';
import 'package:voca_do/features/task_creator/profile/data/models/profile_model.dart';
import 'package:voca_do/features/task_creator/profile/domain/entities/profile_entity.dart';
import 'package:voca_do/features/task_creator/profile/domain/repositories/profile_repository_domain.dart';

@LazySingleton(as: ProfileRepositoryDomain)
class ProfileRepositoryData implements ProfileRepositoryDomain {
  final BaseProfileRemoteDataSource remoteDataSource;

  ProfileRepositoryData(this.remoteDataSource);

  @override
  Future<Result<ProfileEntity, Failure>> getProfile() async {
    try {
      final response = await remoteDataSource.getProfile();
      return Success(response.toEntity());
    } on Failure catch (error) {
      return Error(error);
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
