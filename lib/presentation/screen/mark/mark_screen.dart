import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:utc_student_app/logic/bloc/student/student_bloc.dart';
import 'package:utc_student_app/logic/bloc/student/student_state.dart';
import 'package:utc_student_app/logic/handle/mark_handle.dart';
import 'package:utc_student_app/presentation/screen/loading/loading_circle_screen.dart';
import 'package:utc_student_app/presentation/screen/mark/mark_detail_screen.dart';
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
      body: BlocBuilder<StudentBloc, StudentState>(
        builder: (context, state) {
          if (state is StudentStateMarkSuccess) {
            final List<ChartData> chartData = [];
            state.listGPA.forEach((e) {
              chartData.add(ChartData(
                chartHandle(e.term),
                e.gpa4.toDouble(),
              ));
            });
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16),
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
                                  width: screenSize.width * 0.82,
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
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
                                    axisLine: const AxisLine(width: 0),
                                  ),
                                  primaryXAxis: CategoryAxis(
                                    majorGridLines:
                                        const MajorGridLines(width: 0),
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
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      // Renders the marker
                                      markerSettings: const MarkerSettings(
                                        isVisible: true,
                                        borderColor: blue600,
                                        height: 8,
                                        width: 8,
                                      ),
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        labelAlignment:
                                            ChartDataLabelAlignment.top,
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
                                  height: 10,
                                  color: blue300,
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: const BoxDecoration(
                                      color: blue400,
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
                                    text: 'TB',
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
                                      text: 'KHÁ',
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
                                      text: 'GIỎI',
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
                                      text: 'XUẤT SẮC',
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
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            MarkDetailScreen.routeName,
                            arguments: state.listMark,
                          );
                        },
                        child: const SampleText(
                          text: 'Xem thêm',
                          fontWeight: FontWeight.w600,
                          size: 14,
                          color: grey500,
                        ),
                      ),
                    ),
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
                                  text: 'KỲ HỌC',
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
                                text: 'Hệ 4',
                                fontWeight: FontWeight.w600,
                                size: 14,
                                color: grey700,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: SampleText(
                                text: 'Hệ 10',
                                fontWeight: FontWeight.w600,
                                size: 14,
                                color: grey700,
                              ),
                            ),
                          ),
                          const Expanded(
                            child: Center(
                              child: SampleText(
                                text: 'Số TC',
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
                    Container(
                      color: whiteText,
                      height: 35 * state.listGPA.length.toDouble(),
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.listGPA.length,
                        itemBuilder: (context, index) {
                          return MarkItem(
                            mon: termHandle(state.listGPA[index].term),
                            dqt: state.listGPA[index].gpa4.toString(),
                            thi: state.listGPA[index].gpa10.toString(),
                            tkhp: state.listGPA[index].credit.toString(),
                            index: index,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
          return const LoadingCircleScreen();
        },
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
