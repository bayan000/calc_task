import 'package:flutter/material.dart';
import 'package:prokoders_task1/calcDegrees.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Grades'),
        ),
        body: const GradeCalculator(),
      ),
    );
  }
}


