import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const routeName = 'error-screen';
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Error'),
    );
  }
}
