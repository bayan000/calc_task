

import 'package:flutter/material.dart';

class GradeCalculator extends StatefulWidget {
  const GradeCalculator({super.key});
  @override
  State<GradeCalculator> createState() => _GradeCalculatorState();
}

class _GradeCalculatorState extends State<GradeCalculator> {
  final _gradeController = TextEditingController();
  List<int> grades = [];
  double average = 0.0;
  String message = '';

  void _addGrade() {
    final grade = int.tryParse(_gradeController.text);
    if (grade != null && grade >= 0 && grade <= 100) {
      setState(() {
        grades.add(grade);
        _gradeController.clear();
      });
    } else {
      // Handle invalid input
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Oh no! Invalid Grade!'),
            content: const Text('valid grades are between 0 and 100.'),
            actions: [
              TextButton(
                child: Center(child: const Text('I understand')),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  void _calculateAverage() {
    if (grades.isEmpty) return;
    final sum = grades.reduce((value, element) => value + element);
    setState(() {
      average = sum / grades.length;
      message = _getGradeMessage(average);
    });
  }

  String _getGradeMessage(double average) {
    if (average >= 90) {
      return 'Excellent!';
    } else if (average >= 80) {
      return 'Very Good!';
    } else if (average >= 70) {
      return 'Good!';
    } else if (average >= 60) {
      return 'average!';
    } else {
      return 'Work harder!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grades Calculator'),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _gradeController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter a grade',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addGrade,
              child: const Text('Add Grade'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 16.0),
            // Display Grades List (new)
            if (grades.isNotEmpty)
              Text(
                'Grades: ${grades.join(', ')}',
                style: const TextStyle(fontSize: 16.0),
              ),
            const SizedBox(height: 16.0),
            // Display Average and Message (new)
            if (grades.isNotEmpty)
              Text(
                'Average: $average - $message',
                style: const TextStyle(fontSize: 16.0),
              ),
            ElevatedButton(
              onPressed: _calculateAverage,
              child: const Text('Calculate Average'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
