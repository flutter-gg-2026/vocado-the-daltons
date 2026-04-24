import 'dart:io';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:record/record.dart';
import 'package:uuid/v7.dart';
import 'package:voca_do/core/errors/failure.dart';

@lazySingleton
class AudioService {
  final _record = AudioRecorder();

  //! Permission
  void requestPermission() async {
    final hasPermission = await _record.hasPermission(request: true);
    if (!hasPermission) {
      throw PermissionFailure("Permission denied");
    }
  }

  //---------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------

  //! Start recording

  Future<void> startRecording() async {
    // To store the audio files
    final Directory tempDir = await getTemporaryDirectory();
    // Random path name for the files
    final name = UuidV7().generate();

    await _record.start(
      const RecordConfig(),
      path: '${tempDir.path}/$name.m4a',
    );
  }

  //---------------------------------------------------------------------------------
  //---------------------------------------------------------------------------------

  //! Stop recording

  Future<String?> stopRecording() async {
    final path = await _record.stop();
    return path;
  }
}
