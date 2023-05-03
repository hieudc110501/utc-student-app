import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class News {
  final int newsId;
  final String title;
  final String date;
  final String content;
  News({
    required this.newsId,
    required this.title,
    required this.date,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'newsId': newsId,
      'title': title,
      'date': date,
      'content': content,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    return News(
      newsId: map['newsId'] as int,
      title: map['title'] as String,
      date: map['date'] as String,
      content: map['content'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source) as Map<String, dynamic>);
}
