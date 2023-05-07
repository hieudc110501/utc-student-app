import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tuition {
  final int tuitionId;
  final String studentId;
  final String type;
  final String content;
  final String term;
  final String date;
  final int payment;
  final int paid;
  Tuition({
    required this.tuitionId,
    required this.studentId,
    required this.type,
    required this.content,
    required this.term,
    required this.date,
    required this.payment,
    required this.paid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tuitionId': tuitionId,
      'studentId': studentId,
      'type': type,
      'content': content,
      'term': term,
      'date': date,
      'payment': payment,
      'paid': paid,
    };
  }

  factory Tuition.fromMap(Map<String, dynamic> map) {
    return Tuition(
      tuitionId: map['tuitionId'] as int,
      studentId: map['studentId'] as String,
      type: map['type'] as String,
      content: map['content'] as String,
      term: map['term'] as String,
      date: map['date'] as String,
      payment: map['payment'] as int,
      paid: map['paid'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tuition.fromJson(String source) => Tuition.fromMap(json.decode(source) as Map<String, dynamic>);
}
