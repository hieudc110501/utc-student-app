// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:utc_student_app/data/model/student.dart';
import 'package:utc_student_app/logic/request/student_request.dart';
import 'package:utc_student_app/presentation/screen/profile/widgets/profile_item.dart';

import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late Future<Student> futureStudent;
  @override
  void initState() {
    futureStudent = fecthStudent('191203659', 'datcuu99');
    super.initState();
  }

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
            color: indigo900,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteText,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/menu_icon.png',
              color: indigo900,
              scale: 3,
            ),
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            height: 200,
            width: screenSize.width * 0.9,
            decoration: const BoxDecoration(
              color: indigo600,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Container(
              decoration: const BoxDecoration(
                color: whiteText,
                borderRadius: BorderRadius.all(
                  Radius.circular(18),
                ),
              ),
              child: FutureBuilder<Student>(
                future: futureStudent,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ProfileItem(
                          title: 'Họ Và Tên',
                          content: snapshot.data!.studentName,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(),
                        ),
                        ProfileItem(
                          title: 'Mã Sinh Viên',
                          content: snapshot.data!.studentId,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(),
                        ),
                        ProfileItem(
                          title: 'Ngày Sinh',
                          content: snapshot.data!.birth,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(),
                        ),
                        ProfileItem(
                          title: 'Giới Tính',
                          content: snapshot.data!.gender,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(),
                        ),
                        ProfileItem(
                          title: 'Căn Cước Công Dân',
                          content: snapshot.data!.identity,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(),
                        ),
                        ProfileItem(
                          title: 'Số Điện Thoại',
                          content: snapshot.data!.tel,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Divider(),
                        ),
                        ProfileItem(
                          title: 'Số Tài Khoản',
                          content: snapshot.data!.bankAccount,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text('${snapshot.error}'));
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      )),
    );
  }
}
