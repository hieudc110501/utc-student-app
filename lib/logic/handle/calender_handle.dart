// xử lí tiết học
import 'package:utc_student_app/data/models/exam.dart';
import 'package:utc_student_app/data/models/schedule.dart';

String lessonHandle(int lesson) {
  switch (lesson) {
    case 1:
      return '1,2,3';
    case 2:
      return '4,5,6';
    case 3:
      return '7,8,9';
    case 4:
      return '10,11,12';
    default:
      return 'Trống';
  }
}

//xử lí lịch
bool markerCheck(String startDay, String endDay, DateTime day, int weekDay) {
  DateTime begin = DateTime.parse(startDay);
  DateTime end = DateTime.parse(endDay);
  int weekday = weekDay - 1;
  if (day.isAfter(begin) && day.isBefore(end) && day.weekday == weekday) {
    return true;
  }
  return false;
}

// chuyển thứ thành T2
String convertWeekDay(int weekDay) {
  switch (weekDay) {
    case 1:
      return 'T2';
    case 2:
      return 'T3';
    case 3:
      return 'T4';
    case 4:
      return 'T5';
    case 5:
      return 'T6';
    case 6:
      return 'T7';
    case 7:
      return 'CN';
    default:
      return 'T2';
  }
}

// chuyển thứ thành T2
String weekdayNumber(int weekDay) {
  switch (weekDay) {
    case 1:
      return 'Thứ 2';
    case 2:
      return 'Thứ 3';
    case 3:
      return 'Thứ 4';
    case 4:
      return 'Thứ 5';
    case 5:
      return 'Thứ 6';
    case 6:
      return 'Thứ 7';
    case 7:
      return 'Chủ Nhật';
    default:
      return 'Thứ 2';
  }
}

//check today
bool checkToday(DateTime day) {
  DateTime now = DateTime.now();
  if (now.year == day.year && now.month == day.month && now.day == day.day) {
    return true;
  }
  return false;
}

bool checkSameDay(DateTime a, DateTime b) {
  if (a.day == b.day && a.month == b.month && a.year == b.year) {
    return true;
  }
  return false;
}

// lấy ra ngày có lịch học
List checkSchedule(List<Schedule> schedules) {
  final list = [];
  schedules.forEach((e) {
    if (markerCheck(e.startDay, e.endDay, DateTime.now(), e.weekDay ?? -1)) {
      list.add(e);
    }
  });
  return list;
}

// lấy ra ngày có lịch thi
List checkExam(List<Exam> exams) {
  final list = [];
  exams.forEach((e) {
    if (checkSameDay(DateTime.parse(e.date), DateTime.now())) {
      list.add(e);
    }
  });
  return list;
}