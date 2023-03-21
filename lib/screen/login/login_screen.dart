import 'package:flutter/material.dart';
import 'package:utc_student_app/screen/main_screen.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';
import 'package:utc_student_app/widgets/input_filed.dart';
import 'package:utc_student_app/widgets/sample_button.dart';
import 'package:utc_student_app/widgets/sample_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();
  bool isClick = false;

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            Expanded(
              flex: 5,
              child: Image.asset(
                Asset.image('logo.png'),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.center,
                child: SmapleText(
                  text: 'ĐĂNG NHẬP',
                  fontWeight: FontWeight.w700,
                  size: 24,
                  color: indigo800,
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InputField(
                      name: 'Mã sinh viên',
                      iconUrl: Asset.icon('user.png'),
                      controller: controller1,
                      isClick: isClick,
                    ),
                    InputField(
                      name: 'Mật khẩu',
                      iconUrl: Asset.icon('lock.png'),
                      controller: controller2,
                      isClick: isClick,
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: SmapleText(
                text: '*Bạn đã nhập sai mật khẩu',
                fontWeight: FontWeight.w500,
                size: 14,
                color: rose500,
              ),
            ),
            Flexible(
              flex: 2,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                child: SampleButton(
                  text: 'Đăng nhập',
                  routeName: MainScreen.routeName,
                  fixedSize: MaterialStatePropertyAll(
                    Size(
                      screenSize.width * 0.9,
                      screenSize.height * 0.075,
                    ),
                  ),
                  textStyle: const MaterialStatePropertyAll(
                    TextStyle(
                      fontFamily: 'Inter',
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SmapleText(
                  text: 'Copyright by Trương Hiếu',
                  fontWeight: FontWeight.w500,
                  size: 14,
                  color: indigo800,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
