import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utc_student_app/logic/bloc/login/login_bloc.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/login/login_state.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_screen.dart';
import 'package:utc_student_app/presentation/screen/main_screen.dart';
import 'package:utc_student_app/presentation/widgets/loading/loading_dialog.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';
import 'package:utc_student_app/presentation/widgets/input_filed.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';

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
    super.dispose();
  }

  void saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', controller1.text);
    await prefs.setString('password', controller2.text);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginStateFailure) {
          LoadingScreen.instance().hide();
          loadingDialog(context, state.message!);
        } else if (state is LoginStateLoading) {
          LoadingScreen.instance().show(context: context, text: state.message!);
        } else if (state is LoginStateSuccess) {
          LoadingScreen.instance().hide();
          saveUser();
          Navigator.pushNamed(context, MainScreen.routeName);
        }
      },
      child: Scaffold(
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
                  child: SampleText(
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
                child: SizedBox(),
              ),
              Flexible(
                flex: 2,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          indigo900,
                          indigo600,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(38),
                    ),
                    child: ElevatedButton(
                      onPressed: () => context.read<LoginBloc>().add(
                          LoginEventSubmit(controller1.text, controller2.text)),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(38),
                          ),
                        ),
                        elevation: MaterialStateProperty.all(0),
                        fixedSize: MaterialStatePropertyAll(
                          Size(
                            screenSize.width * 0.9,
                            screenSize.height * 0.075,
                          ),
                        ),
                        //foregroundColor: MaterialStateProperty.all(primaryColorRoseTitleText),
                        textStyle: const MaterialStatePropertyAll(
                          TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      child: const Text('Đăng nhập'),
                    ),
                  ),
                ),
              ),
              const Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: SampleText(
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
      ),
    );
  }
}
