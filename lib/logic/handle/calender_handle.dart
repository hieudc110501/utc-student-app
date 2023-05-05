// xử lí tiết học
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

//check today
bool checkToday(DateTime day) {
  DateTime now = DateTime.now();
  if (now.year == day.year && now.month == day.month && now.day == day.day) {
    return true;
  }
  return false;
}
