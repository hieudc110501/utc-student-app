// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/screen/home/home_screen.dart';
import 'package:utc_student_app/presentation/screen/mark/mark_screen.dart';
import 'package:utc_student_app/presentation/screen/profile/profile_screen.dart';
import 'package:utc_student_app/presentation/screen/schedule/schedule_screen.dart';
import 'package:utc_student_app/presentation/widgets/cupertino_tabbar.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const ScheduleScreen(),
      const MarkScreen(),
      const ProfileScreen(),
    ];
    return Scaffold(
      backgroundColor: whiteText,
      body: screens[index],
      bottomNavigationBar: CupertinoTabbarWidget(
        index: index,
        onChangedTab: onChangedTab,
      ),
    );
  }

  void onChangedTab(int index) {
    setState(() {
      this.index = index;
    });
    // switch (index) {
    //   case 0:
    //     break;
    //   case 1:
    //     context
    //         .read<StudentBloc>()
    //         .add(const StudentEventLoadSchedule('191203659'));
    //     break;
    //   case 2:
    //     context
    //         .read<StudentBloc>()
    //         .add(const StudentEventLoadMark('191203659'));
    //     break;
    //   case 3:
    //     context
    //         .read<StudentBloc>()
    //         .add(const StudentEventLoadData('191203659'));
    //     break;
    //   default:
    //     break;
    // }
  }
}
