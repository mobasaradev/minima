import 'package:flutter/material.dart';

import 'modules/home/views/views.dart';
import 'utils/utils.dart';

class MinimaApp extends StatelessWidget {
  const MinimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      debugShowCheckedModeBanner: false,
      title: 'Minima',
      home: HomePage(),
    );
  }
}
