class Note {
  Note({
    required this.id,
    required this.userid,
    required this.title,
    required this.content,
    this.dateadded,
  });

  final String id;
  final String userid;
  String title;
  String content;
  final DateTime? dateadded;

  factory Note.fromMap(Map<String, dynamic> map) => Note(
        id: map['id'],
        userid: map['userid'],
        title: map['title'],
        content: map['content'],
        dateadded: DateTime.tryParse(map["dateadded"]),
      );
  Map<String, dynamic> toMap() => {
        'id': id,
        'userid': userid,
        'title': title,
        'content': content,
        'dateadded': dateadded!.toIso8601String(),
      };
}
