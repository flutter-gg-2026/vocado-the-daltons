import 'package:multiple_result/multiple_result.dart';
import 'package:voca_do/core/errors/failure.dart';
import 'package:voca_do/features/task_creator/sub/audio_feature/domain/entities/audio_feature_entity.dart';

abstract class AudioFeatureRepositoryDomain {
  Future<Result<bool, Failure>> startRecording();
  Future<Result<AudioFeatureEntity, Failure>> stopRecording();
  Future<Result<String, Failure>> transcribeAudio(String filePath);
}
