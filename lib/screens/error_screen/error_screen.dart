import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  static const String routeName = '/error-screen';
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: const Text(
        'ERROR PAGE',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 48),
      ),
    );
  }
}
