import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:voca_do/features/admin_home_screen/presentation/cubit/admin_home_screen_cubit.dart';
import 'package:voca_do/features/sub/audio_feature/presentation/pages/audio_feature_feature_widget.dart';

class AdminHomeScreenFeatureScreen extends StatelessWidget {
  const AdminHomeScreenFeatureScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final _ = context.read<AdminHomeScreenCubit>();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Audio Transcription',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        mainAxisAlignment: .center,
        children: [Center(child: AudioFeatureFeatureWidget())],
      ),
    );
  }
}
