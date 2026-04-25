import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/core/extensions/font_extensions.dart';
import 'package:voca_do/core/widgets/audio_loading_widget.dart';
import 'package:voca_do/features/task_creator/home/sub/audio_feature/presentation/cubit/audio_feature_cubit.dart';
import 'package:voca_do/features/task_creator/home/sub/audio_feature/presentation/cubit/audio_feature_state.dart';

class AudioFeatureFeatureWidget extends StatelessWidget {
  const AudioFeatureFeatureWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<AudioFeatureCubit>();

    return GestureDetector(
      onLongPress: () async {
        await cubit.startRecordingMethod();
      },
      onLongPressUp: () async {
        await cubit.stopRecordingMethod();
      },
      child: BlocBuilder<AudioFeatureCubit, AudioFeatureState>(
        builder: (context, state) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10.sizeSW(min: 100, max: 200),
                width: 10.sizeSW(min: 100, max: 200),
                decoration: BoxDecoration(
                  color: state is AudioFeatureRecordingState
                      ? state.isRecording
                            ? Colors.redAccent
                            : Colors.blueAccent
                      : Colors.blueAccent,
                  shape: BoxShape.circle,
                ),
                child: Pulse(
                  animate:
                      state is AudioFeatureRecordingState && state.isRecording,
                  infinite: true,
                  child: const Icon(Icons.mic, color: Colors.white, size: 32),
                ),
              ),
              const SizedBox(height: 32),

              if (state is AudioFeatureTranscribingState)
                const AudioLoadingWidget(),

              if (state is AudioFeatureTranscriptionSuccessState)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    state.text,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),

              if (state is AudioFeatureErrorState)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Text(
                    state.message,
                    style: const TextStyle(color: Colors.red),
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
