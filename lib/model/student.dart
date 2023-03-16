import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Student {
  final String firstName;
  final String lastName;
  final String gender;
  final String studentId;
  final String studentBankAccount;
  final String identityCard;
  final String birth;
  final String bornIn;
  final String tel;
  final String email;
  Student({
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.studentId,
    required this.studentBankAccount,
    required this.identityCard,
    required this.birth,
    required this.bornIn,
    required this.tel,
    required this.email,
  });
  

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'firstName': firstName,
      'lastName': lastName,
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
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      gender: map['gender'] as String,
      studentId: map['studentId'] as String,
      studentBankAccount: map['studentBankAccount'] as String,
      identityCard: map['identityCard'] as String,
      birth: map['birth'] as String,
      bornIn: map['bornIn'] as String,
      tel: map['tel'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Student.fromJson(String source) => Student.fromMap(json.decode(source) as Map<String, dynamic>);
}
