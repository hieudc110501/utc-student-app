import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class Comment {
  final int commentsId;
  final int blogId;
  final String studentId;
  final String? studentName;
  final String? content;
  final String? image;
  final String createdAt;
  final String? updatedAt;
  Comment({
    required this.commentsId,
    required this.blogId,
    required this.studentId,
    this.studentName,
    this.content,
    this.image,
    required this.createdAt,
    this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'commentsId': commentsId,
      'blogId': blogId,
      'studentId': studentId,
      'studentName': studentName,
      'content': content,
      'image': image,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      commentsId: map['commentsId'] as int,
      blogId: map['blogId'] as int,
      studentId: map['studentId'] as String,
      studentName: map['studentName'] != null ? map['studentName'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      createdAt: map['createdAt'] as String,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) => Comment.fromMap(json.decode(source) as Map<String, dynamic>);
}
