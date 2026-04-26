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
import 'package:voca_do/features/task_creator/team/data/datasources/team_remote_data_source.dart'
    as _i415;
import 'package:voca_do/features/task_creator/team/data/repositories/team_repository_data.dart'
    as _i1012;
import 'package:voca_do/features/task_creator/team/domain/repositories/team_repository_domain.dart'
    as _i549;
import 'package:voca_do/features/task_creator/team/domain/use_cases/team_use_case.dart'
    as _i13;
import 'package:voca_do/features/task_creator/team/presentation/cubit/team_cubit.dart'
    as _i607;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTeam({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i415.BaseTeamRemoteDataSource>(
      () => _i415.TeamRemoteDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i549.TeamRepositoryDomain>(
      () => _i1012.TeamRepositoryData(gh<_i415.BaseTeamRemoteDataSource>()),
    );
    gh.lazySingleton<_i13.TeamUseCase>(
      () => _i13.TeamUseCase(gh<_i549.TeamRepositoryDomain>()),
    );
    gh.factory<_i607.TeamCubit>(() => _i607.TeamCubit(gh<_i13.TeamUseCase>()));
    return this;
  }
}
