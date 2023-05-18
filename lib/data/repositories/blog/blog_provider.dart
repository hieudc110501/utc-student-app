import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/utils/url.dart';

class BlogProvider {
  final Dio _dio = Dio();

  final StreamController<List<Blog>> _streamController =
      StreamController.broadcast();

  //insert blog
  Future<bool> insertBlog(String studentId, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('$blogInsert/$studentId', data: data);
      if (response.statusCode == 200) {
        if (response.data == true) {
          getAllBlog(studentId);
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //update blog
  Future<bool> updateBlog(Blog blog) async {
    try {
      final response = await _dio.post(
        '$blogUpdate/${blog.blogId}',
        data: blog.toJson(),
      );
      if (response.statusCode == 200) {
        if (response.data == true) {
          getAllBlog(blog.studentId);
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get all blog
  Future<List<Blog>> getAllBlog(String studentId) async {
    try {
      final response = await _dio.get('$blogGetAll/$studentId');
      if (response.statusCode == 200) {
        List data = response.data;
        List<Blog> blogs =
            data.map((e) => Blog.fromJson(jsonEncode(e))).toList();
        _streamController.sink.add(blogs);
        return blogs;
      } else {
        throw Exception('Fail to load Point data');
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //insert like
  Future<bool> insertLike(int blogId, String studentId) async {
    try {
      final response = await _dio.post('$blogInsertLike/$blogId', data: {
        'studentId': studentId,
      });
      if (response.statusCode == 200) {
        if (response.data == true) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //delete like
  Future<bool> deleteLike(int blogId, String studentId) async {
    try {
      final response = await _dio.post('$blogDeleteLike/$blogId', data: {
        'studentId': studentId,
      });
      if (response.statusCode == 200) {
        if (response.data == true) {
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //stearm blog
  Stream<List<Blog>> all() => _streamController.stream;
}
