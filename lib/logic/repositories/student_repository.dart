import 'package:dio/dio.dart';

class StudentRepository {
  Future<bool> login(String username, String password) async {
    final dio = Dio();
    final response = await dio.get(
        "http://192.168.10.47/checkLogged?username=$username&password=$password");
    if (response.statusCode == 200) {
      return true;
    } 
    return false;
  }
}
