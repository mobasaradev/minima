import 'package:flutter/material.dart';
import 'package:minima_note_app/utils/utils.dart';

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
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: themeData.primaryColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.grey.withOpacity(.5),
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
              style: AppThemes.darkTheme.textTheme.titleMedium?.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: AppColors.white,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const Divider(
              height: 12,
              color: AppColors.white,
              thickness: 1,
              endIndent: 300,
            ),
            Text(
              content,
              style: AppThemes.darkTheme.textTheme.titleMedium?.copyWith(
                fontSize: 16,
                color: AppColors.white,
                fontWeight: FontWeight.w600,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  time ?? '',
                  style: AppThemes.darkTheme.textTheme.titleMedium?.copyWith(
                    fontSize: 14,
                    color: AppColors.white,
                  ),
                ),
                GestureDetector(
                  onTap: removeOnPress,
                  child: const Icon(
                    Icons.delete_rounded,
                    size: 20,
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
