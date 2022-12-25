import 'package:counter_app/controller/note_controller.dart';
import 'package:counter_app/models/note.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key});

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  final titleController = TextEditingController();
  final noteController = TextEditingController();
  // focus on note after completing title, press enter btn
  FocusNode noteFocus = FocusNode();

  // save the notes by click the save btn
  void addNewNote() {
    Note newNote = Note(
      id: const Uuid().v1(),
      userid: "mac",
      title: titleController.text,
      content: noteController.text,
      dateadded: DateTime.now(),
    );
    Provider.of<NoteProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {
              addNewNote();
            },
            icon: const Icon(
              Icons.check,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 10,
          ),
          child: Column(
            children: [
              // title
              TextField(
                controller: titleController,
                autofocus: true,
                onSubmitted: (value) {
                  if (value != "") {
                    noteFocus.requestFocus();
                  }
                },
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87),
                decoration: const InputDecoration(
                  hintText: "Title",
                  border: InputBorder.none,
                ),
              ),

              // note
              Expanded(
                child: TextField(
                  controller: noteController,
                  focusNode: noteFocus,
                  maxLines: null,
                  style: TextStyle(fontSize: 20, color: Colors.grey[500]),
                  decoration: const InputDecoration(
                    hintText: "Note",
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
