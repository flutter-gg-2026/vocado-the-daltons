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
import 'package:voca_do/features/task_creator/sub/audio_feature/data/datasources/audio_feature_remote_data_source.dart'
    as _i293;
import 'package:voca_do/features/task_creator/sub/audio_feature/data/repositories/audio_feature_repository_data.dart'
    as _i379;
import 'package:voca_do/features/task_creator/sub/audio_feature/domain/repositories/audio_feature_repository_domain.dart'
    as _i361;
import 'package:voca_do/features/task_creator/sub/audio_feature/domain/use_cases/audio_feature_use_case.dart'
    as _i61;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initAudioFeatureSub({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i293.BaseAudioFeatureRemoteDataSource>(
      () => _i293.AudioFeatureRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i361.Dio>(),
        gh<_i745.AudioService>(),
      ),
    );
    gh.lazySingleton<_i361.AudioFeatureRepositoryDomain>(
      () => _i379.AudioFeatureRepositoryData(
        gh<_i293.BaseAudioFeatureRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i61.AudioFeatureUseCase>(
      () => _i61.AudioFeatureUseCase(gh<_i361.AudioFeatureRepositoryDomain>()),
    );
    return this;
  }
}
