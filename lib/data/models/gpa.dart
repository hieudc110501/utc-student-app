import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class GPA {
  final int gpaId;
  final String term;
  final num gpa10;
  final num gpa4;
  final int credit;
  GPA({
    required this.gpaId,
    required this.term,
    required this.gpa10,
    required this.gpa4,
    required this.credit,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'gpaId': gpaId,
      'term': term,
      'gpa10': gpa10,
      'gpa4': gpa4,
      'credit': credit,
    };
  }

  factory GPA.fromMap(Map<String, dynamic> map) {
    return GPA(
      gpaId: map['gpaId'] as int,
      term: map['term'] as String,
      gpa10: map['gpa10'] as num,
      gpa4: map['gpa4'] as num,
      credit: map['credit'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory GPA.fromJson(String source) => GPA.fromMap(json.decode(source) as Map<String, dynamic>);
}
