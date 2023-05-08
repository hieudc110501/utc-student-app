import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Mark {
  final int markId;
  final int studentTermId;
  final String moduleId;
  final String moduleName;
  final int moduleCredit;
  final int? times;
  final String? evaluate;
  final int markDetailId;
  final num? dqt;
  final num? thi;
  final num? tkhp;
  final String termId;
  Mark({
    required this.markId,
    required this.studentTermId,
    required this.moduleId,
    required this.moduleName,
    required this.moduleCredit,
    this.times,
    this.evaluate,
    required this.markDetailId,
    this.dqt,
    this.thi,
    this.tkhp,
    required this.termId,
  });

  

  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'markId': markId,
      'studentTermId': studentTermId,
      'moduleId': moduleId,
      'moduleName': moduleName,
      'moduleCredit': moduleCredit,
      'times': times,
      'evaluate': evaluate,
      'markDetailId': markDetailId,
      'dqt': dqt,
      'thi': thi,
      'tkhp': tkhp,
      'termId': termId,
    };
  }

  factory Mark.fromMap(Map<String, dynamic> map) {
    return Mark(
      markId: map['markId'] as int,
      studentTermId: map['studentTermId'] as int,
      moduleId: map['moduleId'] as String,
      moduleName: map['moduleName'] as String,
      moduleCredit: map['moduleCredit'] as int,
      times: map['times'] != null ? map['times'] as int : null,
      evaluate: map['evaluate'] != null ? map['evaluate'] as String : null,
      markDetailId: map['markDetailId'] as int,
      dqt: map['dqt'] != null ? map['dqt'] as num : null,
      thi: map['thi'] != null ? map['thi'] as num : null,
      tkhp: map['tkhp'] != null ? map['tkhp'] as num : null,
      termId: map['termId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Mark.fromJson(String source) => Mark.fromMap(json.decode(source) as Map<String, dynamic>);
}
