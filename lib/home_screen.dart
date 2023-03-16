import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:utc_student_app/model/student.dart';
import 'package:utc_student_app/request/student_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<Student> futureStudent;
  @override
  void initState() {
    futureStudent = fecthStudent();
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
              return Text(snapshot.data!.firstName.toString());
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
