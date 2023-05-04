// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:utc_student_app/data/models/mark.dart';
import 'package:utc_student_app/logic/handle/mark_handle.dart';
import 'package:utc_student_app/presentation/widgets/mark/mark_detail_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

// màn hỉnh hiển thị lịch sử của 4 lần test gần nhất
class MarkDetailScreen extends StatelessWidget {
  static const routeName = 'mark-detail-screen';
  final List<Mark> marks;
  const MarkDetailScreen({
    Key? key,
    required this.marks,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, int> map = termMark(marks);
    var keys = map.keys.toList();
    var values = map.values.toList();
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Điểm học phần theo kì',
            textScaleFactor: 1.0,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: whiteText,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: indigo900,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
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
              const SizedBox(height: 10),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        decoration: BoxDecoration(
                          color: blue400,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: SampleText(
                            text: 'HỌC PHẦN',
                            fontWeight: FontWeight.w600,
                            size: 14,
                            color: whiteText,
                          ),
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: SampleText(
                          text: 'DQT',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: SampleText(
                          text: 'THI',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: SampleText(
                          text: 'TKHP',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                physics: const ClampingScrollPhysics(),
                shrinkWrap: true,
                itemCount: map.length,
                itemBuilder: (context, index) {
                  return MarkDetailItem(
                    title: keys[index],
                    size: values[index],
                    marks: marks,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
