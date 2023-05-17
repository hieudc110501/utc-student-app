// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:utc_student_app/data/models/comment.dart';
import 'package:utc_student_app/data/repositories/comment/comment_repository.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';

class BlogCommentScreen extends StatefulWidget {
  final String studentCurrentId;
  final String studentCurrentName;
  final int blogId;
  final int likes;
  TextEditingController cmtController;
  BlogCommentScreen({
    Key? key,
    required this.studentCurrentId,
    required this.studentCurrentName,
    required this.blogId,
    required this.likes,
    required this.cmtController,
  }) : super(key: key);

  @override
  State<BlogCommentScreen> createState() => _BlogCommentScreenState();
}

class _BlogCommentScreenState extends State<BlogCommentScreen> {
  TextEditingController controller = TextEditingController();
  final CommentRepository _commentRepository = CommentRepository();
  late FocusNode _focus;
  bool isEntering = false;
  final picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    _focus = FocusNode();
    _focus.addListener(() {
      setState(() {
        if (_focus.hasFocus) {
          isEntering = true;
        } else {
          isEntering = false;
        }
      });
    });
    _commentRepository.getComment(blogId: widget.blogId);
    super.initState();
  }

  @override
  void dispose() {
    _focus.dispose();
    super.dispose();
  }

  Future imagePicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.gallery);
      setState(() {
        if (pick != null) {
          _image = File(pick.path);
        } else {}
      });
    } catch (e) {
      rethrow;
    }
  }

  void deleteImage() {
    setState(() {
      _image = null;
    });
  }

  Future<String?> uploadImageToFirebase() async {
    if (_image != null) {
      try {
        String fileName = widget.studentCurrentId +
            DateTime.now().millisecondsSinceEpoch.toString();
        UploadTask uploadTask =
            FirebaseStorage.instance.ref('comments/$fileName').putFile(_image!);
        TaskSnapshot snapshot = await uploadTask.whenComplete(() {});
        String imageUrl = await snapshot.ref.getDownloadURL();
        return imageUrl;
      } catch (e) {
        throw Exception(e.toString());
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: whiteText,
      height: screenSize.height * 0.9,
      width: screenSize.width,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 10),
                SizedBox(
                  height: 30,
                  child: Text.rich(
                    TextSpan(
                      children: [
                        WidgetSpan(
                          child: Image.asset(
                            Asset.icon('like.png'),
                            color: Colors.red,
                            scale: 6,
                          ),
                        ),
                        TextSpan(
                          text: ' ${widget.likes}',
                          style: const TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: greyText,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            top: 50,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                height: screenSize.height * 0.74,
                width: screenSize.width,
                child: StreamBuilder(
                  stream: _commentRepository.all(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      List<Comment> comments = snapshot.data!;
                      widget.cmtController.text = comments.length.toString();
                      return RefreshIndicator(
                        onRefresh: () => _commentRepository.getComment(
                            blogId: widget.blogId),
                        child: ListView.builder(
                          itemCount: comments.length,
                          itemBuilder: (context, index) {
                            Comment comment = comments[index];
                            return Padding(
                              padding: const EdgeInsets.symmetric(vertical: 6),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    Asset.icon('avatar.png'),
                                    scale: 3,
                                  ),
                                  const SizedBox(width: 4),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        constraints: BoxConstraints.loose(Size(
                                            screenSize.width * 0.75,
                                            Size.infinite.height)),
                                        //width: screenSize.width * 0.75,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(12),
                                          color: grey100,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              SampleText(
                                                text: comment.studentName!,
                                                fontWeight: FontWeight.w700,
                                                size: 14,
                                                color: greyText,
                                              ),
                                              SampleText(
                                                text: comment.content!,
                                                fontWeight: FontWeight.w500,
                                                size: 14,
                                                color: greyText,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: SampleText(
                                          text: comment.createdAt,
                                          fontWeight: FontWeight.w500,
                                          size: 14,
                                          color: greyText,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.of(context)
                .viewInsets
                .bottom, // Đặt Positioned widget xuống cuối
            left: 0,
            right: 0,
            height: isEntering
                ? _image != null
                    ? 200
                    : 100
                : 65,
            child: Container(
              decoration: const BoxDecoration(
                border: BorderDirectional(
                  top: BorderSide(
                    width: 2,
                    color: grey200,
                  ),
                ),
                color: whiteText,
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: Column(
                  children: [
                    TextFormField(
                      minLines: 1,
                      maxLines: null,
                      controller: controller,
                      focusNode: _focus,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: whiteText,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                          ),
                          hintText: 'Nhập bình luận...',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              width: 1,
                              color: grey300,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(28)),
                          )),
                    ),
                    if (isEntering) ...[
                      if (_image != null) ...[
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 100,
                                  child: Image.file(
                                    _image!,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () => deleteImage(),
                                  child: Image.asset(
                                    Asset.icon('cross.png'),
                                    scale: 6,
                                    color: grey900,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                      SizedBox(
                        height: 30,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              onPressed: () =>
                                  imagePicker().whenComplete(() => null),
                              icon: const Icon(Icons.camera_alt_outlined),
                            ),
                            IconButton(
                              onPressed: () async {
                                if (controller.text.isNotEmpty) {
                                  await _commentRepository.insertComment(
                                    comment: Comment(
                                      commentsId: 0,
                                      blogId: widget.blogId,
                                      content: controller.text,
                                      studentId: widget.studentCurrentId,
                                      studentName: widget.studentCurrentName,
                                      createdAt: DateTime.now().toString(),
                                    ),
                                  );
                                  controller.text = '';
                                }
                              },
                              icon: const Icon(Icons.send),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
