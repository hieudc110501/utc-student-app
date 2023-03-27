import 'package:flutter/material.dart';
import 'package:utc_student_app/model/student.dart';
import 'package:utc_student_app/request/student_request.dart';

class Testcreen extends StatefulWidget {
  const Testcreen({super.key});

  @override
  State<Testcreen> createState() => _TestcreenState();
}

class _TestcreenState extends State<Testcreen> {
  late Future<Student> futureStudent;
  @override
  void initState() {
    futureStudent = fecthStudent('191203659', 'datcuu99');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<Student>(
          future: futureStudent,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.studentName.toString());
            } else if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
