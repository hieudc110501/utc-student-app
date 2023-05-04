// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Calendar {
  final int subjectdetailId;
  final String studentId;
  final String subjectId;
  final String subjectName;
  final String startDay;
  final String endDay;
  final int? weekDay;
  final int? lesson;
  final String? location;
  Calendar({
    required this.subjectdetailId,
    required this.studentId,
    required this.subjectId,
    required this.subjectName,
    required this.startDay,
    required this.endDay,
    this.weekDay,
    this.lesson,
    this.location,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subjectdetailId': subjectdetailId,
      'studentId': studentId,
      'subjectId': subjectId,
      'subjectName': subjectName,
      'startDay': startDay,
      'endDay': endDay,
      'weekDay': weekDay,
      'lesson': lesson,
      'location': location,
    };
  }

  factory Calendar.fromMap(Map<String, dynamic> map) {
    return Calendar(
      subjectdetailId: map['subjectdetailId'] as int,
      studentId: map['studentId'] as String,
      subjectId: map['subjectId'] as String,
      subjectName: map['subjectName'] as String,
      startDay: map['startDay'] as String,
      endDay: map['endDay'] as String,
      weekDay: map['weekDay'] != null ? map['weekDay'] as int : null,
      lesson: map['lesson'] != null ? map['lesson'] as int : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Calendar.fromJson(String source) => Calendar.fromMap(json.decode(source) as Map<String, dynamic>);
}
