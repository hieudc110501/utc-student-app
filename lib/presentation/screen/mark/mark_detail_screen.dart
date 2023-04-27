import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/mark/mark_detail_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

// màn hỉnh hiển thị lịch sử của 4 lần test gần nhất
class MarkDetailScreen extends StatelessWidget {
  static const routeName = 'mark-detail-screen';
  const MarkDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const MarkDetailItem(title: 'Kỳ 2 năm 2021_2022');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
