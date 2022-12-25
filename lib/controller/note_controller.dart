import 'package:counter_app/models/note.dart';
import 'package:flutter/cupertino.dart';

class NoteProvider extends ChangeNotifier {
  List<Note> notes = [];
  void addNote(Note note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote() {}
  void deleteNote() {}
}
