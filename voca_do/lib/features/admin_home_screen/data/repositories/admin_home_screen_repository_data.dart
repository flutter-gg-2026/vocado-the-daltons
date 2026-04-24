
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/admin_home_screen/domain/entities/admin_home_screen_entity.dart';

import 'package:voca_do/features/admin_home_screen/data/datasources/admin_home_screen_remote_data_source.dart';
import 'package:voca_do/features/admin_home_screen/data/models/admin_home_screen_model.dart';
import 'package:voca_do/features/admin_home_screen/domain/repositories/admin_home_screen_repository_domain.dart';

@LazySingleton(as: AdminHomeScreenRepositoryDomain)
class AdminHomeScreenRepositoryData implements AdminHomeScreenRepositoryDomain{
  final BaseAdminHomeScreenRemoteDataSource remoteDataSource;


  AdminHomeScreenRepositoryData(this.remoteDataSource);

@override
  Future<Result<AdminHomeScreenEntity, Failure>> getAdminHomeScreen() async {
    try {
      final response = await remoteDataSource.getAdminHomeScreen();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
