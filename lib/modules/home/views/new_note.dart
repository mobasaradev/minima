import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:minima_note_app/models/note.dart';
import 'package:minima_note_app/modules/home/cubit/note/note_cubit.dart';
import 'package:uuid/uuid.dart';

class NewNote extends StatefulWidget {
  const NewNote({super.key, this.note});
  final Note? note;

  @override
  State<NewNote> createState() => _NewNoteState();
}

class _NewNoteState extends State<NewNote> {
  final _titleTextEditingController = TextEditingController();
  final _contentTextEditingController = TextEditingController();
  // focus on note after completing title, press enter btn
  final FocusNode _noteFocus = FocusNode();

  @override
  void initState() {
    super.initState();
    if (widget.note != null) {
      _titleTextEditingController.text = widget.note?.title ?? "";
      _contentTextEditingController.text = widget.note?.content ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    final noteCubit = context.read<NoteCubit>();
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 25,
        title: TextField(
          controller: _titleTextEditingController,
          autofocus: (widget.note != null) ? false : true,
          onSubmitted: (value) {
            if (value != "") {
              _noteFocus.requestFocus();
            }
          },
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          decoration: const InputDecoration(
            hintText: "Give me a name",
            border: InputBorder.none,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              final note = Note(
                id: const Uuid().v4(),
                title: _titleTextEditingController.text,
                content: _contentTextEditingController.text,
                dateAdded: DateTime.now(),
              );
              widget.note == null
                  ? noteCubit.add(note)
                  : noteCubit.update(note.copyWith(id: widget.note?.id));
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/images/add_notes.png",
              ),
              opacity: .2,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: TextField(
                  controller: _contentTextEditingController,
                  focusNode: _noteFocus,
                  maxLines: null,
                  style: const TextStyle(
                    fontSize: 16,
                  ),
                  decoration: const InputDecoration(
                    hintText: "Hi! What's going on...",
                    border: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
