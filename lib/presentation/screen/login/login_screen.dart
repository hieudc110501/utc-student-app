import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/logic/bloc/login/login_bloc.dart';
import 'package:utc_student_app/logic/bloc/login/login_event.dart';
import 'package:utc_student_app/logic/bloc/login/login_state.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_screen.dart';
import 'package:utc_student_app/presentation/screen/main_screen.dart';
import 'package:utc_student_app/presentation/widgets/dialog/error_dialog.dart';
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
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.read<LoginBloc>().add(const LoginEventCheck());
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen.instance().show(context: context, text: '');
        } else {
          LoadingScreen.instance().hide();
          if (state is LoginStateFailure) {
            showErrorDialog(context, state.error);
          }
        }
      },
      builder: (context, state) {
        if (state is LoginStateSuccess) {
          return MainScreen(
            username: controller1.text,
            password: controller2.text,
          );
        }
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
                  flex: 2,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'TRƯỜNG ĐẠI HỌC GIAO THÔNG VẬN TẢI',
                        style: TextStyle(
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          fontSize: 24,
                          color: indigo800,
                        ),
                        textAlign: TextAlign.center,
                      ),
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
                          isPassword: false,
                        ),
                        InputField(
                          name: 'Mật khẩu',
                          iconUrl: Asset.icon('lock.png'),
                          controller: controller2,
                          isClick: isClick,
                          isPassword: true,
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
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 24),
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
                            LoginEventSubmit(
                                controller1.text, controller2.text)),
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
                              screenSize.height * 0.07,
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
                      text: 'https://qldt.utc.edu.vn',
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
      },
    );
  }
}
