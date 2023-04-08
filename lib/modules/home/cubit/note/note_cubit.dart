import 'package:minima_note_app/models/note.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'note_state.dart';

class NoteCubit extends HydratedCubit<NoteState> {
  NoteCubit() : super(NoteState.initial());

  /// Add note
  void add(Note note) {
    final notes = [note, ...state.notes];
    emit(state.copyWith(notes: notes));
  }

  /// Remove note
  void remove(String id) {
    final notes = [...state.notes];
    notes.removeWhere((e) => e.id == id);
    emit(state.copyWith(notes: notes));
  }

  /// Update note
  void update(Note newNote) {
    if (state.notes.isNotEmpty) {
      final notes = [...state.notes];
      // firstWhere matching the id between list of notes and the note i wanna update.
      final fetchedNote =
          notes.firstWhere((currentNote) => currentNote.id == newNote.id);
      // after updating note
      final index = notes.indexOf(fetchedNote);
      notes[index] = newNote;
      emit(state.copyWith(notes: notes));
    }
  }

  @override
  NoteState? fromJson(Map<String, dynamic> json) {
    return state.copyWith(
      notes: [for (final noteJson in json['notes']) Note.fromMap(noteJson)],
    );
  }

  @override
  Map<String, dynamic>? toJson(NoteState state) {
    return {
      "notes": [for (final note in state.notes) note.toMap()]
    };
  }
}
