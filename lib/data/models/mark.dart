import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Mark {
  final int studentModuleId;
  final int studentTermId;
  final String moduleId;
  final String moduleName;
  final int moduleCredit;
  final int times;
  final String? evaluate;
  final int timesId;
  final num? dqt;
  final num? thi;
  final num? tkhp;
  final String termId;
  Mark({
    required this.studentModuleId,
    required this.studentTermId,
    required this.moduleId,
    required this.moduleName,
    required this.moduleCredit,
    required this.times,
    this.evaluate,
    required this.timesId,
    this.dqt,
    this.thi,
    this.tkhp,
    required this.termId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentModuleId': studentModuleId,
      'studentTermId': studentTermId,
      'moduleId': moduleId,
      'moduleName': moduleName,
      'moduleCredit': moduleCredit,
      'times': times,
      'evaluate': evaluate,
      'timesId': timesId,
      'DQT': dqt,
      'THI': thi,
      'TKHP': tkhp,
      'termId': termId,
    };
  }

  factory Mark.fromMap(Map<String, dynamic> map) {
    return Mark(
      studentModuleId: map['studentModuleId'] as int,
      studentTermId: map['studentTermId'] as int,
      moduleId: map['moduleId'] as String,
      moduleName: map['moduleName'] as String,
      moduleCredit: map['moduleCredit'] as int,
      times: map['times'] as int,
      evaluate: map['evaluate'] != null ? map['evaluate'] as String : null,
      timesId: map['timesId'] as int,
      dqt: map['DQT'] != null ? map['DQT'] as num : null,
      thi: map['THI'] != null ? map['THI'] as num : null,
      tkhp: map['TKHP'] != null ? map['TKHP'] as num : null,
      termId: map['termId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mark.fromJson(String source) => Mark.fromMap(json.decode(source) as Map<String, dynamic>);
}
