// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:voca_do/core/network/dio_client.dart' as _i848;
import 'package:voca_do/core/services/audio_service.dart' as _i745;
import 'package:voca_do/core/services/local_keys_service.dart' as _i302;
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/data/datasources/add_task_screen_remote_data_source.dart'
    as _i1050;
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/data/repositories/add_task_screen_repository_data.dart'
    as _i27;
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart'
    as _i363;
import 'package:voca_do/features/task_creator/home/sub/add_task_screen/domain/use_cases/add_task_screen_use_case.dart'
    as _i79;
import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/data/datasources/admin_home_screen_remote_data_source.dart'
    as _i153;
import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/data/repositories/admin_home_screen_repository_data.dart'
    as _i877;
import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/domain/repositories/admin_home_screen_repository_domain.dart'
    as _i1045;
import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/domain/use_cases/admin_home_screen_use_case.dart'
    as _i679;
import 'package:voca_do/features/task_creator/home/sub/audio_feature/data/datasources/audio_feature_remote_data_source.dart'
    as _i414;
import 'package:voca_do/features/task_creator/home/sub/audio_feature/data/repositories/audio_feature_repository_data.dart'
    as _i147;
import 'package:voca_do/features/task_creator/home/sub/audio_feature/domain/repositories/audio_feature_repository_domain.dart'
    as _i236;
import 'package:voca_do/features/task_creator/home/sub/audio_feature/domain/use_cases/audio_feature_use_case.dart'
    as _i222;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initHome({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i153.BaseAdminHomeScreenRemoteDataSource>(
      () => _i153.AdminHomeScreenRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i414.BaseAudioFeatureRemoteDataSource>(
      () => _i414.AudioFeatureRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i361.Dio>(),
        gh<_i745.AudioService>(),
      ),
    );
    gh.lazySingleton<_i1050.BaseAddTaskScreenRemoteDataSource>(
      () => _i1050.AddTaskScreenRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i848.DioClient>(),
      ),
    );
    gh.lazySingleton<_i1045.AdminHomeScreenRepositoryDomain>(
      () => _i877.AdminHomeScreenRepositoryData(
        gh<_i153.BaseAdminHomeScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i236.AudioFeatureRepositoryDomain>(
      () => _i147.AudioFeatureRepositoryData(
        gh<_i414.BaseAudioFeatureRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i363.AddTaskScreenRepositoryDomain>(
      () => _i27.AddTaskScreenRepositoryData(
        gh<_i1050.BaseAddTaskScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i679.AdminHomeScreenUseCase>(
      () => _i679.AdminHomeScreenUseCase(
        gh<_i1045.AdminHomeScreenRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i222.AudioFeatureUseCase>(
      () => _i222.AudioFeatureUseCase(gh<_i236.AudioFeatureRepositoryDomain>()),
    );
    gh.lazySingleton<_i79.AddTaskScreenUseCase>(
      () =>
          _i79.AddTaskScreenUseCase(gh<_i363.AddTaskScreenRepositoryDomain>()),
    );
    return this;
  }
}
