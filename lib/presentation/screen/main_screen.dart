import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:utc_student_app/logic/repositories/student_repository.dart';
import 'package:utc_student_app/presentation/bloc/student/student_bloc.dart';
import 'package:utc_student_app/presentation/bloc/student/student_event.dart';
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
  late Future<bool> fetchData;
  late final SharedPreferences prefs;
  final StudentBloc _studentBloc = StudentBloc();

  @override
  void initState() {
    super.initState();
    fetchData = syncData('191203659', 'datcuu99');
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      const HomeScreen(),
      const ScheduleScreen(),
      const MarkScreen(),
      const ProfileScreen(),
    ];
    return BlocProvider<StudentBloc>(
      create: (context) => _studentBloc,
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
        break;
      case 1:
        break;
      case 2:
        _studentBloc.add(const StudentEventLoadMark('191203659'));
        break;
      case 3:
        _studentBloc.add(const StudentEventLoadData('191203659'));
        break;
      default:
        break;
    }
  }
}
