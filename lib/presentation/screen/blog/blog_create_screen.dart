// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
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
  late StudentRepository _studentRepository;
  bool isData = false;

  @override
  void initState() {
    _studentRepository = StudentRepository();
    super.initState();
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
          isData
              ? TextButton(
                  onPressed: () {
                    context.read<StudentBloc>().add(
                          StudentEventCreateBlog(
                            widget.student.studentId,
                            {
                              'body': controller.text,
                            },
                            widget.student,
                          ),
                        );
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
              : const SizedBox(),
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView(
            children: [
              const SizedBox(height: 10),
              Row(
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
              TextFormField(
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
            ],
          ),
        ),
      ),
    );
  }
}
