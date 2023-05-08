// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Schedule {
  final int scheduleId;
  final String studentId;
  final String moduleId;
  final String moduleName;
  final String startDay;
  final String endDay;
  final int? weekDay;
  final int? lesson;
  final String? location;
  Schedule({
    required this.scheduleId,
    required this.studentId,
    required this.moduleId,
    required this.moduleName,
    required this.startDay,
    required this.endDay,
    this.weekDay,
    this.lesson,
    this.location,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'scheduleId': scheduleId,
      'studentId': studentId,
      'moduleId': moduleId,
      'moduleName': moduleName,
      'startDay': startDay,
      'endDay': endDay,
      'weekDay': weekDay,
      'lesson': lesson,
      'location': location,
    };
  }

  factory Schedule.fromMap(Map<String, dynamic> map) {
    return Schedule(
      scheduleId: map['scheduleId'] as int,
      studentId: map['studentId'] as String,
      moduleId: map['moduleId'] as String,
      moduleName: map['moduleName'] as String,
      startDay: map['startDay'] as String,
      endDay: map['endDay'] as String,
      weekDay: map['weekDay'] != null ? map['weekDay'] as int : null,
      lesson: map['lesson'] != null ? map['lesson'] as int : null,
      location: map['location'] != null ? map['location'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Schedule.fromJson(String source) => Schedule.fromMap(json.decode(source) as Map<String, dynamic>);
}
