part of 'note_cubit.dart';

enum NoteStatus { initial, loading, error }

class NoteState extends Equatable {
  const NoteState({
    required this.notes,
    required this.statusMsg,
    required this.status,
  });

  factory NoteState.initial() => const NoteState(
        status: NoteStatus.initial,
        notes: [],
        statusMsg: '',
      );

  final List<Note> notes;
  final String statusMsg;
  final NoteStatus status;

  @override
  List<Object> get props => [notes, statusMsg, status];

  NoteState copyWith({
    List<Note>? notes,
    String? statusMsg,
    NoteStatus? status,
  }) {
    return NoteState(
      notes: notes ?? this.notes,
      statusMsg: statusMsg ?? this.statusMsg,
      status: status ?? this.status,
    );
  }
}

