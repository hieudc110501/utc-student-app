import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Blog {
  final int blogId;
  final String studentId;
  final String studentName;
  final String body;
  final String? image;
  final String createdAt;
  final String? updatedAt;
  final int likeCount;
  final int commentCount;

  Blog({
    required this.blogId,
    required this.studentId,
    required this.studentName,
    required this.body,
    this.image,
    required this.createdAt,
    this.updatedAt,
    required this.likeCount,
    required this.commentCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'blogId': blogId,
      'studentId': studentId,
      'studentName': studentName,
      'body': body,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'likeCount': likeCount,
      'commentCount': commentCount,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      blogId: map['blogId'] as int,
      studentId: map['studentId'] as String,
      studentName: map['studentName'] as String,
      body: map['body'] as String,
      image: map['image'] != null ? map['image'] as String : null,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
      likeCount: map['likeCount'] as int,
      commentCount: map['commentCount'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source) as Map<String, dynamic>);
}
