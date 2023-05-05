// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';

class ScheduleMarker extends StatelessWidget {
  final String day;
  final bool isMarker;
  final bool isToday;
  const ScheduleMarker({
    Key? key,
    required this.day,
    required this.isMarker,
    required this.isToday,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Center(
          child: isMarker
              ? Image.asset(
                  Asset.icon('marker.png'),
                  scale: 2.8,
                  fit: BoxFit.cover,
                  color: indigo700,
                )
              : const SizedBox(),
        ),
        Center(
          child: Text(
            day,
            style: const TextStyle(
              color: grey700,
            ),
          ),
        ),
        isToday
            ? Positioned(
                bottom: 18,
                child: Image.asset(
                  Asset.icon('dot.png'),
                  scale: 2.6,
                  color: rose600,
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
