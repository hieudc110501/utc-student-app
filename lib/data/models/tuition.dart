import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Tuition {
  final int tuitionId;
  final String studentId;
  final String? type;
  final String? content;
  final String? term;
  final String? date;
  final int? payment;
  final int? paid;
  Tuition({
    required this.tuitionId,
    required this.studentId,
    this.type,
    this.content,
    this.term,
    this.date,
    this.payment,
    this.paid,
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
      type: map['type'] != null ? map['type'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      term: map['term'] != null ? map['term'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
      payment: map['payment'] != null ? map['payment'] as int : null,
      paid: map['paid'] != null ? map['paid'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Tuition.fromJson(String source) => Tuition.fromMap(json.decode(source) as Map<String, dynamic>);
}
