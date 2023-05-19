import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:utc_student_app/data/enum/blog_image.dart';

class StorageProvider {
  //upload image to firebase
  Future<String?> uploadImageToFirebase(
    File? image,
    String studentId,
    BlogImageType imageType,
  ) async {
    if (image != null) {
      try {
        String fileName =
            studentId + DateTime.now().millisecondsSinceEpoch.toString();
        UploadTask uploadTask = FirebaseStorage.instance
            .ref('${imageType.name}/$fileName')
            .putFile(image);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        String imageUrl = await snapshot.ref.getDownloadURL();
        return imageUrl;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return null;
  }

  //delete image from firebase
  Future<void> deleteImageFromFirebase(String? imageUrl) async {
    if (imageUrl != null) {
      Reference storageReference =
          FirebaseStorage.instance.refFromURL(imageUrl);
      try {
        await storageReference.delete();
      } catch (e) {
        throw Exception(e);
      }
    }
  }

  //delete all blog image from firebase
  Future<void> deleteAllBlogImage(List<String> images) async {
    for (String image in images) {
      Reference storageReference = FirebaseStorage.instance.refFromURL(image);
      try {
        await storageReference.delete();
      } catch (e) {
        throw Exception(e);
      }
    }
  }
}
