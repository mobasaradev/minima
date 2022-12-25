import 'package:flutter/material.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Notes App',
    );
  }
}

// MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => NoteProvider(),
//         ),
//       ],
//       child: const