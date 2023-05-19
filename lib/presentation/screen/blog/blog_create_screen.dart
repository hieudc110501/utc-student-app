// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:utc_student_app/data/enum/blog_image.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/blog/blog_repository.dart';
import 'package:utc_student_app/data/repositories/storage/storage_repository.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class BlogCreateScreen extends StatefulWidget {
  static const routeName = 'blog-create';
  final Student student;
  const BlogCreateScreen({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  State<BlogCreateScreen> createState() => _BlogCreateScreenState();
}

class _BlogCreateScreenState extends State<BlogCreateScreen> {
  TextEditingController controller = TextEditingController();
  late BlogRepository _blogRepository;
  late StorageRepository _storageRepository;

  bool isData = false;
  final picker = ImagePicker();
  File? _image;

  @override
  void initState() {
    _blogRepository = BlogRepository();
    _storageRepository = StorageRepository();
    super.initState();
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

  Future cameraPicker() async {
    try {
      final pick = await picker.pickImage(source: ImageSource.camera);
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey200,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Tạo bài viết',
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: whiteText,
            ),
          ),
        ),
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          if (isData || _image != null) ...[
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                String? image = await _storageRepository.uploadImageToFirebase(
                  image: _image,
                  studentId: widget.student.studentId,
                  imageType: BlogImageType.blogs,
                );
                await _blogRepository
                    .insertBlog(studentId: widget.student.studentId, data: {
                  'body': controller.text,
                  'image': image,
                });
              },
              child: Container(
                height: 30,
                width: 40,
                decoration: BoxDecoration(
                  color: whiteText,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Center(
                  child: SampleText(
                    text: 'Đăng',
                    fontWeight: FontWeight.w700,
                    size: 12,
                    color: greyText,
                  ),
                ),
              ),
            )
          ],
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/menu_icon.png',
              color: whiteText,
              scale: 3,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Image.asset(
                    Asset.icon('avatar.png'),
                    scale: 3,
                  ),
                  const SizedBox(width: 14),
                  SampleText(
                    text: widget.student.studentName,
                    fontWeight: FontWeight.w800,
                    size: 16,
                    color: greyText,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                constraints: const BoxConstraints(
                  minHeight: 50,
                  maxHeight: 500,
                ),
                child: TextFormField(
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      setState(() {
                        isData = true;
                      });
                    } else {
                      setState(() {
                        isData = false;
                      });
                    }
                  },
                  minLines: 1,
                  maxLines: null,
                  controller: controller,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Nhập nội dung...',
                  ),
                ),
              ),
            ),
            if (_image != null) ...[
              Stack(
                children: [
                  Image.file(
                    _image!,
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      onPressed: () => deleteImage(),
                      icon: Image.asset(
                        Asset.icon('cross.png'),
                        color: whiteText,
                      ),
                    ),
                  ),
                ],
              ),
            ],
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                imagePicker().whenComplete(() => null);
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: Border.symmetric(
                    horizontal: BorderSide(
                      width: 1,
                      color: grey300,
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        Asset.icon('gallery.png'),
                        scale: 4,
                      ),
                      const SizedBox(width: 20),
                      const SampleText(
                        text: 'Thêm ảnh',
                        fontWeight: FontWeight.w500,
                        size: 16,
                        color: grey600,
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                cameraPicker().whenComplete(() => null);
              },
              child: Container(
                decoration: const BoxDecoration(
                  border: BorderDirectional(
                    bottom: BorderSide(
                      width: 1,
                      color: grey300,
                    ),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        Asset.icon('camera.png'),
                        scale: 4,
                      ),
                      const SizedBox(width: 20),
                      const SampleText(
                        text: 'Chụp ảnh',
                        fontWeight: FontWeight.w500,
                        size: 16,
                        color: grey600,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
