import 'package:dio/dio.dart';
import 'package:utc_student_app/utils/constant.dart';

class StudentRepository {
  //kiểm tra login
  Future<bool> login(String username, String password) async {
    final dio = Dio();
    final response = await dio.get('${postLogin}username=$username&password=$password');
    if (response.statusCode == 200) {
      if (response.data == '1') {
        return true;
      }
    }
    return false;
  }
}

//đồng bộ dữ liệu
Future<bool> syncData(String username, String password) async {
  final dio = Dio();
  final response = await dio.get(
      "http://192.168.10.47/fetchData?username=$username&password=$password");
  if (response.statusCode == 200) {
    if (response.data == '1') {
      return true;
    }
  }
  return false;
}
