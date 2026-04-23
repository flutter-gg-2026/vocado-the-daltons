// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:voca_do/core/services/local_keys_service.dart' as _i302;
import 'package:voca_do/features/task_creator/data/datasources/task_creator_remote_data_source.dart'
    as _i714;
import 'package:voca_do/features/task_creator/data/repositories/task_creator_repository_data.dart'
    as _i365;
import 'package:voca_do/features/task_creator/domain/repositories/task_creator_repository_domain.dart'
    as _i140;
import 'package:voca_do/features/task_creator/domain/use_cases/task_creator_use_case.dart'
    as _i158;

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
    gh.lazySingleton<_i140.TaskCreatorRepositoryDomain>(
      () => _i365.TaskCreatorRepositoryData(
        gh<_i714.BaseTaskCreatorRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i158.TaskCreatorUseCase>(
      () => _i158.TaskCreatorUseCase(gh<_i140.TaskCreatorRepositoryDomain>()),
    );
    return this;
  }
}
