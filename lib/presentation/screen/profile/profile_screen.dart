// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utc_student_app/logic/bloc/login/login_bloc.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_box.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_container.dart';
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

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> logout() async {
    final SharedPreferences prefs = await _prefs;
    setState(() {
      prefs.remove('username');
    });
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
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if (state is StudentStateProfileSuccess) {
            return SafeArea(
              child: ScrollConfiguration(
                behavior: const ScrollBehavior(),
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Container(
                      height: 100,
                      decoration: BoxDecoration(
                        color: whiteText,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12.withAlpha(10),
                            spreadRadius: 4,
                            blurRadius: 10,
                            offset: const Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Image.asset(
                              'assets/icons/avatar.png',
                              scale: 2,
                            ),
                          ),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 24),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SampleText(
                                    text: state.student.studentName,
                                    fontWeight: FontWeight.w500,
                                    size: 20,
                                    color: greyText,
                                  ),
                                  SampleText(
                                    text: state.student.studentId,
                                    fontWeight: FontWeight.w400,
                                    size: 16,
                                    color: greyText,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: SizedBox(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Container(
                        height: 100,
                        decoration: BoxDecoration(
                          color: whiteText,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12.withAlpha(10),
                              spreadRadius: 4,
                              blurRadius: 10,
                              offset: const Offset(0, 0),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  const Expanded(
                                    child: SampleText(
                                      text: 'Kỳ đã học',
                                      fontWeight: FontWeight.w500,
                                      size: 16,
                                      color: greyText,
                                    ),
                                  ),
                                  Expanded(
                                    child: SampleText(
                                      text:
                                          (state.listGPA.length - 1).toString(),
                                      fontWeight: FontWeight.w600,
                                      size: 20,
                                      color: indigo700,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  const Expanded(
                                    child: SampleText(
                                      text: 'Tín chỉ tích lũy',
                                      fontWeight: FontWeight.w500,
                                      size: 16,
                                      color: greyText,
                                    ),
                                  ),
                                  Expanded(
                                    child: SampleText(
                                      text:
                                          state.listGPA.last.credit.toString(),
                                      fontWeight: FontWeight.w600,
                                      size: 20,
                                      color: indigo700,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  const Expanded(child: SizedBox()),
                                  const Expanded(
                                    child: SampleText(
                                      text: 'GPA',
                                      fontWeight: FontWeight.w500,
                                      size: 16,
                                      color: greyText,
                                    ),
                                  ),
                                  Expanded(
                                    child: SampleText(
                                      text: state.listGPA.last.gpa4.toString(),
                                      fontWeight: FontWeight.w600,
                                      size: 20,
                                      color: indigo700,
                                    ),
                                  ),
                                  const Expanded(child: SizedBox()),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 1,
                        color: grey300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          ProfileBox.routeName,
                          arguments: state.student,
                        ),
                        child: const SizedBox(
                          height: 50,
                          child: ProfileContainer(
                            leftIcon: 'assets/icons/profile_info.png',
                            title: 'Thông tin cá nhân',
                            textColor: grey700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          height: 50,
                          child: ProfileContainer(
                            leftIcon: 'assets/icons/profile_map.png',
                            title: 'Bản đồ',
                            textColor: grey700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        onTap: () {},
                        child: const SizedBox(
                          height: 50,
                          child: ProfileContainer(
                            leftIcon: 'assets/icons/profile_email.png',
                            title: 'Đóng góp ý kiến',
                            textColor: grey700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        onTap: () => Navigator.pushNamed(
                          context,
                          ProfileBox.routeName,
                          arguments: state.student,
                        ),
                        child: const SizedBox(
                          height: 50,
                          child: ProfileContainer(
                            leftIcon: 'assets/icons/profile_info.png',
                            title: 'Thông tin cá nhân',
                            textColor: grey700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Divider(
                        height: 1,
                        color: grey300,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(26),
                              ),
                            ),
                            isScrollControlled: true,
                            barrierColor: grey900.withOpacity(0.4),
                            context: context,
                            builder: (context) {
                              return BackdropFilter(
                                filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: whiteText,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(26),
                                      topRight: Radius.circular(26),
                                    ),
                                  ),
                                  height: screenSize.height * 0.3,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 40),
                                      child: Column(
                                        children: [
                                          const SampleText(
                                            text: 'Đăng Xuất',
                                            fontWeight: FontWeight.w700,
                                            size: 18,
                                            color: rose700,
                                          ),
                                          const SizedBox(
                                            height: 20,
                                          ),
                                          const Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 70),
                                            child: Text(
                                              'Bạn có chắc chắn đăng xuất khỏi tài khoản này không?',
                                              textScaleFactor: 1.0,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            height: 40,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        indigo900,
                                                        indigo900,
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            38),
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(),
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors
                                                                    .transparent),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    Colors
                                                                        .transparent),
                                                        shape: MaterialStateProperty
                                                            .all(
                                                                RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(38),
                                                        )),
                                                        elevation:
                                                            MaterialStateProperty
                                                                .all(0),
                                                        fixedSize:
                                                            MaterialStatePropertyAll(
                                                                Size(
                                                                    screenSize
                                                                            .width *
                                                                        0.4,
                                                                    40))
                                                        //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                                                        ),
                                                    child: const Text(
                                                      'Quay lại',
                                                      textScaleFactor: 1.0,
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DecoratedBox(
                                                  decoration: BoxDecoration(
                                                    gradient:
                                                        const LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        rose700,
                                                        rose700,
                                                      ],
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            38),
                                                  ),
                                                  child: ElevatedButton(
                                                    onPressed: () {
                                                      logout();
                                                      Navigator.of(context).pop();
                                                      BlocProvider.of<
                                                                  LoginBloc>(
                                                              context)
                                                          .add(
                                                              const LoginEventCheck());
                                                    },
                                                    style: ButtonStyle(
                                                        overlayColor:
                                                            const MaterialStatePropertyAll(
                                                                Colors
                                                                    .transparent),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(
                                                                    Colors
                                                                        .transparent),
                                                        shape: MaterialStateProperty
                                                            .all(
                                                                RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(38),
                                                        )),
                                                        elevation:
                                                            MaterialStateProperty
                                                                .all(0),
                                                        fixedSize:
                                                            MaterialStatePropertyAll(
                                                                Size(
                                                                    screenSize
                                                                            .width *
                                                                        0.4,
                                                                    40))
                                                        //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                                                        ),
                                                    child: const Text(
                                                      'Đăng xuất',
                                                      textScaleFactor: 1.0,
                                                      style: TextStyle(
                                                        fontFamily: 'Inter',
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        child: const SizedBox(
                          height: 50,
                          child: ProfileContainer(
                            leftIcon: 'assets/icons/profile_logout.png',
                            title: 'Đăng xuất',
                            textColor: rose700,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            );
          }
          return const LoadingCircleScreen();
        },
      ),
    );
  }
}
