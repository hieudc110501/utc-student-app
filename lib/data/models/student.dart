import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  
  final String studentId;
  final String studentName;
  final String? bankAccount;
  final String? identity;
  final String? birth;
  final String? tel;
  final String? bornIn;
  final String? email;
  final String? gender;
  final String updateAt;
  Student({
    required this.studentId,
    required this.studentName,
    this.bankAccount,
    this.identity,
    this.birth,
    this.tel,
    this.bornIn,
    this.email,
    this.gender,
    required this.updateAt,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'studentId': studentId,
      'studentName': studentName,
      'bankAccount': bankAccount,
      'identity': identity,
      'birth': birth,
      'tel': tel,
      'bornIn': bornIn,
      'email': email,
      'gender': gender,
      'updateAt': updateAt,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      studentId: map['studentId'] as String,
      studentName: map['studentName'] as String,
      bankAccount: map['bankAccount'] != null ? map['bankAccount'] as String : null,
      identity: map['identity'] != null ? map['identity'] as String : null,
      birth: map['birth'] != null ? map['birth'] as String : null,
      tel: map['tel'] != null ? map['tel'] as String : null,
      bornIn: map['bornIn'] != null ? map['bornIn'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
      gender: map['gender'] != null ? map['gender'] as String : null,
      updateAt: map['updateAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
