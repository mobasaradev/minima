import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';

class NoteAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NoteAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(100);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: NoteColor.transparentColor,
      child: const Padding(
        padding: EdgeInsets.symmetric(
          vertical: 30,
        ),
        child: Text(
          "My Notes",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w500,
            color: NoteColor.primaryTextColor,
          ),
        ),
      ),
    );
  }
}
