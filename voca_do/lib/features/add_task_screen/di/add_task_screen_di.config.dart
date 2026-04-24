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
import 'package:voca_do/features/add_task_screen/data/datasources/add_task_screen_remote_data_source.dart'
    as _i423;
import 'package:voca_do/features/add_task_screen/data/repositories/add_task_screen_repository_data.dart'
    as _i328;
import 'package:voca_do/features/add_task_screen/domain/repositories/add_task_screen_repository_domain.dart'
    as _i356;
import 'package:voca_do/features/add_task_screen/domain/use_cases/add_task_screen_use_case.dart'
    as _i340;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAddTaskScreen({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i423.BaseAddTaskScreenRemoteDataSource>(
      () => _i423.AddTaskScreenRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i356.AddTaskScreenRepositoryDomain>(
      () => _i328.AddTaskScreenRepositoryData(
        gh<_i423.BaseAddTaskScreenRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i340.AddTaskScreenUseCase>(
      () =>
          _i340.AddTaskScreenUseCase(gh<_i356.AddTaskScreenRepositoryDomain>()),
    );
    return this;
  }
}
