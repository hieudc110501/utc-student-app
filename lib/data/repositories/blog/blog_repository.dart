import 'package:utc_student_app/data/models/blog.dart';
import 'package:utc_student_app/data/repositories/blog/blog_provider.dart';

class BlogRepository {
  final _provider = BlogProvider();


  Future<bool> insertBlog({
    required String studentId,
    required Map<String, dynamic> data,
  }) {
    return _provider.insertBlog(studentId, data);
  }

  Future<bool> updateBlog({
    required Blog blog,
  }) {
    return _provider.updateBlog(blog);
  }

  Future<bool> deleteBlog({
    required Blog blog,
  }) {
    return _provider.deleteBlog(blog);
  }

   Future<List<Blog>> getAllPersonBlog({
    required String studentId,
  }) {
    return _provider.getAllPersonBlog(studentId);
  }

  Future<List<Blog>> getAllBlog({
    required String studentId,
  }) {
    return _provider.getAllBlog(studentId);
  }

  Future<bool> insertLike({
    required int blogId,
    required String studentId,
  }) {
    return _provider.insertLike(blogId, studentId);
  }

  Future<bool> deleteLike({
    required int blogId,
    required String studentId,
  }) {
    return _provider.deleteLike(blogId, studentId);
  }

  Stream<List<Blog>> all() => _provider.all();
}