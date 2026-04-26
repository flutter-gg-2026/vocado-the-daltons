// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';
// import 'package:voca_do/core/navigation/routers.dart';
// import 'package:voca_do/features/task_creator/home/sub/admin_home_screen/presentation/cubit/admin_home_screen_cubit.dart';

// class AdminHomeScreenFeatureScreen extends StatelessWidget {
//   const AdminHomeScreenFeatureScreen({super.key});
//   @override
//   Widget build(BuildContext context) {
//     final _ = context.read<AdminHomeScreenCubit>();

//     return Scaffold(
//       floatingActionButton: Padding(
//         padding: const EdgeInsets.all(24),
//         child: FloatingActionButton.large(
//           onPressed: () {
//             context.push(Routes.addTaskScreen);
//           },
//           child: Icon(Icons.add),
//         ),
//       ),
//       appBar: AppBar(
//         title: const Text(
//           'Home',
//           style: TextStyle(color: Colors.white, fontSize: 20),
//         ),
//         backgroundColor: Colors.blueAccent,
//       ),
//       body: Column(mainAxisAlignment: .center, children: []),
//     );
//   }
// }
