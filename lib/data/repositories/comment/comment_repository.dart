import 'package:utc_student_app/data/models/comment.dart';
import 'package:utc_student_app/data/repositories/comment/comment_provider.dart';

class CommentRepository {
  final _provider = CommentProvider();
  
  Future<bool> insertComment({
    required Comment comment,
  }) {
    return _provider.insertComment(comment);
  }

  Future<List<Comment>> getComment({
    required int blogId,
  }) {
    return _provider.getComment(blogId);
  }

  Future<bool> deleteComment({
    required Comment comment,
  }) {
    return _provider.deleteComment(comment);
  }

  Future<List<String>> getAllImageComment({
    required int blogId,
  }) {
    return _provider.getAllImageComment(blogId);
  }

  Stream<List<Comment>> all() => _provider.all();
  Stream<int> commentCount() => _provider.commentCount();
}
