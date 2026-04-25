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

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initProfile({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i217.BaseProfileRemoteDataSource>(
      () => _i217.ProfileRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i608.ProfileRepositoryDomain>(
      () =>
          _i385.ProfileRepositoryData(gh<_i217.BaseProfileRemoteDataSource>()),
    );
    gh.lazySingleton<_i455.ProfileUseCase>(
      () => _i455.ProfileUseCase(gh<_i608.ProfileRepositoryDomain>()),
    );
    gh.factory<_i750.ProfileCubit>(
      () => _i750.ProfileCubit(gh<_i455.ProfileUseCase>()),
    );
    return this;
  }
}
