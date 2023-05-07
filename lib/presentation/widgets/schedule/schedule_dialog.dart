// ignore_for_file: public_member_api_docs, sort_constructors_first
// hiển thị hướng dẫn trong phần lịch
import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/asset.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';

Future<void> scheduleDialog(BuildContext context) {
  return showDialog<void>(
    barrierColor: Colors.transparent,
    context: context,
    builder: (BuildContext context) {
      return MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
          child: AlertDialog(
            elevation: 0,
            contentPadding: EdgeInsets.zero,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(24),
              ),
            ),
            content: Container(
              height: 250,
              width: screenSize.width,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.transparent),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0xff10182814),
                    spreadRadius: 4,
                    blurRadius: 10,
                    offset: Offset(0, 1),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Expanded(
                          flex: 1,
                          child: SizedBox(),
                        ),
                        const Expanded(
                          flex: 4,
                          child: Center(
                            child: SampleText(
                              text: 'Chú thích TKB',
                              fontWeight: FontWeight.w700,
                              size: 16,
                              color: grey700,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: Image.asset(
                                Asset.icon('exit.png'),
                                scale: 3,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Divider(
                    height: 5,
                    color: grey500,
                  ),
                  NoteItem(
                    iconUrl: Asset.icon('note_today.png'),
                    text: 'Ngày hôm nay',
                  ),
                  NoteItem(
                    iconUrl: Asset.icon('note_marker.png'),
                    text: 'Ngày có lịch học',
                    iconColor: indigo700,
                  ),
                  NoteItem(
                    iconUrl: Asset.icon('note_marker.png'),
                    text: 'Ngày có lịch thi',
                    iconColor: rose700,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}

class NoteItem extends StatelessWidget {
  final String iconUrl;
  final String text;
  final Color? iconColor;
  const NoteItem({
    Key? key,
    required this.iconUrl,
    required this.text,
    this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, bottom: 10, left: 24),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            scale: 2.8,
            color: iconColor,
          ),
          const SizedBox(
            width: 20,
          ),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: grey700,
              ),
              maxLines: 2,
            ),
          ),
        ],
      ),
    );
  }
}
