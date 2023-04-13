import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Mark {
  String moduleId;
  String moduleName;
  int moduleCredit;
  int studentModuleId;
  String studentId;
  int times;
  int timesId;
  num dqt;
  num thi;
  num tkhp;
  Mark({
    required this.moduleId,
    required this.moduleName,
    required this.moduleCredit,
    required this.studentModuleId,
    required this.studentId,
    required this.times,
    required this.timesId,
    required this.dqt,
    required this.thi,
    required this.tkhp,
  });


 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'moduleId': moduleId,
      'moduleName': moduleName,
      'moduleCredit': moduleCredit,
      'studentModuleId': studentModuleId,
      'studentId': studentId,
      'times': times,
      'timesId': timesId,
      'DQT': dqt,
      'THI': thi,
      'TKHP': tkhp,
    };
  }

  factory Mark.fromMap(Map<String, dynamic> map) {  
    return Mark(
      moduleId: map['moduleId'] as String,
      moduleName: map['moduleName'] as String,
      moduleCredit: map['moduleCredit'] as int,
      studentModuleId: map['studentModuleId'] as int,
      studentId: map['studentId'] as String,
      times: map['times'] as int,
      timesId: map['timesId'] as int,
      dqt: map['DQT'] as num,
      thi: map['THI'] as num,
      tkhp: map['TKHP'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mark.fromJson(String source) => Mark.fromMap(json.decode(source) as Map<String, dynamic>);
}
