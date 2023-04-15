// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/presentation/bloc/student/student_bloc.dart';
import 'package:utc_student_app/presentation/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_item.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/size.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
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
        child: BlocBuilder<StudentBloc, StudentState>(
          builder: (context, state) {
            if (state is StudentStateInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is StudentStateError) {
              return const Center(
                child: Text('Load fail'),
              );
            } else if (state is StudentStateInfoSuccess) {
              return ListView(
                children: [
                  Container(
                    height: 100,
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
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ProfileItem(
                            title: 'Họ Và Tên',
                            content: state.student.studentName,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          ProfileItem(
                            title: 'Mã Sinh Viên',
                            content: state.student.studentId,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          ProfileItem(
                            title: 'Ngày Sinh',
                            content: state.student.birth,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          ProfileItem(
                            title: 'Giới Tính',
                            content: state.student.gender,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          ProfileItem(
                            title: 'Căn Cước Công Dân',
                            content: state.student.identity,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          ProfileItem(
                            title: 'Số Điện Thoại',
                            content: state.student.tel,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 24),
                            child: Divider(),
                          ),
                          ProfileItem(
                            title: 'Số Tài Khoản',
                            content: state.student.bankAccount,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
