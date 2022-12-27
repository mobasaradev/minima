import 'package:flutter/material.dart';

class EmptyBackGroundImage extends StatelessWidget {
  const EmptyBackGroundImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 100),
      alignment: Alignment.topCenter,
      child: Image.asset(
        'assets/images/empty_note_background.png',
        width: 300,
      ),
    );
  }
}
