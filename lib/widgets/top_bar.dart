import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';

class CustomTopBar extends StatelessWidget {
  const CustomTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: NoteColor.primaryTextColor,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.account_circle,
            color: NoteColor.primaryTextColor,
          ),
          padding: const EdgeInsets.only(right: 15),
        ),
      ],
    );
  }
}
