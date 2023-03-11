import 'package:counter_app/utils/utils.dart';
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
          color: AppColors.secondaryBackGround,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: AppColors.secondaryTextDark,
              blurRadius: 5,
              offset: Offset(0, 2),
            )
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
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
              style: const TextStyle(
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
                  style: const TextStyle(
                    fontSize: 12,
                  ),
                ),
                IconButton(
                  onPressed: removeOnPress,
                  icon: const Icon(
                    Icons.delete_rounded,
                    size: 18,
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

// class NoteList extends StatelessWidget {
//   const NoteList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     NoteProvider noteProvider = Provider.of<NoteProvider>(context);
//     return ListView.builder(
//       itemCount: noteProvider.notes.length,
//       itemBuilder: (context, index) {
//         Note currentNote = noteProvider.notes[index];

//         return GestureDetector(
//           //update
//           onTap: () {
//             Navigator.push(
//               context,
//               CupertinoPageRoute(
//                 builder: (context) => AddNewNote(
//                   isUpdate: true,
//                   note: currentNote,
//                 ),
//               ),
//             );
//           },
//           child: Container(
//             margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
//             padding: const EdgeInsets.only(
//               top: 10,
//               left: 10,
//               right: 10,
//               bottom: 0,
//             ),
//             decoration: BoxDecoration(
//               color: NoteColor.secondaryBackGroundColor,
//               borderRadius: BorderRadius.circular(6),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   currentNote.title,
//                   style: const TextStyle(
//                     color: NoteColor.primaryTextColor,
//                     fontSize: 20,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 const SizedBox(height: 8),
//                 Text(
//                   currentNote.content,
//                   style: const TextStyle(
//                     fontSize: 18,
//                     color: NoteColor.secondaryTextColor,
//                   ),
//                   maxLines: 2,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       "12:00 pm",
//                       style: TextStyle(
//                         color: NoteColor.primaryTextColor,
//                         fontSize: 16,
//                       ),
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         noteProvider.deleteNote(currentNote);
//                       },
//                       icon: const Icon(Icons.delete_rounded),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

