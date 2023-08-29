// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

void main() {
  runApp(BMICalculatorApp());
}

// ignore: use_key_in_widget_constructors
class BMICalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BMI Calculator',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color.fromARGB(255, 0, 112, 84),
      ),
      home: BMICalculator(),
    );
  }
}

// ignore: use_key_in_widget_constructors
class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  double height = 150;
  int weight = 60;
  double bmi = 0;

  void calculateBMI() {
    setState(() {
      bmi = weight / ((height / 100) * (height / 100));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: Text(
                'Your BMI: ${bmi.toStringAsFixed(1)}',
                style: const TextStyle(fontSize: 24),
              ),
            ),
          ),
          Slider(
            value: height,
            min: 100,
            max: 220,
            onChanged: (newValue) {
              setState(() {
                height = newValue;
              });
            },
          ),
          Text('Height: ${height.toStringAsFixed(0)} cm'),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text('Weight:'),
              const SizedBox(width: 22),
              Text(
                weight.toString(),
                style: const TextStyle(fontSize: 24),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  if (weight > 0) {
                    setState(() {
                      weight--;
                    });
                  }
                },
                child: const Text('-'),
              ),
              const SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    weight++;
                  });
                },
                child: const Text('+'),
              ),
            ],
          ),
          const SizedBox(height: 80),
          ElevatedButton(
            onPressed: calculateBMI,
            child: const Text('Calculate BMI'),
          ),
        ],
      ),
    );
  }
}
