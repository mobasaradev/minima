import 'package:counter_app/modules/home/views/home_page.dart';
import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';

class MinimaNoteApp extends StatelessWidget {
  const MinimaNoteApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Minima Note',
      home: HomePage(),
    );
  }
}
