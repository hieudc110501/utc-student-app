import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/screen/home/home_screen.dart';
import 'package:utc_student_app/presentation/screen/mark/mark_screen.dart';
import 'package:utc_student_app/presentation/screen/profile/profile_screen.dart';
import 'package:utc_student_app/presentation/screen/schedule/schedule_screen.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/presentation/widgets/cupertino_tabbar.dart';

class MainScreen extends StatefulWidget {
  static const routeName = 'main-screen';
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentTab = 0;
  int index = 0;
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
  }
}

