import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  final String fullName;
  final String gender;
  final String studentId;
  final String studentBankAccount;
  final String identityCard;
  final String birth;
  final String bornIn;
  final String tel;
  final String email;

  Student(
    this.fullName,
    this.gender,
    this.studentId,
    this.studentBankAccount,
    this.identityCard,
    this.birth,
    this.bornIn,
    this.tel,
    this.email,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'gender': gender,
      'studentId': studentId,
      'studentBankAccount': studentBankAccount,
      'identityCard': identityCard,
      'birth': birth,
      'bornIn': bornIn,
      'tel': tel,
      'email': email,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      map['fullName'] as String,
      map['gender'] as String,
      map['studentId'] as String,
      map['studentBankAccount'] as String,
      map['identityCard'] as String,
      map['birth'] as String,
      map['bornIn'] as String,
      map['tel'] as String,
      map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
