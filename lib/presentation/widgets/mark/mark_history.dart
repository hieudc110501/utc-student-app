import 'package:flutter/material.dart';
import 'package:utc_student_app/presentation/widgets/mark/mark_item.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';
import 'package:utc_student_app/utils/color.dart';

class MarkHistory extends StatelessWidget {
  const MarkHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteText,
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Lịch sử test',
            textScaleFactor: 1.0,
            style: const TextStyle(
              fontFamily: 'Inter',
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ).copyWith(
              color: rose500,
            ),
          ),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: whiteText,
        shadowColor: whiteText,
        bottomOpacity: 0.1,
        elevation: 3,
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Image.asset(
              'assets/icons/x_icon.png',
              color: rose500,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: violet500,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: SampleText(
                            text: 'Ngày',
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
                          text: 'Giờ',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: SampleText(
                          text: 'Giá trị LH',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey700,
                        ),
                      ),
                    ),
                    const Expanded(
                      child: Center(
                        child: SampleText(
                          text: 'Lần Test',
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
                  return MarkItem(mon: 'a', dqt: '1', thi: '1', tkhp: '1');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
