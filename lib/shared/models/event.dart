import 'dart:convert';

class Event {
  final String date;
  final String time;
  final String title;
  final String content;
  final String by;
  final String link;

  Event({
    required this.date,
    required this.time,
    required this.title,
    required this.content,
    required this.by,
    required this.link,
  });

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'time': time,
      'title': title,
      'content': content,
      'by': by,
      'link': link,
    };
  }

  factory Event.fromMap(Map<String, dynamic> map) {
    return Event(
      date: map['date'] ?? '',
      time: map['time'] ?? '',
      title: map['title'] ?? '',
      content: map['content'] ?? '',
      by: map['by'] ?? '',
      link: map['link'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Event.fromJson(String source) => Event.fromMap(json.decode(source));
}
