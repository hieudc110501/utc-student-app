import 'package:flutter/material.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/widgets/sample_text.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SmapleText(
            text: 'Trang Chủ',
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
      body: const SafeArea(
        child: Center(
          child: Text('home'),
        ),
      ),
    );
  }
}
