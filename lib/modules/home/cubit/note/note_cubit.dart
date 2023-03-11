import 'package:counter_app/models/note.dart';
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

  /// Edit note
  void edit(Note newNote) {
    if (state.notes.isNotEmpty) {
      final notes = [...state.notes];
      final note = notes.firstWhere((e) => e.id == newNote.id);
      final index = notes.indexOf(note);
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
