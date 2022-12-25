import 'package:counter_app/controller/note_controller.dart';
import 'package:counter_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteApp extends StatelessWidget {
  const NoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NoteProvider(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Notes App',
        home: HomePage(),
      ),
    );
  }
}
