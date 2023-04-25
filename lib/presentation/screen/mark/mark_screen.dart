import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_event.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/presentation/widgets/mark/mark_item.dart';
import 'package:utc_student_app/utils/color.dart';
import 'package:utc_student_app/utils/size.dart';
import 'package:utc_student_app/presentation/widgets/sample_text.dart';

class MarkScreen extends StatefulWidget {
  const MarkScreen({super.key});

  @override
  State<MarkScreen> createState() => _MarkScreenState();
}

class _MarkScreenState extends State<MarkScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double heightChart = 380;
    final List<ChartData> chartData = [
      ChartData('Test 1', 2.84),
      ChartData('Test 2', 3.2),
      ChartData('Test 3', 3.6),
      ChartData('Test 4', 2.5),
      ChartData('Test 5', 1.5),
      ChartData('Test 6', 3),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: SampleText(
            text: 'Điểm',
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
            onPressed: () {},
            icon: Image.asset(
              'assets/icons/menu_icon.png',
              color: whiteText,
              scale: 3,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ListView(
            children: [
              Container(
                height: heightChart,
                decoration: BoxDecoration(
                  color: blue50,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: SampleText(
                        text: 'Biểu đồ điểm',
                        fontWeight: FontWeight.w700,
                        size: 14,
                        color: grey700,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Stack(
                      children: [
                        Positioned(
                          right: 0,
                          child: SizedBox(
                            height: heightChart,
                            width: screenSize.width * 0.76,
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(12),
                                    ),
                                    color: blue400,
                                  ),
                                  height: heightChart * 0.095,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    color: blue300,
                                  ),
                                  height: heightChart * 0.068,
                                ),
                                Container(
                                  color: blue200,
                                  height: heightChart * 0.115,
                                ),
                                Container(
                                  decoration: const BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(12),
                                    ),
                                    color: blue100,
                                  ),
                                  height: heightChart * (0.42),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          child: SfCartesianChart(
                            plotAreaBorderWidth: 0,
                            primaryYAxis: NumericAxis(
                              minimum: 0,
                              maximum: 4,
                              labelStyle: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ).copyWith(color: grey500),
                              majorGridLines: const MajorGridLines(width: 0),
                              axisLine: const AxisLine(width: 0),
                            ),
                            primaryXAxis: CategoryAxis(
                              majorGridLines: const MajorGridLines(width: 0),
                              axisLine: const AxisLine(width: 0),
                              labelStyle: const TextStyle(
                                fontFamily: 'Inter',
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ).copyWith(color: grey500),
                            ),
                            series: <CartesianSeries>[
                              LineSeries<ChartData, String>(
                                dataSource: chartData,
                                xValueMapper: (ChartData data, _) => data.x,
                                yValueMapper: (ChartData data, _) => data.y,
                                // Renders the marker
                                markerSettings: const MarkerSettings(
                                    isVisible: true,
                                    borderColor: blue600,
                                    height: 12,
                                    width: 12),
                                dataLabelSettings: DataLabelSettings(
                                  isVisible: true,
                                  labelAlignment: ChartDataLabelAlignment.top,
                                  textStyle: const TextStyle(
                                    fontFamily: 'Inter',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14,
                                  ).copyWith(color: blue600),
                                ),
                                dashArray: [5, 5],
                                color: blue600,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: blue100,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  topLeft: Radius.circular(12),
                                )),
                            height: 10,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            height: 10,
                            color: blue200,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                                color: blue300,
                                borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  topRight: Radius.circular(12),
                                )),
                            height: 10,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: const [
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: SampleText(
                              text: 'THẤP',
                              fontWeight: FontWeight.w600,
                              size: 12,
                              color: grey500,
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Align(
                              alignment: Alignment.center,
                              child: SampleText(
                                text: 'THẤP',
                                fontWeight: FontWeight.w600,
                                size: 12,
                                color: grey500,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Align(
                            alignment: Alignment.center,
                            child: Align(
                              alignment: Alignment.center,
                              child: SampleText(
                                text: 'THẤP',
                                fontWeight: FontWeight.w600,
                                size: 12,
                                color: grey500,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ListTile(
                contentPadding: EdgeInsets.zero,
                title: const SampleText(
                  text: 'Điểm',
                  fontWeight: FontWeight.w700,
                  size: 18,
                  color: grey700,
                ),
                trailing: TextButton(
                  style: const ButtonStyle(
                      overlayColor:
                          MaterialStatePropertyAll(Colors.transparent)),
                  onPressed: () {},
                  child: const SampleText(
                    text: 'Xem thêm',
                    fontWeight: FontWeight.w400,
                    size: 12,
                    color: grey500,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        decoration: BoxDecoration(
                          color: blue400,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Center(
                          child: SampleText(
                            text: 'MÔN',
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
              // Container(
              //   color: whiteText,
              //   height: 200,
              //   child: ListView.builder(
              //     itemCount: state.listMark.length,
              //     itemBuilder: (context, index) {
              //       return MarkItem(
              //         mon: state.listMark[index].moduleName,
              //         dqt: state.listMark[index].dqt.toString(),
              //         thi: state.listMark[index].thi.toString(),
              //         tkhp: state.listMark[index].tkhp.toString(),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

//model dữ liệu biểu đồ trục x,y
class ChartData {
  ChartData(this.x, this.y);
  final String x;
  final double? y;
}
