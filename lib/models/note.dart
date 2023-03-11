import 'package:equatable/equatable.dart';

class Note extends Equatable {
  const Note({
    required this.id,
    required this.title,
    required this.content,
    required this.dateAdded,
  });

  final String id;
  final String title;
  final String content;
  final DateTime? dateAdded;

  factory Note.fromMap(Map<String, dynamic> map) => Note(
        id: map['id'],
        title: map['title'],
        content: map['content'],
        dateAdded: DateTime.tryParse(map["dateAdded"]),
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'title': title,
        'content': content,
        'dateAdded': dateAdded?.toIso8601String(),
      };

  @override
  List<Object?> get props => [
        id,
        title,
        content,
        dateAdded,
      ];

  @override
  bool get stringify => true;

  Note copyWith({
    String? id,
    String? title,
    String? content,
    DateTime? dateAdded,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      dateAdded: dateAdded ?? this.dateAdded,
    );
  }
}
