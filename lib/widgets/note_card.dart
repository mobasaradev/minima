import 'package:counter_app/controller/note_controller.dart';
import 'package:counter_app/models/models.dart';
import 'package:counter_app/pages/pages.dart';
import 'package:counter_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({super.key});

  @override
  Widget build(BuildContext context) {
    NoteProvider noteProvider = Provider.of<NoteProvider>(context);
    return ListView.builder(
      itemCount: noteProvider.notes.length,
      itemBuilder: (context, index) {
        Note currentNote = noteProvider.notes[index];

        return GestureDetector(
          //update
          onTap: () {
            Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (context) => AddNewNote(
                  isUpdate: true,
                  note: currentNote,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: NoteColor.secondaryBackGroundColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentNote.title,
                  style: const TextStyle(
                    color: NoteColor.primaryTextColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  currentNote.content,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(
                    fontSize: 20,
                    color: NoteColor.secondaryTextColor,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "12:00 pm",
                      style: TextStyle(
                        color: NoteColor.primaryTextColor,
                        fontSize: 16,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        noteProvider.deleteNote(currentNote);
                      },
                      icon: const Icon(Icons.delete_rounded),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
