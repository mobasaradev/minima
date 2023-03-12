import 'package:counter_app/models/note.dart';
import 'package:counter_app/modules/home/cubit/note/note_cubit.dart';
import 'package:counter_app/modules/home/views/new_note.dart';
import 'package:counter_app/widgets/note_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllNotes extends StatelessWidget {
  const AllNotes({super.key});

  @override
  Widget build(BuildContext context) {
    final noteCubit = context.read<NoteCubit>();
    return BlocSelector<NoteCubit, NoteState, List<Note>>(
      selector: (state) => state.notes,
      builder: (context, notes) {
        return ListView.builder(
          itemCount: notes.length,
          itemBuilder: (context, index) {
            final note = notes[index];
            final date = "${note.dateAdded?.hour}:${note.dateAdded?.minute}";
            return NoteCard(
              title: note.title,
              content: note.content,
              time: date,
              removeOnPress: () {
                noteCubit.remove(note.id);
              },
              editOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => NewNote(note: note),
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}