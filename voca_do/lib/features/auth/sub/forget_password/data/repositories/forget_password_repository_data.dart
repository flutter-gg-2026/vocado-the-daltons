
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/network_exceptions.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/auth/sub/forget_password/domain/entities/forget_password_entity.dart';

import 'package:voca_do/features/auth/sub/forget_password/data/datasources/forget_password_remote_data_source.dart';
import 'package:voca_do/features/auth/sub/forget_password/data/models/forget_password_model.dart';
import 'package:voca_do/features/auth/sub/forget_password/domain/repositories/forget_password_repository_domain.dart';

@LazySingleton(as: ForgetPasswordRepositoryDomain)
class ForgetPasswordRepositoryData implements ForgetPasswordRepositoryDomain{
  final BaseForgetPasswordRemoteDataSource remoteDataSource;


  ForgetPasswordRepositoryData(this.remoteDataSource);

@override
  Future<Result<ForgetPasswordEntity, Failure>> getForgetPassword() async {
    try {
      final response = await remoteDataSource.getForgetPassword();
      return Success(response.toEntity());
    } catch (error) {
      return Error(FailureExceptions.getException(error));
    }
  }
}
