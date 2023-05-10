// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utc_student_app/data/local/repository/local_repository.dart';
import 'package:utc_student_app/data/local/shared_preferences/shared_preferences_service.dart';
import 'package:utc_student_app/data/repositories/student/student_repostitory.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/screen/home/home_screen.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_screen.dart';
import 'package:utc_student_app/presentation/screen/mark/mark_screen.dart';
import 'package:utc_student_app/presentation/screen/profile/profile_screen.dart';
import 'package:utc_student_app/presentation/screen/schedule/schedule_screen.dart';
import 'package:utc_student_app/presentation/widgets/cupertino_tabbar.dart';
import 'package:utc_student_app/presentation/widgets/dialog/error_dialog.dart';
import 'package:utc_student_app/presentation/widgets/dialog/update_dialog.dart';
import 'package:utc_student_app/utils/color.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'main-screen';
  final String username;
  final String password;
  const MainScreen({
    Key? key,
    required this.username,
    required this.password,
  }) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  int index = 0;
  late String? username;

  @override
  void initState() {
    super.initState();
  }

  Future<void> saveData() async {
    setState(() {
      SharedPreferencesService.preferences
          .setString('username', widget.username);
      SharedPreferencesService.preferences
          .setString('password', widget.password);
    });
  }

  Future<void> checkData(BuildContext context) async {
    username = SharedPreferencesService.preferences.getString('username');
    if (username == null) {
      LocalRepository localRepository = LocalRepository();
      StudentRepository studentRepository = StudentRepository();
      final check = await localRepository.check(widget.username);
      if (check) {
        final update = await showUpdateDialog(context);
        if (update) {
          await studentRepository.deleteAll(widget.username);
          await localRepository.deleteAll(widget.username);
        }
      }
      context
          .read<StudentBloc>()
          .add(StudentEventSyncData(widget.username, widget.password));
    } else if (index == 0) {
      context.read<StudentBloc>().add(StudentEventLoadData(username!));
    }
  }

  @override
  Widget build(BuildContext context) {
    checkData(context);

    final List<Widget> screens = [
      const HomeScreen(),
      const ScheduleScreen(),
      const MarkScreen(),
      const ProfileScreen(),
    ];
    return BlocListener<StudentBloc, StudentState>(
      listener: (context, state) {
        if (state.isLoading) {
          LoadingScreen().show(context: context, text: 'Đang đồng bộ...');
        } else {
          LoadingScreen().hide();
          if (state is StudentStateSyncFailure) {
            showErrorDialog(
              context: context,
              title: 'Đồng bộ thất bại',
              text: state.error,
            );
          } else if (state is StudentStateSyncSuccess) {
            saveData();
            context
                .read<StudentBloc>()
                .add(StudentEventLoadData(widget.username));
          }
        }
      },
      child: Scaffold(
        backgroundColor: whiteText,
        body: screens[index],
        bottomNavigationBar: CupertinoTabbarWidget(
          index: index,
          onChangedTab: onChangedTab,
        ),
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
    switch (index) {
      case 0:
        context.read<StudentBloc>().add(StudentEventLoadData(username!));
        break;
      case 1:
        context.read<StudentBloc>().add(StudentEventLoadSchedule(username!));
        break;
      case 2:
        context.read<StudentBloc>().add(StudentEventLoadMark(username!));
        break;
      case 3:
        context.read<StudentBloc>().add(StudentEventLoadProfile(username!));
        break;
      default:
        break;
    }
  }
}
