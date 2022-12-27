import 'package:counter_app/controller/note_controller.dart';
import 'package:counter_app/models/models.dart';
import 'package:counter_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({super.key, required this.isUpdate, this.note});
  final bool isUpdate;
  final Note? note;

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
      userid: "dev",
      title: titleController.text,
      content: noteController.text,
      dateadded: DateTime.now(),
    );

    context.read<NoteProvider>().addNote(newNote);
    // listen: false for context.read
    // listen: true for context.watch
    //Provider.of<NoteProvider>(context, listen: false).addNote(newNote);
    Navigator.pop(context);
  }

  void updateNote() {
    widget.note!.title = titleController.text;
    widget.note!.content = noteController.text;
    Provider.of<NoteProvider>(
      context,
      listen: false,
    ).updateNote(widget.note!);
    Navigator.pop(context);
  }

  //for update note
  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      titleController.text = widget.note!.title;
      noteController.text = widget.note!.content;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: NoteColor.secondaryBackGroundColor,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: NoteColor.secondaryTextColor,
        ),
        backgroundColor: NoteColor.secondaryBackGroundColor,
        shadowColor: NoteColor.secondaryBackGroundColor,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.keyboard_voice,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.image,
            ),
          ),
          IconButton(
            onPressed: () {
              //is update note
              if (widget.isUpdate) {
                updateNote();
              } else {
                addNewNote();
              }
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
                autofocus: (widget.isUpdate == true) ? false : true,
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
