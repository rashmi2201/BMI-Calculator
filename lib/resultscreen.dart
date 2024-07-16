import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  final double bmiResult;
  const ResultScreen({super.key, required this.bmiResult});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Column(children: [Padding(
        padding: const EdgeInsets.only(top: 300),
        child: Text('Your BMI score is ${bmiResult.toStringAsFixed(1)}',style: TextStyle(fontSize: 30),),
      ),],)),
    );
  }
}