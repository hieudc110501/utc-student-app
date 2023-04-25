
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_item.dart';
import 'package:utc_student_app/utils/color.dart';

class ProfileBox extends StatelessWidget {
  const ProfileBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
            content: "state.student.studentName",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Mã Sinh Viên',
            content: "state.student.studentId",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Ngày Sinh',
            content: "state.student.birth",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Giới Tính',
            content: "state.student.gender",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Căn Cước Công Dân',
            content: "state.student.identity",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Số Điện Thoại',
            content: "state.student.tel",
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Divider(),
          ),
          ProfileItem(
            title: 'Số Tài Khoản',
            content: "state.student.bankAccount",
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
