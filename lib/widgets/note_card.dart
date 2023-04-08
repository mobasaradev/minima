import 'package:minima_note_app/utils/utils.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({
    super.key,
    required this.removeOnPress,
    required this.editOnTap,
    required this.title,
    required this.content,
    required this.time,
  });

  final VoidCallback removeOnPress;
  final GestureTapCallback editOnTap;
  final String title;
  final String content;
  final String? time;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return GestureDetector(
      onTap: editOnTap,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 7,
        ),
        padding: const EdgeInsets.only(
          top: 10,
          left: 15,
        ),
        decoration: BoxDecoration(
          color: themeData.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryIconBackGround.withOpacity(.5),
              blurRadius: 3,
              offset: const Offset(0, 1),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: AppThemes.josefinSansTextStyle.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Divider(
              height: 8,
              thickness: 1,
              endIndent: 350,
            ),
            Text(
              content,
              style: AppThemes.josefinSansTextStyle.copyWith(
                fontSize: 14,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time ?? '',
                  style: AppThemes.josefinSansTextStyle.copyWith(
                    fontSize: 14,
                  ),
                ),
                IconButton(
                  onPressed: removeOnPress,
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 20,
                    // color: AppColors.primaryIconBackGround,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
