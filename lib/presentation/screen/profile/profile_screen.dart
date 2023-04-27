// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_container.dart';
import 'package:utc_student_app/presentation/widgets/profile/profile_item.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';

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
      body: SafeArea(
        child: ScrollConfiguration(
          behavior: const ScrollBehavior(),
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                  color: whiteText,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
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
                          children: const [
                            SampleText(
                              text: 'Trương Minh Hiếu',
                              fontWeight: FontWeight.w500,
                              size: 20,
                              color: greyText,
                            ),
                            SampleText(
                              text: '191203659 - CNTT6 K60',
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
                          children: const [
                            Expanded(child: SizedBox()),
                            Expanded(
                              child: SampleText(
                                text: 'Kỳ đã học',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: greyText,
                              ),
                            ),
                            Expanded(
                              child: SampleText(
                                text: '4',
                                fontWeight: FontWeight.w600,
                                size: 20,
                                color: greyText,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Expanded(child: SizedBox()),
                            Expanded(
                              child: SampleText(
                                text: 'Tín chỉ tích lũy',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: greyText,
                              ),
                            ),
                            Expanded(
                              child: SampleText(
                                text: '4',
                                fontWeight: FontWeight.w600,
                                size: 20,
                                color: greyText,
                              ),
                            ),
                            Expanded(child: SizedBox()),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: const [
                            Expanded(child: SizedBox()),
                            Expanded(
                              child: SampleText(
                                text: 'GPA',
                                fontWeight: FontWeight.w500,
                                size: 16,
                                color: greyText,
                              ),
                            ),
                            Expanded(
                              child: SampleText(
                                text: '4',
                                fontWeight: FontWeight.w600,
                                size: 20,
                                color: greyText,
                              ),
                            ),
                            Expanded(child: SizedBox()),
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
                  onTap: () {},
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
                  onTap: () {},
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
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: InkWell(
                  onTap: () {},
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
      ),
    );
  }
}
