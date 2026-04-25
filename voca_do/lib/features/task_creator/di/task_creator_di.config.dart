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
import 'package:voca_do/core/services/audio_service.dart' as _i745;
import 'package:voca_do/core/services/local_keys_service.dart' as _i302;
import 'package:voca_do/features/task_creator/data/datasources/task_creator_remote_data_source.dart'
    as _i714;
import 'package:voca_do/features/task_creator/data/repositories/task_creator_repository_data.dart'
    as _i365;
import 'package:voca_do/features/task_creator/domain/repositories/task_creator_repository_domain.dart'
    as _i140;
import 'package:voca_do/features/task_creator/domain/use_cases/task_creator_use_case.dart'
    as _i158;
import 'package:voca_do/features/task_creator/sub/add_task_screen/data/datasources/add_task_screen_remote_data_source.dart'
    as _i696;
import 'package:voca_do/features/task_creator/sub/add_task_screen/data/repositories/add_task_screen_repository_data.dart'
    as _i778;
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart'
    as _i251;
import 'package:voca_do/features/task_creator/sub/add_task_screen/domain/use_cases/add_task_screen_use_case.dart'
    as _i12;
import 'package:voca_do/features/task_creator/sub/admin_home_screen/data/datasources/admin_home_screen_remote_data_source.dart'
    as _i554;
import 'package:voca_do/features/task_creator/sub/admin_home_screen/data/repositories/admin_home_screen_repository_data.dart'
    as _i782;
import 'package:voca_do/features/task_creator/sub/admin_home_screen/domain/repositories/admin_home_screen_repository_domain.dart'
    as _i210;
import 'package:voca_do/features/task_creator/sub/admin_home_screen/domain/use_cases/admin_home_screen_use_case.dart'
    as _i235;
import 'package:voca_do/features/task_creator/sub/audio_feature/data/datasources/audio_feature_remote_data_source.dart'
    as _i594;
import 'package:voca_do/features/task_creator/sub/audio_feature/data/repositories/audio_feature_repository_data.dart'
    as _i635;
import 'package:voca_do/features/task_creator/sub/audio_feature/domain/repositories/audio_feature_repository_domain.dart'
    as _i764;
import 'package:voca_do/features/task_creator/sub/audio_feature/domain/use_cases/audio_feature_use_case.dart'
    as _i97;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTaskCreator({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i714.BaseTaskCreatorRemoteDataSource>(
      () => _i714.TaskCreatorRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i554.BaseAdminHomeScreenRemoteDataSource>(
      () => _i554.AdminHomeScreenRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i210.AdminHomeScreenRepositoryDomain>(
      () => _i782.AdminHomeScreenRepositoryData(
        gh<_i554.BaseAdminHomeScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i696.BaseAddTaskScreenRemoteDataSource>(
      () => _i696.AddTaskScreenRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i594.BaseAudioFeatureRemoteDataSource>(
      () => _i594.AudioFeatureRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i361.Dio>(),
        gh<_i745.AudioService>(),
      ),
    );
    gh.lazySingleton<_i764.AudioFeatureRepositoryDomain>(
      () => _i635.AudioFeatureRepositoryData(
        gh<_i594.BaseAudioFeatureRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i97.AudioFeatureUseCase>(
      () => _i97.AudioFeatureUseCase(gh<_i764.AudioFeatureRepositoryDomain>()),
    );
    gh.lazySingleton<_i140.TaskCreatorRepositoryDomain>(
      () => _i365.TaskCreatorRepositoryData(
        gh<_i714.BaseTaskCreatorRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i235.AdminHomeScreenUseCase>(
      () => _i235.AdminHomeScreenUseCase(
        gh<_i210.AdminHomeScreenRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i251.AddTaskScreenRepositoryDomain>(
      () => _i778.AddTaskScreenRepositoryData(
        gh<_i696.BaseAddTaskScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i12.AddTaskScreenUseCase>(
      () =>
          _i12.AddTaskScreenUseCase(gh<_i251.AddTaskScreenRepositoryDomain>()),
    );
    gh.lazySingleton<_i158.TaskCreatorUseCase>(
      () => _i158.TaskCreatorUseCase(gh<_i140.TaskCreatorRepositoryDomain>()),
    );
    return this;
  }
}
