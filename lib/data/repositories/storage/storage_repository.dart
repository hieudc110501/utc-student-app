import 'dart:io';

import 'package:utc_student_app/data/enum/blog_image.dart';
import 'package:utc_student_app/data/repositories/storage/storage_provider.dart';

class StorageRepository {
  final _provider = StorageProvider();

  // upload
  Future uploadImageToFirebase({
    required File? image,
    required String studentId,
    required BlogImageType imageType,
  }) =>
      _provider.uploadImageToFirebase(image, studentId, imageType);

  // delete
  Future deleteImageFromFirebase({required String? imageUrl}) =>
      _provider.deleteImageFromFirebase(imageUrl);

  // delete
  Future deleteAllBlogImage({required List<String> images}) =>
      _provider.deleteAllBlogImage(images);
}
