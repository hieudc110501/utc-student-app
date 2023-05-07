// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:utc_student_app/utils/color.dart';

//Tabbar của phầm home
class CupertinoTabbarWidget extends StatefulWidget {
  final int index;
  final ValueChanged<int> onChangedTab;
  const CupertinoTabbarWidget({
    Key? key,
    required this.index,
    required this.onChangedTab,
  }) : super(key: key);

  @override
  State<CupertinoTabbarWidget> createState() => _CupertinoTabbarWidgetState();
}

class _CupertinoTabbarWidgetState extends State<CupertinoTabbarWidget> {
  @override
  Widget build(BuildContext context) {
    return CupertinoTabBar(
      backgroundColor: whiteText,
      height: 60,
      border: const Border(
        top: BorderSide(
          width: 1,
          color: indigo900,
        ),
      ),
      items: [
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(left: 40),
            child: Image.asset(
              widget.index == 0
                  ? 'assets/icons/home_active.png'
                  : 'assets/icons/home_unactive.png',
              scale: 2.5,
              color: widget.index == 0 ? indigo900 : grey500,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            widget.index == 1
                ? 'assets/icons/calendar_active.png'
                : 'assets/icons/calendar_unactive.png',
            scale: 2.5,
            color: widget.index == 1 ? indigo900 : grey500,
          ),
        ),
        BottomNavigationBarItem(
          icon: Image.asset(
            widget.index == 2
                ? 'assets/icons/chart_active.png'
                : 'assets/icons/chart_unactive.png',
            scale: 2.5,
            color: widget.index == 2 ? indigo900 : grey500,
          ),
        ),
        BottomNavigationBarItem(
          icon: Padding(
            padding: const EdgeInsets.only(right: 40),
            child: Image.asset(
              widget.index == 3
                  ? 'assets/icons/user_active.png'
                  : 'assets/icons/user_unactive.png',
              scale: 2.5,
              color: widget.index == 3 ? indigo900 : grey500,
            ),
          ),
        ),
      ],
      currentIndex: widget.index,
      onTap: (index) {
        widget.onChangedTab(index);
      },
    );
  }
}
