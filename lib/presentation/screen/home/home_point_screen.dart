// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:utc_student_app/data/models/point.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class HomePointScreen extends StatelessWidget {
  static const routeName = 'home-point-screen';
  final List<Point> points;
  const HomePointScreen({
    Key? key,
    required this.points,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Điểm rèn luyện',
            fontWeight: FontWeight.w600,
            size: 18,
            color: whiteText,
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(
              Icons.close,
              color: whiteText,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 30),
              const SampleText(
                text: 'Điểm rèn luyện sinh viên',
                fontWeight: FontWeight.w700,
                size: 16,
                color: indigo700,
              ),
              const SizedBox(height: 10),
              Table(
                columnWidths: const {
                  0: FlexColumnWidth(1),
                  1: FlexColumnWidth(5),
                  2: FlexColumnWidth(2),
                  3: FlexColumnWidth(2),
                  4: FlexColumnWidth(2),
                },
                border: TableBorder.all(),
                children: [
                  const TableRow(
                    decoration: BoxDecoration(color: blue600),
                    children: [
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'STT',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'Năm học',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'Học kỳ',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'Điểm',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'Xếp loại',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < points.length; i++)
                    TableRow(
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: (i + 1).toString(),
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: points[i].period ?? '',
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: points[i].term.toString(),
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: points[i].point.toString(),
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: points[i].ability ?? '',
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
