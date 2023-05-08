// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:utc_student_app/data/models/student.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class ProfileBox extends StatelessWidget {
  static const routeName = 'profile-box';
  final Student student;
  const ProfileBox({
    Key? key,
    required this.student,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey100,
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Thông Tin Cá Nhân',
            fontWeight: FontWeight.w600,
            size: 18,
            color: whiteText,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
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
      body: Container(
        decoration: const BoxDecoration(
          color: whiteText,
          borderRadius: BorderRadius.all(
            Radius.circular(18),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileItem(
              title: 'Họ Và Tên',
              content: student.studentName,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            ProfileItem(
              title: 'Mã Sinh Viên',
              content: student.studentId,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            ProfileItem(
              title: 'Ngày Sinh',
              content: student.birth ?? '',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            ProfileItem(
              title: 'Giới Tính',
              content: student.gender!,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            ProfileItem(
              title: 'Căn Cước Công Dân',
              content: student.identity ?? '',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            ProfileItem(
              title: 'Số Điện Thoại',
              content: student.tel ?? '',
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            ProfileItem(
              title: 'Số Tài Khoản',
              content: student.bankAccount ?? '',
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
