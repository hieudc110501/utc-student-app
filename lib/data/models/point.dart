import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Point {
  final int pointId;
  final String studentId;
  final String? period;
  final String? term;
  final int? point;
  final String? ability;
  Point({
    required this.pointId,
    required this.studentId,
    this.period,
    this.term,
    this.point,
    this.ability,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pointId': pointId,
      'studentId': studentId,
      'period': period,
      'term': term,
      'point': point,
      'ability': ability,
    };
  }

  factory Point.fromMap(Map<String, dynamic> map) {
    return Point(
      pointId: map['pointId'] as int,
      studentId: map['studentId'] as String,
      period: map['period'] != null ? map['period'] as String : null,
      term: map['term'] != null ? map['term'] as String : null,
      point: map['point'] != null ? map['point'] as int : null,
      ability: map['ability'] != null ? map['ability'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Point.fromJson(String source) => Point.fromMap(json.decode(source) as Map<String, dynamic>);
}
