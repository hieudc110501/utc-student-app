import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  
  final String studentId;
  final String studentName;
  final String bankAccount;
  final String identity;
  final String birth;
  final String tel;
  final String bornIn;
  final String email;
  final String gender;
  Student({
    required this.studentId,
    required this.studentName,
    required this.bankAccount,
    required this.identity,
    required this.birth,
    required this.tel,
    required this.bornIn,
    required this.email,
    required this.gender,
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
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      studentId: map['studentId'] as String,
      studentName: map['studentName'] as String,
      bankAccount: map['bankAccount'] as String,
      identity: map['identity'] as String,
      birth: map['birth'] as String,
      tel: map['tel'] as String,
      bornIn: map['bornIn'] as String,
      email: map['email'] as String,
      gender: map['gender'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
