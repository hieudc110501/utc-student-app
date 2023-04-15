// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Calendar {
  final String termId;
  final num studentSubjectTermId;
  final num subjectId;
  final num subjectdetailId;
  final String startDay;
  final String endDay;
  final DateTime? lesson;
  final DateTime? weekday;
  final String subjectName;

  Calendar(
    this.termId,
    this.studentSubjectTermId,
    this.subjectId,
    this.subjectdetailId,
    this.startDay,
    this.endDay,
    this.lesson,
    this.weekday,
    this.subjectName,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'termId': termId,
      'studentSubjectTermId': studentSubjectTermId,
      'subjectId': subjectId,
      'subjectdetailId': subjectdetailId,
      'startDay': startDay,
      'endDay': endDay,
      'lesson': lesson?.millisecondsSinceEpoch,
      'weekday': weekday?.millisecondsSinceEpoch,
      'subjectName': subjectName,
    };
  }

  factory Calendar.fromMap(Map<String, dynamic> map) {
    return Calendar(
      map['termId'] as String,
      map['studentSubjectTermId'] as num,
      map['subjectId'] as num,
      map['subjectdetailId'] as num,
      map['startDay'] as String,
      map['endDay'] as String,
      map['lesson'] != null ? DateTime.fromMillisecondsSinceEpoch(map['lesson'] as int) : null,
      map['weekday'] != null ? DateTime.fromMillisecondsSinceEpoch(map['weekday'] as int) : null,
      map['subjectName'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Calendar.fromJson(String source) => Calendar.fromMap(json.decode(source) as Map<String, dynamic>);
}
