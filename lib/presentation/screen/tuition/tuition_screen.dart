// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:utc_student_app/data/models/tuition.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class TuitionScreen extends StatelessWidget {
  static const routeName = 'tuition-screen';
  final List<Tuition> tuitions;
  const TuitionScreen({
    Key? key,
    required this.tuitions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Tuition> listPaid =
        tuitions.where((tuition) => tuition.paid == 1).toList();
    List<Tuition> listNotPaid =
        tuitions.where((tuition) => tuition.paid == 0).toList();
    String totalPaid = NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
        .format(listPaid.fold(
            0, (previousValue, element) => previousValue + element.payment));
    String totalNotPaid = NumberFormat.currency(locale: 'vi_VN', symbol: '₫')
        .format(listNotPaid.fold(
            0, (previousValue, element) => previousValue + element.payment));

    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Thông Tin Học Phí',
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
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: SampleText(
                  text: 'Đã đóng : $totalPaid',
                  fontWeight: FontWeight.w700,
                  size: 16,
                  color: indigo700,
                ),
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
                          text: 'Nội dung',
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
                          text: 'Ngày',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'Số tiền',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < listPaid.length; i++)
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
                            text: listPaid[i].content,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: listPaid[i].term,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: listPaid[i].date,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: listPaid[i].payment.toString(),
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                      ],
                    ),
                ],
              ),
              const SizedBox(height: 30),
              Align(
                alignment: Alignment.center,
                child: SampleText(
                  text: 'Còn phải đóng: $totalNotPaid',
                  fontWeight: FontWeight.w700,
                  size: 16,
                  color: rose700,
                ),
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
                          text: 'Nội dung',
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
                          text: 'Ngày',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: SampleText(
                          text: 'Số tiền',
                          fontWeight: FontWeight.w700,
                          size: 14,
                          color: whiteText,
                        ),
                      ),
                    ],
                  ),
                  for (int i = 0; i < listNotPaid.length; i++)
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
                            text: listNotPaid[i].content,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: listNotPaid[i].term,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: listNotPaid[i].date,
                            fontWeight: FontWeight.w500,
                            size: 14,
                            color: grey700,
                          ),
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: SampleText(
                            text: listNotPaid[i].payment.toString(),
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
