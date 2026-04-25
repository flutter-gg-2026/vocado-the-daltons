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
import 'package:voca_do/features/task_creator/home/data/datasources/home_remote_data_source.dart'
    as _i808;
import 'package:voca_do/features/task_creator/home/data/repositories/home_repository_data.dart'
    as _i466;
import 'package:voca_do/features/task_creator/home/domain/repositories/home_repository_domain.dart'
    as _i960;
import 'package:voca_do/features/task_creator/home/domain/use_cases/home_use_case.dart'
    as _i113;
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
import 'package:voca_do/features/task_creator/profile/data/datasources/profile_remote_data_source.dart'
    as _i217;
import 'package:voca_do/features/task_creator/profile/data/repositories/profile_repository_data.dart'
    as _i385;
import 'package:voca_do/features/task_creator/profile/domain/repositories/profile_repository_domain.dart'
    as _i608;
import 'package:voca_do/features/task_creator/profile/domain/use_cases/profile_use_case.dart'
    as _i455;
import 'package:voca_do/features/task_creator/profile/presentation/cubit/profile_cubit.dart'
    as _i750;
import 'package:voca_do/features/task_creator/tasks_board/data/datasources/tasks_board_remote_data_source.dart'
    as _i81;
import 'package:voca_do/features/task_creator/tasks_board/data/repositories/tasks_board_repository_data.dart'
    as _i949;
import 'package:voca_do/features/task_creator/tasks_board/domain/repositories/tasks_board_repository_domain.dart'
    as _i638;
import 'package:voca_do/features/task_creator/tasks_board/domain/use_cases/tasks_board_use_case.dart'
    as _i471;
import 'package:voca_do/features/task_creator/team/data/datasources/team_remote_data_source.dart'
    as _i415;
import 'package:voca_do/features/task_creator/team/data/repositories/team_repository_data.dart'
    as _i1012;
import 'package:voca_do/features/task_creator/team/domain/repositories/team_repository_domain.dart'
    as _i549;
import 'package:voca_do/features/task_creator/team/domain/use_cases/team_use_case.dart'
    as _i13;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTaskCreator({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i808.BaseHomeRemoteDataSource>(
      () => _i808.HomeRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i153.BaseAdminHomeScreenRemoteDataSource>(
      () => _i153.AdminHomeScreenRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i415.BaseTeamRemoteDataSource>(
      () => _i415.TeamRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i217.BaseProfileRemoteDataSource>(
      () => _i217.ProfileRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i81.BaseTasksBoardRemoteDataSource>(
      () => _i81.TasksBoardRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i549.TeamRepositoryDomain>(
      () => _i1012.TeamRepositoryData(gh<_i415.BaseTeamRemoteDataSource>()),
    );
    gh.lazySingleton<_i1050.BaseAddTaskScreenRemoteDataSource>(
      () => _i1050.AddTaskScreenRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i608.ProfileRepositoryDomain>(
      () =>
          _i385.ProfileRepositoryData(gh<_i217.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i455.ProfileUseCase>(
      () => _i455.ProfileUseCase(gh<_i608.ProfileRepositoryDomain>()),
    );
    gh.lazySingleton<_i414.BaseAudioFeatureRemoteDataSource>(
      () => _i414.AudioFeatureRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i361.Dio>(),
        gh<_i745.AudioService>(),
      ),
    );
    gh.lazySingleton<_i363.AddTaskScreenRepositoryDomain>(
      () => _i27.AddTaskScreenRepositoryData(
        gh<_i1050.BaseAddTaskScreenRemoteDataSource>(),
      ),
    );
    gh.factory<_i750.ProfileCubit>(
      () => _i750.ProfileCubit(gh<_i455.ProfileUseCase>()),
    );
    gh.lazySingleton<_i960.HomeRepositoryDomain>(
      () => _i466.HomeRepositoryData(gh<_i808.BaseHomeRemoteDataSource>()),
    );
    gh.lazySingleton<_i638.TasksBoardRepositoryDomain>(
      () => _i949.TasksBoardRepositoryData(
        gh<_i81.BaseTasksBoardRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i1045.AdminHomeScreenRepositoryDomain>(
      () => _i877.AdminHomeScreenRepositoryData(
        gh<_i153.BaseAdminHomeScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i79.AddTaskScreenUseCase>(
      () =>
          _i79.AddTaskScreenUseCase(gh<_i363.AddTaskScreenRepositoryDomain>()),
    );
    gh.lazySingleton<_i13.TeamUseCase>(
      () => _i13.TeamUseCase(gh<_i549.TeamRepositoryDomain>()),
    );
    gh.lazySingleton<_i471.TasksBoardUseCase>(
      () => _i471.TasksBoardUseCase(gh<_i638.TasksBoardRepositoryDomain>()),
    );
    gh.lazySingleton<_i236.AudioFeatureRepositoryDomain>(
      () => _i147.AudioFeatureRepositoryData(
        gh<_i414.BaseAudioFeatureRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i113.HomeUseCase>(
      () => _i113.HomeUseCase(gh<_i960.HomeRepositoryDomain>()),
    );
    gh.lazySingleton<_i679.AdminHomeScreenUseCase>(
      () => _i679.AdminHomeScreenUseCase(
        gh<_i1045.AdminHomeScreenRepositoryDomain>(),
      ),
    );
    gh.lazySingleton<_i222.AudioFeatureUseCase>(
      () => _i222.AudioFeatureUseCase(gh<_i236.AudioFeatureRepositoryDomain>()),
    );
    return this;
  }
}
