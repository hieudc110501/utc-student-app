//xử lí kỳ học
import 'package:utc_student_app/data/models/mark.dart';

String termHandle(String term) {
  if (term.length == 5) {
    String a = term.substring(4);
    String b = term.substring(0, 2);
    String c = term.substring(2, 4);
    return 'Kỳ $a Năm 20$b-20$c';
  }
  return term;
}

//xử lý kì học để hiện lên bản đồ
String chartHandle(String term) {
  if (term.length == 5) {
    String a = term.substring(4);
    String b = term.substring(0, 2);
    return '$b$a';
  }
  return 'TK';
}

Map<String, int> termMark(List<Mark> marks) {
  Map<String, int> map = {};
  marks.forEach((e) {
    if (map.containsKey(e.termId)) {
      int value = map[e.termId]!;
      map[e.termId] = value + 1;
    } else {
      map[e.termId] = 1;
    }
  });
  return map;
}
