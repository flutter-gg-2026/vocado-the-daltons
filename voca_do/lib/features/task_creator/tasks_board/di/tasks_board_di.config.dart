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
import 'package:voca_do/features/task_creator/tasks_board/data/datasources/tasks_board_remote_data_source.dart'
    as _i81;
import 'package:voca_do/features/task_creator/tasks_board/data/repositories/tasks_board_repository_data.dart'
    as _i949;
import 'package:voca_do/features/task_creator/tasks_board/domain/repositories/tasks_board_repository_domain.dart'
    as _i638;
import 'package:voca_do/features/task_creator/tasks_board/domain/use_cases/tasks_board_use_case.dart'
    as _i471;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTasksBoard({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i81.BaseTasksBoardRemoteDataSource>(
      () => _i81.TasksBoardRemoteDataSource(
        gh<_i302.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i638.TasksBoardRepositoryDomain>(
      () => _i949.TasksBoardRepositoryData(
        gh<_i81.BaseTasksBoardRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i471.TasksBoardUseCase>(
      () => _i471.TasksBoardUseCase(gh<_i638.TasksBoardRepositoryDomain>()),
    );
    return this;
  }
}
