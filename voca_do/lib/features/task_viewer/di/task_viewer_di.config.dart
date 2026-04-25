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
import 'package:voca_do/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart'
    as _i137;
import 'package:voca_do/features/task_viewer/data/repositories/task_viewer_repository_data.dart'
    as _i209;
import 'package:voca_do/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart'
    as _i778;
import 'package:voca_do/features/task_viewer/domain/use_cases/task_viewer_use_case.dart'
    as _i562;
import 'package:voca_do/features/task_viewer/domain/use_cases/update_task_status_use_case.dart'
    as _i660;
import 'package:voca_do/features/task_viewer/presentation/cubit/task_viewer_cubit.dart'
    as _i1045;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTaskViewer({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i137.TaskViewerRemoteDataSource>(
      () => _i137.TaskViewerRemoteDataSourceImpl(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i778.TaskViewerRepository>(
      () => _i209.TaskViewerRepositoryImpl(
        gh<_i137.TaskViewerRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i562.GetUserTasksUseCase>(
      () => _i562.GetUserTasksUseCase(gh<_i778.TaskViewerRepository>()),
    );
    gh.lazySingleton<_i660.UpdateTaskStatusUseCase>(
      () => _i660.UpdateTaskStatusUseCase(gh<_i778.TaskViewerRepository>()),
    );
    gh.factory<_i1045.TaskViewerCubit>(
      () => _i1045.TaskViewerCubit(
        gh<_i562.GetUserTasksUseCase>(),
        gh<_i660.UpdateTaskStatusUseCase>(),
      ),
    );
    return this;
  }
}
