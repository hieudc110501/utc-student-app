import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Exam {
  final int examId;
  final String studentId;
  final String moduleId;
  final String moduleName;
  final int credit;
  final String date;
  final String lesson;
  final String type;
  final int identify;
  final String room;
  Exam({
    required this.examId,
    required this.studentId,
    required this.moduleId,
    required this.moduleName,
    required this.credit,
    required this.date,
    required this.lesson,
    required this.type,
    required this.identify,
    required this.room,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'examId': examId,
      'studentId': studentId,
      'moduleId': moduleId,
      'moduleName': moduleName,
      'credit': credit,
      'date': date,
      'lesson': lesson,
      'type': type,
      'identify': identify,
      'room': room,
    };
  }

  factory Exam.fromMap(Map<String, dynamic> map) {
    return Exam(
      examId: map['examId'] as int,
      studentId: map['studentId'] as String,
      moduleId: map['moduleId'] as String,
      moduleName: map['moduleName'] as String,
      credit: map['credit'] as int,
      date: map['date'] as String,
      lesson: map['lesson'] as String,
      type: map['type'] as String,
      identify: map['identify'] as int,
      room: map['room'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Exam.fromJson(String source) => Exam.fromMap(json.decode(source) as Map<String, dynamic>);
}
