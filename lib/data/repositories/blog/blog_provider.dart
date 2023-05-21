import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/utils/url.dart';

class BlogProvider {
  final Dio _dio = Dio();
  static final BlogProvider _instance = BlogProvider._internal();
  factory BlogProvider() {
    return _instance;
  }
  BlogProvider._internal();
  final StreamController<List<Blog>> _streamController =
      StreamController.broadcast();
  final StreamController<List<Blog>> _streamPersonController =
      StreamController.broadcast();
  final StreamController<List<Blog>> _streamSearchController =
      StreamController.broadcast();

  //get all blog of person
  Future<List<Blog>> getAllPersonBlog(String studentId) async {
    try {
      final response = await _dio.get('$blogGetAllPerson/$studentId');
      if (response.statusCode == 200) {
        List data = response.data;
        List<Blog> blogs =
            data.map((e) => Blog.fromJson(jsonEncode(e))).toList();
        _streamPersonController.sink.add(blogs);
        return blogs;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //get all blog search
  Future<List<Blog>> getBlogSearch(
    String studentId,
    String content,
  ) async {
    try {
      final response = await _dio.get(
        '$blogGetSearch/$studentId',
        data: {
          'content': content,
        },
      );
      if (response.statusCode == 200) {
        List data = response.data;
        List<Blog> blogs =
            data.map((e) => Blog.fromJson(jsonEncode(e))).toList();
        _streamSearchController.sink.add(blogs);
        return blogs;
      }
      return [];
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //insert blog
  Future<bool> insertBlog(String studentId, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post('$blogInsert/$studentId', data: data);

      if (response.statusCode == 200) {
        await getAllBlog(studentId);
        return true;
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
          return true;
        }
      }
      return false;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  //delete blog
  Future<bool> deleteBlog(Blog blog) async {
    try {
      final response = await _dio.post('$blogDelete/${blog.blogId}');
      if (response.statusCode == 200) {
        if (response.data == true) {
          await getAllBlog(blog.studentId);
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
      } 
      return [];
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
  Stream<List<Blog>> allPerson() => _streamPersonController.stream;
  Stream<List<Blog>> allSearch() => _streamSearchController.stream;
}
