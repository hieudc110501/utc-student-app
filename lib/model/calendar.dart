// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Calendar {
  final int subjectdetailId;
  final int studentSubjectTermId;
  final DateTime startDay;
  final DateTime endDay;
  final String? lesson;
  final String? weekday;

  Calendar(
    this.subjectdetailId,
    this.studentSubjectTermId,
    this.startDay,
    this.endDay,
    this.lesson,
    this.weekday,
  );


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectdetailId': subjectdetailId,
      'studentSubjectTermId': studentSubjectTermId,
      'startDay': startDay.millisecondsSinceEpoch,
      'endDay': endDay.millisecondsSinceEpoch,
      'lesson': lesson,
      'weekday': weekday,
    };
  }

  factory Calendar.fromMap(Map<String, dynamic> map) {
    return Calendar(
      map['subjectdetailId'] as int,
      map['studentSubjectTermId'] as int,
      DateTime.fromMillisecondsSinceEpoch(map['startDay'] as int),
      DateTime.fromMillisecondsSinceEpoch(map['endDay'] as int),
      map['lesson'] != null ? map['lesson'] as String : null,
      map['weekday'] != null ? map['weekday'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Calendar.fromJson(String source) => Calendar.fromMap(json.decode(source) as Map<String, dynamic>);
}
