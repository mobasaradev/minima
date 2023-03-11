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
            final date =
                "${notes[index].dateAdded?.hour}:${notes[index].dateAdded?.minute}";
            return NoteCard(
              title: notes[index].title,
              content: notes[index].content,
              time: date,
              removeOnPress: () {
                noteCubit.remove(notes[index].id);
              },
              editOnTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NewNote()),
                );
              },
            );
          },
        );
      },
    );
  }
}
