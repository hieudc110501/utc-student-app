import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/comment.dart';
import 'package:utc_student_app/utils/url.dart';

class CommentProvider {
  final Dio _dio = Dio();

  final StreamController<List<Comment>> _streamController =
      StreamController.broadcast();

  final StreamController<int> _countStreamController =
      StreamController.broadcast();
  //insert comment
  Future<bool> insertComment(Comment comment) async {
    try {
      final response = await _dio.post('$blogInsertComment/${comment.blogId}',
          data: comment.toJson());
      if (response.statusCode == 200) {
        if (response.data == true) {
          await getComment(comment.blogId);
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<bool> deleteComment(Comment comment) async {
    try {
      final response = await _dio.post(
          '$blogDeleteComment/${comment.commentsId}',
          data: comment.toJson());
      if (response.statusCode == 200) {
        if (response.data == true) {
          await getComment(comment.blogId);
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get all comment
  Future<List<Comment>> getComment(int blogId) async {
    try {
      final response = await _dio.get('$blogGetComment/$blogId');
      if (response.statusCode == 200) {
        List data = response.data;
        List<Comment> comments =
            data.map((e) => Comment.fromJson(jsonEncode(e))).toList();
        _streamController.sink.add(comments);
        _countStreamController.sink.add(comments.length);
        return comments;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get all image comment
  Future<List<String>> getAllImageComment(int blogId) async {
    try {
      final response = await _dio.get('$blogGetComment/$blogId');
      if (response.statusCode == 200) {
        List data = response.data;
        List<Comment> comments =
            data.map((e) => Comment.fromJson(jsonEncode(e))).toList();

        List<String> listImage = [];
        comments.forEach((element) {
          if (element.image != null) {
            listImage.add(element.image!);
          }
        });
        return listImage;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Stream<List<Comment>> all() => _streamController.stream;
  Stream<int> commentCount() => _countStreamController.stream;
}
